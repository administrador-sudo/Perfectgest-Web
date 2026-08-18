# Publica o site completo no Render (home, FAQ vitrine, legais, SPA).
# Uso:
#   cd C:\Users\Usuario\ProjetosPerfect\fabrica\Projetos\webs\Web_perfectgest
#   .\scripts\publicar_site_render.ps1
#   .\scripts\publicar_site_render.ps1 -Msg "feat: sua mensagem" -NoPause
#
# Chama node scripts/publish-web.cjs (nao npm) para o PowerShell nao perder --msg.
# Pipeline: icones + flutter build web --release + rotas legais + verify + commit + push main.

param(
    [string]$Msg = 'feat: publicar site completo home FAQ contabilgest',
    [switch]$NoPause
)

$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath (Join-Path $PSScriptRoot '..')

Write-Host "Repo: $(Get-Location)" -ForegroundColor Cyan
Write-Host "Publicar site completo (build Flutter + legais + push). Pode demorar varios minutos." -ForegroundColor Yellow

$publishJs = Join-Path $PSScriptRoot 'publish-web.cjs'
& node $publishJs "--msg=$Msg"
$code = $LASTEXITCODE
if ($code -ne 0) {
    Write-Host "publish-web saiu com codigo $code. Veja a mensagem [publish-web] acima." -ForegroundColor Red
    if (-not $NoPause) {
        Read-Host "Enter para sair"
    }
    exit $code
}

Write-Host ""
Write-Host "Push enviado. Aguarde o deploy no Render Dashboard." -ForegroundColor Green
Write-Host "No Render, confirme Rewrite: /faq-contabilgest -> /faq-contabilgest.html" -ForegroundColor Yellow
Write-Host ""
Write-Host "Validar em janela anonima:" -ForegroundColor Cyan
Write-Host "  https://perfectgestdev.com/"
Write-Host "  https://perfectgestdev.com/faq-contabilgest"
Write-Host "  https://perfectgestdev.com/contabil-i-faq"
Write-Host "  https://perfectgestdev.com/politica-privacidade-site"
Write-Host "  https://perfectgestdev.com/pre-cadastro"
Write-Host "Home: wordmark -> setor contabil -> planos -> link FAQ (pagina vitrine) -> textos Flutter."

if (-not $NoPause) {
    Read-Host "Enter para sair"
}
