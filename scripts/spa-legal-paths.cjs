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
  nexusB2bStaticSlugs,
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
const BARBER_APP_OG_IMAGE = 'https://perfectgestdev.com/barber-app-logo.png';
const BARBER_BOOKING_URL = 'https://perfectgestdev.com/Barber_Hairdresser';

function escapeHtmlAttr(s) {
  return String(s)
    .replace(/&/g, '&amp;')
    .replace(/"/g, '&quot;')
    .replace(/</g, '&lt;');
}

/** Stub Barber: manifest-barber + OG/Twitter do cartao desta loja. */
function patchBarberStubHtml(html, options) {
  const shopName = options && options.shopName ? options.shopName : '';
  const ogImage = (options && options.ogImage) || BARBER_APP_OG_IMAGE;
  const ogUrl = (options && options.ogUrl) || BARBER_BOOKING_URL;
  const touchIcon = (options && options.touchIcon) || '/barber-app-logo.png';
  let out = html.toString('utf8');
  const title = shopName && shopName.trim()
    ? `${shopName.trim()} — Agendar`
    : 'Agenda Barbeiro — Agendar';
  const desc =
    'Agende seu horario. Toque no link para abrir a pagina da barbearia.'; // ASCII meta (sem acentos)
  const safeTitle = escapeHtmlAttr(title);
  const safeDesc = escapeHtmlAttr(desc);
  const safeImage = escapeHtmlAttr(ogImage);
  const safeUrl = escapeHtmlAttr(ogUrl);
  const safeTouch = escapeHtmlAttr(touchIcon);

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
    `<meta property="og:image" content="${safeImage}">`,
  );
  out = out.replace(
    /<meta\s+name="description"\s+content="[^"]*"\s*>/i,
    `<meta name="description" content="${safeDesc}">`,
  );

  // Twitter card + og:url (inserir apos og:image se ainda nao existirem).
  if (!/property="og:url"/i.test(out)) {
    out = out.replace(
      /(<meta\s+property="og:image"\s+content="[^"]*"\s*>)/i,
      `$1\n  <meta property="og:url" content="${safeUrl}">`,
    );
  } else {
    out = out.replace(
      /<meta\s+property="og:url"\s+content="[^"]*"\s*>/i,
      `<meta property="og:url" content="${safeUrl}">`,
    );
  }
  if (!/name="twitter:card"/i.test(out)) {
    out = out.replace(
      /(<meta\s+property="og:image"\s+content="[^"]*"\s*>)/i,
      `$1
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="${safeTitle}">
  <meta name="twitter:description" content="${safeDesc}">
  <meta name="twitter:image" content="${safeImage}">`,
    );
  } else {
    out = out.replace(
      /<meta\s+name="twitter:image"\s+content="[^"]*"\s*>/i,
      `<meta name="twitter:image" content="${safeImage}">`,
    );
  }

  // apple-touch-icon: preferir logo da barbearia no atalho iOS.
  out = out.replace(
    /<link\s+rel="apple-touch-icon"\s+href="[^"]*"\s*>/i,
    `<link rel="apple-touch-icon" href="${safeTouch}">`,
  );

  return Buffer.from(out, 'utf8');
}

function writeSpaStubs() {
  for (const segment of siteSpaPages) {
    removeBare(segment);
    const dest = path.join(buildWeb, `${segment}.html`);
    if (BARBER_SPA_SEGMENTS.has(segment)) {
      fs.writeFileSync(dest, patchBarberStubHtml(indexHtml));
    } else {
      fs.writeFileSync(dest, indexHtml);
    }
  }
}

function readBarberShops() {
  const jsonPath = path.join(buildWeb, 'barber-og-shops.json');
  if (!fs.existsSync(jsonPath)) return [];
  try {
    const list = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));
    return Array.isArray(list) ? list : [];
  } catch (_) {
    return [];
  }
}

/** HTML por loja + rewrite antes do curinga, para o WhatsApp ler o cartao certo. */
function writePerShopCards(shops) {
  const dir = path.join(buildWeb, 'Barber_Hairdresser');
  fs.mkdirSync(dir, { recursive: true });
  const routeLines = [];
  for (const shop of shops) {
    const id = String(shop.id || '');
    if (!/^[A-Za-z0-9_-]{3,48}$/.test(id)) continue;
    const image = `https://perfectgestdev.com/barber-logo/${id}.png`;
    fs.writeFileSync(
      path.join(dir, `${id}.html`),
      patchBarberStubHtml(indexHtml, {
        shopName: shop.name || id,
        ogImage: image,
        ogUrl: `https://perfectgestdev.com/Barber_Hairdresser/${id}`,
        touchIcon: `/barber-logo/${id}.png`,
      }),
    );
    routeLines.push(
      `      - type: rewrite\n        source: /Barber_Hairdresser/${id}\n        destination: /Barber_Hairdresser/${id}.html`,
    );
  }
  const yamlPath = path.join(__dirname, '..', 'render.yaml');
  let yaml = fs.readFileSync(yamlPath, 'utf8');
  const block =
    '      # barber-shop-og:start\n' +
    (routeLines.length ? `${routeLines.join('\n')}\n` : '') +
    '      # barber-shop-og:end\n';
  const nl = yaml.includes('\r\n') ? '\r\n' : '\n';
  const blockNl = block.replace(/\n/g, nl);
  if (yaml.includes('# barber-shop-og:start')) {
    yaml = yaml.replace(/      # barber-shop-og:start[\s\S]*?      # barber-shop-og:end\r?\n/, blockNl);
  } else {
    const wildcardRe =
      /      - type: rewrite\r?\n        source: \/Barber_Hairdresser\/\*\r?\n        destination: \/Barber_Hairdresser\.html\r?\n/;
    if (!wildcardRe.test(yaml)) {
      throw new Error('render.yaml sem rewrite /Barber_Hairdresser/*');
    }
    yaml = yaml.replace(wildcardRe, `${blockNl}$&`);
  }
  fs.writeFileSync(yamlPath, yaml, 'utf8');
  console.log(`spa-legal-paths: ${routeLines.length} cartoes de loja.`);
}

/** Sync logo OG antes dos stubs (best-effort; nao falha o build). */
const { spawnSync } = require('node:child_process');
const syncLogoResult = spawnSync(process.execPath, [path.join(__dirname, 'sync-barber-og-logo.cjs')], {
  encoding: 'utf8',
  cwd: path.join(__dirname, '..'),
});
if (syncLogoResult.stdout) process.stdout.write(syncLogoResult.stdout);
if (syncLogoResult.stderr) process.stderr.write(syncLogoResult.stderr);
writeSpaStubs();
writePerShopCards(readBarberShops());

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

for (const segment of nexusB2bStaticSlugs) {
  removeBare(segment);
}

writeClinicaIiiStaticHtml(buildWeb);
syncPerfectGestILegalFromMd();
syncContabilILegalFromMd();
writeStaticHtmlAfterSync('perfectgest-i-static-html.cjs', buildWeb);
writeStaticHtmlAfterSync('contabil-i-static-html.cjs', buildWeb);
writeStaticHtmlAfterSync('barber-static-html.cjs', buildWeb);
writeStaticHtmlAfterSync('nexus-b2b-static-html.cjs', buildWeb);

for (const [segment, targetUrl] of Object.entries(legacyAppRedirects)) {
  removeBare(segment);
  fs.writeFileSync(path.join(buildWeb, `${segment}.html`), writeRedirectHtml(targetUrl));
}

require('./sync-legal-html-to-build.cjs');
require('./generate-render-legal-routes.cjs');

console.log(
  `spa-legal-paths: ${siteSpaPages.length} SPA .html; ${clinicaIiiStaticSlugs.length} Clinica III estatico; ${perfectGestIStaticSlugs.length} PerfectGest I estatico; ${contabilIStaticSlugs.length} Contabil I estatico; ${agendaBarberStaticSlugs.length} Agenda Barber estatico; ${nexusB2bStaticSlugs.length} NEXUS-B2B estatico; ${Object.keys(legacyAppRedirects).length} redirects Google Sites.`,
);
