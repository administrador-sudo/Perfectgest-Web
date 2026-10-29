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
const crypto = require('node:crypto');
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
const orcamentoPrecosFile = path.join(dataDir, 'orcamento_precos.json');
const orcamentoRegistrosFile = path.join(dataDir, 'orcamento_registros.json');
const ORCAMENTO_PRECOS_PIN = String(process.env.ORCAMENTO_PRECOS_PIN || '061972').trim();
const ORCAMENTO_VENDEDOR_PIN = String(process.env.ORCAMENTO_VENDEDOR_PIN || '112026').trim();
const ORCAMENTO_SESSION_SECRET = String(process.env.ORCAMENTO_SESSION_SECRET || 'pg-orcamento-sessao-v1').trim();
const ORCAMENTO_SESSION_MS = 12 * 60 * 60 * 1000;

const app = express();
app.use(express.json({ limit: '256kb' }));

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
    CREATE TABLE IF NOT EXISTS orcamento_precos (
      id INT PRIMARY KEY DEFAULT 1 CHECK (id = 1),
      precos_m2 JSONB NOT NULL DEFAULT '{}'::jsonb,
      precos_vidro JSONB NOT NULL DEFAULT '{}'::jsonb,
      updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    );
    ALTER TABLE orcamento_precos ADD COLUMN IF NOT EXISTS fatia_material DOUBLE PRECISION NOT NULL DEFAULT 60;
    ALTER TABLE orcamento_precos ADD COLUMN IF NOT EXISTS fatia_mao_obra DOUBLE PRECISION NOT NULL DEFAULT 40;
    INSERT INTO orcamento_precos (id) VALUES (1) ON CONFLICT (id) DO NOTHING;
    CREATE TABLE IF NOT EXISTS orcamento_precos_bkp (
      id BIGSERIAL PRIMARY KEY,
      precos_m2 JSONB NOT NULL DEFAULT '{}'::jsonb,
      precos_vidro JSONB NOT NULL DEFAULT '{}'::jsonb,
      fatia_material DOUBLE PRECISION NOT NULL DEFAULT 60,
      fatia_mao_obra DOUBLE PRECISION NOT NULL DEFAULT 40,
      created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    );
    CREATE INDEX IF NOT EXISTS orcamento_precos_bkp_created_at_idx ON orcamento_precos_bkp (created_at DESC);
    CREATE TABLE IF NOT EXISTS orcamento_registros (
      id BIGSERIAL PRIMARY KEY,
      payload JSONB NOT NULL DEFAULT '{}'::jsonb,
      cliente TEXT NOT NULL DEFAULT '',
      total DOUBLE PRECISION NOT NULL DEFAULT 0,
      comissao DOUBLE PRECISION NOT NULL DEFAULT 0,
      created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    );
    CREATE INDEX IF NOT EXISTS orcamento_registros_created_at_idx ON orcamento_registros (created_at DESC);
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

function asPriceMap(raw) {
  const out = {};
  if (!raw || typeof raw !== 'object' || Array.isArray(raw)) return out;
  for (const [k, v] of Object.entries(raw)) {
    const n = typeof v === 'number' ? v : Number(String(v).replace(',', '.'));
    if (!Number.isFinite(n) || n < 0 || n > 1e7) continue;
    out[String(k).slice(0, 80)] = n;
  }
  return out;
}

function emptyPrecos() {
  return { precosM2: {}, precosVidro: {}, fatiaMaterial: 60, fatiaMaoObra: 40 };
}

function asFatiaMaterial(raw) {
  const n = typeof raw === 'number' ? raw : Number(String(raw ?? '').replace(',', '.'));
  if (!Number.isFinite(n)) return 60;
  return Math.min(100, Math.max(0, n));
}

function asFatiaPar(materialRaw) {
  const material = asFatiaMaterial(materialRaw);
  const maoObra = Math.round((100 - material) * 100) / 100;
  return { fatiaMaterial: material, fatiaMaoObra: maoObra };
}

function hasPrices(data) {
  for (const map of [data && data.precosM2, data && data.precosVidro]) {
    if (!map || typeof map !== 'object') continue;
    for (const v of Object.values(map)) {
      if (typeof v === 'number' && v > 0) return true;
    }
  }
  return false;
}

function precosIguais(a, b) {
  return (
    JSON.stringify((a && a.precosM2) || {}) === JSON.stringify((b && b.precosM2) || {}) &&
    JSON.stringify((a && a.precosVidro) || {}) === JSON.stringify((b && b.precosVidro) || {}) &&
    Number(a && a.fatiaMaterial) === Number(b && b.fatiaMaterial)
  );
}

function readPrecosFileBundle() {
  try {
    if (!fs.existsSync(orcamentoPrecosFile)) return { ...emptyPrecos(), historico: [] };
    const raw = JSON.parse(fs.readFileSync(orcamentoPrecosFile, 'utf8'));
    const fatia = asFatiaPar(raw && raw.fatiaMaterial);
    const historico = Array.isArray(raw.historico) ? raw.historico : [];
    return {
      precosM2: asPriceMap(raw && raw.precosM2),
      precosVidro: asPriceMap(raw && raw.precosVidro),
      fatiaMaterial: fatia.fatiaMaterial,
      fatiaMaoObra: fatia.fatiaMaoObra,
      historico,
    };
  } catch (_) {
    return { ...emptyPrecos(), historico: [] };
  }
}

function readPrecosFile() {
  const b = readPrecosFileBundle();
  return {
    precosM2: b.precosM2,
    precosVidro: b.precosVidro,
    fatiaMaterial: b.fatiaMaterial,
    fatiaMaoObra: b.fatiaMaoObra,
  };
}

function writePrecosFile(precosM2, precosVidro, fatiaMaterial, fatiaMaoObra, historico) {
  const hist = historico != null ? historico : readPrecosFileBundle().historico;
  fs.mkdirSync(dataDir, { recursive: true });
  fs.writeFileSync(
    orcamentoPrecosFile,
    `${JSON.stringify({ precosM2, precosVidro, fatiaMaterial, fatiaMaoObra, historico: hist }, null, 2)}\n`,
    'utf8',
  );
}

async function readOrcamentoPrecos() {
  if (pgPool) {
    await ensurePgSchema();
    const result = await pgPool.query(
      'SELECT precos_m2, precos_vidro, fatia_material, fatia_mao_obra FROM orcamento_precos WHERE id = 1',
    );
    const row = result.rows[0];
    if (!row) return emptyPrecos();
    const fatia = asFatiaPar(row.fatia_material);
    return {
      precosM2: asPriceMap(row.precos_m2),
      precosVidro: asPriceMap(row.precos_vidro),
      fatiaMaterial: fatia.fatiaMaterial,
      fatiaMaoObra: fatia.fatiaMaoObra,
    };
  }
  if (!allowFileFallback) {
    throw new Error('DATABASE_URL required in production');
  }
  return readPrecosFile();
}

async function snapshotPrecosSeMudou(novo) {
  const atual = await readOrcamentoPrecos();
  if (!hasPrices(atual) || precosIguais(atual, novo)) return;
  if (pgPool) {
    await pgPool.query(
      `INSERT INTO orcamento_precos_bkp (precos_m2, precos_vidro, fatia_material, fatia_mao_obra)
       VALUES ($1::jsonb, $2::jsonb, $3, $4)`,
      [
        JSON.stringify(atual.precosM2),
        JSON.stringify(atual.precosVidro),
        atual.fatiaMaterial,
        atual.fatiaMaoObra,
      ],
    );
    return;
  }
  const bundle = readPrecosFileBundle();
  bundle.historico.unshift({
    id: String(Date.now()),
    createdAt: new Date().toISOString(),
    precosM2: atual.precosM2,
    precosVidro: atual.precosVidro,
    fatiaMaterial: atual.fatiaMaterial,
    fatiaMaoObra: atual.fatiaMaoObra,
  });
  writePrecosFile(
    bundle.precosM2,
    bundle.precosVidro,
    bundle.fatiaMaterial,
    bundle.fatiaMaoObra,
    bundle.historico.slice(0, 80),
  );
}

async function listPrecosHistorico() {
  if (pgPool) {
    await ensurePgSchema();
    const result = await pgPool.query(
      'SELECT id, created_at FROM orcamento_precos_bkp ORDER BY created_at DESC LIMIT 80',
    );
    return result.rows.map((r) => ({
      id: String(r.id),
      createdAt: r.created_at.toISOString(),
    }));
  }
  return readPrecosFileBundle().historico.map((h) => ({
    id: String(h.id),
    createdAt: h.createdAt,
  }));
}

async function restorePrecosHistorico(id) {
  if (pgPool) {
    await ensurePgSchema();
    const result = await pgPool.query(
      'SELECT precos_m2, precos_vidro, fatia_material, fatia_mao_obra FROM orcamento_precos_bkp WHERE id = $1',
      [id],
    );
    const row = result.rows[0];
    if (!row) return null;
    const fatia = asFatiaPar(row.fatia_material);
    return {
      precosM2: asPriceMap(row.precos_m2),
      precosVidro: asPriceMap(row.precos_vidro),
      fatiaMaterial: fatia.fatiaMaterial,
      fatiaMaoObra: fatia.fatiaMaoObra,
    };
  }
  const hit = readPrecosFileBundle().historico.find((h) => String(h.id) === String(id));
  if (!hit) return null;
  const fatia = asFatiaPar(hit.fatiaMaterial);
  return {
    precosM2: asPriceMap(hit.precosM2),
    precosVidro: asPriceMap(hit.precosVidro),
    fatiaMaterial: fatia.fatiaMaterial,
    fatiaMaoObra: fatia.fatiaMaoObra,
  };
}

async function deletePrecosHistorico(id) {
  if (pgPool) {
    await ensurePgSchema();
    const result = await pgPool.query('DELETE FROM orcamento_precos_bkp WHERE id = $1', [id]);
    return result.rowCount > 0;
  }
  const bundle = readPrecosFileBundle();
  const next = bundle.historico.filter((h) => String(h.id) !== String(id));
  if (next.length === bundle.historico.length) return false;
  writePrecosFile(
    bundle.precosM2,
    bundle.precosVidro,
    bundle.fatiaMaterial,
    bundle.fatiaMaoObra,
    next,
  );
  return true;
}

function clipStr(raw, max) {
  return String(raw || '').trim().slice(0, max);
}

function asMoney(raw) {
  const n = typeof raw === 'number' ? raw : Number(String(raw ?? '').replace(',', '.'));
  if (!Number.isFinite(n) || n < 0 || n > 1e9) return 0;
  return Math.round(n * 100) / 100;
}

function sanitizeCadastro(raw) {
  const c = raw && typeof raw === 'object' ? raw : {};
  return {
    empresaNome: clipStr(c.empresaNome, 160),
    cnpj: clipStr(c.cnpj, 32),
    endereco: clipStr(c.endereco, 240),
    telefone: clipStr(c.telefone, 40),
    email: clipStr(c.email, 120),
    fabricante: clipStr(c.fabricante, 120),
    vendedor: clipStr(c.vendedor, 120),
    instalador: clipStr(c.instalador, 120),
    cliente: clipStr(c.cliente, 160),
    validadeAte: clipStr(c.validadeAte, 20),
  };
}

function sanitizeItem(it) {
  const o = it && typeof it === 'object' ? it : {};
  let areaOverride = null;
  if (o.areaM2Override != null && o.areaM2Override !== '') {
    const n = asMoney(o.areaM2Override);
    areaOverride = n > 0 ? n : null;
  }
  return {
    id: clipStr(o.id, 80),
    catalogId: clipStr(o.catalogId, 80),
    nome: clipStr(o.nome, 160),
    precoM2: asMoney(o.precoM2),
    larguraMm: asMoney(o.larguraMm),
    alturaMm: asMoney(o.alturaMm),
    areaM2Override: areaOverride,
    cor: clipStr(o.cor, 80),
    modelo: clipStr(o.modelo, 80),
    pctMaoObra: asMoney(o.pctMaoObra),
    pctComissao: asMoney(o.pctComissao),
    instalacao: asMoney(o.instalacao),
    obs: clipStr(o.obs, 400),
    vidroId: clipStr(o.vidroId, 40),
    precoM2Vidro: asMoney(o.precoM2Vidro),
    precoM2VidroPadrao: asMoney(o.precoM2VidroPadrao),
  };
}

function sanitizeRegistro(body) {
  const cadastro = sanitizeCadastro(body.cadastro);
  const itensIn = Array.isArray(body.itens) ? body.itens.slice(0, 80) : [];
  const itens = itensIn.map(sanitizeItem);
  return {
    v: 1,
    cadastro,
    itens,
    cliente: cadastro.cliente,
    vendedor: cadastro.vendedor,
    empresaNome: cadastro.empresaNome,
    data: clipStr(body.data, 40),
    total: asMoney(body.total),
    comissao: asMoney(body.comissao),
  };
}

function readRegistrosFile() {
  try {
    if (!fs.existsSync(orcamentoRegistrosFile)) return [];
    const raw = JSON.parse(fs.readFileSync(orcamentoRegistrosFile, 'utf8'));
    return Array.isArray(raw) ? raw : [];
  } catch (_) {
    return [];
  }
}

function writeRegistrosFile(list) {
  fs.mkdirSync(dataDir, { recursive: true });
  fs.writeFileSync(orcamentoRegistrosFile, `${JSON.stringify(list.slice(0, 400), null, 2)}\n`, 'utf8');
}

async function insertRegistro(payload) {
  if (pgPool) {
    await ensurePgSchema();
    const result = await pgPool.query(
      `INSERT INTO orcamento_registros (payload, cliente, total, comissao)
       VALUES ($1::jsonb, $2, $3, $4) RETURNING id, created_at`,
      [JSON.stringify(payload), payload.cliente, payload.total, payload.comissao],
    );
    return { id: String(result.rows[0].id), createdAt: result.rows[0].created_at.toISOString() };
  }
  const list = readRegistrosFile();
  const row = {
    id: String(Date.now()),
    createdAt: new Date().toISOString(),
    cliente: payload.cliente,
    total: payload.total,
    comissao: payload.comissao,
    payload,
  };
  list.unshift(row);
  writeRegistrosFile(list);
  return { id: row.id, createdAt: row.createdAt };
}

function asRegistroId(id) {
  const n = Number(String(id || '').trim());
  if (!Number.isFinite(n) || n <= 0) return null;
  return n;
}

function asPayloadObject(raw) {
  if (raw && typeof raw === 'object' && !Array.isArray(raw)) return raw;
  if (typeof raw === 'string' && raw.trim()) {
    try {
      const p = JSON.parse(raw);
      if (p && typeof p === 'object' && !Array.isArray(p)) return p;
    } catch (_) {}
  }
  return {};
}

async function getRegistro(id) {
  const nid = asRegistroId(id);
  if (nid == null) return null;
  if (pgPool) {
    await ensurePgSchema();
    const result = await pgPool.query(
      'SELECT id, payload, cliente, total, comissao, created_at FROM orcamento_registros WHERE id = $1',
      [nid],
    );
    const row = result.rows[0];
    if (!row) return null;
    return {
      id: String(row.id),
      payload: asPayloadObject(row.payload),
      cliente: row.cliente || '',
      total: Number(row.total) || 0,
      comissao: Number(row.comissao) || 0,
      createdAt: row.created_at.toISOString(),
    };
  }
  const hit = readRegistrosFile().find((r) => String(r.id) === String(nid));
  if (!hit) return null;
  return {
    id: String(hit.id),
    payload: asPayloadObject(hit.payload),
    cliente: hit.cliente || '',
    total: Number(hit.total) || 0,
    comissao: Number(hit.comissao) || 0,
    createdAt: hit.createdAt,
  };
}

async function updateRegistro(id, payload) {
  const nid = asRegistroId(id);
  if (nid == null) return null;
  if (pgPool) {
    await ensurePgSchema();
    const result = await pgPool.query(
      `UPDATE orcamento_registros
       SET payload = $2::jsonb, cliente = $3, total = $4, comissao = $5
       WHERE id = $1 RETURNING id, created_at`,
      [nid, JSON.stringify(payload), payload.cliente, payload.total, payload.comissao],
    );
    if (!result.rows[0]) return null;
    return { id: String(result.rows[0].id), createdAt: result.rows[0].created_at.toISOString() };
  }
  const list = readRegistrosFile();
  const idx = list.findIndex((r) => String(r.id) === String(nid));
  if (idx < 0) return null;
  list[idx] = {
    ...list[idx],
    cliente: payload.cliente,
    total: payload.total,
    comissao: payload.comissao,
    payload,
  };
  writeRegistrosFile(list);
  return { id: String(list[idx].id), createdAt: list[idx].createdAt };
}

async function listRegistros() {
  if (pgPool) {
    await ensurePgSchema();
    const result = await pgPool.query(
      'SELECT id, cliente, total, comissao, created_at FROM orcamento_registros ORDER BY created_at DESC LIMIT 400',
    );
    return result.rows.map((r) => ({
      id: String(r.id),
      cliente: r.cliente || '',
      total: Number(r.total) || 0,
      comissao: Number(r.comissao) || 0,
      createdAt: r.created_at.toISOString(),
    }));
  }
  return readRegistrosFile().map((r) => ({
    id: String(r.id),
    cliente: r.cliente || '',
    total: Number(r.total) || 0,
    comissao: Number(r.comissao) || 0,
    createdAt: r.createdAt,
  }));
}

async function deleteRegistro(id) {
  const nid = asRegistroId(id);
  if (nid == null) return false;
  if (pgPool) {
    await ensurePgSchema();
    const result = await pgPool.query('DELETE FROM orcamento_registros WHERE id = $1', [nid]);
    return result.rowCount > 0;
  }
  const list = readRegistrosFile();
  const next = list.filter((r) => String(r.id) !== String(nid));
  if (next.length === list.length) return false;
  writeRegistrosFile(next);
  return true;
}

function papelDoPin(pin) {
  if (pin === ORCAMENTO_PRECOS_PIN) return 'adm';
  if (pin === ORCAMENTO_VENDEDOR_PIN) return 'vendedor';
  return null;
}

function signSessao(papel) {
  const exp = Date.now() + ORCAMENTO_SESSION_MS;
  const payload = Buffer.from(JSON.stringify({ papel, exp }), 'utf8').toString('base64url');
  const sig = crypto.createHmac('sha256', ORCAMENTO_SESSION_SECRET).update(payload).digest('base64url');
  return `${payload}.${sig}`;
}

function verifySessao(token) {
  const parts = String(token || '').split('.');
  if (parts.length !== 2) return null;
  const [payload, sig] = parts;
  const expected = crypto.createHmac('sha256', ORCAMENTO_SESSION_SECRET).update(payload).digest('base64url');
  const a = Buffer.from(sig);
  const b = Buffer.from(expected);
  if (a.length !== b.length || !crypto.timingSafeEqual(a, b)) return null;
  try {
    const data = JSON.parse(Buffer.from(payload, 'base64url').toString('utf8'));
    if (!data || (data.papel !== 'adm' && data.papel !== 'vendedor')) return null;
    if (Date.now() > Number(data.exp || 0)) return null;
    return data;
  } catch (_) {
    return null;
  }
}

function sessaoDe(req) {
  const h = String(req.headers.authorization || '');
  const m = h.match(/^Bearer\s+(\S+)/i);
  return m ? verifySessao(m[1]) : null;
}

function exigirSessao(req, res) {
  const s = sessaoDe(req);
  if (!s) {
    res.status(403).json({ error: 'pin_invalid' });
    return null;
  }
  return s;
}

function exigirAdm(req, res) {
  const s = exigirSessao(req, res);
  if (!s) return null;
  if (s.papel !== 'adm') {
    res.status(403).json({ error: 'pin_invalid' });
    return null;
  }
  return s;
}

async function writeOrcamentoPrecos(precosM2, precosVidro, fatiaMaterial, fatiaMaoObra) {
  const fatia = asFatiaPar(fatiaMaterial, fatiaMaoObra);
  await snapshotPrecosSeMudou({
    precosM2,
    precosVidro,
    fatiaMaterial: fatia.fatiaMaterial,
    fatiaMaoObra: fatia.fatiaMaoObra,
  });
  if (pgPool) {
    await ensurePgSchema();
    await pgPool.query(
      `INSERT INTO orcamento_precos (id, precos_m2, precos_vidro, fatia_material, fatia_mao_obra, updated_at)
       VALUES (1, $1::jsonb, $2::jsonb, $3, $4, NOW())
       ON CONFLICT (id) DO UPDATE SET
         precos_m2 = EXCLUDED.precos_m2,
         precos_vidro = EXCLUDED.precos_vidro,
         fatia_material = EXCLUDED.fatia_material,
         fatia_mao_obra = EXCLUDED.fatia_mao_obra,
         updated_at = NOW()`,
      [JSON.stringify(precosM2), JSON.stringify(precosVidro), fatia.fatiaMaterial, fatia.fatiaMaoObra],
    );
    return 'postgres';
  }
  if (!allowFileFallback) {
    throw new Error('DATABASE_URL required in production');
  }
  writePrecosFile(precosM2, precosVidro, fatia.fatiaMaterial, fatia.fatiaMaoObra);
  return 'file';
}

const leadsLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 30,
  standardHeaders: true,
  legacyHeaders: false,
  message: { error: 'rate_limited' },
});

const orcamentoLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 120,
  standardHeaders: true,
  legacyHeaders: false,
  message: { error: 'rate_limited' },
});

const sessaoLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 20,
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

app.post('/api/orcamento-sessao', sessaoLimiter, (req, res) => {
  const pin = String((req.body && req.body.pin) || '').trim();
  const papel = papelDoPin(pin);
  if (!papel) {
    res.status(403).json({ error: 'pin_invalid' });
    return;
  }
  res.json({ ok: true, token: signSessao(papel), papel });
});

app.get('/api/orcamento-precos', orcamentoLimiter, async (req, res) => {
  try {
    if (!exigirSessao(req, res)) return;
    if (!pgPool && isProduction) {
      res.status(503).json({ error: 'database_required' });
      return;
    }
    const data = await readOrcamentoPrecos();
    res.json({ ok: true, ...data });
  } catch (err) {
    console.error('[leads-api] GET /api/orcamento-precos', err);
    res.status(500).json({ error: 'server_error' });
  }
});

app.put('/api/orcamento-precos', orcamentoLimiter, async (req, res) => {
  try {
    if (!exigirAdm(req, res)) return;
    if (!pgPool && isProduction) {
      res.status(503).json({ error: 'database_required' });
      return;
    }
    const body = req.body || {};
    const precosM2 = asPriceMap(body.precosM2);
    const precosVidro = asPriceMap(body.precosVidro);
    const fatia = asFatiaPar(body.fatiaMaterial);
    const storage = await writeOrcamentoPrecos(
      precosM2,
      precosVidro,
      fatia.fatiaMaterial,
      fatia.fatiaMaoObra,
    );
    res.json({ ok: true, storage });
  } catch (err) {
    console.error('[leads-api] PUT /api/orcamento-precos', err);
    res.status(500).json({ error: 'server_error' });
  }
});

app.get('/api/orcamento-precos/historico', orcamentoLimiter, async (req, res) => {
  try {
    if (!exigirAdm(req, res)) return;
    if (!pgPool && isProduction) {
      res.status(503).json({ error: 'database_required' });
      return;
    }
    const historico = await listPrecosHistorico();
    res.json({ ok: true, historico });
  } catch (err) {
    console.error('[leads-api] GET /api/orcamento-precos/historico', err);
    res.status(500).json({ error: 'server_error' });
  }
});

app.post('/api/orcamento-precos/historico/restaurar', orcamentoLimiter, async (req, res) => {
  try {
    if (!exigirAdm(req, res)) return;
    if (!pgPool && isProduction) {
      res.status(503).json({ error: 'database_required' });
      return;
    }
    const id = String((req.body && req.body.id) || '').trim();
    const found = await restorePrecosHistorico(id);
    if (!found) {
      res.status(404).json({ error: 'not_found' });
      return;
    }
    const storage = await writeOrcamentoPrecos(
      found.precosM2,
      found.precosVidro,
      found.fatiaMaterial,
      found.fatiaMaoObra,
    );
    res.json({ ok: true, storage, ...found });
  } catch (err) {
    console.error('[leads-api] POST /api/orcamento-precos/historico/restaurar', err);
    res.status(500).json({ error: 'server_error' });
  }
});

app.delete('/api/orcamento-precos/historico', orcamentoLimiter, async (req, res) => {
  try {
    if (!exigirAdm(req, res)) return;
    if (!pgPool && isProduction) {
      res.status(503).json({ error: 'database_required' });
      return;
    }
    const id = String((req.body && req.body.id) || (req.query && req.query.id) || '').trim();
    const ok = await deletePrecosHistorico(id);
    if (!ok) {
      res.status(404).json({ error: 'not_found' });
      return;
    }
    res.json({ ok: true });
  } catch (err) {
    console.error('[leads-api] DELETE /api/orcamento-precos/historico', err);
    res.status(500).json({ error: 'server_error' });
  }
});

app.post('/api/orcamento-registros', orcamentoLimiter, async (req, res) => {
  try {
    if (!exigirSessao(req, res)) return;
    if (!pgPool && isProduction) {
      res.status(503).json({ error: 'database_required' });
      return;
    }
    const payload = sanitizeRegistro(req.body || {});
    const saved = await insertRegistro(payload);
    res.status(201).json({ ok: true, ...saved });
  } catch (err) {
    console.error('[leads-api] POST /api/orcamento-registros', err);
    res.status(500).json({ error: 'server_error' });
  }
});

app.get('/api/orcamento-registros', orcamentoLimiter, async (req, res) => {
  try {
    if (!exigirSessao(req, res)) return;
    if (!pgPool && isProduction) {
      res.status(503).json({ error: 'database_required' });
      return;
    }
    const registros = await listRegistros();
    res.json({ ok: true, registros });
  } catch (err) {
    console.error('[leads-api] GET /api/orcamento-registros', err);
    res.status(500).json({ error: 'server_error' });
  }
});

app.get('/api/orcamento-registros/:id', orcamentoLimiter, async (req, res) => {
  try {
    if (!exigirSessao(req, res)) return;
    if (!pgPool && isProduction) {
      res.status(503).json({ error: 'database_required' });
      return;
    }
    const found = await getRegistro(String(req.params.id || '').trim());
    if (!found) {
      res.status(404).json({ error: 'not_found' });
      return;
    }
    res.json({ ok: true, ...found });
  } catch (err) {
    console.error('[leads-api] GET /api/orcamento-registros/:id', err);
    res.status(500).json({ error: 'server_error' });
  }
});

app.put('/api/orcamento-registros/:id', orcamentoLimiter, async (req, res) => {
  try {
    if (!exigirSessao(req, res)) return;
    if (!pgPool && isProduction) {
      res.status(503).json({ error: 'database_required' });
      return;
    }
    const payload = sanitizeRegistro(req.body || {});
    const saved = await updateRegistro(String(req.params.id || '').trim(), payload);
    if (!saved) {
      res.status(404).json({ error: 'not_found' });
      return;
    }
    res.json({ ok: true, ...saved });
  } catch (err) {
    console.error('[leads-api] PUT /api/orcamento-registros/:id', err);
    res.status(500).json({ error: 'server_error' });
  }
});

app.delete('/api/orcamento-registros', orcamentoLimiter, async (req, res) => {
  try {
    if (!exigirSessao(req, res)) return;
    if (!pgPool && isProduction) {
      res.status(503).json({ error: 'database_required' });
      return;
    }
    const id = String((req.body && req.body.id) || (req.query && req.query.id) || '').trim();
    const ok = await deleteRegistro(id);
    if (!ok) {
      res.status(404).json({ error: 'not_found' });
      return;
    }
    res.json({ ok: true });
  } catch (err) {
    console.error('[leads-api] DELETE /api/orcamento-registros', err);
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
