# Atualiza e publica a SPA /Barber_Hairdresser no site Web_perfectgest.
# Nao usa travessao Unicode (quebra o parser do PowerShell).
#
# Uso (caminho absoluto - colar de qualquer pasta):
#   & "C:\Users\Usuario\ProjetosPerfect\fabrica\Projetos\webs\Web_perfectgest\scripts\atualizar-barber-spa.ps1"
#   & "...\scripts\atualizar-barber-spa.ps1" -SkipPublish
#   & "...\scripts\atualizar-barber-spa.ps1" -Msg "fix-barber-spa-rewrite" -NoPause
#
# Pipeline: garante commits Barber em main -> build:web:sync -> publish-web (opcional).
# Producao Render segue origin/main; branch sozinha NAO tira o 404.

param(
    [string]$Branch = 'cursor/barber-spa-rewrite-5027',
    [string]$Msg = 'fix-barber-spa-rewrite',
    [switch]$SkipPublish,
    [switch]$SkipCheckout,
    [switch]$NoPause
)

$ErrorActionPreference = 'Stop'
$RepoRoot = Split-Path -Parent $PSScriptRoot

function Write-Step([string]$msg) {
    Write-Host ""
    Write-Host "==> $msg" -ForegroundColor Cyan
}

Set-Location -LiteralPath $RepoRoot
Write-Host "Site: $RepoRoot" -ForegroundColor Cyan

if ($Branch -eq 'cursor/barber-spa-rewrite-5027' -or $Branch -like '*barber-spa-rewrite-5027*') {
    Write-Host ""
    Write-Host "AVISO: Branch default/antiga '$Branch' NAO tem loja/logo/checkout." -ForegroundColor Red
    Write-Host "Prefira: scripts\publicar-barber-paginas.ps1 (padrao cursor/checkout-loja-pix-a6bc)." -ForegroundColor Yellow
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

if (-not $SkipPublish) {
    Write-Step "npm run publish-web -- --msg=$Msg"
    # Chama node direto para o PowerShell nao perder --msg (igual publicar_site_render.ps1).
    $publishJs = Join-Path $PSScriptRoot 'publish-web.cjs'
    & node $publishJs "--msg=$Msg"
    if ($LASTEXITCODE -ne 0) { throw "publish-web falhou ($LASTEXITCODE)" }
    Write-Host "Push enviado. Aguarde deploy no Render." -ForegroundColor Green
    Write-Host "Confirme Rewrite: /Barber_Hairdresser -> /Barber_Hairdresser.html" -ForegroundColor Yellow
} else {
    Write-Host "SkipPublish: build local pronto; publish nao executado." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Validar:" -ForegroundColor Cyan
Write-Host "  curl.exe -i https://perfectgestdev.com/Barber_Hairdresser"
Write-Host "  curl.exe -i https://perfectgestdev.com/A1_Certificado"
Write-Host "Local:"
Write-Host "  npm run serve:web:sync"

if (-not $NoPause) {
    Read-Host "Enter para sair"
}
