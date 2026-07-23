/// Endpoint da API de leads (Web Service Render + PostgreSQL).
/// Ver `docs/RENDER_LEADS_POSTGRES.md` para deploy e consulta dos cadastros.
const String kLeadsApiUrl = String.fromEnvironment(
  'LEADS_API_URL',
  defaultValue: 'https://perfectgest-leads-api-2ztg.onrender.com/api/leads',
);
