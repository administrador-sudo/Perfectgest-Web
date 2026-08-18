# Atalho no repo do site -> script no mobile ContabilGest
# Uso:
#   cd C:\...\webs\Web_perfectgest
#   .\scripts\atualizar_politicas_site.ps1

$MobileScript = Join-Path $PSScriptRoot '..\..\..\S-App-ContabilGest\mobile_user_app\scripts\atualizar_politicas_site.ps1'
$MobileScript = (Resolve-Path $MobileScript).Path
& $MobileScript @args
exit $LASTEXITCODE
