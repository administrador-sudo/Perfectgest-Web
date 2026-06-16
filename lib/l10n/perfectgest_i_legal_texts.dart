import 'package:flutter/widgets.dart';

import '../company_legal.dart';
import 'play_store_app_legal_texts.dart';

/// Textos legais PerfectGest I no domínio (PT/EN/ES) — paralelo a
/// `scripts/perfectgest-i-legal-data.cjs`. Canónico na app: Google Sites.
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
  String get lastUpdated;
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

const String _kPgIProductEmail = 'sac.perfectgest@gmail.com';
const String _kPgIPublisher = 'Marcos Leandro dos Santos';

const String _kHeaderPt =
    '$kCompanyLegalName\n'
    'Nome fantasia: $kCompanyFantasyName · CNPJ $kCompanyCnpj\n'
    '$kCompanyAddressLine\n'
    'Responsável editorial do produto: $_kPgIPublisher\n'
    'Contacto do produto: $_kPgIProductEmail · Suporte institucional: $kCompanyContactEmail\n\n'
    'Estas páginas no domínio perfectgestdev.com são uma cópia de referência para o futuro. '
    'A app PerfectGest I (Google Play) continua a apontar para o portal Google Sites até nova publicação.';

const String _kHeaderEn =
    '$kCompanyLegalName\n'
    'Trade name: $kCompanyFantasyName · CNPJ $kCompanyCnpj\n'
    '$kCompanyAddressLine\n'
    'Product publisher: $_kPgIPublisher\n'
    'Product contact: $_kPgIProductEmail · Institutional support: $kCompanyContactEmail\n\n'
    'These pages on perfectgestdev.com are a reference copy for future use. '
    'The PerfectGest I app (Google Play) still links to the Google Sites portal until republished.';

const String _kHeaderEs =
    '$kCompanyLegalName\n'
    'Nombre comercial: $kCompanyFantasyName · CNPJ $kCompanyCnpj\n'
    '$kCompanyAddressLine\n'
    'Responsable editorial del producto: $_kPgIPublisher\n'
    'Contacto del producto: $_kPgIProductEmail · Soporte institucional: $kCompanyContactEmail\n\n'
    'Estas páginas en perfectgestdev.com son una copia de referencia para el futuro. '
    'La app PerfectGest I (Google Play) sigue apuntando al portal Google Sites hasta nueva publicación.';

const List<LegalSectionText> _kPrivacyPt = <LegalSectionText>[
  LegalSectionText(heading: '1. Controlador e contacto', body: 'O $kProductPerfectGestIName é operado por $_kPgIPublisher. Para direitos LGPD: $_kPgIProductEmail.'),
  LegalSectionText(heading: '2. Armazenamento local', body: 'Modelo local-first: clientes, orçamentos, caixa e ordens de serviço ficam em SQLite no dispositivo. Não enviamos esses dados automaticamente para servidores PerfectGest.'),
  LegalSectionText(heading: '3. Quando os dados podem sair do aparelho', body: 'Somente por acção sua: partilhar PDF, backup exportado, cartão de visita (PNG/vCard/QR). Partilha de backup é sua responsabilidade.'),
  LegalSectionText(heading: '4. Cartão de visita', body: 'Dados da aba Empresa alimentam o cartão digital. Clientes e financeiro não entram no cartão. Modo estático após 1.º cartão sem Pro; funções avançadas com Plano Pro — tudo na app.'),
  LegalSectionText(heading: '5. Período de teste e Plano Pro', body: '7 dias desde a 1.ª abertura; limites 5+5+5. PDF de orçamento nos 4 primeiros; bloqueado a partir do 5.º e após 7 dias sem Pro. Após o trial, consulta/edição mantém-se; criação exige Pro.'),
  LegalSectionText(heading: '6. Serviços de terceiros', body: 'Firebase Analytics (eventos genéricos), Remote Config, Firestore (metadados anónimos), Google Play Billing. Sem venda de dados para publicidade.'),
  LegalSectionText(heading: '7. Retenção e exclusão', body: 'Dados locais: eliminar na app ou desinstalar. Telemetria: pedido por e-mail, até 15 dias úteis.'),
  LegalSectionText(heading: '8. Foro', body: 'Leis do Brasil; foro Caxias do Sul/RS. Utilizadores maiores de 18 anos.'),
];

const List<LegalSectionText> _kTermsPt = <LegalSectionText>[
  LegalSectionText(heading: '1. Objeto', body: 'Termos do $kProductPerfectGestIName — gestão empresarial no telemóvel, dados principalmente no dispositivo.'),
  LegalSectionText(heading: '2. Elegibilidade', body: 'Maiores de 18 anos.'),
  LegalSectionText(heading: '3. Teste e subscrição', body: '7 dias de teste; 5 clientes, 5 orçamentos, 5 lançamentos. Aviso no 4.º; 6.º ou fim dos 7 dias sem Pro bloqueia novos registos. Plano Pro na Google Play.'),
  LegalSectionText(heading: '4. Cancelamento', body: 'Google Play → Pagamentos e subscrições → Subscrições.'),
  LegalSectionText(heading: '5. Lembretes fiscais', body: 'Informativos; não substituem contabilista.'),
  LegalSectionText(heading: '6. Responsabilidade', body: 'Ferramenta de apoio; decisões de negócio são do utilizador.'),
  LegalSectionText(heading: '7. Contacto', body: _kPgIProductEmail),
];

const List<LegalSectionText> _kDeletionPt = <LegalSectionText>[
  LegalSectionText(heading: '1. Dados locais', body: 'Configurações → Dados no dispositivo → Eliminar todos os dados. Ou desinstalar. Irreversível sem backup externo.'),
  LegalSectionText(heading: '2. Ficheiros exportados', body: 'PDFs e backups partilhados devem ser apagados manualmente onde os guardou.'),
  LegalSectionText(heading: '3. Firebase (metadados)', body: 'E-mail $_kPgIProductEmail, assunto «Solicitação de Exclusão de Dados Técnicos». Prazo: até 15 dias úteis.'),
  LegalSectionText(heading: '4. Subscrições', body: 'Eliminar dados não cancela subscrição Google Play — gerir na loja.'),
];

const List<LegalSectionText> _kFaqPt = <LegalSectionText>[
  LegalSectionText(heading: 'O que é o PerfectGest I?', body: 'Gestão no telemóvel com dados locais (SQLite). Sem conta na nuvem para clientes/orçamentos/caixa.'),
  LegalSectionText(heading: 'Funciona offline?', body: 'Sim, uso diário offline-first.'),
  LegalSectionText(heading: 'Como funciona o teste de 7 dias?', body: '5+5+5 durante 7 dias. PDF de orçamento nos 4 primeiros; bloqueado do 5.º e após 7 dias sem Pro.'),
  LegalSectionText(heading: 'Cartão de visita', body: 'Aba Empresa — dados profissionais. Partilha PNG; Pro para vCard, QR e edição após 1.º cartão.'),
  LegalSectionText(heading: 'Como apagar tudo?', body: 'Configurações → Dados no dispositivo → Eliminar todos os dados.'),
];

class _PerfectGestILegalTextsPt extends PerfectGestILegalTexts {
  const _PerfectGestILegalTextsPt();

  @override
  String get privacyTitle => 'Política de Privacidade — $kProductPerfectGestIName';
  @override
  String get termsTitle => 'Termos e Condições — $kProductPerfectGestIName';
  @override
  String get deletionTitle => 'Exclusão de Dados — $kProductPerfectGestIName';
  @override
  String get faqTitle => 'Perguntas frequentes — $kProductPerfectGestIName';
  @override
  String get lastUpdated => 'Última atualização: 16/06/2026';
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
  String get privacyTitle => 'Privacy Policy — $kProductPerfectGestIName';
  @override
  String get termsTitle => 'Terms and Conditions — $kProductPerfectGestIName';
  @override
  String get deletionTitle => 'Data Deletion — $kProductPerfectGestIName';
  @override
  String get faqTitle => 'FAQ — $kProductPerfectGestIName';
  @override
  String get lastUpdated => 'Last updated: 16 June 2026';
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
  List<LegalSectionText> get privacySections => const [
    LegalSectionText(heading: '1. Controller and contact', body: '$kProductPerfectGestIName is operated by $_kPgIPublisher. For LGPD rights: $_kPgIProductEmail.'),
    LegalSectionText(heading: '2. Local storage', body: 'Local-first: clients, estimates, cash stay in SQLite on the device.'),
    LegalSectionText(heading: '5. Trial and Pro Plan', body: '7 days; 5+5+5 limits. Budget PDF for first 4 only; blocked from 5th and after 7 days without Pro.'),
    LegalSectionText(heading: '8. Governing law', body: 'Laws of Brazil; venue Caxias do Sul/RS.'),
  ];
  @override
  List<LegalSectionText> get termsSections => const [
    LegalSectionText(heading: '1. Purpose', body: 'These Terms govern $kProductPerfectGestIName on your phone.'),
    LegalSectionText(heading: '3. Trial and subscription', body: '7-day trial; 5+5+5. Pro via Google Play.'),
    LegalSectionText(heading: '7. Contact', body: _kPgIProductEmail),
  ];
  @override
  List<LegalSectionText> get deletionSections => const [
    LegalSectionText(heading: '1. Local data', body: 'Settings → Device data → Delete all data.'),
    LegalSectionText(heading: '3. Firebase (metadata)', body: 'Email $_kPgIProductEmail — Technical Data Deletion Request.'),
  ];
  @override
  List<LegalSectionText> get faqSections => const [
    LegalSectionText(heading: 'What is PerfectGest I?', body: 'Mobile management with local SQLite data.'),
    LegalSectionText(heading: '7-day trial', body: '5+5+5; budget PDF first 4 only; blocked from 5th and after 7 days without Pro.'),
  ];
}

class _PerfectGestILegalTextsEs extends PerfectGestILegalTexts {
  const _PerfectGestILegalTextsEs();

  @override
  String get privacyTitle => 'Política de Privacidad — $kProductPerfectGestIName';
  @override
  String get termsTitle => 'Términos y Condiciones — $kProductPerfectGestIName';
  @override
  String get deletionTitle => 'Eliminación de Datos — $kProductPerfectGestIName';
  @override
  String get faqTitle => 'Preguntas frecuentes — $kProductPerfectGestIName';
  @override
  String get lastUpdated => 'Última actualización: 16/06/2026';
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
  List<LegalSectionText> get privacySections => const [
    LegalSectionText(heading: '1. Controlador y contacto', body: '$kProductPerfectGestIName es operado por $_kPgIPublisher. Para derechos LGPD: $_kPgIProductEmail.'),
    LegalSectionText(heading: '2. Almacenamiento local', body: 'Modelo local-first: datos en SQLite en el dispositivo.'),
    LegalSectionText(heading: '5. Prueba y Plan Pro', body: '7 días; límites 5+5+5. PDF de presupuesto en los 4 primeros; bloqueado desde el 5.º y tras 7 días sin Pro.'),
  ];
  @override
  List<LegalSectionText> get termsSections => const [
    LegalSectionText(heading: '1. Objeto', body: 'Términos de $kProductPerfectGestIName en el móvil.'),
    LegalSectionText(heading: '3. Prueba y suscripción', body: '7 días; 5+5+5. Plan Pro en Google Play.'),
    LegalSectionText(heading: '7. Contacto', body: _kPgIProductEmail),
  ];
  @override
  List<LegalSectionText> get deletionSections => const [
    LegalSectionText(heading: '1. Datos locales', body: 'Ajustes → Datos en el dispositivo → Eliminar todos los datos.'),
    LegalSectionText(heading: '3. Firebase (metadatos)', body: 'Correo $_kPgIProductEmail — Solicitud de Eliminación de Datos Técnicos.'),
  ];
  @override
  List<LegalSectionText> get faqSections => const [
    LegalSectionText(heading: '¿Qué es PerfectGest I?', body: 'Gestión en el móvil con datos locales.'),
    LegalSectionText(heading: 'Prueba de 7 días', body: '5+5+5; PDF de presupuesto en los 4 primeros; bloqueado desde el 5.º sin Pro.'),
  ];
}
