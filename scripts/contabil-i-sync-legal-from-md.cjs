#!/usr/bin/env node
/**
 * Sincroniza contabil-i-legal-data.cjs a partir de
 * apps/Contabilidade_Clientes/mobile/docs/politicas/*.md (PT).
 * EN/ES: contabil-i-legal-en-es.cjs (paralelo ao PT).
 */
const fs = require('node:fs');
const path = require('node:path');

const ROOT = path.join(__dirname, '..');
const MD_DIR = path.join(
  ROOT,
  '..',
  '..',
  'apps',
  'Contabilidade_Clientes',
  'mobile',
  'docs',
  'politicas',
);
const OUT_CJS = path.join(__dirname, 'contabil-i-legal-data.cjs');
const EN_ES = require('./contabil-i-legal-en-es.cjs');

const PRODUCT = 'PerfectGest-Contabil I';
const PACKAGE_ID = 'br.perfectgestcontabil.dev';
const FANTASY = 'Perfect Gest Dev';
const LEGAL_NAME = 'PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA';
const CNPJ = '66.889.409/0001-19';
const EMAIL = 'suporte@perfectgestdev.com';
const ADDRESS = 'Caxias do Sul — RS — Brasil';

const FILES = {
  privacy: 'politica-privacidade.md',
  terms: 'termos-de-uso.md',
  deletion: 'exclusao-de-dados.md',
  faq: 'faq.md',
};

const INTRO_HEADING = { pt: 'Introdução', en: 'Introduction', es: 'Introducción' };

function readMd(name) {
  const p = path.join(MD_DIR, name);
  if (!fs.existsSync(p)) throw new Error(`Ficheiro em falta: ${p}`);
  return fs.readFileSync(p, 'utf8').replace(/\r\n/g, '\n');
}

function formatTableLine(line) {
  const t = line.trim();
  if (!t.startsWith('|')) return line;
  if (/^\|[\s\-:|]+\|$/.test(t)) return null;
  const cells = t
    .split('|')
    .map((c) => c.trim())
    .filter(Boolean);
  return cells.join(' · ');
}

function cleanInline(text) {
  return text
    .replace(/\*\*([^*]+)\*\*/g, '$1')
    .replace(/`([^`]+)`/g, '$1')
    .replace(/\[([^\]]+)\]\([^)]+\)/g, '$1')
    .replace(/\s+/g, ' ')
    .trim();
}

function cleanBlock(text) {
  return text
    .replace(/\*\*([^*]+)\*\*/g, '$1')
    .replace(/`([^`]+)`/g, '$1')
    .replace(/\[([^\]]+)\]\([^)]+\)/g, '$1')
    .replace(/[ \t]+\n/g, '\n')
    .replace(/\n{3,}/g, '\n\n')
    .trim();
}

function isSkipLine(line) {
  const t = line.trim();
  if (!t) return false;
  if (t.startsWith('# ') && !t.startsWith('## ')) return true;
  if (/^\*\*PerfectGest-Contabil I\*\*/.test(t)) return true;
  if (/^Última atualização:/i.test(t)) return true;
  if (t === '---') return true;
  if (t.startsWith('*PerfectGest')) return true;
  if (t.startsWith('*Consulte também')) return true;
  if (t.startsWith('*Ao aceitar')) return true;
  return false;
}

function parseMd(content, mode) {
  const lines = content.split('\n');
  const sections = [];
  let current = null;
  let intro = [];

  function flush() {
    if (!current) return;
    const body = cleanBlock(current.body.join('\n'));
    if (current.heading && body) {
      sections.push({ heading: cleanInline(current.heading), body });
    }
    current = null;
  }

  for (const line of lines) {
    if (isSkipLine(line)) continue;

    const formatted = formatTableLine(line);
    if (formatted === null) continue;

    const h2 = line.match(/^## (.+)$/);
    const h3 = line.match(/^### (.+)$/);

    if (h2) {
      flush();
      current = { heading: h2[1].trim(), body: [] };
      continue;
    }

    if (h3) {
      const sub = h3[1].trim();
      if (mode === 'faq') {
        flush();
        current = { heading: sub, body: [] };
        continue;
      }
      if (!current) current = { heading: INTRO_HEADING.pt, body: [] };
      current.body.push('', sub);
      continue;
    }

    if (!current) {
      if (formatted.trim()) intro.push(formatted);
      continue;
    }
    current.body.push(formatted);
  }
  flush();

  if (intro.length) {
    const body = cleanBlock(intro.join('\n'));
    if (body && mode !== 'faq') {
      sections.unshift({ heading: INTRO_HEADING.pt, body });
    }
  }

  return sections.filter((s) => s.heading && s.body);
}

function parseAllPt() {
  const out = {};
  for (const [page, file] of Object.entries(FILES)) {
    const mode = page === 'faq' ? 'faq' : 'doc';
    out[page] = parseMd(readMd(file), mode);
  }
  return out;
}

function jsString(s) {
  return JSON.stringify(s);
}

function sectionsToJs(sections) {
  return sections
    .map((s) => `    { heading: ${jsString(s.heading)}, body: ${jsString(s.body)} }`)
    .join(',\n');
}

function buildCjs(pt) {
  const header = {
    pt:
      `${LEGAL_NAME}\n` +
      `Nome fantasia: ${FANTASY} · CNPJ ${CNPJ}\n` +
      `${ADDRESS} · ${EMAIL}\n` +
      `App Android: ${PRODUCT} · pacote ${PACKAGE_ID}\n\n` +
      'Papéis no tratamento (LGPD)\n' +
      '• Controlador dos dados contábeis e da empresa: o titular da ME/MEI ou o profissional que utiliza o software.\n' +
      `• Operador do software: ${FANTASY} (${LEGAL_NAME}) — desenvolve e mantém a ferramenta; não decide sobre o conteúdo inserido pelo utilizador.\n` +
      '• Direitos do titular: aceder, corrigir, exportar e eliminar no próprio app, ou contactar ' +
      EMAIL + '.',
    en:
      `${LEGAL_NAME}\n` +
      `Trade name: ${FANTASY} · CNPJ ${CNPJ}\n` +
      `${ADDRESS} · ${EMAIL}\n` +
      `Android app: ${PRODUCT} · package ${PACKAGE_ID}\n\n` +
      'Roles in processing (LGPD)\n' +
      '• Controller of accounting and business data: the ME/MEI owner or professional using the software.\n' +
      `• Software operator: ${FANTASY} (${LEGAL_NAME}) — develops and maintains the tool; does not decide on user-entered content.\n` +
      '• Data subject rights: access, correct, export, and delete in the app, or contact ' +
      EMAIL + '.',
    es:
      `${LEGAL_NAME}\n` +
      `Nombre comercial: ${FANTASY} · CNPJ ${CNPJ}\n` +
      `${ADDRESS} · ${EMAIL}\n` +
      `App Android: ${PRODUCT} · paquete ${PACKAGE_ID}\n\n` +
      'Roles en el tratamiento (LGPD)\n' +
      '• Controlador de los datos contables y de la empresa: el titular de la ME/MEI o el profesional que utiliza el software.\n' +
      `• Operador del software: ${FANTASY} (${LEGAL_NAME}) — desarrolla y mantiene la herramienta; no decide sobre el contenido introducido por el usuario.\n` +
      '• Derechos del titular: acceder, corregir, exportar y eliminar en la app, o contactar ' +
      EMAIL + '.',
  };

  return `/** PerfectGest-Contabil I — documentos legais no domínio perfectgestdev.com
 * Gerado por scripts/contabil-i-sync-legal-from-md.cjs — não editar manualmente.
 * Fonte PT: apps/Contabilidade_Clientes/mobile/docs/politicas/*.md */
const PRODUCT = ${jsString(PRODUCT)};
const PACKAGE_ID = ${jsString(PACKAGE_ID)};
const FANTASY = ${jsString(FANTASY)};
const LEGAL_NAME = ${jsString(LEGAL_NAME)};
const CNPJ = ${jsString(CNPJ)};
const EMAIL = ${jsString(EMAIL)};
const ADDRESS = ${jsString(ADDRESS)};

const header = {
  pt: ${jsString(header.pt)},
  en: ${jsString(header.en)},
  es: ${jsString(header.es)},
};

const lastUpdated = {
  pt: 'Última atualização: 21/06/2026',
  en: 'Last updated: 21 June 2026',
  es: 'Última actualización: 21/06/2026',
};

const labels = {
  pt: {
    privacy: 'Política de Privacidade',
    terms: 'Termos de Uso',
    deletion: 'Exclusão de Dados',
    faq: 'Perguntas frequentes',
  },
  en: {
    privacy: 'Privacy Policy',
    terms: 'Terms of Use',
    deletion: 'Data Deletion',
    faq: 'FAQ',
  },
  es: {
    privacy: 'Política de Privacidad',
    terms: 'Términos de Uso',
    deletion: 'Eliminación de Datos',
    faq: 'Preguntas frecuentes',
  },
};

const privacy = {
  pt: [
${sectionsToJs(pt.privacy)}
  ],
  en: [
${sectionsToJs(EN_ES.privacy.en)}
  ],
  es: [
${sectionsToJs(EN_ES.privacy.es)}
  ],
};

const terms = {
  pt: [
${sectionsToJs(pt.terms)}
  ],
  en: [
${sectionsToJs(EN_ES.terms.en)}
  ],
  es: [
${sectionsToJs(EN_ES.terms.es)}
  ],
};

const deletion = {
  pt: [
${sectionsToJs(pt.deletion)}
  ],
  en: [
${sectionsToJs(EN_ES.deletion.en)}
  ],
  es: [
${sectionsToJs(EN_ES.deletion.es)}
  ],
};

const faq = {
  pt: [
${sectionsToJs(pt.faq)}
  ],
  en: [
${sectionsToJs(EN_ES.faq.en)}
  ],
  es: [
${sectionsToJs(EN_ES.faq.es)}
  ],
};

const pageSlugs = {
  privacy: 'contabil-i-politica-privacidade',
  terms: 'contabil-i-termos',
  deletion: 'contabil-i-exclusao-dados',
  faq: 'contabil-i-faq',
};

module.exports = {
  header,
  lastUpdated,
  labels,
  pageSlugs,
  pages: {
    privacy: {
      slug: pageSlugs.privacy,
      titles: {
        pt: \`Política de Privacidade — \${PRODUCT}\`,
        en: \`Privacy Policy — \${PRODUCT}\`,
        es: \`Política de Privacidad — \${PRODUCT}\`,
      },
      sections: privacy,
    },
    terms: {
      slug: pageSlugs.terms,
      titles: {
        pt: \`Termos de Uso — \${PRODUCT}\`,
        en: \`Terms of Use — \${PRODUCT}\`,
        es: \`Términos de Uso — \${PRODUCT}\`,
      },
      sections: terms,
    },
    deletion: {
      slug: pageSlugs.deletion,
      titles: {
        pt: \`Exclusão de Dados — \${PRODUCT}\`,
        en: \`Data Deletion — \${PRODUCT}\`,
        es: \`Eliminación de Datos — \${PRODUCT}\`,
      },
      sections: deletion,
    },
    faq: {
      slug: pageSlugs.faq,
      titles: {
        pt: \`Perguntas frequentes — \${PRODUCT}\`,
        en: \`FAQ — \${PRODUCT}\`,
        es: \`Preguntas frecuentes — \${PRODUCT}\`,
      },
      sections: faq,
    },
  },
};
`;
}

function sync() {
  const pt = parseAllPt();
  fs.writeFileSync(OUT_CJS, buildCjs(pt), 'utf8');
  const counts = Object.entries(pt)
    .map(([k, v]) => `${k}=${v.length}`)
    .join('; ');
  console.log(`contabil-i-sync-legal-from-md: PT ${counts}`);
}

module.exports = { sync, parseAllPt };

if (require.main === module) {
  sync();
}
