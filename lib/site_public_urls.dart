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

/// FAQ institucional ContabilGest (formato vitrine — distinto de /contabil-i-faq legal Play).
const String kContabilgestFaqPath = '/faq-contabilgest';

/// Funil isolado de honorários (sem menu da vitrine).
const String kContabilidadePath = '/contabilidade';

/// Funil isolado Escritorio001 (associados S-App+CRCADM; sem menu da vitrine).
const String kContabilidadeEscritorio001Path = '/contabilidade_Escritorio001';

/// Funil isolado do certificado A1 QualityCert (sem menu da vitrine).
const String kCertificadoA1Path = '/A1_Certificado';

/// Landing isolada Barbear e Cortar (agenda MEI — sem menu da vitrine).
const String kBarberHairdresserPath = '/Barber_Hairdresser';

/// Painel admin da barbearia (convidar profissionais por email).
const String kBarberAdminPath = '/Barber_Admin';

/// Admin PerfectGest: criar / listar / desactivar lojas (multi-loja).
const String kBarberShopsAdminPath = '/Barber_Shops_Admin';

/// Shop piloto / legado (URL sem segmento redireciona para este).
const String kBarberDefaultShopId = 'perfectgest_dev';

/// Slug comercial: letras minúsculas, dígitos, `_` ou `-` (3–48).
final RegExp kBarberShopIdPattern = RegExp(r'^[a-z0-9_-]{3,48}$');

bool isValidBarberShopId(String raw) =>
    kBarberShopIdPattern.hasMatch(raw.trim());

/// Extrai shopId de `/Barber_Hairdresser/{id}` ou `/Barber_Admin/{id}`.
/// Path exacto (legado) → [kBarberDefaultShopId]. Inválido → null.
String? parseBarberShopIdFromRoute(String routeName, String basePath) {
  final path = routeName.trim();
  if (path == basePath) return kBarberDefaultShopId;
  final prefix = '$basePath/';
  if (!path.startsWith(prefix)) return null;
  final rest = path.substring(prefix.length);
  final id = rest.split('/').first.trim();
  if (!isValidBarberShopId(id)) return null;
  return id;
}

String barberHairdresserPublicUrlFor(String shopId) =>
    '$kSitePublicOrigin$kBarberHairdresserPath/$shopId';

String barberAdminPublicUrlFor(String shopId) =>
    '$kSitePublicOrigin$kBarberAdminPath/$shopId';

/// Ferramenta isolada de orçamento de esquadrias (sem menu da vitrine).
const String kOrcamentoPath = '/orcamento';

/// Lista-resumo Adm dos orçamentos gravados ao Ver folha.
const String kOrcamentoRegistrosPath = '/orcamento/registros';

const String kPreCadastroPublicUrl = '$kSitePublicOrigin$kPreCadastroPath';

const String kSitePrivacyPolicyPublicUrl = '$kSitePublicOrigin$kSitePrivacyPolicyPath';

const String kSiteReturnsPolicyPublicUrl = '$kSitePublicOrigin$kSiteReturnsPolicyPath';

const String kContabilgestFaqPublicUrl = '$kSitePublicOrigin$kContabilgestFaqPath';

const String kContabilidadePublicUrl = '$kSitePublicOrigin$kContabilidadePath';

const String kCertificadoA1PublicUrl = '$kSitePublicOrigin$kCertificadoA1Path';

const String kBarberHairdresserPublicUrl =
    '$kSitePublicOrigin$kBarberHairdresserPath';

/// Políticas do produto PerfectGest-Clinica III (consulta isolada — sem navegação da vitrine).
const String kClinicaIIIPrivacyPolicyPath = '/politica-privacidade-clinica-iii';
const String kClinicaIIITermsPath = '/termos-clinica-iii';
const String kClinicaIIIHealthLgpdPath = '/dados-saude-lgpd-clinica-iii';

const String kClinicaIIIPrivacyPolicyPublicUrl =
    '$kSitePublicOrigin$kClinicaIIIPrivacyPolicyPath';
const String kClinicaIIITermsPublicUrl = '$kSitePublicOrigin$kClinicaIIITermsPath';
const String kClinicaIIIHealthLgpdPublicUrl =
    '$kSitePublicOrigin$kClinicaIIIHealthLgpdPath';

/// Políticas PerfectGest I no domínio (HTML estático trílingue — canónico app e site).
const String kPerfectGestIPrivacyPolicyPath = '/perfectgest-i-politica-privacidade';
const String kPerfectGestITermsPath = '/perfectgest-i-termos';
const String kPerfectGestIDeletionPath = '/perfectgest-i-exclusao-dados';
const String kPerfectGestIFaqPath = '/perfectgest-i-faq';

const String kPerfectGestIPrivacyPolicyPublicUrl =
    '$kSitePublicOrigin$kPerfectGestIPrivacyPolicyPath';
const String kPerfectGestITermsPublicUrl = '$kSitePublicOrigin$kPerfectGestITermsPath';
const String kPerfectGestIDeletionPublicUrl =
    '$kSitePublicOrigin$kPerfectGestIDeletionPath';
const String kPerfectGestIFaqPublicUrl = '$kSitePublicOrigin$kPerfectGestIFaqPath';
