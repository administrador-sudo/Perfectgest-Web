import 'package:web/web.dart' as web;

const String _kMetaDescriptionHome =
    'Software house especialista em Flutter, Java e SDKs para apps mobile, web e desktop com alta performance.';
const String _kMetaKeywordsHome = 'Flutter, Java, SDK, PWA, SEO, Google Search Console, mobile, web, desktop';
const String _kOgTitleHome = 'Codificando o Amanha, Hoje | Perfect Gest Dev';
const String _kOgDescriptionHome =
    'Inovacao em Flutter, Java e SDKs com foco em codigo limpo, escala e performance.';
const String _kDocumentTitleHome = 'Codificando o Amanha, Hoje | Perfect Gest Dev';

const String _kMetaDescriptionAbout =
    'Sobre a Perfect Gest Dev: software house em Flutter, Java e SDKs. Apps nativos, web rapida, desktop Windows, Clean Architecture, seguranca e escalabilidade.';
const String _kMetaKeywordsAbout =
    'Perfect Gest Dev, sobre nos, software house, Flutter, Java, desenvolvimento mobile, web, desktop, PWA, Clean Architecture';
const String _kOgTitleAbout = 'Sobre nos | Perfect Gest Dev';
const String _kOgDescriptionAbout =
    'Missao, solucoes em app e web, desktop Windows e diferenciais da Perfect Gest Dev.';
const String _kDocumentTitleAbout = 'Sobre nos | Perfect Gest Dev';

const String _kMetaDescriptionPolitica =
    'Politica de privacidade, dados pessoais, cookies e termos de uso do site Perfect Gest Dev — software house Flutter e Java.';
const String _kMetaKeywordsPolitica =
    'Perfect Gest Dev, politica de privacidade, cookies, termos de uso, RGPD, dados pessoais, Google Analytics';
const String _kOgTitlePolitica = 'Privacidade, dados e cookies | Perfect Gest Dev';
const String _kOgDescriptionPolitica =
    'Como tratamos dados, cookies de medição, direitos do titular e termos de uso do site institucional Perfect Gest Dev.';
const String _kDocumentTitlePolitica = 'Privacidade e termos | Perfect Gest Dev';

const String _kMetaDescriptionTecnologias =
    'Parceiros tecnológicos e stack Flutter da Perfect Gest Dev: Clean Architecture, segurança, escala, integrações e operação contínua.';
const String _kMetaKeywordsTecnologias =
    'Perfect Gest Dev, tecnologias, Flutter, Dart, Java, Gradle, SDK, integrações, arquitetura limpa, segurança, escala';
const String _kOgTitleTecnologias = 'Parceiros tecnológicos | Perfect Gest Dev';
const String _kOgDescriptionTecnologias =
    'Visão técnica do stack Perfect Gest Dev para mobile, web e desktop com foco em performance e previsibilidade.';
const String _kDocumentTitleTecnologias = 'Parceiros tecnológicos | Perfect Gest Dev';

const String _kMetaDescriptionPreCadastro =
    'Pre-cadastro Perfect Gest Dev: deixe nome, e-mail e comentario para receber novidades sobre apps Flutter, web e integracoes Java.';
const String _kMetaKeywordsPreCadastro =
    'Perfect Gest Dev, pre-cadastro, newsletter, Flutter, software house, contato, leads';
const String _kOgTitlePreCadastro = 'Pre-cadastro | Perfect Gest Dev';
const String _kOgDescriptionPreCadastro =
    'Formulario rapido para acompanhar lancamentos e solucoes da Perfect Gest Dev.';
const String _kDocumentTitlePreCadastro = 'Pre-cadastro | Perfect Gest Dev';

void _applyHomeSeoMetaTags() {
  _syncCanonicalFromLocation();
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
  _syncCanonicalFromLocation();
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
  _syncCanonicalFromLocation();
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
  _syncCanonicalFromLocation();
  _upsertMeta('description', _kMetaDescriptionPolitica);
  _upsertMeta('keywords', _kMetaKeywordsPolitica);
  _upsertMeta('robots', 'index, follow');
  _upsertMetaProperty('og:title', _kOgTitlePolitica);
  _upsertMetaProperty('og:description', _kOgDescriptionPolitica);
  _upsertMetaProperty('og:type', 'article');
  _upsertMetaProperty('og:locale', 'pt_BR');
  _setDocumentTitle(_kDocumentTitlePolitica);
}

/// Meta da pagina de pre-cadastro de leads.
void applyPreCadastroSeoMetaTags() {
  _syncCanonicalFromLocation();
  _upsertMeta('description', _kMetaDescriptionPreCadastro);
  _upsertMeta('keywords', _kMetaKeywordsPreCadastro);
  _upsertMeta('robots', 'index, follow');
  _upsertMetaProperty('og:title', _kOgTitlePreCadastro);
  _upsertMetaProperty('og:description', _kOgDescriptionPreCadastro);
  _upsertMetaProperty('og:type', 'website');
  _upsertMetaProperty('og:locale', 'pt_BR');
  _setDocumentTitle(_kDocumentTitlePreCadastro);
}

/// Restaura titulo e descricoes padrao da home ao sair de rotas institucionais.
void restoreGlobalSeoMetaTags() => _applyHomeSeoMetaTags();

/// Sincroniza o atributo `lang` do `<html>` para o idioma ativo (a11y/SEO).
///
/// Aceita codigo ISO curto (`pt`, `en`, `es`) ou BCP-47 (`pt-BR`, `en-US`).
void applyDocumentLanguage(String bcp47Tag) {
  if (bcp47Tag.isEmpty) return;
  final el = web.document.documentElement;
  if (el == null) return;
  el.setAttribute('lang', bcp47Tag);
}

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

void _syncCanonicalFromLocation() {
  final loc = web.window.location;
  final origin = loc.origin;
  var path = loc.pathname;
  if (path.isEmpty) path = '/';
  if (path.length > 1 && path.endsWith('/')) {
    path = path.substring(0, path.length - 1);
  }
  final href = path == '/' ? '$origin/' : '$origin$path';
  final head = web.document.head;
  if (head == null) return;
  final link = (head.querySelector('link[rel="canonical"]') as web.HTMLLinkElement?) ??
      (web.HTMLLinkElement()..rel = 'canonical');
  if (link.parentNode == null) head.append(link);
  link.href = href;
  _upsertMetaProperty('og:url', href);
}

/// Expõe sincronização do canonical (e `og:url`) para rotas sem bloco meta dedicado.
void syncCanonicalToCurrentUrl() => _syncCanonicalFromLocation();
