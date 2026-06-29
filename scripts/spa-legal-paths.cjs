#!/usr/bin/env node
/**
 * Rotas legais no static host (Render):
 * - Remove ficheiros SEM extensao (causam download no browser).
 * - Publica {rota}.html com index (SPA) ou redirect (URLs legadas da app → Google Sites).
 * - Cria /{rota}/index.html para URLs limpas quando o CDN suporta.
 * Ver docs/RENDER_SPA_REWRITE.md
 */
const fs = require('node:fs');
const path = require('node:path');

const {
  siteSpaPages,
  clinicaIiiStaticSlugs,
  perfectGestIStaticSlugs,
  contabilIStaticSlugs,
  legacyAppRedirects,
} = require('./legal-routes.cjs');

const buildWeb = path.join(__dirname, '..', 'build', 'web');
const indexPath = path.join(buildWeb, 'index.html');

if (!fs.existsSync(indexPath)) {
  console.error('spa-legal-paths: build/web/index.html nao encontrado. Rode flutter build web antes.');
  process.exit(1);
}

const indexHtml = fs.readFileSync(indexPath);
const { writeAll: writeClinicaIiiStaticHtml } = require('./clinica-iii-static-html.cjs');
const { sync: syncPerfectGestILegalFromMd } = require('./perfectgest-i-sync-legal-from-md.cjs');
const { sync: syncContabilILegalFromMd } = require('./contabil-i-sync-legal-from-md.cjs');

/** Recarrega legal-data.cjs após sync MD (evita cache do require). */
function writeStaticHtmlAfterSync(staticHtmlCjs, buildWeb) {
  const staticPath = path.join(__dirname, staticHtmlCjs);
  const dataPath = staticPath.replace('-static-html.cjs', '-legal-data.cjs');
  delete require.cache[require.resolve(staticPath)];
  try {
    delete require.cache[require.resolve(dataPath)];
  } catch (_) {
    /* sem legal-data associado */
  }
  const { writeAll } = require(staticPath);
  writeAll(buildWeb);
}

function removeBare(segment) {
  const barePath = path.join(buildWeb, segment);
  if (fs.existsSync(barePath)) {
    fs.rmSync(barePath, { recursive: true, force: true });
  }
}

function writeRedirectHtml(targetUrl) {
  return `<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="refresh" content="0;url=${targetUrl}">
  <link rel="canonical" href="${targetUrl}">
  <title>Redirecionando…</title>
</head>
<body>
  <p><a href="${targetUrl}">Continuar para a documentação oficial do produto</a></p>
</body>
</html>`;
}

for (const segment of siteSpaPages) {
  removeBare(segment);
  fs.writeFileSync(path.join(buildWeb, `${segment}.html`), indexHtml);
}

for (const segment of clinicaIiiStaticSlugs) {
  removeBare(segment);
}

for (const segment of perfectGestIStaticSlugs) {
  removeBare(segment);
}

for (const segment of contabilIStaticSlugs) {
  removeBare(segment);
}

writeClinicaIiiStaticHtml(buildWeb);
syncPerfectGestILegalFromMd();
syncContabilILegalFromMd();
writeStaticHtmlAfterSync('perfectgest-i-static-html.cjs', buildWeb);
writeStaticHtmlAfterSync('contabil-i-static-html.cjs', buildWeb);

for (const [segment, targetUrl] of Object.entries(legacyAppRedirects)) {
  removeBare(segment);
  fs.writeFileSync(path.join(buildWeb, `${segment}.html`), writeRedirectHtml(targetUrl));
}

require('./sync-legal-html-to-build.cjs');
require('./generate-render-legal-routes.cjs');

console.log(
  `spa-legal-paths: ${siteSpaPages.length} SPA .html; ${clinicaIiiStaticSlugs.length} Clinica III estatico; ${perfectGestIStaticSlugs.length} PerfectGest I estatico; ${contabilIStaticSlugs.length} Contabil I estatico; ${Object.keys(legacyAppRedirects).length} redirects Google Sites.`,
);
