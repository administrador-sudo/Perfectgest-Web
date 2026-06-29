#!/usr/bin/env node
/** Falha o publish se páginas legais .html ou /slug/index.html estiverem em falta. */
const fs = require('node:fs');
const path = require('node:path');
const { allLegalSlugs } = require('./legal-routes.cjs');

const buildWeb = path.join(__dirname, '..', 'build', 'web');

function check(slug) {
  const htmlPath = path.join(buildWeb, `${slug}.html`);
  const indexPath = path.join(buildWeb, slug, 'index.html');
  if (!fs.existsSync(htmlPath) || fs.statSync(htmlPath).size === 0) {
    return `${slug}.html em falta ou vazio`;
  }
  if (!fs.existsSync(indexPath) || fs.statSync(indexPath).size === 0) {
    return `${slug}/index.html em falta ou vazio`;
  }
  const bare = path.join(buildWeb, slug);
  if (fs.existsSync(bare) && !fs.statSync(bare).isDirectory()) {
    return `${slug} sem extensao (ficheiro) — apagar antes do deploy`;
  }
  return null;
}

function main() {
  const errors = allLegalSlugs().map((slug) => check(slug)).filter(Boolean);
  if (errors.length) {
    console.error('verify-legal-build: paginas legais invalidas:');
    for (const e of errors) console.error(`  - ${e}`);
    console.error('Execute: node scripts/spa-legal-paths.cjs');
    process.exit(1);
  }
  console.log(`verify-legal-build: OK ${allLegalSlugs().length} rotas legais`);
}

main();
