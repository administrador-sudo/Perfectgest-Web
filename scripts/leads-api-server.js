/**
 * API de leads do site (pre-cadastro) — PostgreSQL no Render.
 *
 * Env:
 *   DATABASE_URL          — connection string Postgres (Render)
 *   ALLOWED_ORIGINS       — origens CORS separadas por virgula (ex.: https://perfectgest-web-desenvolvedor-apps.onrender.com)
 *   PORT                  — default 10000
 *
 * PowerShell local:
 *   $env:DATABASE_URL="postgres://..."
 *   $env:ALLOWED_ORIGINS="http://localhost:8080"
 *   npm run server:leads
 *
 * POST /api/leads  { nome, email, comentario?, consent, locale?, website? }
 */
const express = require('express');
const cors = require('cors');
const rateLimit = require('express-rate-limit');
const { Pool } = require('pg');

const app = express();
app.use(express.json({ limit: '32kb' }));

const databaseUrl = process.env.DATABASE_URL;
const allowedOrigins = (process.env.ALLOWED_ORIGINS || '')
  .split(',')
  .map((s) => s.trim())
  .filter(Boolean);

const pool = databaseUrl
  ? new Pool({
      connectionString: databaseUrl,
      ssl: databaseUrl.includes('localhost') ? false : { rejectUnauthorized: false },
    })
  : null;

let schemaReady = false;

async function ensureSchema() {
  if (!pool || schemaReady) return;
  await pool.query(`
    CREATE TABLE IF NOT EXISTS site_leads (
      id BIGSERIAL PRIMARY KEY,
      nome TEXT NOT NULL,
      email TEXT NOT NULL,
      comentario TEXT NOT NULL DEFAULT '',
      locale TEXT NOT NULL DEFAULT 'pt',
      created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    );
    CREATE INDEX IF NOT EXISTS site_leads_created_at_idx ON site_leads (created_at DESC);
    CREATE INDEX IF NOT EXISTS site_leads_email_idx ON site_leads (email);
  `);
  schemaReady = true;
}

function corsOptionsDelegate(req, callback) {
  if (allowedOrigins.length === 0) {
    callback(null, { origin: false });
    return;
  }
  const origin = req.header('Origin');
  if (!origin || allowedOrigins.includes(origin)) {
    callback(null, { origin: true });
    return;
  }
  callback(null, { origin: false });
}

app.use(cors(corsOptionsDelegate));

const leadsLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 30,
  standardHeaders: true,
  legacyHeaders: false,
  message: { error: 'rate_limited' },
});

function looksLikeEmail(value) {
  if (typeof value !== 'string') return false;
  const trimmed = value.trim();
  if (trimmed.length < 5 || trimmed.length > 254) return false;
  const at = trimmed.indexOf('@');
  if (at <= 0 || at >= trimmed.length - 1) return false;
  return trimmed.includes('.', at + 1);
}

app.get('/health', async (_req, res) => {
  if (!pool) {
    res.status(503).json({ ok: false, dbConfigured: false });
    return;
  }
  try {
    await ensureSchema();
    await pool.query('SELECT 1');
    res.json({ ok: true, dbConfigured: true });
  } catch (err) {
    console.error('[leads-api] health', err);
    res.status(503).json({ ok: false, dbConfigured: true, error: 'db_unavailable' });
  }
});

app.post('/api/leads', leadsLimiter, async (req, res) => {
  try {
    if (!pool) {
      res.status(503).json({ error: 'db_unconfigured' });
      return;
    }

    const body = req.body || {};
    const honeypot = String(body.website || '').trim();
    if (honeypot) {
      res.status(200).json({ ok: true, skipped: 'honeypot' });
      return;
    }

    if (body.consent !== true) {
      res.status(400).json({ error: 'consent_required' });
      return;
    }

    const nome = String(body.nome || '').trim();
    const email = String(body.email || '').trim().toLowerCase();
    const comentario = String(body.comentario || '').trim().slice(0, 4000);
    const locale = String(body.locale || 'pt').trim().slice(0, 16) || 'pt';

    if (nome.length < 2 || nome.length > 200) {
      res.status(400).json({ error: 'name_invalid' });
      return;
    }
    if (!looksLikeEmail(email)) {
      res.status(400).json({ error: 'email_invalid' });
      return;
    }

    await ensureSchema();
    await pool.query(
      `INSERT INTO site_leads (nome, email, comentario, locale) VALUES ($1, $2, $3, $4)`,
      [nome, email, comentario, locale],
    );

    res.status(201).json({ ok: true });
  } catch (err) {
    console.error('[leads-api] POST /api/leads', err);
    res.status(500).json({ error: 'server_error' });
  }
});

const port = process.env.PORT || 10000;

app.listen(port, '0.0.0.0', () => {
  console.log(`[leads-api] listening on ${port}`);
  console.log(`[leads-api] CORS origins: ${allowedOrigins.length ? allowedOrigins.join(', ') : '(none — configure ALLOWED_ORIGINS)'}`);
  if (!databaseUrl) {
    console.warn('[leads-api] DATABASE_URL ausente — POST /api/leads retorna 503.');
  }
});
