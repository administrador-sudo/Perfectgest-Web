$ErrorActionPreference = 'Stop'
$base = 'https://perfectgest-leads-api-6v1e.onrender.com'

Write-Output '=== 1) HEALTH ==='
try {
  Invoke-RestMethod -Uri "$base/health" -TimeoutSec 25 | ConvertTo-Json -Compress
} catch {
  Write-Output $_.Exception.Message
}

Write-Output '=== 2) MAIL-CHECK ==='
try {
  Invoke-RestMethod -Uri "$base/api/mail-check" -TimeoutSec 25 | ConvertTo-Json -Compress
} catch {
  Write-Output $_.Exception.Message
}

Write-Output '=== 3) Conferir no Render Environment ==='
Write-Output 'RESEND_API_KEY=re_... (obrigatorio no Free)'
Write-Output 'MAIL_FROM=Perfect Gest Dev <leads@perfectgestdev.com>'
Write-Output 'MAIL_BCC=perfectpro.sac@gmail.com'
Write-Output 'Esperado: resendMode true, verifyOk true'
Write-Output 'MAIL_FROM nao pode ser gmail.com no Resend — dominio verificado no painel Resend.'
