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
  agendaBarberStaticSlugs,
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

const BARBER_SPA_SEGMENTS = new Set(['Barber_Hairdresser', 'Barber_Admin', 'Barber_Shops_Admin']);
const BARBER_OG_IMAGE = 'https://perfectgestdev.com/barber-shop-logo.png';
const BARBER_BOOKING_URL = 'https://perfectgestdev.com/Barber_Hairdresser/perfectgest_dev';

function escapeHtmlAttr(s) {
  return String(s)
    .replace(/&/g, '&amp;')
    .replace(/"/g, '&quot;')
    .replace(/</g, '&lt;');
}

/** Stub Barber: manifest-barber + OG/Twitter com logo estavel (WhatsApp preview). */
function patchBarberStubHtml(html, shopName) {
  let out = html.toString('utf8');
  const title = shopName && shopName.trim()
    ? `${shopName.trim()} — Agendar`
    : 'Barbear e Cortar — Agendar';
  const desc =
    'Agende seu horario. Toque no link para abrir a pagina da barbearia.'; // ASCII meta (sem acentos)
  const safeTitle = escapeHtmlAttr(title);
  const safeDesc = escapeHtmlAttr(desc);

  out = out.replace(
    /<link\s+rel="manifest"\s+href="[^"]*"\s*>/i,
    '<link rel="manifest" href="/manifest-barber.json">',
  );
  out = out.replace(
    /<meta\s+name="apple-mobile-web-app-title"\s+content="[^"]*"\s*>/i,
    '<meta name="apple-mobile-web-app-title" content="Agendar">',
  );
  out = out.replace(
    /<title>[^<]*<\/title>/i,
    `<title>${safeTitle}</title>`,
  );
  out = out.replace(
    /<meta\s+property="og:title"\s+content="[^"]*"\s*>/i,
    `<meta property="og:title" content="${safeTitle}">`,
  );
  out = out.replace(
    /<meta\s+property="og:description"\s+content="[^"]*"\s*>/i,
    `<meta property="og:description" content="${safeDesc}">`,
  );
  out = out.replace(
    /<meta\s+property="og:image"\s+content="[^"]*"\s*>/i,
    `<meta property="og:image" content="${BARBER_OG_IMAGE}">`,
  );
  out = out.replace(
    /<meta\s+name="description"\s+content="[^"]*"\s*>/i,
    `<meta name="description" content="${safeDesc}">`,
  );

  // Twitter card + og:url (inserir apos og:image se ainda nao existirem).
  if (!/property="og:url"/i.test(out)) {
    out = out.replace(
      /(<meta\s+property="og:image"\s+content="[^"]*"\s*>)/i,
      `$1\n  <meta property="og:url" content="${BARBER_BOOKING_URL}">`,
    );
  }
  if (!/name="twitter:card"/i.test(out)) {
    out = out.replace(
      /(<meta\s+property="og:image"\s+content="[^"]*"\s*>)/i,
      `$1
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="${safeTitle}">
  <meta name="twitter:description" content="${safeDesc}">
  <meta name="twitter:image" content="${BARBER_OG_IMAGE}">`,
    );
  } else {
    out = out.replace(
      /<meta\s+name="twitter:image"\s+content="[^"]*"\s*>/i,
      `<meta name="twitter:image" content="${BARBER_OG_IMAGE}">`,
    );
  }

  // apple-touch-icon: preferir logo da barbearia no atalho iOS.
  out = out.replace(
    /<link\s+rel="apple-touch-icon"\s+href="[^"]*"\s*>/i,
    '<link rel="apple-touch-icon" href="/barber-shop-logo.png">',
  );

  return Buffer.from(out, 'utf8');
}

function writeSpaStubs(shopName) {
  for (const segment of siteSpaPages) {
    removeBare(segment);
    const dest = path.join(buildWeb, `${segment}.html`);
    if (BARBER_SPA_SEGMENTS.has(segment)) {
      fs.writeFileSync(dest, patchBarberStubHtml(indexHtml, shopName));
    } else {
      fs.writeFileSync(dest, indexHtml);
    }
  }
}

/** Sync logo OG antes dos stubs (best-effort; nao falha o build). */
const { spawnSync } = require('node:child_process');
const syncLogoResult = spawnSync(process.execPath, [path.join(__dirname, 'sync-barber-og-logo.cjs')], {
  encoding: 'utf8',
  cwd: path.join(__dirname, '..'),
});
if (syncLogoResult.stdout) process.stdout.write(syncLogoResult.stdout);
if (syncLogoResult.stderr) process.stderr.write(syncLogoResult.stderr);
const shopNameMatch = /SHOP_NAME=(.+)/.exec(syncLogoResult.stdout || '');
const barberShopName = shopNameMatch ? shopNameMatch[1].trim() : '';

writeSpaStubs(barberShopName);

for (const segment of clinicaIiiStaticSlugs) {
  removeBare(segment);
}

for (const segment of perfectGestIStaticSlugs) {
  removeBare(segment);
}

for (const segment of contabilIStaticSlugs) {
  removeBare(segment);
}

for (const segment of agendaBarberStaticSlugs) {
  removeBare(segment);
}

writeClinicaIiiStaticHtml(buildWeb);
syncPerfectGestILegalFromMd();
syncContabilILegalFromMd();
writeStaticHtmlAfterSync('perfectgest-i-static-html.cjs', buildWeb);
writeStaticHtmlAfterSync('contabil-i-static-html.cjs', buildWeb);
writeStaticHtmlAfterSync('barber-static-html.cjs', buildWeb);

for (const [segment, targetUrl] of Object.entries(legacyAppRedirects)) {
  removeBare(segment);
  fs.writeFileSync(path.join(buildWeb, `${segment}.html`), writeRedirectHtml(targetUrl));
}

require('./sync-legal-html-to-build.cjs');
require('./generate-render-legal-routes.cjs');

console.log(
  `spa-legal-paths: ${siteSpaPages.length} SPA .html; ${clinicaIiiStaticSlugs.length} Clinica III estatico; ${perfectGestIStaticSlugs.length} PerfectGest I estatico; ${contabilIStaticSlugs.length} Contabil I estatico; ${agendaBarberStaticSlugs.length} Agenda Barber estatico; ${Object.keys(legacyAppRedirects).length} redirects Google Sites.`,
);
