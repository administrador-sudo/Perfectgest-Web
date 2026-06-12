/// URL público canónico do site (domínio principal).
const String kSitePublicOrigin = 'https://perfectgestdev.com';

/// Espelho Render (redirect); mantido para CORS/API durante transição.
const String kSiteRenderOrigin =
    'https://perfectgest-web-desenvolvedor-apps.onrender.com';

/// Rota Flutter / path público do pré-cadastro de leads.
const String kPreCadastroPath = '/pre-cadastro';

/// Política de privacidade do site institucional (formulários web, cookies, analytics).
const String kSitePrivacyPolicyPath = '/politica-privacidade-site';

/// Política de privacidade da app PerfectGest I (Google Play / Microsoft Store).
const String kAppPrivacyPolicyPath = '/politica-privacidade-perfectgest-i';

/// Política de exclusão de dados da app PerfectGest I.
const String kAppDataDeletionPolicyPath = '/politica-exclusao-dados-perfectgest-i';

/// Política de devolução do site.
const String kSiteReturnsPolicyPath = '/politica-devolucao';

/// Link completo para redes sociais, bio e campanhas.
const String kPreCadastroPublicUrl = '$kSitePublicOrigin$kPreCadastroPath';

const String kSitePrivacyPolicyPublicUrl = '$kSitePublicOrigin$kSitePrivacyPolicyPath';

const String kAppPrivacyPolicyPublicUrl = '$kSitePublicOrigin$kAppPrivacyPolicyPath';

const String kAppDataDeletionPolicyPublicUrl = '$kSitePublicOrigin$kAppDataDeletionPolicyPath';

const String kSiteReturnsPolicyPublicUrl = '$kSitePublicOrigin$kSiteReturnsPolicyPath';
