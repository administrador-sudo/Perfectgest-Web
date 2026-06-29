#!/usr/bin/env node
/**
 * Garante imagens de marca na raiz de build/web (Render serve esta pasta).
 * O Flutter copia web/ → build/web, mas o publish falha silenciosamente se
 * o build estiver desactualizado — este script copia e valida antes do commit.
 */
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const webDir = path.join(root, 'web');
const buildWeb = path.join(root, 'build', 'web');

const REQUIRED_ROOT = [
  'brasao-emblema.png',
  'brasao-perfectgestdev.png',
  'perfectgestdev-wordmark.png',
  'favicon.ico',
  'favicon.png',
  'favicon.webp',
];

const REQUIRED_ICONS = [
  'icons/Icon-192.png',
  'icons/Icon-512.png',
  'icons/Icon-maskable-192.png',
  'icons/Icon-maskable-512.png',
  'icons/brasao-emblema-192.png',
];

function copyIfExists(rel) {
  const src = path.join(webDir, rel);
  const dst = path.join(buildWeb, rel);
  if (!fs.existsSync(src)) {
    return { rel, ok: false, reason: 'origem em falta em web/' };
  }
  fs.mkdirSync(path.dirname(dst), { recursive: true });
  fs.copyFileSync(src, dst);
  const size = fs.statSync(dst).size;
  return { rel, ok: size > 0, size };
}

function main() {
  if (!fs.existsSync(buildWeb)) {
    console.error('sync-brand-assets: build/web nao existe. Rode flutter build web antes.');
    process.exit(1);
  }

  const results = [];
  for (const rel of [...REQUIRED_ROOT, ...REQUIRED_ICONS]) {
    results.push(copyIfExists(rel));
  }

  const missing = results.filter((r) => !r.ok);
  if (missing.length) {
    console.error('sync-brand-assets: ficheiros em falta:');
    for (const m of missing) {
      console.error(`  - ${m.rel}${m.reason ? ` (${m.reason})` : ''}`);
    }
    console.error('Execute: dart run tool/generate_brand_icons.dart');
    process.exit(1);
  }

  console.log(
    `sync-brand-assets: OK ${results.length} ficheiros em build/web (${REQUIRED_ROOT.join(', ')})`,
  );
}

main();
