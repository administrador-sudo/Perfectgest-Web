# diagnostico_leads_api.ps1
# Executa: .\scripts\diagnostico_leads_api.ps1
# Verifica o estado do Web Service perfectgest-leads-api no Render.

$api = "https://perfectgest-leads-api.onrender.com"

Write-Host ""
Write-Host "=== Diagnostico perfectgest-leads-api ===" -ForegroundColor Cyan

# 1. DNS
Write-Host ""
Write-Host "[1] DNS..." -ForegroundColor Yellow
try {
    $null = [System.Net.Dns]::GetHostAddresses("perfectgest-leads-api.onrender.com")
    Write-Host "    DNS OK" -ForegroundColor Green
} catch {
    Write-Host "    FALHA DNS - servico pode nao existir no Render." -ForegroundColor Red
    Write-Host "    -> Aceda ao Render Dashboard e verifique se 'perfectgest-leads-api' existe."
    exit 1
}

# 2. Health endpoint (timeout 90s - aguarde cold start)
Write-Host ""
Write-Host "[2] GET $api/health  (timeout 90s - aguarde cold start)" -ForegroundColor Yellow
try {
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    $r  = Invoke-WebRequest -Uri "$api/health" -TimeoutSec 90 -UseBasicParsing -ErrorAction Stop
    $sw.Stop()
    Write-Host "    HTTP $($r.StatusCode) em $($sw.ElapsedMilliseconds) ms" -ForegroundColor Green
    Write-Host "    Resposta: $($r.Content)"
    $json = $r.Content | ConvertFrom-Json
    if ($json.storage -eq "postgres") {
        Write-Host "    Storage: PostgreSQL OK" -ForegroundColor Green
    } else {
        Write-Host "    AVISO: storage=$($json.storage) - DATABASE_URL pode nao estar ligado." -ForegroundColor Yellow
        Write-Host "    -> Render Dashboard: perfectgest-leads-api -> Environment -> link DATABASE_URL"
    }
} catch {
    Write-Host "    FALHA: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "    -> Servico nao esta a correr. Opcoes:" -ForegroundColor Yellow
    Write-Host "       a) Render Dashboard -> New -> Blueprint (usar render.yaml deste repo)"
    Write-Host "       b) Ver docs/RENDER_LEADS_POSTGRES.md para criacao manual"
    exit 1
}

# 3. Teste POST
Write-Host ""
Write-Host "[3] POST $api/api/leads (dado de teste)" -ForegroundColor Yellow
$body = '{"nome":"Teste Diagnostico","email":"teste@perfectgestdev.com","comentario":"diagnostico","consent":true,"locale":"pt","website":""}'
try {
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    $r  = Invoke-WebRequest -Uri "$api/api/leads" `
          -Method POST `
          -Body $body `
          -ContentType "application/json" `
          -TimeoutSec 90 `
          -UseBasicParsing `
          -ErrorAction Stop
    $sw.Stop()
    Write-Host "    HTTP $($r.StatusCode) em $($sw.ElapsedMilliseconds) ms" -ForegroundColor Green
    Write-Host "    Resposta: $($r.Content)"
    Write-Host ""
    Write-Host ">>> API funcional. Se o site ainda falha, o problema e CORS no browser." -ForegroundColor Green
    Write-Host "    Abra DevTools (F12) -> Console e procure por erros CORS ao enviar o formulario."
} catch {
    Write-Host "    FALHA POST: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "=== Fim do diagnostico ===" -ForegroundColor Cyan
