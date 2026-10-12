$ErrorActionPreference = 'Stop'
$base = 'https://perfectgest-leads-api-6v1e.onrender.com'

Write-Output '=== 1) HEALTH ==='
try {
  Invoke-RestMethod -Uri "$base/health" -TimeoutSec 25 | ConvertTo-Json -Compress
} catch {
  Write-Output $_.Exception.Message
}

Write-Output '=== 2) MAIL-CHECK (SMTP no Render, sem enviar e-mail) ==='
try {
  Invoke-RestMethod -Uri "$base/api/mail-check" -TimeoutSec 25 | ConvertTo-Json -Compress
} catch {
  Write-Output $_.Exception.Message
}

Write-Output '=== 3) Conferir no Render Environment ==='
Write-Output 'SMTP_HOST=smtp.gmail.com'
Write-Output 'SMTP_PORT=587'
Write-Output 'SMTP_SECURE=false'
Write-Output 'SMTP_USER=perfectpro.sac@gmail.com'
Write-Output 'SMTP_PASS=senha de app 16 letras (sem espaco visivel)'
Write-Output 'MAIL_FROM=perfectpro.sac@gmail.com'
Write-Output 'MAIL_BCC=perfectpro.sac@gmail.com'
Write-Output 'Esperado no mail-check: mailerReady true, gmailMode true, verifyOk true'
