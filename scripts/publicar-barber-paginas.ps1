# Publica as paginas Barber (/Barber_Hairdresser, /Barber_Admin) no site Web_perfectgest.
# Branch padrao = texto-produtos-vitrine-7887 (subtitulo Produtos). Nao usa o rewrite-5027.
# Nao usa travessao Unicode (quebra o parser do PowerShell).
#
# Uso (caminho absoluto - colar de qualquer pasta):
#   & "C:\Users\Usuario\ProjetosPerfect\fabrica\Projetos\webs\Web_perfectgest\scripts\publicar-barber-paginas.ps1" -NoPause -Msg "texto-produtos-vitrine"
#   & "...\scripts\publicar-barber-paginas.ps1" -SkipPublish -NoPause
#   & "...\scripts\publicar-barber-paginas.ps1" -SkipCheckout -NoPause -Msg "texto-produtos-vitrine"
#
# Pipeline: fetch Branch -> merge ff-only em main -> build:web:sync -> publish-web -> poll live.
# Producao Render segue origin/main; publish-web.cjs faz push origin main (+ RENDER_DEPLOY_HOOK se set).
# Sucesso so com etag novo e stockQty+Produtos no live; timeout = Manual Deploy no Render.

param(
    [string]$Branch = 'cursor/texto-produtos-vitrine-7887',
    [string]$Msg = 'texto-produtos-vitrine',
    [int]$PollSeconds = 300,
    [int]$PollIntervalSec = 20,
    [switch]$SkipPublish,
    [switch]$SkipCheckout,
    [switch]$NoPause
)

$ErrorActionPreference = 'Stop'
$RepoRoot = Split-Path -Parent $PSScriptRoot
$BranchPerigoso = 'cursor/barber-spa-rewrite-5027'
$EtagAntigo = '87d77e51'
$LastModAntigo = '11:23:56'
$LiveJsUrl = 'https://perfectgestdev.com/main.dart.js'
$script:PublishFailed = $false

function Write-Step([string]$msg) {
    Write-Host ""
    Write-Host "==> $msg" -ForegroundColor Cyan
}

function Invoke-RenderDeployHook {
    $hook = [string]$env:RENDER_DEPLOY_HOOK
    if ([string]::IsNullOrWhiteSpace($hook)) {
        Write-Host "RENDER_DEPLOY_HOOK ausente no ambiente." -ForegroundColor Yellow
        Write-Host "Se o auto-deploy nao arrancar: Manual Deploy no dashboard Render do servico perfectgestdev.com (Clear build cache)." -ForegroundColor Yellow
        return $false
    }
    Write-Step "POST RENDER_DEPLOY_HOOK"
    try {
        $resp = Invoke-RestMethod -Method Post -Uri $hook.Trim() -TimeoutSec 60
        Write-Host "Deploy hook OK: $resp" -ForegroundColor Green
        return $true
    } catch {
        Write-Host "FALHA: RENDER_DEPLOY_HOOK: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host "Abra Manual Deploy no Render (Clear build cache) para perfectgestdev.com." -ForegroundColor Red
        $script:PublishFailed = $true
        return $false
    }
}

function Test-OriginMainHasLojaMarkers {
    Write-Step "Prova origin/main:build/web/main.dart.js (stockQty / Produtos)"
    & git fetch origin main
    if ($LASTEXITCODE -ne 0) {
        Write-Host "AVISO: git fetch origin main falhou ($LASTEXITCODE)." -ForegroundColor Yellow
        return $false
    }
    $tmpOrigin = Join-Path $env:TEMP ("perfectgest-origin-main-dart-{0}.js" -f [guid]::NewGuid().ToString('N'))
    try {
        & git show "origin/main:build/web/main.dart.js" | Out-File -FilePath $tmpOrigin -Encoding utf8
        if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $tmpOrigin)) {
            Write-Host "FALHA: nao foi possivel ler origin/main:build/web/main.dart.js" -ForegroundColor Red
            return $false
        }
        $hasStock = $null -ne (Select-String -Path $tmpOrigin -Pattern 'stockQty' -SimpleMatch | Select-Object -First 1)
        $hasProdutos = $null -ne (Select-String -Path $tmpOrigin -Pattern 'Produtos' -SimpleMatch | Select-Object -First 1)
        if (-not $hasStock -or -not $hasProdutos) {
            Write-Host "FALHA: origin/main ainda sem stockQty+Produtos (push nao levou o artefacto loja)." -ForegroundColor Red
            return $false
        }
        Write-Host "origin/main OK: stockQty + Produtos no tip." -ForegroundColor Green
        return $true
    } finally {
        if (Test-Path -LiteralPath $tmpOrigin) {
            Remove-Item -LiteralPath $tmpOrigin -Force -ErrorAction SilentlyContinue
        }
    }
}

function Test-LiveLojaReady {
    param([string]$TmpJsPath)

    $headersRaw = & curl.exe -sI $LiveJsUrl
    if ($LASTEXITCODE -ne 0) {
        return @{ Ok = $false; Reason = "curl headers falhou ($LASTEXITCODE)"; Headers = $headersRaw }
    }

    $etagLine = ($headersRaw | Where-Object { $_ -match '(?i)^etag:' } | Select-Object -First 1)
    $lmLine = ($headersRaw | Where-Object { $_ -match '(?i)^last-modified:' } | Select-Object -First 1)
    $cfLine = ($headersRaw | Where-Object { $_ -match '(?i)^cf-cache-status:' } | Select-Object -First 1)
    $rndrLine = ($headersRaw | Where-Object { $_ -match '(?i)^rndr-id:' } | Select-Object -First 1)

    $etagOld = $etagLine -and ($etagLine -match [regex]::Escape($EtagAntigo))
    $lmOld = $lmLine -and ($lmLine -match [regex]::Escape($LastModAntigo))

    & curl.exe -sL $LiveJsUrl -o $TmpJsPath
    if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $TmpJsPath)) {
        return @{
            Ok = $false
            Reason = 'download live main.dart.js falhou'
            Headers = $headersRaw
            EtagLine = $etagLine
            LmLine = $lmLine
            CfLine = $cfLine
            RndrLine = $rndrLine
        }
    }

    $liveHits = Select-String -Path $TmpJsPath -Pattern 'stockQty|Produtos|listProducts' -AllMatches
    $liveStock = ($liveHits | Where-Object { $_.Line -match 'stockQty' }) -ne $null
    $liveProdutos = ($liveHits | Where-Object { $_.Line -match 'Produtos' }) -ne $null
    $liveList = ($liveHits | Where-Object { $_.Line -match 'listProducts' }) -ne $null

    $ok = (-not $etagOld) -and $liveStock -and $liveProdutos
    $reason = if ($ok) {
        'live OK'
    } elseif ($etagOld) {
        "etag ainda contem $EtagAntigo"
    } elseif (-not $liveStock -or -not $liveProdutos) {
        'live sem stockQty e/ou Produtos'
    } else {
        'live ainda antigo'
    }

    return @{
        Ok = $ok
        Reason = $reason
        Headers = $headersRaw
        EtagLine = $etagLine
        LmLine = $lmLine
        CfLine = $cfLine
        RndrLine = $rndrLine
        LmOld = $lmOld
        LiveStock = $liveStock
        LiveProdutos = $liveProdutos
        LiveList = $liveList
    }
}

Set-Location -LiteralPath $RepoRoot
Write-Host "Site: $RepoRoot" -ForegroundColor Cyan

if (-not (Test-Path -LiteralPath (Join-Path $RepoRoot 'pubspec.yaml'))) {
    throw "Repo Web_perfectgest invalido: pubspec.yaml ausente em $RepoRoot"
}

if ($Branch -eq $BranchPerigoso -or $Branch -like '*barber-spa-rewrite-5027*') {
    Write-Host ""
    Write-Host "AVISO CRITICO: Branch '$Branch' e o SPA antigo (sem loja/logo/checkout)." -ForegroundColor Red
    Write-Host "Use o padrao cursor/checkout-loja-pix-a6bc (ou -SkipCheckout com working tree ja correcta)." -ForegroundColor Red
    Write-Host "Continuar republica o live antigo (etag 87d77e51)." -ForegroundColor Red
    Write-Host ""
}

if (-not $SkipCheckout) {
    Write-Step "git fetch origin main + $Branch"
    & git fetch origin main $Branch
    if ($LASTEXITCODE -ne 0) { throw "git fetch falhou ($LASTEXITCODE)" }

    Write-Step "git checkout main"
    & git checkout main
    if ($LASTEXITCODE -ne 0) { throw "git checkout main falhou ($LASTEXITCODE)" }

    Write-Step "git merge --ff-only $Branch (ou origin/$Branch)"
    & git merge --ff-only $Branch
    if ($LASTEXITCODE -ne 0) {
        & git merge --ff-only "origin/$Branch"
        if ($LASTEXITCODE -ne 0) {
            throw "merge ff-only falhou; integre $Branch em main manualmente"
        }
    }
    & git status -sb
} else {
    Write-Host "SkipCheckout: a usar working tree actual." -ForegroundColor Yellow
    & git status -sb
}

Write-Step "npm run build:web:sync"
& npm run build:web:sync
if ($LASTEXITCODE -ne 0) { throw "build:web:sync falhou ($LASTEXITCODE)" }

$stub = Join-Path $RepoRoot 'build\web\Barber_Hairdresser.html'
if (-not (Test-Path -LiteralPath $stub)) {
    Write-Host "AVISO: stub ausente, a gerar com spa-legal-paths.cjs" -ForegroundColor Yellow
    & node (Join-Path $PSScriptRoot 'spa-legal-paths.cjs')
    if ($LASTEXITCODE -ne 0) { throw "spa-legal-paths falhou ($LASTEXITCODE)" }
}

if (Test-Path -LiteralPath $stub) {
    Write-Host "Stub OK: $stub" -ForegroundColor Green
} else {
    throw "Stub Barber_Hairdresser.html nao encontrado apos o build."
}

$localJs = Join-Path $RepoRoot 'build\web\main.dart.js'
if (Test-Path -LiteralPath $localJs) {
    Write-Step "Prova local main.dart.js (stockQty / Produtos)"
    $localHits = Select-String -Path $localJs -Pattern 'stockQty|Produtos|listProducts' -AllMatches
    $hasStock = ($localHits | Where-Object { $_.Line -match 'stockQty' }) -ne $null
    $hasProdutos = ($localHits | Where-Object { $_.Line -match 'Produtos' }) -ne $null
    if (-not $hasStock -or -not $hasProdutos) {
        throw "Build local sem marcadores loja (stockQty/Produtos). Abortar antes do publish."
    }
    Write-Host "Marcadores locais OK (stockQty + Produtos)." -ForegroundColor Green
} else {
    Write-Host "AVISO: build\web\main.dart.js ausente para prova local." -ForegroundColor Yellow
}

if (-not $SkipPublish) {
    Write-Step "npm run publish-web -- --msg=$Msg"
    # Chama node direto para o PowerShell nao perder --msg (igual atualizar-barber-spa.ps1).
    $publishJs = Join-Path $PSScriptRoot 'publish-web.cjs'
    & node $publishJs "--msg=$Msg"
    if ($LASTEXITCODE -ne 0) { throw "publish-web falhou ($LASTEXITCODE)" }

    if (-not (Test-OriginMainHasLojaMarkers)) {
        $script:PublishFailed = $true
        Write-Host "Push/Git remoto sem artefacto loja. Nao marcar sucesso." -ForegroundColor Red
    } else {
        Write-Host "Push confirmado em origin/main com artefacto loja." -ForegroundColor Green
    }

    # publish-web.cjs ja tenta o hook; PS1 reforça se a env estiver set (idempotente).
    [void](Invoke-RenderDeployHook)

    Write-Step "Poll live ate $PollSeconds s (intervalo ${PollIntervalSec}s)"
    $deadline = (Get-Date).AddSeconds([Math]::Max(30, $PollSeconds))
    $tmpJs = Join-Path $env:TEMP ("perfectgest-main-dart-{0}.js" -f [guid]::NewGuid().ToString('N'))
    $liveOk = $false
    $lastProbe = $null
    try {
        do {
            $lastProbe = Test-LiveLojaReady -TmpJsPath $tmpJs
            if ($lastProbe.EtagLine) { Write-Host $lastProbe.EtagLine }
            if ($lastProbe.LmLine) { Write-Host $lastProbe.LmLine }
            if ($lastProbe.CfLine) { Write-Host $lastProbe.CfLine }
            if ($lastProbe.RndrLine) { Write-Host $lastProbe.RndrLine }
            Write-Host "stockQty=$($lastProbe.LiveStock) Produtos=$($lastProbe.LiveProdutos) listProducts=$($lastProbe.LiveList) -> $($lastProbe.Reason)"

            if ($lastProbe.Ok) {
                $liveOk = $true
                Write-Host "Live OK: etag novo + stockQty + Produtos." -ForegroundColor Green
                if ($lastProbe.LiveList) {
                    Write-Host "Live OK: listProducts tambem presente." -ForegroundColor Green
                }
                break
            }

            if ((Get-Date) -ge $deadline) { break }
            Write-Host "Ainda antigo; novo poll em ${PollIntervalSec}s..." -ForegroundColor Yellow
            Start-Sleep -Seconds ([Math]::Max(5, $PollIntervalSec))
        } while ((Get-Date) -lt $deadline)
    } finally {
        if (Test-Path -LiteralPath $tmpJs) {
            Remove-Item -LiteralPath $tmpJs -Force -ErrorAction SilentlyContinue
        }
    }

    if (-not $liveOk) {
        $script:PublishFailed = $true
        Write-Host ""
        Write-Host "FALHA: timeout do poll live (~${PollSeconds}s). Bundle ainda antigo ou sem marcadores." -ForegroundColor Red
        Write-Host "Manual Deploy no Render: dashboard do servico perfectgestdev.com -> Manual Deploy -> Clear build cache." -ForegroundColor Red
        Write-Host "Opcional: defina RENDER_DEPLOY_HOOK (Deploy Hook URL do Render) no ambiente antes de republicar." -ForegroundColor Yellow
        if ($lastProbe -and $lastProbe.Headers) {
            Write-Host "Ultimos headers:" -ForegroundColor Yellow
            Write-Host ($lastProbe.Headers -join "`n")
        }
    }
} else {
    Write-Host "SkipPublish: build local pronto; publish nao executado." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Apos o deploy: hard refresh em https://perfectgestdev.com/Barber_Hairdresser" -ForegroundColor Cyan
Write-Host "Esperado: logo da barbearia + seccao Produtos." -ForegroundColor Cyan
Write-Host "Validar:" -ForegroundColor Cyan
Write-Host "  curl.exe -sI https://perfectgestdev.com/main.dart.js"
Write-Host "  curl.exe -i https://perfectgestdev.com/Barber_Hairdresser"

if (-not $NoPause) {
    Read-Host "Enter para sair"
}

if ($script:PublishFailed) {
    exit 1
}
