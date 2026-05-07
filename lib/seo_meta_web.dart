import 'package:web/web.dart' as web;

const String _kMetaDescriptionHome =
    'Software house especialista em Flutter, Java e SDKs para apps mobile, web e desktop com alta performance.';
const String _kMetaKeywordsHome = 'Flutter, Java, SDK, PWA, SEO, Google Search Console, mobile, web, desktop';
const String _kOgTitleHome = 'Codificando o Amanha, Hoje | PerfectGest I';
const String _kOgDescriptionHome =
    'Inovacao em Flutter, Java e SDKs com foco em codigo limpo, escala e performance.';
const String _kDocumentTitleHome = 'Codificando o Amanha, Hoje | PerfectGest I';

const String _kMetaDescriptionAbout =
    'Sobre a PerfectGest I: software house em Flutter, Java e SDKs. Apps nativos, web rapida, desktop Windows, Clean Architecture, seguranca e escalabilidade.';
const String _kMetaKeywordsAbout =
    'PerfectGest I, sobre nos, software house, Flutter, Java, desenvolvimento mobile, web, desktop, PWA, Clean Architecture';
const String _kOgTitleAbout = 'Sobre nos | PerfectGest I';
const String _kOgDescriptionAbout =
    'Missao, solucoes em app e web, desktop Windows e diferenciais da PerfectGest I.';
const String _kDocumentTitleAbout = 'Sobre nos | PerfectGest I';

const String _kMetaDescriptionPolitica =
    'Politica de privacidade, dados pessoais, cookies e termos de uso do site PerfectGest I — software house Flutter e Java.';
const String _kMetaKeywordsPolitica =
    'PerfectGest I, politica de privacidade, cookies, termos de uso, RGPD, dados pessoais, Google Analytics';
const String _kOgTitlePolitica = 'Privacidade, dados e cookies | PerfectGest I';
const String _kOgDescriptionPolitica =
    'Como tratamos dados, cookies de medição, direitos do titular e termos de uso do site institucional PerfectGest I.';
const String _kDocumentTitlePolitica = 'Privacidade e termos | PerfectGest I';

const String _kMetaDescriptionTecnologias =
    'Parceiros tecnológicos e stack Flutter da PerfectGest I: Clean Architecture, segurança, escala, integrações e operação contínua.';
const String _kMetaKeywordsTecnologias =
    'PerfectGest I, tecnologias, Flutter, Dart, Java, Gradle, SDK, integrações, arquitetura limpa, segurança, escala';
const String _kOgTitleTecnologias = 'Parceiros tecnológicos | PerfectGest I';
const String _kOgDescriptionTecnologias =
    'Visão técnica do stack PerfectGest I para mobile, web e desktop com foco em performance e previsibilidade.';
const String _kDocumentTitleTecnologias = 'Parceiros tecnológicos | PerfectGest I';

void _applyHomeSeoMetaTags() {
  _upsertMeta('description', _kMetaDescriptionHome);
  _upsertMeta('keywords', _kMetaKeywordsHome);
  _upsertMeta('robots', 'index, follow');

  _upsertMetaProperty('og:title', _kOgTitleHome);
  _upsertMetaProperty('og:description', _kOgDescriptionHome);
  _upsertMetaProperty('og:type', 'website');
  _upsertMetaProperty('og:locale', 'pt_BR');
  _setDocumentTitle(_kDocumentTitleHome);
}

void applySeoMetaTags() => _applyHomeSeoMetaTags();

/// Reaplica meta da pagina inicial (ex.: ao voltar da rota Sobre nos ou ao montar a home).
void applyHomePageSeoMetaTags() => _applyHomeSeoMetaTags();

/// Atualiza titulo e meta da rota institucional "Sobre nos" (melhor sinal para crawlers na SPA web).
void applyAboutPageSeoMetaTags() {
  _upsertMeta('description', _kMetaDescriptionAbout);
  _upsertMeta('keywords', _kMetaKeywordsAbout);
  _upsertMeta('robots', 'index, follow');
  _upsertMetaProperty('og:title', _kOgTitleAbout);
  _upsertMetaProperty('og:description', _kOgDescriptionAbout);
  _upsertMetaProperty('og:type', 'article');
  _upsertMetaProperty('og:locale', 'pt_BR');
  _setDocumentTitle(_kDocumentTitleAbout);
}

/// Atualiza titulo e metas da pagina de tecnologias/parceiros.
void applyTecnologiasSeoMetaTags() {
  _upsertMeta('description', _kMetaDescriptionTecnologias);
  _upsertMeta('keywords', _kMetaKeywordsTecnologias);
  _upsertMeta('robots', 'index, follow');
  _upsertMetaProperty('og:title', _kOgTitleTecnologias);
  _upsertMetaProperty('og:description', _kOgDescriptionTecnologias);
  _upsertMetaProperty('og:type', 'article');
  _upsertMetaProperty('og:locale', 'pt_BR');
  _setDocumentTitle(_kDocumentTitleTecnologias);
}

/// Meta da pagina de politica (privacidade, dados, cookies, termos).
void applyPoliticaSeoMetaTags() {
  _upsertMeta('description', _kMetaDescriptionPolitica);
  _upsertMeta('keywords', _kMetaKeywordsPolitica);
  _upsertMeta('robots', 'index, follow');
  _upsertMetaProperty('og:title', _kOgTitlePolitica);
  _upsertMetaProperty('og:description', _kOgDescriptionPolitica);
  _upsertMetaProperty('og:type', 'article');
  _upsertMetaProperty('og:locale', 'pt_BR');
  _setDocumentTitle(_kDocumentTitlePolitica);
}

/// Restaura titulo e descricoes padrao da home ao sair de rotas institucionais.
void restoreGlobalSeoMetaTags() => _applyHomeSeoMetaTags();

void _setDocumentTitle(String title) {
  web.document.title = title;
}

void _upsertMeta(String name, String content) {
  final head = web.document.head;
  if (head == null) return;
  final tag = (head.querySelector('meta[name="$name"]') as web.HTMLMetaElement?) ?? web.HTMLMetaElement()..name = name;
  if (tag.parentNode == null) head.append(tag);
  tag.content = content;
}

void _upsertMetaProperty(String property, String content) {
  final head = web.document.head;
  if (head == null) return;
  final tag = (head.querySelector('meta[property="$property"]') as web.HTMLMetaElement?)
      ?? (web.HTMLMetaElement()..setAttribute('property', property));
  if (tag.parentNode == null) head.append(tag);
  tag.content = content;
}
