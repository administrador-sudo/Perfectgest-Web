/** Rotas legais — slugs canónicos (URL sem .html). */
const siteSpaPages = [
  'politica-devolucao',
  'politica-privacidade-site',
  'pre-cadastro',
];

const clinicaIiiStaticSlugs = [
  'politica-privacidade-clinica-iii',
  'termos-clinica-iii',
  'dados-saude-lgpd-clinica-iii',
];

const perfectGestIStaticSlugs = [
  'perfectgest-i-politica-privacidade',
  'perfectgest-i-termos',
  'perfectgest-i-exclusao-dados',
  'perfectgest-i-faq',
];

const contabilIStaticSlugs = [
  'contabil-i-politica-privacidade',
  'contabil-i-termos',
  'contabil-i-exclusao-dados',
  'contabil-i-faq',
];

const legacyAppRedirects = {
  'politica-privacidade-perfectgest-i':
    'https://sites.google.com/view/perfectgest-i-faq-suporte/politica-em-pt',
  'politica-exclusao-dados-perfectgest-i':
    'https://sites.google.com/view/perfectgest-exclusao-dados/exclus%C3%A3o-de-dados',
};

function allLegalSlugs() {
  return [
    ...siteSpaPages,
    ...clinicaIiiStaticSlugs,
    ...perfectGestIStaticSlugs,
    ...contabilIStaticSlugs,
    ...Object.keys(legacyAppRedirects),
  ];
}

module.exports = {
  siteSpaPages,
  clinicaIiiStaticSlugs,
  perfectGestIStaticSlugs,
  contabilIStaticSlugs,
  legacyAppRedirects,
  allLegalSlugs,
};
