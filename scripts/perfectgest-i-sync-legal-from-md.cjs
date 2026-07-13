#!/usr/bin/env node
/**
 * Sincroniza perfectgest-i-legal-data.cjs e lib/l10n/perfectgest_i_legal_texts.dart
 * a partir de apps/PerfectGest-I/Politicas-Privacidade/*.md (textos completos).
 */
const fs = require('node:fs');
const path = require('node:path');

const ROOT = path.join(__dirname, '..');
const MD_DIR = path.join(ROOT, '..', '..', 'apps', 'PerfectGest-I', 'Politicas-Privacidade');
const OUT_CJS = path.join(__dirname, 'perfectgest-i-legal-data.cjs');
const OUT_DART = path.join(ROOT, 'lib', 'l10n', 'perfectgest_i_legal_texts.dart');

const EMAIL = 'suporte@perfectgestdev.com';
const PRODUCT = 'PerfectGest I';
const FANTASY = 'Perfect Gest Dev';
const LEGAL_NAME = 'PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA';
const CNPJ = '66.889.409/0001-19';
const ADDRESS = 'Caxias do Sul — RS — Brasil';
const PUBLISHER = 'Marcos Leandro dos Santos';

const FILES = {
  privacy: { pt: 'politica_privacidade_pt.md', en: 'politica_privacidade_en.md', es: 'politica_privacidade_es.md' },
  terms: { pt: 'termos_pt.md', en: 'termos_en.md', es: 'termos_es.md' },
  deletion: { pt: 'exclusao_dados_pt.md', en: 'exclusao_dados_en.md', es: 'exclusao_dados_es.md' },
  faq: { pt: 'faq_pt.md', en: 'faq_en.md', es: 'faq_es.md' },
};

const INTRO_HEADING = { pt: 'Introdução', en: 'Introduction', es: 'Introducción' };

function readMd(name) {
  const p = path.join(MD_DIR, name);
  if (!fs.existsSync(p)) throw new Error(`Ficheiro em falta: ${p}`);
  return fs.readFileSync(p, 'utf8').replace(/\r\n/g, '\n');
}

function cleanInline(text) {
  return text
    .replace(/sac\.perfectgest@gmail\.com/gi, EMAIL)
    .replace(/\*\*([^*]+)\*\*/g, '$1')
    .replace(/`([^`]+)`/g, '$1')
    .replace(/\[([^\]]+)\]\([^)]+\)/g, '$1')
    .replace(/\s+/g, ' ')
    .trim();
}

function cleanBlock(text) {
  return text
    .replace(/sac\.perfectgest@gmail\.com/gi, EMAIL)
    .replace(/\*\*([^*]+)\*\*/g, '$1')
    .replace(/`([^`]+)`/g, '$1')
    .replace(/\[([^\]]+)\]\([^)]+\)/g, '$1')
    .replace(/[ \t]+\n/g, '\n')
    .replace(/\n{3,}/g, '\n\n')
    .trim();
}

function isFooterSection(heading) {
  const h = heading.toLowerCase();
  return h.includes('links externos') || h.includes('external links') || h.includes('enlaces externos');
}

function isSkipLine(line) {
  const t = line.trim();
  if (!t) return false;
  if (t.startsWith('# ')) return true;
  if (t === '---') return true;
  return false;
}

/** privacy, terms, deletion: ## secções; ### subsecções no corpo. faq: cada ### é uma pergunta. */
function parseMd(content, mode) {
  const lines = content.split('\n');
  const sections = [];
  let current = null;
  let intro = [];

  function flush() {
    if (!current) return;
    const body = cleanBlock(current.body.join('\n'));
    if (current.heading && body) sections.push({ heading: cleanInline(current.heading), body });
    current = null;
  }

  for (const line of lines) {
    if (isSkipLine(line)) continue;

    const h2 = line.match(/^## (.+)$/);
    const h3 = line.match(/^### (.+)$/);

    if (h2) {
      const heading = h2[1].trim();
      if (isFooterSection(heading)) break;
      flush();
      current = { heading, body: [] };
      continue;
    }

    if (h3) {
      const sub = h3[1].trim();
      if (mode === 'faq') {
        flush();
        current = { heading: sub, body: [] };
        continue;
      }
      if (!current) {
        current = { heading: INTRO_HEADING.pt, body: [] };
      }
      current.body.push('', sub);
      continue;
    }

    if (!current) {
      if (line.trim()) intro.push(line);
      continue;
    }
    current.body.push(line);
  }
  flush();

  if (intro.length) {
    const body = cleanBlock(intro.join('\n'));
    if (body) {
      sections.unshift({
        heading: INTRO_HEADING.pt,
        body,
      });
    }
  }

  return sections.filter((s) => s.heading && s.body);
}

function parseMdLang(content, mode, lang) {
  const sections = parseMd(content, mode);
  if (mode !== 'faq' && sections.length && sections[0].heading === INTRO_HEADING.pt) {
    sections[0].heading = INTRO_HEADING[lang];
  }
  return sections;
}

function parseAll() {
  const out = { privacy: {}, terms: {}, deletion: {}, faq: {} };
  for (const [page, langs] of Object.entries(FILES)) {
    const mode = page === 'faq' ? 'faq' : 'doc';
    for (const [lang, file] of Object.entries(langs)) {
      out[page][lang] = parseMdLang(readMd(file), mode, lang);
    }
  }
  return out;
}

function jsString(s) {
  return JSON.stringify(s);
}

function dartString(s) {
  if (!s.includes("'") && !s.includes('\n') && !s.includes('\\')) {
    return "'" + s.replace(/\$/g, '\\$') + "'";
  }
  const escaped = s.replace(/\\/g, '\\\\').replace(/\$/g, '\\$').replace(/'''/g, "\\'\\'\\'");
  return "'''" + escaped + "'''";
}

function sectionsToJs(sections) {
  return sections
    .map((s) => `    { heading: ${jsString(s.heading)}, body: ${jsString(s.body)} }`)
    .join(',\n');
}

function sectionsToDart(sections, indent = '  ') {
  return sections
    .map(
      (s) =>
        `${indent}LegalSectionText(heading: ${dartString(s.heading)}, body: ${dartString(s.body)}),`,
    )
    .join('\n');
}

function buildCjs(sections) {
  const header = {
    pt:
      `${LEGAL_NAME}\n` +
      `Nome fantasia: ${FANTASY} · CNPJ ${CNPJ}\n` +
      `${ADDRESS}\n` +
      `Responsável editorial do produto: ${PUBLISHER}\n` +
      `Suporte: ${EMAIL}`,
    en:
      `${LEGAL_NAME}\n` +
      `Trade name: ${FANTASY} · CNPJ ${CNPJ}\n` +
      `${ADDRESS}\n` +
      `Product publisher: ${PUBLISHER}\n` +
      `Support: ${EMAIL}`,
    es:
      `${LEGAL_NAME}\n` +
      `Nombre comercial: ${FANTASY} · CNPJ ${CNPJ}\n` +
      `${ADDRESS}\n` +
      `Responsable editorial del producto: ${PUBLISHER}\n` +
      `Soporte: ${EMAIL}`,
  };

  return `/** PerfectGest I — documentos legais no domínio.
 * Gerado por scripts/perfectgest-i-sync-legal-from-md.cjs a partir de
 * apps/PerfectGest-I/Politicas-Privacidade/*.md — não editar manualmente. */
const PRODUCT = ${jsString(PRODUCT)};
const FANTASY = ${jsString(FANTASY)};
const LEGAL_NAME = ${jsString(LEGAL_NAME)};
const CNPJ = ${jsString(CNPJ)};
const EMAIL = ${jsString(EMAIL)};
const ADDRESS = ${jsString(ADDRESS)};
const PUBLISHER = ${jsString(PUBLISHER)};

const header = {
  pt: ${jsString(header.pt)},
  en: ${jsString(header.en)},
  es: ${jsString(header.es)},
};

const labels = {
  pt: {
    privacy: 'Política de Privacidade',
    terms: 'Termos e Condições',
    deletion: 'Exclusão de Dados',
    faq: 'Perguntas frequentes',
  },
  en: {
    privacy: 'Privacy Policy',
    terms: 'Terms and Conditions',
    deletion: 'Data Deletion',
    faq: 'FAQ',
  },
  es: {
    privacy: 'Política de Privacidad',
    terms: 'Términos y Condiciones',
    deletion: 'Eliminación de Datos',
    faq: 'Preguntas frecuentes',
  },
};

const privacy = {
  pt: [
${sectionsToJs(sections.privacy.pt)}
  ],
  en: [
${sectionsToJs(sections.privacy.en)}
  ],
  es: [
${sectionsToJs(sections.privacy.es)}
  ],
};

const terms = {
  pt: [
${sectionsToJs(sections.terms.pt)}
  ],
  en: [
${sectionsToJs(sections.terms.en)}
  ],
  es: [
${sectionsToJs(sections.terms.es)}
  ],
};

const deletion = {
  pt: [
${sectionsToJs(sections.deletion.pt)}
  ],
  en: [
${sectionsToJs(sections.deletion.en)}
  ],
  es: [
${sectionsToJs(sections.deletion.es)}
  ],
};

const faq = {
  pt: [
${sectionsToJs(sections.faq.pt)}
  ],
  en: [
${sectionsToJs(sections.faq.en)}
  ],
  es: [
${sectionsToJs(sections.faq.es)}
  ],
};

const pageSlugs = {
  privacy: 'perfectgest-i-politica-privacidade',
  terms: 'perfectgest-i-termos',
  deletion: 'perfectgest-i-exclusao-dados',
  faq: 'perfectgest-i-faq',
};

module.exports = {
  header,
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
        pt: \`Termos e Condições — \${PRODUCT}\`,
        en: \`Terms and Conditions — \${PRODUCT}\`,
        es: \`Términos y Condiciones — \${PRODUCT}\`,
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

function buildDart(sections) {
  return `import 'package:flutter/widgets.dart';

import '../company_legal.dart';
import 'play_store_app_legal_texts.dart';

/// Textos legais PerfectGest I no domínio (PT/EN/ES).
/// Gerado por scripts/perfectgest-i-sync-legal-from-md.cjs — não editar manualmente.
abstract class PerfectGestILegalTexts {
  const PerfectGestILegalTexts();

  static PerfectGestILegalTexts of(BuildContext context) {
    switch (Localizations.localeOf(context).languageCode) {
      case 'en':
        return const _PerfectGestILegalTextsEn();
      case 'es':
        return const _PerfectGestILegalTextsEs();
      case 'pt':
      default:
        return const _PerfectGestILegalTextsPt();
    }
  }

  String get privacyTitle;
  String get termsTitle;
  String get deletionTitle;
  String get faqTitle;
  String get legalHeaderBody;
  String get footerPrivacy;
  String get footerTerms;
  String get footerDeletion;
  String get footerFaq;

  List<LegalSectionText> get privacySections;
  List<LegalSectionText> get termsSections;
  List<LegalSectionText> get deletionSections;
  List<LegalSectionText> get faqSections;
}

const String _kPgIPublisher = ${dartString(PUBLISHER)};

const String _kHeaderPt =
    '\$kCompanyLegalName\\n'
    'Nome fantasia: \$kCompanyFantasyName · CNPJ \$kCompanyCnpj\\n'
    '\$kCompanyAddressLine\\n'
    'Responsável editorial do produto: \$_kPgIPublisher\\n'
    'Suporte: \$kCompanyContactEmail';

const String _kHeaderEn =
    '\$kCompanyLegalName\\n'
    'Trade name: \$kCompanyFantasyName · CNPJ \$kCompanyCnpj\\n'
    '\$kCompanyAddressLine\\n'
    'Product publisher: \$_kPgIPublisher\\n'
    'Support: \$kCompanyContactEmail';

const String _kHeaderEs =
    '\$kCompanyLegalName\\n'
    'Nombre comercial: \$kCompanyFantasyName · CNPJ \$kCompanyCnpj\\n'
    '\$kCompanyAddressLine\\n'
    'Responsable editorial del producto: \$_kPgIPublisher\\n'
    'Soporte: \$kCompanyContactEmail';

const List<LegalSectionText> _kPrivacyPt = <LegalSectionText>[
${sectionsToDart(sections.privacy.pt)}
];

const List<LegalSectionText> _kTermsPt = <LegalSectionText>[
${sectionsToDart(sections.terms.pt)}
];

const List<LegalSectionText> _kDeletionPt = <LegalSectionText>[
${sectionsToDart(sections.deletion.pt)}
];

const List<LegalSectionText> _kFaqPt = <LegalSectionText>[
${sectionsToDart(sections.faq.pt)}
];

const List<LegalSectionText> _kPrivacyEn = <LegalSectionText>[
${sectionsToDart(sections.privacy.en)}
];

const List<LegalSectionText> _kTermsEn = <LegalSectionText>[
${sectionsToDart(sections.terms.en)}
];

const List<LegalSectionText> _kDeletionEn = <LegalSectionText>[
${sectionsToDart(sections.deletion.en)}
];

const List<LegalSectionText> _kFaqEn = <LegalSectionText>[
${sectionsToDart(sections.faq.en)}
];

const List<LegalSectionText> _kPrivacyEs = <LegalSectionText>[
${sectionsToDart(sections.privacy.es)}
];

const List<LegalSectionText> _kTermsEs = <LegalSectionText>[
${sectionsToDart(sections.terms.es)}
];

const List<LegalSectionText> _kDeletionEs = <LegalSectionText>[
${sectionsToDart(sections.deletion.es)}
];

const List<LegalSectionText> _kFaqEs = <LegalSectionText>[
${sectionsToDart(sections.faq.es)}
];

class _PerfectGestILegalTextsPt extends PerfectGestILegalTexts {
  const _PerfectGestILegalTextsPt();

  @override
  String get privacyTitle => 'Política de Privacidade — \$kProductPerfectGestIName';
  @override
  String get termsTitle => 'Termos e Condições — \$kProductPerfectGestIName';
  @override
  String get deletionTitle => 'Exclusão de Dados — \$kProductPerfectGestIName';
  @override
  String get faqTitle => 'Perguntas frequentes — \$kProductPerfectGestIName';
  @override
  String get legalHeaderBody => _kHeaderPt;
  @override
  String get footerPrivacy => 'Política de Privacidade';
  @override
  String get footerTerms => 'Termos e Condições';
  @override
  String get footerDeletion => 'Exclusão de Dados';
  @override
  String get footerFaq => 'Perguntas frequentes';
  @override
  List<LegalSectionText> get privacySections => _kPrivacyPt;
  @override
  List<LegalSectionText> get termsSections => _kTermsPt;
  @override
  List<LegalSectionText> get deletionSections => _kDeletionPt;
  @override
  List<LegalSectionText> get faqSections => _kFaqPt;
}

class _PerfectGestILegalTextsEn extends PerfectGestILegalTexts {
  const _PerfectGestILegalTextsEn();

  @override
  String get privacyTitle => 'Privacy Policy — \$kProductPerfectGestIName';
  @override
  String get termsTitle => 'Terms and Conditions — \$kProductPerfectGestIName';
  @override
  String get deletionTitle => 'Data Deletion — \$kProductPerfectGestIName';
  @override
  String get faqTitle => 'FAQ — \$kProductPerfectGestIName';
  @override
  String get legalHeaderBody => _kHeaderEn;
  @override
  String get footerPrivacy => 'Privacy Policy';
  @override
  String get footerTerms => 'Terms and Conditions';
  @override
  String get footerDeletion => 'Data Deletion';
  @override
  String get footerFaq => 'FAQ';
  @override
  List<LegalSectionText> get privacySections => _kPrivacyEn;
  @override
  List<LegalSectionText> get termsSections => _kTermsEn;
  @override
  List<LegalSectionText> get deletionSections => _kDeletionEn;
  @override
  List<LegalSectionText> get faqSections => _kFaqEn;
}

class _PerfectGestILegalTextsEs extends PerfectGestILegalTexts {
  const _PerfectGestILegalTextsEs();

  @override
  String get privacyTitle => 'Política de Privacidad — \$kProductPerfectGestIName';
  @override
  String get termsTitle => 'Términos y Condiciones — \$kProductPerfectGestIName';
  @override
  String get deletionTitle => 'Eliminación de Datos — \$kProductPerfectGestIName';
  @override
  String get faqTitle => 'Preguntas frecuentes — \$kProductPerfectGestIName';
  @override
  String get legalHeaderBody => _kHeaderEs;
  @override
  String get footerPrivacy => 'Política de Privacidad';
  @override
  String get footerTerms => 'Términos y Condiciones';
  @override
  String get footerDeletion => 'Eliminación de Datos';
  @override
  String get footerFaq => 'Preguntas frecuentes';
  @override
  List<LegalSectionText> get privacySections => _kPrivacyEs;
  @override
  List<LegalSectionText> get termsSections => _kTermsEs;
  @override
  List<LegalSectionText> get deletionSections => _kDeletionEs;
  @override
  List<LegalSectionText> get faqSections => _kFaqEs;
}
`;
}

function sync() {
  const sections = parseAll();
  fs.writeFileSync(OUT_CJS, buildCjs(sections), 'utf8');
  fs.writeFileSync(OUT_DART, buildDart(sections), 'utf8');
  const counts = Object.entries(sections)
    .map(([k, v]) => `${k}: pt=${v.pt.length} en=${v.en.length} es=${v.es.length}`)
    .join('; ');
  console.log(`perfectgest-i-sync-legal-from-md: ${counts}`);
}

module.exports = { sync, parseAll };

if (require.main === module) {
  sync();
}
