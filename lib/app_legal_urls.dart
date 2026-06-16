import 'package:flutter/widgets.dart';

import 'site_public_urls.dart';

/// URLs canónicas da app PerfectGest I (portal externo de suporte — conformidade nas consolas de distribuição).
/// Espelham `apps/PerfectGest-I/lib/config/legal_urls.dart`.

const String kAppPrivacyPolicyUrlPt =
    'https://sites.google.com/view/perfectgest-i-faq-suporte/politica-em-pt';

const String kAppPrivacyPolicyUrlEn =
    'https://sites.google.com/view/perfectgest-i-faq-suporte/politics-in-en';

const String kAppPrivacyPolicyUrlEs =
    'https://sites.google.com/view/perfectgest-i-faq-suporte/pol%C3%ADtica-en-es';

const String kAppAccountDeletionUrlPt =
    'https://sites.google.com/view/perfectgest-exclusao-dados/exclus%C3%A3o-de-dados';

const String kAppAccountDeletionUrlEn =
    'https://sites.google.com/view/perfectgest-exclusao-dados/data-deletion-english';

const String kAppAccountDeletionUrlEs =
    'https://sites.google.com/view/perfectgest-exclusao-dados/exclusi%C3%B3n-de-datos-espa%C3%B1ol';

const String kAppSupportFaqUrl =
    'https://sites.google.com/view/perfectgest-i-faq-suporte/faq';

const String kAppTermsOfUseUrl =
    'https://sites.google.com/view/perfectgest-i-faq-suporte/termos-e-condi%C3%A7oes';

/// Rotas legadas no domínio do site (redireccionam para Google Sites no build estático).
const String kLegacyAppPrivacyPolicyPath = '/politica-privacidade-perfectgest-i';
const String kLegacyAppDataDeletionPath = '/politica-exclusao-dados-perfectgest-i';

// --- Futuro: páginas PerfectGest I no domínio (app continua a usar [kApp*] Google Sites) ---

const String kDomainPerfectGestIPrivacyPublicUrl = kPerfectGestIPrivacyPolicyPublicUrl;
const String kDomainPerfectGestITermsPublicUrl = kPerfectGestITermsPublicUrl;
const String kDomainPerfectGestIDeletionPublicUrl = kPerfectGestIDeletionPublicUrl;
const String kDomainPerfectGestIFaqPublicUrl = kPerfectGestIFaqPublicUrl;

String appPrivacyPolicyUrlFor(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return kAppPrivacyPolicyUrlEn;
    case 'es':
      return kAppPrivacyPolicyUrlEs;
    default:
      return kAppPrivacyPolicyUrlPt;
  }
}

String appAccountDeletionUrlFor(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return kAppAccountDeletionUrlEn;
    case 'es':
      return kAppAccountDeletionUrlEs;
    default:
      return kAppAccountDeletionUrlPt;
  }
}
