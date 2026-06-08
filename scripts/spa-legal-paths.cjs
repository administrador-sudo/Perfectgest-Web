#!/usr/bin/env node
/**
 * Rotas legais no static host (Render):
 * - Remove ficheiros SEM extensao (causam download no browser).
 * - Publica apenas {rota}.html (Content-Type text/html correto).
 * No Render: Rewrite por rota, ex. /politica-devolucao -> /politica-devolucao.html
 * (ver docs/RENDER_SPA_REWRITE.md). NAO usar ficheiro sem extensao.
 */
const fs = require('node:fs');
const path = require('node:path');

const buildWeb = path.join(__dirname, '..', 'build', 'web');
const indexPath = path.join(buildWeb, 'index.html');

if (!fs.existsSync(indexPath)) {
  console.error('spa-legal-paths: build/web/index.html nao encontrado. Rode flutter build web antes.');
  process.exit(1);
}

const indexHtml = fs.readFileSync(indexPath);

const legalSegments = [
  'politica-devolucao',
  'politica-privacidade-perfectgest-i',
  'politica-exclusao-dados-perfectgest-i',
  'pre-cadastro',
];

for (const segment of legalSegments) {
  const barePath = path.join(buildWeb, segment);
  if (fs.existsSync(barePath)) {
    fs.rmSync(barePath, { recursive: true, force: true });
  }
  fs.writeFileSync(path.join(buildWeb, `${segment}.html`), indexHtml);
}

console.log(
  `spa-legal-paths: ${legalSegments.length} paginas .html geradas; removidos ficheiros sem extensao.`,
);
