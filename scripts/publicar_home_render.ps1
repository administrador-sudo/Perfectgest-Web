# Compat: atalho para o publish completo do site.
# Uso:
#   cd C:\Users\Usuario\ProjetosPerfect\fabrica\Projetos\webs\Web_perfectgest
#   .\scripts\publicar_home_render.ps1
#   .\scripts\publicar_site_render.ps1

$ErrorActionPreference = 'Stop'
& (Join-Path $PSScriptRoot 'publicar_site_render.ps1') @args
exit $LASTEXITCODE
