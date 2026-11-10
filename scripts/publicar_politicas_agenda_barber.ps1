# Publicar / atualizar politicas Agenda Barber no site (Play Console).
# Uso (caminho absoluto — 1a vez e updates):
#   & "C:\Users\Usuario\ProjetosPerfect\fabrica\Projetos\webs\Web_perfectgest\scripts\publicar_politicas_agenda_barber.ps1" -NoPause
#   & "...\scripts\publicar_politicas_agenda_barber.ps1" -SkipPublish -NoPause
#
# URLs:
#   https://perfectgestdev.com/barber-politica-privacidade
#   https://perfectgestdev.com/barber-termos
#   https://perfectgestdev.com/barber-exclusao-dados
#   https://perfectgestdev.com/barber-faq

param(
    [switch]$SkipPublish,
    [string]$Msg = 'politicas Agenda Barber (Play)',
    [switch]$NoPause
)

$ErrorActionPreference = 'Stop'

$SiteRoot = 'C:\Users\Usuario\ProjetosPerfect\fabrica\Projetos\webs\Web_perfectgest'
$StaticJs = Join-Path $SiteRoot 'scripts\barber-static-html.cjs'
$DataJs = Join-Path $SiteRoot 'scripts\barber-legal-data.cjs'
$BuildWeb = Join-Path $SiteRoot 'build\web'
$PublishJs = Join-Path $SiteRoot 'scripts\publish-web.cjs'

$Urls = @(
    'https://perfectgestdev.com/barber-politica-privacidade',
    'https://perfectgestdev.com/barber-termos',
    'https://perfectgestdev.com/barber-exclusao-dados',
    'https://perfectgestdev.com/barber-faq'
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

Write-Step '1) Gerar HTML estatico barber-*'
if (-not (Test-Path -LiteralPath $BuildWeb)) {
    New-Item -ItemType Directory -Path $BuildWeb -Force | Out-Null
}
node $StaticJs $BuildWeb
if ($LASTEXITCODE -ne 0) { throw "barber-static-html falhou ($LASTEXITCODE)" }

$Expected = @(
    'barber-politica-privacidade.html',
    'barber-termos.html',
    'barber-exclusao-dados.html',
    'barber-faq.html'
)
foreach ($f in $Expected) {
    $p = Join-Path $BuildWeb $f
    if (-not (Test-Path -LiteralPath $p)) {
        throw "HTML em falta apos gerar: $p"
    }
}
Write-Host "OK: $($Expected.Count) paginas em $BuildWeb" -ForegroundColor Green

if (-not $SkipPublish) {
    Write-Step '2) publish-web (commit build/web + push main / hook Render)'
    if (-not (Test-Path -LiteralPath $PublishJs)) {
        throw "Falta $PublishJs"
    }
    node $PublishJs "--msg=$Msg"
    if ($LASTEXITCODE -ne 0) { throw "publish-web falhou ($LASTEXITCODE)" }
} else {
    Write-Step '2) SkipPublish — HTML local gerado; sem deploy'
}

Write-Step '3) URLs a validar (HTTP 200 apos CDN)'
$Urls | ForEach-Object { Write-Host "  $_" }

Write-Host ""
Write-Host 'Play Console: colar privacidade + exclusao; Data safety alinhado a estes textos.' -ForegroundColor Yellow
Write-Host 'Concluido.' -ForegroundColor Green

if (-not $NoPause) {
    Read-Host 'Enter para sair'
}
exit 0
