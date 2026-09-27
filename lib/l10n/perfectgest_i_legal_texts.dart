import 'package:flutter/widgets.dart';

import '../company_legal.dart';
import 'play_store_app_legal_texts.dart';

/// Textos legais PerfectGest I no domínio (PT/EN/ES).
/// Gerado por scripts/perfectgest-i-sync-legal-from-md.cjs — não editar manualmente.
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

const String _kPgIPublisher = 'Marcos Leandro dos Santos';

const String _kHeaderPt =
    '$kCompanyLegalName\n'
    'Nome fantasia: $kCompanyFantasyName · CNPJ $kCompanyCnpj\n'
    '$kCompanyAddressLine\n'
    'Responsável editorial do produto: $_kPgIPublisher\n'
    'Suporte: $kCompanyContactEmail';

const String _kHeaderEn =
    '$kCompanyLegalName\n'
    'Trade name: $kCompanyFantasyName · CNPJ $kCompanyCnpj\n'
    '$kCompanyAddressLine\n'
    'Product publisher: $_kPgIPublisher\n'
    'Support: $kCompanyContactEmail';

const String _kHeaderEs =
    '$kCompanyLegalName\n'
    'Nombre comercial: $kCompanyFantasyName · CNPJ $kCompanyCnpj\n'
    '$kCompanyAddressLine\n'
    'Responsable editorial del producto: $_kPgIPublisher\n'
    'Soporte: $kCompanyContactEmail';

const List<LegalSectionText> _kPrivacyPt = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: '''Última atualização: 27 de setembro de 2026
O aplicativo PerfectGest trata os dados descritos nesta política. Esta política cobre apenas este aplicativo, em conformidade com a LGPD (Lei 13.709/18) e as normas da Google Play. Nome fantasia: PerfectGest. Site: https://perfectgestdev.com.'''),
  LegalSectionText(heading: 'Controlador e contato', body: 'Para acesso, retificação ou exclusão, escreva para suporte@perfectgestdev.com.'),
  LegalSectionText(heading: 'O que o aplicativo faz', body: 'O PerfectGest é gratuito. Serve para gestão operacional no telemóvel: agenda comercial (clientes e fornecedores), orçamentos, ordens de serviço, caixa, PDFs e backup local.'),
  LegalSectionText(heading: 'Armazenamento', body: '''Os dados de gestão ficam no dispositivo (SQLite). Não enviamos automaticamente clientes, orçamentos, caixa ou PDFs para servidores da PerfectGest.

Quando os dados podem sair (só por ação sua)

- Partilhar ou guardar PDF, cartão, vCard ou QR
- Criar e partilhar backup ou ZIP de exportação
- Abrir ligações que você escolhe (WhatsApp, e-mail, Play Store, site)'''),
  LegalSectionText(heading: 'Serviços de terceiros', body: '''- Firebase Analytics / Remote Config: eventos genéricos de uso e políticas de versão, sem nomes de clientes nem valores financeiros.
- Não usamos Google Play Billing neste aplicativo.'''),
  LegalSectionText(heading: 'Notificações', body: 'Podem existir notificações locais no aparelho. Não enviamos campanhas de marketing por servidor.'),
  LegalSectionText(heading: 'Direitos', body: 'Pode eliminar dados na app (Configurações) ou desinstalar o aplicativo. Backups e PDFs que você exportou ficam onde os guardou.'),
  LegalSectionText(heading: 'Alterações', body: 'Alterações a esta política serão publicadas nesta página. Versão de referência na app: kPublicLegalDocumentsVersion.'),
  LegalSectionText(heading: 'Identificação legal (LGPD / Google Play)', body: 'Controlador: PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA, CNPJ 66.889.409/0001-19. Site: https://perfectgestdev.com. Contacto: suporte@perfectgestdev.com.'),
];

const List<LegalSectionText> _kTermsPt = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: 'Ultima atualizacao: 27 de setembro de 2026'),
  LegalSectionText(heading: '1. Objeto', body: 'Estes Termos regem apenas o aplicativo PerfectGest: gestao operacional no telemovel (agenda comercial, orcamentos, ordens de servico, caixa, PDF, backup local). Dados principalmente no dispositivo. Nome fantasia: PerfectGest. Site: https://perfectgestdev.com.'),
  LegalSectionText(heading: '2. Elegibilidade', body: 'Utilizadores maiores de 18 anos.'),
  LegalSectionText(heading: '3. Preco', body: 'O PerfectGest e gratuito. Nao ha assinatura Google Play neste aplicativo.'),
  LegalSectionText(heading: '4. Limitacao de responsabilidade', body: 'Ferramenta de apoio a gestao. Nao substitui assessoria profissional. Decisoes de negocio sao do utilizador.'),
  LegalSectionText(heading: '5. Propriedade intelectual', body: 'Licenca revogavel, nao exclusiva.'),
  LegalSectionText(heading: '6. Lei e foro', body: 'Leis do Brasil; foro Caxias do Sul/RS, sem prejuizo do consumidor.'),
  LegalSectionText(heading: '7. Contacto', body: 'suporte@perfectgestdev.com'),
];

const List<LegalSectionText> _kDeletionPt = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: '''Ultima atualizacao: 27 de setembro de 2026
O PerfectGest e local-first. Dados de agenda, orcamentos e caixa nao sao enviados automaticamente para servidores. Site: https://perfectgestdev.com.'''),
  LegalSectionText(heading: 'Como eliminar', body: '''- Na app: Configuracoes → eliminar dados neste aparelho
- Android: Definicoes → Apps → PerfectGest → Armazenamento → Limpar dados
- Desinstalar o aplicativo

Sem copia externa nao ha recuperacao. Backups e PDFs que voce partilhou devem ser apagados no destino (WhatsApp, e-mail, Drive).'''),
  LegalSectionText(heading: 'Telemetria', body: 'Eventos genericos Firebase. Pedido por e-mail: suporte@perfectgestdev.com (assunto: Solicitacao de Exclusao de Dados Tecnicos). Prazo: ate 15 dias uteis.'),
];

const List<LegalSectionText> _kFaqPt = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: 'Ultima atualizacao: 27 de setembro de 2026'),
  LegalSectionText(heading: 'O que e o PerfectGest?', body: 'Aplicacao gratuita de gestao no telemovel, com dados locais (SQLite). Agenda (clientes e fornecedores), orcamentos, ordens de servico, caixa e PDF. Site: https://perfectgestdev.com.'),
  LegalSectionText(heading: 'Funciona sem internet?', body: 'Sim, o uso diario e offline-first. Analytics e Remote Config podem usar rede.'),
  LegalSectionText(heading: 'Ha assinatura?', body: 'Nao. O PerfectGest e gratuito e ilimitado neste aplicativo.'),
  LegalSectionText(heading: 'Como exporto os meus dados?', body: 'Configuracoes → exportar ZIP JSON, ou backup local. Voce escolhe com quem partilhar.'),
  LegalSectionText(heading: 'Como apago os dados?', body: 'Configuracoes → eliminar dados neste aparelho, ou desinstalar.'),
  LegalSectionText(heading: 'Sugestoes?', body: 'Aba Empresa ou e-mail suporte@perfectgestdev.com.'),
];

const List<LegalSectionText> _kPrivacyEn = <LegalSectionText>[
  LegalSectionText(heading: 'Introduction', body: '''Last updated: 27 September 2026
The PerfectGest app processes the data described in this policy. This policy covers this app only, under Brazil’s LGPD and Google Play rules. Trade name: PerfectGest. Website: https://perfectgestdev.com.'''),
  LegalSectionText(heading: 'Controller and contact', body: 'For access, correction or deletion: suporte@perfectgestdev.com.'),
  LegalSectionText(heading: 'What the app does', body: 'PerfectGest is free. It is operational management on the phone: commercial agenda (clients and suppliers), quotes, work orders, cash, PDFs and local backup.'),
  LegalSectionText(heading: 'Storage', body: '''Business data stays on the device (SQLite). We do not automatically send clients, quotes, cash or PDFs to PerfectGest servers.

When data may leave the device (only if you act)

- Share or save PDF, business card, vCard or QR
- Create and share a backup or export ZIP
- Open links you choose (WhatsApp, email, Play Store, website)'''),
  LegalSectionText(heading: 'Third-party services', body: '''- Firebase Analytics / Remote Config: generic usage events and version policy, without client names or money amounts.
- We do not use Google Play Billing in this app.'''),
  LegalSectionText(heading: 'Notifications', body: 'Notifications, if any, are local on the device.'),
  LegalSectionText(heading: 'Rights', body: 'You can delete data in Settings or uninstall the app. Files you exported remain where you saved them.'),
  LegalSectionText(heading: 'Changes', body: 'Updates are published on this page.'),
  LegalSectionText(heading: 'Legal identification (LGPD / Google Play)', body: 'Controller: PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA, CNPJ 66.889.409/0001-19. Website: https://perfectgestdev.com. Contact: suporte@perfectgestdev.com.'),
];

const List<LegalSectionText> _kTermsEn = <LegalSectionText>[
  LegalSectionText(heading: 'Introduction', body: 'Last updated: 27 September 2026'),
  LegalSectionText(heading: '1. Scope', body: 'These Terms cover only the PerfectGest app: operational management on the phone (commercial agenda, quotes, work orders, cash, PDF, local backup). Data is mainly on-device. Trade name: PerfectGest. Website: https://perfectgestdev.com.'),
  LegalSectionText(heading: '2. Eligibility', body: 'Users 18 years or older.'),
  LegalSectionText(heading: '3. Price', body: 'PerfectGest is free. There is no Google Play subscription in this app.'),
  LegalSectionText(heading: '4. Liability', body: 'Support tool only. It does not replace professional advice.'),
  LegalSectionText(heading: '5. Intellectual property', body: 'Revocable, non-exclusive licence.'),
  LegalSectionText(heading: '6. Law', body: 'Laws of Brazil; venue Caxias do Sul/RS, without prejudice to consumer rights.'),
  LegalSectionText(heading: '7. Contact', body: 'suporte@perfectgestdev.com'),
];

const List<LegalSectionText> _kDeletionEn = <LegalSectionText>[
  LegalSectionText(heading: 'Introduction', body: '''Last updated: 27 September 2026
PerfectGest is local-first. Agenda, quotes and cash are not sent automatically to servers. Website: https://perfectgestdev.com.'''),
  LegalSectionText(heading: 'How to delete', body: '''- In the app: Settings → delete data on this device
- Android: Settings → Apps → PerfectGest → Storage → Clear data
- Uninstall the app

Without an external copy there is no recovery. Delete shared backups/PDFs where you saved them.'''),
  LegalSectionText(heading: 'Telemetry', body: 'Generic Firebase events. Email suporte@perfectgestdev.com (subject: Technical data deletion). Up to 15 business days.'),
];

const List<LegalSectionText> _kFaqEn = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: 'Last updated: 27 September 2026'),
  LegalSectionText(heading: 'What is PerfectGest?', body: 'A free phone app for day-to-day management with local SQLite data: agenda (clients and suppliers), quotes, work orders, cash and PDF. Website: https://perfectgestdev.com.'),
  LegalSectionText(heading: 'Does it work offline?', body: 'Yes for daily use. Analytics and Remote Config may use the network.'),
  LegalSectionText(heading: 'Is there a subscription?', body: 'No. PerfectGest is free and unlimited in this app.'),
  LegalSectionText(heading: 'How do I export data?', body: 'Settings → JSON ZIP export, or local backup. You choose who to share with.'),
  LegalSectionText(heading: 'How do I delete data?', body: 'Settings → delete data on this device, or uninstall.'),
  LegalSectionText(heading: 'Suggestions?', body: 'Company tab or suporte@perfectgestdev.com.'),
];

const List<LegalSectionText> _kPrivacyEs = <LegalSectionText>[
  LegalSectionText(heading: 'Introducción', body: '''Ultima actualizacion: 27 de septiembre de 2026
La aplicacion PerfectGest trata los datos descritos en esta politica. Esta politica cubre solo esta aplicacion, conforme a la LGPD y las normas de Google Play. Nombre comercial: PerfectGest. Sitio: https://perfectgestdev.com.'''),
  LegalSectionText(heading: 'Responsable y contacto', body: 'Acceso, rectificacion o supresion: suporte@perfectgestdev.com.'),
  LegalSectionText(heading: 'Que hace la aplicacion', body: 'PerfectGest es gratuito. Gestion operativa en el telefono: agenda comercial (clientes y proveedores), presupuestos, ordenes de servicio, caja, PDF y copia de seguridad local.'),
  LegalSectionText(heading: 'Almacenamiento', body: '''Los datos de gestion permanecen en el dispositivo (SQLite). No enviamos automaticamente clientes, presupuestos, caja o PDF a servidores de PerfectGest.

Cuando pueden salir (solo si usted actua)

- Compartir o guardar PDF, tarjeta, vCard o QR
- Crear y compartir copia de seguridad o ZIP de exportacion
- Abrir enlaces que usted elige (WhatsApp, correo, Play Store, sitio)'''),
  LegalSectionText(heading: 'Terceros', body: '''- Firebase Analytics / Remote Config: eventos genericos de uso y politica de version, sin nombres de clientes ni importes.
- No usamos Google Play Billing en esta aplicacion.'''),
  LegalSectionText(heading: 'Notificaciones', body: 'Si existen, son locales en el aparato.'),
  LegalSectionText(heading: 'Derechos', body: 'Puede borrar datos en Ajustes o desinstalar. Los archivos que exporte quedan donde los guarde.'),
  LegalSectionText(heading: 'Cambios', body: 'Las actualizaciones se publican en esta pagina.'),
  LegalSectionText(heading: 'Identificacion legal (LGPD / Google Play)', body: 'Responsable: PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA, CNPJ 66.889.409/0001-19. Sitio: https://perfectgestdev.com. Contacto: suporte@perfectgestdev.com.'),
];

const List<LegalSectionText> _kTermsEs = <LegalSectionText>[
  LegalSectionText(heading: 'Introducción', body: 'Ultima actualizacion: 27 de septiembre de 2026'),
  LegalSectionText(heading: '1. Objeto', body: 'Estos Terminos cubren solo la app PerfectGest: gestion operativa en el telefono (agenda comercial, presupuestos, ordenes de servicio, caja, PDF, copia local). Datos principalmente en el dispositivo. Nombre comercial: PerfectGest. Sitio: https://perfectgestdev.com.'),
  LegalSectionText(heading: '2. Elegibilidad', body: 'Usuarios mayores de 18 anos.'),
  LegalSectionText(heading: '3. Precio', body: 'PerfectGest es gratuito. No hay suscripcion de Google Play en esta aplicacion.'),
  LegalSectionText(heading: '4. Responsabilidad', body: 'Herramienta de apoyo. No sustituye asesoramiento profesional.'),
  LegalSectionText(heading: '5. Propiedad intelectual', body: 'Licencia revocable, no exclusiva.'),
  LegalSectionText(heading: '6. Ley', body: 'Leyes de Brasil; fuero Caxias do Sul/RS, sin perjuicio del consumidor.'),
  LegalSectionText(heading: '7. Contacto', body: 'suporte@perfectgestdev.com'),
];

const List<LegalSectionText> _kDeletionEs = <LegalSectionText>[
  LegalSectionText(heading: 'Introducción', body: '''Ultima actualizacion: 27 de septiembre de 2026
PerfectGest es local-first. Agenda, presupuestos y caja no se envian automaticamente a servidores. Sitio: https://perfectgestdev.com.'''),
  LegalSectionText(heading: 'Como eliminar', body: '''- En la app: Ajustes → eliminar datos en este aparato
- Android: Ajustes → Apps → PerfectGest → Almacenamiento → Borrar datos
- Desinstalar la aplicacion

Sin copia externa no hay recuperacion. Borre copias compartidas donde las guardo.'''),
  LegalSectionText(heading: 'Telemetria', body: 'Eventos genericos de Firebase. Correo suporte@perfectgestdev.com. Hasta 15 dias habiles.'),
];

const List<LegalSectionText> _kFaqEs = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: 'Ultima actualizacion: 27 de septiembre de 2026'),
  LegalSectionText(heading: 'Que es PerfectGest?', body: 'Aplicacion gratuita de gestion en el telefono, con datos locales (SQLite): agenda (clientes y proveedores), presupuestos, ordenes de servicio, caja y PDF. Sitio: https://perfectgestdev.com.'),
  LegalSectionText(heading: 'Funciona sin internet?', body: 'Si, el uso diario es offline-first. Analytics y Remote Config pueden usar red.'),
  LegalSectionText(heading: 'Hay suscripcion?', body: 'No. PerfectGest es gratuito e ilimitado en esta aplicacion.'),
  LegalSectionText(heading: 'Como exporto datos?', body: 'Ajustes → ZIP JSON, o copia local. Usted elige con quien compartir.'),
  LegalSectionText(heading: 'Como borro datos?', body: 'Ajustes → eliminar datos en este aparato, o desinstalar.'),
  LegalSectionText(heading: 'Sugerencias?', body: 'Pestana Empresa o suporte@perfectgestdev.com.'),
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
  List<LegalSectionText> get privacySections => _kPrivacyEn;
  @override
  List<LegalSectionText> get termsSections => _kTermsEn;
  @override
  List<LegalSectionText> get deletionSections => _kDeletionEn;
  @override
  List<LegalSectionText> get faqSections => _kFaqEn;
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
  List<LegalSectionText> get privacySections => _kPrivacyEs;
  @override
  List<LegalSectionText> get termsSections => _kTermsEs;
  @override
  List<LegalSectionText> get deletionSections => _kDeletionEs;
  @override
  List<LegalSectionText> get faqSections => _kFaqEs;
}
