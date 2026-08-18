# Atalho no repo do site -> script ContabilGest (S-App).
# Uso:
#   cd C:\...\webs\Web_perfectgest
#   .\scripts\publicar_politicas_site.ps1 -NoPause

$ErrorActionPreference = 'Stop'
# scripts -> Web_perfectgest -> webs -> Projetos -> S-App-ContabilGest
$MobileScript = Join-Path $PSScriptRoot '..\..\..\S-App-ContabilGest\mobile_user_app\scripts\publicar_politicas_site.ps1'
if (-not (Test-Path -LiteralPath $MobileScript)) {
    throw "Script ContabilGest em falta: $MobileScript"
}
$MobileScript = (Resolve-Path -LiteralPath $MobileScript).Path
Write-Host "ContabilGest: $MobileScript" -ForegroundColor Cyan
& $MobileScript @args
exit $LASTEXITCODE
