# Atalho no repo do site -> script no mobile
# Uso:
#   cd C:\...\webs\Web_perfectgest
#   .\scripts\atualizar_politicas_site.ps1

$MobileScript = Join-Path $PSScriptRoot '..\..\..\apps\Contabilidade_Clientes\mobile\scripts\atualizar_politicas_site.ps1'
$MobileScript = (Resolve-Path $MobileScript).Path
& $MobileScript @args
exit $LASTEXITCODE
