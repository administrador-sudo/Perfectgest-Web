/**
 * API de leads do site (pre-cadastro) — Render Web Service + PostgreSQL (Opção B).
 *
 * Produção (Render): DATABASE_URL obrigatório — dados em `site_leads`.
 * Desenvolvimento local: sem DATABASE_URL grava JSONL em ./data (apenas testes).
 *
 * Consulta / export: docs/RENDER_LEADS_POSTGRES.md
 */
const fs = require('node:fs');
const path = require('node:path');
const express = require('express');
const cors = require('cors');
const rateLimit = require('express-rate-limit');

const isProduction = process.env.RENDER === 'true' || process.env.NODE_ENV === 'production';
const allowFileFallback = !isProduction && process.env.ALLOW_FILE_LEADS !== '0';

let pgPool = null;
try {
  // pg opcional — servidor arranca mesmo sem módulo em ambientes mínimos.
  const { Pool } = require('pg');
  const databaseUrl = process.env.DATABASE_URL;
  if (databaseUrl) {
    pgPool = new Pool({
      connectionString: databaseUrl,
      ssl: databaseUrl.includes('localhost') ? false : { rejectUnauthorized: false },
    });
  }
} catch (err) {
  console.warn('[leads-api] pg indisponível:', err.message);
}

const DEFAULT_ORIGINS = [
  'https://perfectgestdev.com',
  'https://perfectgest-web-desenvolvedor-apps.onrender.com',
  'http://localhost:8080',
  'http://127.0.0.1:8080',
];

const allowedOrigins = (process.env.ALLOWED_ORIGINS || DEFAULT_ORIGINS.join(','))
  .split(',')
  .map((s) => s.trim())
  .filter(Boolean);

const dataDir = process.env.LEADS_DATA_DIR || path.join(__dirname, '..', 'data');
const leadsFile = path.join(dataDir, 'site_leads.jsonl');

const app = express();
app.use(express.json({ limit: '32kb' }));

app.use(
  cors({
    origin(origin, callback) {
      if (!origin || allowedOrigins.includes(origin)) {
        callback(null, true);
        return;
      }
      console.warn('[leads-api] CORS blocked:', origin);
      callback(null, false);
    },
  }),
);

let schemaReady = false;

async function ensurePgSchema() {
  if (!pgPool || schemaReady) return;
  await pgPool.query(`
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

function appendLeadFile(record) {
  fs.mkdirSync(dataDir, { recursive: true });
  fs.appendFileSync(leadsFile, `${JSON.stringify(record)}\n`, 'utf8');
}

async function persistLead({ nome, email, comentario, locale }) {
  if (pgPool) {
    await ensurePgSchema();
    await pgPool.query(
      `INSERT INTO site_leads (nome, email, comentario, locale) VALUES ($1, $2, $3, $4)`,
      [nome, email, comentario, locale],
    );
    return 'postgres';
  }
  if (!allowFileFallback) {
    throw new Error('DATABASE_URL required in production');
  }
  appendLeadFile({
    nome,
    email,
    comentario,
    locale,
    created_at: new Date().toISOString(),
  });
  return 'file';
}

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

app.get('/', (_req, res) => {
  res.json({
    ok: true,
    service: 'perfectgest-leads-api',
    storage: pgPool ? 'postgres' : 'file',
  });
});

app.get('/health', async (_req, res) => {
  try {
    if (pgPool) {
      await ensurePgSchema();
      await pgPool.query('SELECT 1');
      res.json({ ok: true, storage: 'postgres' });
      return;
    }
    if (isProduction) {
      res.status(503).json({
        ok: false,
        error: 'database_required',
        hint: 'Ligue DATABASE_URL (Postgres Render). Ver docs/RENDER_LEADS_POSTGRES.md',
      });
      return;
    }
    fs.mkdirSync(dataDir, { recursive: true });
    res.json({ ok: true, storage: 'file', file: leadsFile, mode: 'development' });
  } catch (err) {
    console.error('[leads-api] health', err);
    res.status(503).json({ ok: false, error: 'storage_unavailable' });
  }
});

app.post('/api/leads', leadsLimiter, async (req, res) => {
  try {
    if (!pgPool && isProduction) {
      res.status(503).json({ error: 'database_required' });
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

    const storage = await persistLead({ nome, email, comentario, locale });
    res.status(201).json({ ok: true, storage });
  } catch (err) {
    console.error('[leads-api] POST /api/leads', err);
    res.status(500).json({ error: 'server_error' });
  }
});

const port = Number(process.env.PORT) || 10000;

app.listen(port, '0.0.0.0', () => {
  console.log(`[leads-api] listening on ${port}`);
  console.log(`[leads-api] CORS: ${allowedOrigins.join(', ')}`);
  if (pgPool) {
    console.log('[leads-api] storage: postgres (site_leads)');
  } else if (allowFileFallback) {
    console.log(`[leads-api] storage: file dev only (${leadsFile})`);
  } else {
    console.warn('[leads-api] DATABASE_URL ausente — produção rejeita POST /api/leads.');
  }
});
