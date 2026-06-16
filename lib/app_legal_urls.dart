import 'package:flutter/widgets.dart';

import 'site_public_urls.dart';

/// URLs canónicas da app PerfectGest I (domínio perfectgestdev.com — páginas trílingues).
/// Espelham `apps/PerfectGest-I/lib/config/legal_urls.dart`.

const String kAppPrivacyPolicyUrlPt = kPerfectGestIPrivacyPolicyPublicUrl;
const String kAppPrivacyPolicyUrlEn = kPerfectGestIPrivacyPolicyPublicUrl;
const String kAppPrivacyPolicyUrlEs = kPerfectGestIPrivacyPolicyPublicUrl;

const String kAppAccountDeletionUrlPt = kPerfectGestIDeletionPublicUrl;
const String kAppAccountDeletionUrlEn = kPerfectGestIDeletionPublicUrl;
const String kAppAccountDeletionUrlEs = kPerfectGestIDeletionPublicUrl;

const String kAppSupportFaqUrl = kPerfectGestIFaqPublicUrl;

const String kAppTermsOfUseUrl = kPerfectGestITermsPublicUrl;

/// Rotas legadas no domínio do site (redireccionam para Google Sites no build estático).
const String kLegacyAppPrivacyPolicyPath = '/politica-privacidade-perfectgest-i';
const String kLegacyAppDataDeletionPath = '/politica-exclusao-dados-perfectgest-i';

// --- Páginas PerfectGest I no domínio (canónico app + site) ---

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
