/// Endpoint da API de leads (Web Service Render — ver `scripts/leads-api-server.js`).
///
/// Build produção (exemplo):
/// `flutter build web --release --dart-define=LEADS_API_URL=https://SEU-SERVICO.onrender.com/api/leads`
const String kLeadsApiUrl = String.fromEnvironment(
  'LEADS_API_URL',
  defaultValue: 'https://perfectgest-leads-api.onrender.com/api/leads',
);
