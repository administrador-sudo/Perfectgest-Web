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
  'https://www.perfectgestdev.com',
  'https://perfectgest-web-desenvolvedor-apps.onrender.com',
  'http://localhost:8080',
  'http://127.0.0.1:8080',
  'http://localhost:8088',
  'http://127.0.0.1:8088',
  'http://localhost:8090',
  'http://127.0.0.1:8090',
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

const PLAY_CONTABIL_URL =
  'https://play.google.com/store/apps/details?id=br.perfectgestcontabil.dev';

function readEnv(name) {
  const wanted = String(name).trim();
  if (process.env[wanted]) return String(process.env[wanted]).trim();
  const hit = Object.keys(process.env).find(
    (k) => k.trim().toUpperCase() === wanted.toUpperCase(),
  );
  return hit ? String(process.env[hit] || '').trim() : '';
}

function resendReady() {
  return Boolean(readEnv('RESEND_API_KEY'));
}

function mailerReady() {
  return (
    resendReady() ||
    Boolean(process.env.SMTP_HOST && process.env.SMTP_USER && process.env.SMTP_PASS)
  );
}

function splitAddresses(raw) {
  return String(raw || '')
    .split(',')
    .map((s) => s.trim())
    .filter(Boolean);
}

async function sendResend({ from, to, subject, text }) {
  const key = readEnv('RESEND_API_KEY');
  const response = await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${key}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      from,
      to: splitAddresses(to),
      subject,
      text,
    }),
    signal: AbortSignal.timeout(20000),
  });
  if (!response.ok) {
    const body = await response.text();
    throw new Error(`resend_${response.status}: ${body.slice(0, 180)}`);
  }
  return true;
}

async function sendMailMessage({ from, to, subject, text }) {
  if (resendReady()) {
    return sendResend({ from, to, subject, text });
  }
  try {
    require('nodemailer');
  } catch (err) {
    console.warn('[leads-api] nodemailer indisponivel:', err.message);
    return false;
  }
  const transporter = createTransporter();
  await transporter.sendMail({ from, to, subject, text });
  return true;
}

function copyMailCopy({ nome, comentario, locale }) {
  const loc = String(locale || 'pt').toLowerCase();
  if (loc.startsWith('en')) {
    return {
      subject: 'Copy of your registration - Perfect Gest Dev',
      text:
        `Hello, ${nome}.\n\n` +
        `This is a copy of the registration sent to the accounting office.\n\n` +
        `${comentario}\n\n` +
        `Exclusive office app on Google Play:\n${PLAY_CONTABIL_URL}\n`,
    };
  }
  if (loc.startsWith('es')) {
    return {
      subject: 'Copia de su registro - Perfect Gest Dev',
      text:
        `Hola, ${nome}.\n\n` +
        `Esta es una copia del registro enviado al despacho contable.\n\n` +
        `${comentario}\n\n` +
        `Herramienta exclusiva del despacho en Google Play:\n${PLAY_CONTABIL_URL}\n`,
    };
  }
  return {
    subject: 'Cópia do seu cadastro - Perfect Gest Dev',
    text:
      `Olá, ${nome}.\n\n` +
      `Esta é uma cópia do cadastro enviado ao escritório de contabilidade.\n\n` +
      `${comentario}\n\n` +
      `Ferramenta exclusiva do escritório na Google Play:\n${PLAY_CONTABIL_URL}\n`,
  };
}

function officeAddress() {
  return String(
    process.env.MAIL_TO || process.env.MAIL_BCC || 'suporte@perfectgestdev.com',
  ).trim();
}

function createTransporter() {
  const nodemailer = require('nodemailer');
  const host = String(process.env.SMTP_HOST || '').trim();
  const user = String(process.env.SMTP_USER || '').trim();
  const pass = String(process.env.SMTP_PASS || '').replace(/\s+/g, '');
  const timeouts = {
    connectionTimeout: 45000,
    greetingTimeout: 25000,
    socketTimeout: 45000,
  };
  const isGmail = /gmail/i.test(host) || /@gmail\.com$/i.test(user);
  if (isGmail) {
    return nodemailer.createTransport({
      service: 'gmail',
      family: 4,
      auth: { user, pass },
      ...timeouts,
    });
  }
  const port = Number(process.env.SMTP_PORT || 465);
  return nodemailer.createTransport({
    host,
    port,
    family: 4,
    secure: process.env.SMTP_SECURE !== 'false',
    auth: { user, pass },
    ...timeouts,
  });
}

async function notifyOffice({ nome, email, comentario, locale }) {
  if (!mailerReady()) {
    console.warn('[leads-api] SMTP/Resend ausente — escritorio nao notificado');
    return false;
  }
  const from = process.env.MAIL_FROM || process.env.SMTP_USER;
  return sendMailMessage({
    from,
    to: officeAddress(),
    subject: `[Lead site] ${nome}`,
    text:
      `Novo lead no site Perfect Gest Dev.\n\n` +
      `Nome: ${nome}\n` +
      `E-mail: ${email}\n` +
      `Idioma: ${locale || 'pt'}\n\n` +
      `${comentario || '(sem comentario)'}\n`,
  });
}

async function sendUserCopy({ nome, email, comentario, locale }) {
  if (!mailerReady()) {
    console.warn('[leads-api] SMTP/Resend ausente — copia nao enviada');
    return false;
  }
  const { subject, text } = copyMailCopy({ nome, comentario, locale });
  const from = process.env.MAIL_FROM || process.env.SMTP_USER;
  return sendMailMessage({ from, to: email, subject, text });
}

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

app.get('/api/mail-check', leadsLimiter, async (_req, res) => {
  const host = String(process.env.SMTP_HOST || '').trim();
  const user = String(process.env.SMTP_USER || '').trim();
  const from = String(process.env.MAIL_FROM || process.env.SMTP_USER || '').trim();
  const report = {
    ok: false,
    mailerReady: mailerReady(),
    resendMode: resendReady(),
    resendKeySet: resendReady(),
    resendEnvNames: Object.keys(process.env)
      .filter((k) => /resend/i.test(k))
      .map((k) => k.trim()),
    smtpHost: host || null,
    smtpUser: user || null,
    smtpPassSet: Boolean(String(process.env.SMTP_PASS || '').trim()),
    smtpPort: String(process.env.SMTP_PORT || '') || null,
    smtpSecure: process.env.SMTP_SECURE || null,
    mailFrom: from || null,
    mailBcc: officeAddress() || null,
    gmailMode: /gmail/i.test(host) || /@gmail\.com$/i.test(user),
    verifyOk: false,
    verifyMs: 0,
    verifyError: null,
  };
  const started = Date.now();
  try {
    if (resendReady()) {
      const response = await fetch('https://api.resend.com/domains', {
        headers: { Authorization: `Bearer ${readEnv('RESEND_API_KEY')}` },
        signal: AbortSignal.timeout(12000),
      });
      if (!response.ok) {
        const body = await response.text();
        throw new Error(`resend_${response.status}: ${body.slice(0, 160)}`);
      }
      report.verifyOk = true;
      report.ok = true;
    } else if (report.mailerReady) {
      const transporter = createTransporter();
      await Promise.race([
        transporter.verify(),
        new Promise((_, reject) => {
          setTimeout(() => reject(new Error('verify_timeout_15s')), 15000);
        }),
      ]);
      report.verifyOk = true;
      report.ok = true;
    } else {
      report.verifyError = 'smtp_or_resend_not_ready';
    }
  } catch (err) {
    report.verifyError = String(err && err.message ? err.message : err).slice(0, 200);
  }
  report.verifyMs = Date.now() - started;
  res.status(200).json(report);
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
    let officeSent = false;
    let mailError;
    try {
      officeSent = await Promise.race([
        notifyOffice({ nome, email, comentario, locale }),
        new Promise((_, reject) => {
          setTimeout(() => reject(new Error('smtp_timeout_40s')), 40000);
        }),
      ]);
      if (!officeSent) mailError = 'smtp_not_ready';
    } catch (mailErr) {
      mailError = String(mailErr && mailErr.message ? mailErr.message : mailErr).slice(0, 180);
      console.error('[leads-api] e-mail escritorio', mailErr);
    }
    let copySent = false;
    if (body.copiaUsuario === true && officeSent) {
      try {
        copySent = await sendUserCopy({ nome, email, comentario, locale });
      } catch (mailErr) {
        console.error('[leads-api] copia e-mail', mailErr);
      }
    }
    res.status(201).json({ ok: true, storage, copySent, officeSent, mailError });
  } catch (err) {
    console.error('[leads-api] POST /api/leads', err);
    res.status(500).json({ error: 'server_error' });
  }
});

const port = Number(process.env.PORT) || 10000;

app.listen(port, '0.0.0.0', () => {
  console.log(`[leads-api] listening on ${port}`);
  console.log(`[leads-api] resendKeySet: ${resendReady()}`);
  console.log(`[leads-api] CORS: ${allowedOrigins.join(', ')}`);
  if (pgPool) {
    console.log('[leads-api] storage: postgres (site_leads)');
  } else if (allowFileFallback) {
    console.log(`[leads-api] storage: file dev only (${leadsFile})`);
  } else {
    console.warn('[leads-api] DATABASE_URL ausente — produção rejeita POST /api/leads.');
  }
});
