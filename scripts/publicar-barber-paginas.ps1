# Publica as paginas Barber (/Barber_Hairdresser, /Barber_Admin) no site Web_perfectgest.
# Branch padrao = checkout-loja-pix (loja + logo + checkout). Nao usa o rewrite-5027.
# Nao usa travessao Unicode (quebra o parser do PowerShell).
#
# Uso (caminho absoluto - colar de qualquer pasta):
#   & "C:\Users\Usuario\ProjetosPerfect\fabrica\Projetos\webs\Web_perfectgest\scripts\publicar-barber-paginas.ps1" -NoPause -Msg "loja-logo-live"
#   & "...\scripts\publicar-barber-paginas.ps1" -SkipPublish -NoPause
#   & "...\scripts\publicar-barber-paginas.ps1" -SkipCheckout -NoPause -Msg "loja-logo-live"
#
# Pipeline: fetch Branch -> merge ff-only em main -> build:web:sync -> publish-web -> prova live.
# Producao Render segue origin/main; publish-web.cjs faz push origin main.

param(
    [string]$Branch = 'cursor/checkout-loja-pix-a6bc',
    [string]$Msg = 'loja-logo-live',
    [switch]$SkipPublish,
    [switch]$SkipCheckout,
    [switch]$NoPause
)

$ErrorActionPreference = 'Stop'
$RepoRoot = Split-Path -Parent $PSScriptRoot
$BranchPerigoso = 'cursor/barber-spa-rewrite-5027'
$EtagAntigo = '87d77e51'
$LastModAntigo = '11:23:56'

function Write-Step([string]$msg) {
    Write-Host ""
    Write-Host "==> $msg" -ForegroundColor Cyan
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
    Write-Host "Push enviado. Aguarde deploy no Render." -ForegroundColor Green
    Write-Host "Confirme Rewrite: /Barber_Hairdresser -> /Barber_Hairdresser.html" -ForegroundColor Yellow

    Write-Step "Prova live https://perfectgestdev.com/main.dart.js"
    $tmpJs = Join-Path $env:TEMP ("perfectgest-main-dart-{0}.js" -f [guid]::NewGuid().ToString('N'))
    try {
        $headers = & curl.exe -sI "https://perfectgestdev.com/main.dart.js"
        if ($LASTEXITCODE -ne 0) {
            Write-Host "AVISO: curl headers falhou ($LASTEXITCODE). Confirme manualmente apos o Render." -ForegroundColor Yellow
        } else {
            Write-Host $headers
            $etagLine = ($headers | Where-Object { $_ -match '(?i)^etag:' } | Select-Object -First 1)
            $lmLine = ($headers | Where-Object { $_ -match '(?i)^last-modified:' } | Select-Object -First 1)
            if ($etagLine -and ($etagLine -match [regex]::Escape($EtagAntigo))) {
                Write-Host "FALHA/AVISO: etag ainda contem $EtagAntigo (bundle antigo)." -ForegroundColor Red
            }
            if ($lmLine -and ($lmLine -match [regex]::Escape($LastModAntigo))) {
                Write-Host "FALHA/AVISO: Last-Modified ainda contem $LastModAntigo (bundle antigo)." -ForegroundColor Red
            }
            if (($etagLine -and ($etagLine -match [regex]::Escape($EtagAntigo))) -or
                ($lmLine -and ($lmLine -match [regex]::Escape($LastModAntigo)))) {
                Write-Host "Deploy pode ainda estar a propagar. Revalide em 1-2 min." -ForegroundColor Yellow
            } else {
                Write-Host "Headers live nao batem no snapshot antigo." -ForegroundColor Green
            }
        }

        & curl.exe -sL "https://perfectgestdev.com/main.dart.js" -o $tmpJs
        if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $tmpJs)) {
            Write-Host "AVISO: download live main.dart.js falhou. Confirme marcadores manualmente." -ForegroundColor Yellow
        } else {
            $liveHits = Select-String -Path $tmpJs -Pattern 'stockQty|Produtos|listProducts' -AllMatches
            $liveStock = ($liveHits | Where-Object { $_.Line -match 'stockQty' }) -ne $null
            $liveProdutos = ($liveHits | Where-Object { $_.Line -match 'Produtos' }) -ne $null
            $liveList = ($liveHits | Where-Object { $_.Line -match 'listProducts' }) -ne $null
            if (-not $liveStock -or -not $liveProdutos) {
                Write-Host "FALHA: live sem stockQty e/ou Produtos. Hard refresh pode nao bastar - republicar branch correcto." -ForegroundColor Red
            } else {
                Write-Host "Live OK: stockQty + Produtos presentes." -ForegroundColor Green
                if ($liveList) {
                    Write-Host "Live OK: listProducts tambem presente." -ForegroundColor Green
                }
            }
        }
    } finally {
        if (Test-Path -LiteralPath $tmpJs) {
            Remove-Item -LiteralPath $tmpJs -Force -ErrorAction SilentlyContinue
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
