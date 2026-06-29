#!/usr/bin/env node
/**
 * Garante páginas legais .html + pastas /slug/index.html em build/web.
 */
const fs = require('node:fs');
const path = require('node:path');
const { allLegalSlugs } = require('./legal-routes.cjs');

const buildWeb = path.join(__dirname, '..', 'build', 'web');

function publishCleanUrl(slug) {
  const htmlPath = path.join(buildWeb, `${slug}.html`);
  if (!fs.existsSync(htmlPath)) {
    return { slug, ok: false, reason: `${slug}.html em falta` };
  }
  const html = fs.readFileSync(htmlPath);
  if (html.length === 0) {
    return { slug, ok: false, reason: `${slug}.html vazio` };
  }
  const dir = path.join(buildWeb, slug);
  fs.mkdirSync(dir, { recursive: true });
  fs.writeFileSync(path.join(dir, 'index.html'), html);
  return { slug, ok: true, bytes: html.length };
}

function main() {
  if (!fs.existsSync(buildWeb)) {
    console.error('sync-legal-html: build/web nao existe.');
    process.exit(1);
  }

  const results = allLegalSlugs().map(publishCleanUrl);
  const missing = results.filter((r) => !r.ok);
  if (missing.length) {
    console.error('sync-legal-html: paginas em falta:');
    for (const m of missing) {
      console.error(`  - ${m.slug}: ${m.reason}`);
    }
    console.error('Execute: node scripts/spa-legal-paths.cjs');
    process.exit(1);
  }

  console.log(`sync-legal-html: OK ${results.length} rotas (.html + /slug/index.html)`);
}

main();
