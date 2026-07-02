#!/usr/bin/env node
/**
 * Actualiza páginas legais ContábilSigilo no site a partir dos .md do mobile.
 *
 * Fonte (PT): apps/Contabilidade_Clientes/mobile/docs/politicas/*.md
 * EN/ES:       scripts/contabil-i-legal-en-es.cjs (editar manualmente se planos/preços mudarem)
 *
 * Uso (pasta webs/Web_perfectgest):
 *   node scripts/contabil-i-update-legal-pages.cjs
 *   node scripts/contabil-i-update-legal-pages.cjs --build-web
 *
 * Uso (pasta mobile):
 *   .\scripts\atualizar_politicas_site.ps1
 */
const fs = require('node:fs');
const path = require('node:path');

const WEB_ROOT = path.join(__dirname, '..');
const SCRIPTS = path.join(WEB_ROOT, 'scripts');
const MD_DIR = path.join(
  WEB_ROOT,
  '..',
  '..',
  'apps',
  'Contabilidade_Clientes',
  'mobile',
  'docs',
  'politicas',
);
const PREVIEW_DIR = path.join(WEB_ROOT, 'exports', 'contabil-i-legal-preview');
const BUILD_WEB = path.join(WEB_ROOT, 'build', 'web');

const MD_FILES = [
  'politica-privacidade.md',
  'termos-de-uso.md',
  'exclusao-de-dados.md',
  'faq.md',
];

const OUTPUT_HTML = [
  'contabil-i-politica-privacidade.html',
  'contabil-i-termos.html',
  'contabil-i-exclusao-dados.html',
  'contabil-i-faq.html',
];

const PUBLIC_URLS = [
  ['Política de privacidade', 'https://perfectgestdev.com/contabil-i-politica-privacidade'],
  ['Termos de uso', 'https://perfectgestdev.com/contabil-i-termos'],
  ['Exclusão de dados', 'https://perfectgestdev.com/contabil-i-exclusao-dados'],
  ['FAQ', 'https://perfectgestdev.com/contabil-i-faq'],
];

function parseArgs(argv) {
  return {
    buildWeb: argv.includes('--build-web'),
    help: argv.includes('--help') || argv.includes('-h'),
  };
}

function rel(p) {
  return path.relative(WEB_ROOT, p).replace(/\\/g, '/');
}

function ensureDir(dir) {
  fs.mkdirSync(dir, { recursive: true });
}

function verifySources() {
  const missing = MD_FILES.filter((name) => !fs.existsSync(path.join(MD_DIR, name)));
  if (missing.length) {
    console.error('contabil-i-update-legal-pages: ficheiros em falta em mobile/docs/politicas/:');
    for (const name of missing) console.error(`  - ${name}`);
    process.exit(1);
  }
  console.log('Fonte PT OK:');
  for (const name of MD_FILES) {
    const stat = fs.statSync(path.join(MD_DIR, name));
    console.log(`  - ${rel(path.join(MD_DIR, name))} (${stat.size} bytes)`);
  }
}

function writeStaticHtml(outDir) {
  ensureDir(outDir);
  const staticPath = path.join(SCRIPTS, 'contabil-i-static-html.cjs');
  const dataPath = path.join(SCRIPTS, 'contabil-i-legal-data.cjs');
  delete require.cache[require.resolve(staticPath)];
  try {
    delete require.cache[require.resolve(dataPath)];
  } catch (_) {
    /* ignore */
  }
  const { writeAll } = require(staticPath);
  const slugs = writeAll(outDir);
  console.log(`HTML (${rel(outDir)}): ${slugs.length} páginas`);
  return slugs;
}

function publishContabilCleanUrls() {
  for (const htmlName of OUTPUT_HTML) {
    const slug = htmlName.replace(/\.html$/, '');
    const htmlPath = path.join(BUILD_WEB, htmlName);
    if (!fs.existsSync(htmlPath)) {
      console.warn(`  aviso: ${rel(htmlPath)} em falta — ignorado`);
      continue;
    }
    const html = fs.readFileSync(htmlPath);
    const dir = path.join(BUILD_WEB, slug);
    fs.mkdirSync(dir, { recursive: true });
    fs.writeFileSync(path.join(dir, 'index.html'), html);
    console.log(`  URL limpa: /${slug}/index.html`);
  }
}

function main() {
  const args = parseArgs(process.argv.slice(2));
  if (args.help) {
    console.log(`Uso: node scripts/contabil-i-update-legal-pages.cjs [--build-web]

Passos:
  1. Lê mobile/docs/politicas/*.md (PT)
  2. Regenera scripts/contabil-i-legal-data.cjs
  3. Gera exports/contabil-i-legal-preview/contabil-i-*.html
  4. Com --build-web: copia HTML para build/web (se existir) + /slug/index.html

EN/ES: editar scripts/contabil-i-legal-en-es.cjs quando planos ou preços mudarem.
Deploy: flutter build web && node scripts/spa-legal-paths.cjs`);
    process.exit(0);
  }

  console.log('=== ContábilSigilo — actualizar páginas legais do site ===\n');

  verifySources();

  const { sync } = require('./contabil-i-sync-legal-from-md.cjs');
  sync();
  console.log(`Gerado: ${rel(path.join(SCRIPTS, 'contabil-i-legal-data.cjs'))}`);

  writeStaticHtml(PREVIEW_DIR);

  if (args.buildWeb) {
    if (!fs.existsSync(BUILD_WEB)) {
      console.warn('\n--build-web: build/web não existe. Rode: flutter build web');
    } else {
      console.log(`\nActualizar ${rel(BUILD_WEB)}:`);
      writeStaticHtml(BUILD_WEB);
      publishContabilCleanUrls();
    }
  }

  console.log('\nFicheiros para commit (repo webs/Web_perfectgest):');
  console.log(`  - ${rel(path.join(SCRIPTS, 'contabil-i-legal-data.cjs'))}`);
  console.log(`  - ${rel(PREVIEW_DIR)}/contabil-i-*.html (4)`);
  if (args.buildWeb && fs.existsSync(BUILD_WEB)) {
    console.log(`  - ${rel(BUILD_WEB)}/contabil-i-*.html (+ pastas /contabil-i-*/)`);
  }

  console.log('\nURLs públicas:');
  for (const [label, url] of PUBLIC_URLS) {
    console.log(`  - ${label}: ${url}`);
  }

  console.log('\nLembrete EN/ES: se alterou planos, preços ou IDs na Play, actualize também');
  console.log('  scripts/contabil-i-legal-en-es.cjs e volte a correr este script.');

  if (!args.buildWeb) {
    console.log('\nDeploy Render (quando for publicar):');
    console.log('  flutter build web');
    console.log('  node scripts/spa-legal-paths.cjs');
  }

  console.log('\nOK.');
}

main();
