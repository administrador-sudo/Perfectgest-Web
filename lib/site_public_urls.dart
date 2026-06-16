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

/// Políticas do produto PerfectGest-Clinica III (consulta isolada — sem navegação da vitrine).
const String kClinicaIIIPrivacyPolicyPath = '/politica-privacidade-clinica-iii';
const String kClinicaIIITermsPath = '/termos-clinica-iii';
const String kClinicaIIIHealthLgpdPath = '/dados-saude-lgpd-clinica-iii';

const String kClinicaIIIPrivacyPolicyPublicUrl =
    '$kSitePublicOrigin$kClinicaIIIPrivacyPolicyPath';
const String kClinicaIIITermsPublicUrl = '$kSitePublicOrigin$kClinicaIIITermsPath';
const String kClinicaIIIHealthLgpdPublicUrl =
    '$kSitePublicOrigin$kClinicaIIIHealthLgpdPath';
