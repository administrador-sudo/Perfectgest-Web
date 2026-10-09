# Copia de cadastro por e-mail (API de leads no Render).
# Preencha SMTP no Dashboard: perfectgest-leads-api > Environment.
# Depois faca Manual Deploy desse servico (nao e o publish do site).

Write-Host "Variaveis no Render (perfectgest-leads-api):"
Write-Host "  SMTP_HOST=smtp.gmail.com"
Write-Host "  SMTP_PORT=465"
Write-Host "  SMTP_SECURE=true"
Write-Host "  SMTP_USER=contabilidade@perfectgestdev.com"
Write-Host "  SMTP_PASS=(senha de app Google)"
Write-Host "  MAIL_FROM=Perfect Gest Dev <contabilidade@perfectgestdev.com>"
Write-Host "  MAIL_BCC=contabilidade@perfectgestdev.com"
Write-Host ""
Write-Host "Local (opcional):"
Set-Location $PSScriptRoot\..
npm install nodemailer
Write-Host "Pronto. Sem isso a copia de e-mail nao sai."
