/// URL público canónico do site institucional (domínio principal).
const String kSitePublicOrigin = 'https://perfectgestdev.com';

/// Espelho Render (redirect); mantido para CORS/API durante transição.
const String kSiteRenderOrigin =
    'https://perfectgest-web-desenvolvedor-apps.onrender.com';

/// Rota Flutter / path público do pré-cadastro de leads.
const String kPreCadastroPath = '/pre-cadastro';

/// Política de privacidade do site (cookies, analytics, formulários web).
const String kSitePrivacyPolicyPath = '/politica-privacidade-site';

/// Política de devolução do site.
const String kSiteReturnsPolicyPath = '/politica-devolucao';

const String kPreCadastroPublicUrl = '$kSitePublicOrigin$kPreCadastroPath';

const String kSitePrivacyPolicyPublicUrl = '$kSitePublicOrigin$kSitePrivacyPolicyPath';

const String kSiteReturnsPolicyPublicUrl = '$kSitePublicOrigin$kSiteReturnsPolicyPath';
