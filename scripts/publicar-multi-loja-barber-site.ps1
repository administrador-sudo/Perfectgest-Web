# Publica site multi-loja Barber (path shopId + Admin lojas) a partir desta branch.
# Wrapper de publicar-barber-paginas.ps1 com Branch correcta.
#
# Uso (caminho absoluto):
#   & "C:\Users\Usuario\ProjetosPerfect\fabrica\Projetos\webs\Web_perfectgest\scripts\publicar-multi-loja-barber-site.ps1" -NoPause
#   & "...\scripts\publicar-multi-loja-barber-site.ps1" -SkipPublish -NoPause
#   & "...\scripts\publicar-multi-loja-barber-site.ps1" -SkipCheckout -NoPause

param(
    [string]$Branch = 'cursor/multi-loja-play-admin-5533',
    [string]$Msg = 'multi-loja-play-admin-site',
    [switch]$SkipPublish,
    [switch]$SkipCheckout,
    [switch]$NoPause
)

$ErrorActionPreference = 'Stop'
$Here = $PSScriptRoot
$Inner = Join-Path $Here 'publicar-barber-paginas.ps1'
if (-not (Test-Path -LiteralPath $Inner)) {
    throw "Falta $Inner"
}

Write-Host "Publicar site Barber multi-loja | Branch=$Branch" -ForegroundColor Cyan
& $Inner -Branch $Branch -Msg $Msg -SkipPublish:$SkipPublish -SkipCheckout:$SkipCheckout -NoPause:$NoPause
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host ""
Write-Host "Smoke paths apos CDN:" -ForegroundColor Yellow
Write-Host "  https://perfectgestdev.com/Barber_Hairdresser"
Write-Host "  https://perfectgestdev.com/Barber_Hairdresser/perfectgest_dev"
Write-Host "  https://perfectgestdev.com/Barber_Admin/perfectgest_dev"
Write-Host "  https://perfectgestdev.com/Barber_Shops_Admin"
