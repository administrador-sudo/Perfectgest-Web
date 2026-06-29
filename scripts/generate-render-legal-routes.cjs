#!/usr/bin/env node
/**
 * Gera bloco routes para render.yaml (static site — URLs legais sem .html).
 */
const fs = require('node:fs');
const path = require('node:path');
const { allLegalSlugs } = require('./legal-routes.cjs');

const outPath = path.join(__dirname, '..', 'docs', 'generated-render-legal-routes.yaml');

const routes = allLegalSlugs().map((slug) => ({
  type: 'rewrite',
  source: `/${slug}`,
  destination: `/${slug}.html`,
}));

const yaml =
  '# Gerado por scripts/generate-render-legal-routes.cjs — colar em render.yaml (servico static)\n' +
  'routes:\n' +
  routes.map((r) => `  - type: ${r.type}\n    source: ${r.source}\n    destination: ${r.destination}`).join('\n') +
  '\n';

fs.writeFileSync(outPath, yaml, 'utf8');
console.log(`generate-render-legal-routes: ${routes.length} rewrites -> ${outPath}`);
