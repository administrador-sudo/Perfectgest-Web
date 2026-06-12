#!/usr/bin/env node
/**
 * Rotas legais no static host (Render):
 * - Remove ficheiros SEM extensao (causam download no browser).
 * - Publica {rota}.html com index (SPA) ou redirect (URLs legadas da app → Google Sites).
 * Ver docs/RENDER_SPA_REWRITE.md
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

/** Páginas do site institucional (Flutter SPA). */
const siteSpaPages = [
  'politica-devolucao',
  'politica-privacidade-site',
  'pre-cadastro',
];

/** Rotas antigas da app no domínio do site → portal Google Sites (canónico). */
const legacyAppRedirects = {
  'politica-privacidade-perfectgest-i':
    'https://sites.google.com/view/perfectgest-i-faq-suporte/politica-em-pt',
  'politica-exclusao-dados-perfectgest-i':
    'https://sites.google.com/view/perfectgest-exclusao-dados/exclus%C3%A3o-de-dados',
};

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

for (const [segment, targetUrl] of Object.entries(legacyAppRedirects)) {
  removeBare(segment);
  fs.writeFileSync(path.join(buildWeb, `${segment}.html`), writeRedirectHtml(targetUrl));
}

console.log(
  `spa-legal-paths: ${siteSpaPages.length} paginas SPA .html; ${Object.keys(legacyAppRedirects).length} redirects para Google Sites.`,
);
