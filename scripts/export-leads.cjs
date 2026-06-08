#!/usr/bin/env node
/**
 * Exporta site_leads (PostgreSQL) para CSV.
 *
 * PowerShell:
 *   $env:DATABASE_URL="postgresql://..."
 *   npm run export:leads
 *
 * Opcional: --out=exports/meu.csv
 */
const fs = require('node:fs');
const path = require('node:path');
const { Pool } = require('pg');

const databaseUrl = process.env.DATABASE_URL;
if (!databaseUrl) {
  console.error('export-leads: defina DATABASE_URL (URL externa do Postgres Render).');
  process.exit(1);
}

const outArg = process.argv.find((a) => a.startsWith('--out='));
const defaultOut = path.join(
  __dirname,
  '..',
  'exports',
  `site_leads_${new Date().toISOString().slice(0, 10)}.csv`,
);
const outPath = outArg ? outArg.replace('--out=', '').trim() : defaultOut;

function csvEscape(value) {
  const s = String(value ?? '');
  if (/[",\n\r]/.test(s)) {
    return `"${s.replace(/"/g, '""')}"`;
  }
  return s;
}

async function main() {
  const pool = new Pool({
    connectionString: databaseUrl,
    ssl: databaseUrl.includes('localhost') ? false : { rejectUnauthorized: false },
  });

  const { rows } = await pool.query(`
    SELECT id, nome, email, comentario, locale, created_at
    FROM site_leads
    ORDER BY created_at DESC
  `);

  const header = ['id', 'nome', 'email', 'comentario', 'locale', 'created_at'];
  const lines = [header.join(',')];
  for (const row of rows) {
    lines.push(header.map((k) => csvEscape(row[k])).join(','));
  }

  fs.mkdirSync(path.dirname(outPath), { recursive: true });
  fs.writeFileSync(outPath, `${lines.join('\n')}\n`, 'utf8');
  console.log(`export-leads: ${rows.length} registo(s) → ${outPath}`);

  await pool.end();
}

main().catch((err) => {
  console.error('export-leads:', err.message || err);
  process.exit(1);
});
