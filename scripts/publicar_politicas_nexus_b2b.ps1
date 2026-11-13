# Publicar / atualizar politicas NEXUS-B2B no site (Play Console).
# Integra HTML no spa-legal-paths + publish-web (push origin main = site static).
# NAO usa Blueprint nem leads-api.
#
# Uso (caminho absoluto — 1a vez e updates):
#   & "C:\Users\Usuario\ProjetosPerfect\fabrica\Projetos\webs\Web_perfectgest\scripts\publicar_politicas_nexus_b2b.ps1" -NoPause
#   & "...\scripts\publicar_politicas_nexus_b2b.ps1" -SkipPublish -NoPause
#   & "...\scripts\publicar_politicas_nexus_b2b.ps1" -SkipCheckout -NoPause
#
# URLs:
#   https://perfectgestdev.com/nexus-b2b-politica-privacidade
#   https://perfectgestdev.com/nexus-b2b-termos
#   https://perfectgestdev.com/nexus-b2b-exclusao-dados
#   https://perfectgestdev.com/nexus-b2b-faq

param(
    [string]$Branch = 'cursor/nexus-b2b-politicas',
    [switch]$SkipPublish,
    [switch]$SkipCheckout,
    [string]$Msg = 'politicas NEXUS-B2B (Play)',
    [switch]$NoPause
)

$ErrorActionPreference = 'Stop'

$SiteRoot = 'C:\Users\Usuario\ProjetosPerfect\fabrica\Projetos\webs\Web_perfectgest'
$StaticJs = Join-Path $SiteRoot 'scripts\nexus-b2b-static-html.cjs'
$DataJs = Join-Path $SiteRoot 'scripts\nexus-b2b-legal-data.cjs'
$BuildWeb = Join-Path $SiteRoot 'build\web'
$PublishJs = Join-Path $SiteRoot 'scripts\publish-web.cjs'

$Urls = @(
    'https://perfectgestdev.com/nexus-b2b-politica-privacidade',
    'https://perfectgestdev.com/nexus-b2b-termos',
    'https://perfectgestdev.com/nexus-b2b-exclusao-dados',
    'https://perfectgestdev.com/nexus-b2b-faq'
)

function Write-Step([string]$Text) {
    Write-Host ""
    Write-Host "=== $Text ===" -ForegroundColor Cyan
}

if (-not (Test-Path -LiteralPath $SiteRoot)) {
    throw "Site nao encontrado: $SiteRoot"
}
if (-not (Test-Path -LiteralPath $DataJs)) {
    throw "Falta dados legais: $DataJs"
}
if (-not (Test-Path -LiteralPath $StaticJs)) {
    throw "Falta gerador HTML: $StaticJs"
}

Set-Location -LiteralPath $SiteRoot

if (-not $SkipCheckout) {
    Write-Step "1) Integrar $Branch em main (ff-only)"
    & git fetch origin main $Branch
    if ($LASTEXITCODE -ne 0) { throw "git fetch falhou ($LASTEXITCODE)" }
    & git checkout main
    if ($LASTEXITCODE -ne 0) { throw "git checkout main falhou ($LASTEXITCODE)" }
    & git merge --ff-only $Branch
    if ($LASTEXITCODE -ne 0) {
        & git merge --ff-only "origin/$Branch"
        if ($LASTEXITCODE -ne 0) {
            throw "merge ff-only falhou; integre $Branch em main manualmente"
        }
    }
} else {
    Write-Step '1) SkipCheckout — working tree actual'
}

Write-Step '2) Gerar HTML estatico nexus-b2b-* (pre-check)'
if (-not (Test-Path -LiteralPath $BuildWeb)) {
    New-Item -ItemType Directory -Path $BuildWeb -Force | Out-Null
}
node $StaticJs $BuildWeb
if ($LASTEXITCODE -ne 0) { throw "nexus-b2b-static-html falhou ($LASTEXITCODE)" }

$Expected = @(
    'nexus-b2b-politica-privacidade.html',
    'nexus-b2b-termos.html',
    'nexus-b2b-exclusao-dados.html',
    'nexus-b2b-faq.html'
)
foreach ($f in $Expected) {
    $p = Join-Path $BuildWeb $f
    if (-not (Test-Path -LiteralPath $p)) {
        throw "HTML em falta apos gerar: $p"
    }
}
Write-Host "OK: $($Expected.Count) paginas em $BuildWeb" -ForegroundColor Green

if (-not $SkipPublish) {
    Write-Step '3) publish-web (flutter build + spa-legal-paths com NEXUS-B2B + push main)'
    if (-not (Test-Path -LiteralPath $PublishJs)) {
        throw "Falta $PublishJs"
    }
    # Garantir que estamos em main (publish-web faz push origin main).
    $cur = (& git rev-parse --abbrev-ref HEAD).Trim()
    if ($cur -ne 'main') {
        throw "Branch actual e '$cur'; publish-web exige main (use sem -SkipCheckout)."
    }
    node $PublishJs "--msg=$Msg"
    if ($LASTEXITCODE -ne 0) { throw "publish-web falhou ($LASTEXITCODE)" }
} else {
    Write-Step '3) SkipPublish — HTML local gerado; sem deploy'
}

Write-Step '4) URLs a validar (HTTP 200 apos CDN / Auto-Deploy static)'
$Urls | ForEach-Object { Write-Host "  $_" }

Write-Host ""
Write-Host 'Render: so o servico static perfectgest-web-desenvolvedor-apps (nao Blueprint / leads-api).' -ForegroundColor Yellow
Write-Host 'Concluido.' -ForegroundColor Green

if (-not $NoPause) {
    Read-Host 'Enter para sair'
}
exit 0
