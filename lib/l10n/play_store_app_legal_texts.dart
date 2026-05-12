import 'package:flutter/widgets.dart';

class LegalSectionText {
  const LegalSectionText({required this.heading, required this.body});
  final String heading;
  final String body;
}

/// Textos legais da app PerfectGest I (Play Store): titulos, data e
/// secoes das politicas de Privacidade e Exclusao de Dados (PT/EN/ES).
abstract class PlayStoreAppLegalTexts {
  const PlayStoreAppLegalTexts();

  static PlayStoreAppLegalTexts of(BuildContext context) {
    switch (Localizations.localeOf(context).languageCode) {
      case 'en':
        return const _PlayStoreAppLegalTextsEn();
      case 'es':
        return const _PlayStoreAppLegalTextsEs();
      case 'pt':
      default:
        return const _PlayStoreAppLegalTextsPt();
    }
  }

  String get privacyPolicyPerfectGestITitle;
  String get dataDeletionPolicyPerfectGestITitle;
  String get lastUpdatedMay2026;

  List<LegalSectionText> get privacyPolicySections;
  List<LegalSectionText> get dataDeletionPolicySections;
}

// =====================================================================
// Portugues (fonte original)
// =====================================================================

const List<LegalSectionText> _kPrivacyPt = <LegalSectionText>[
  LegalSectionText(
    heading: '1. Identificação do Controlador',
    body:
        'A PerfectGest, sob responsabilidade de Marcos Leandro dos Santos, estabelece esta Política de Privacidade '
        'em conformidade com a Lei Geral de Proteção de Dados (LGPD - Lei 13.709/18) e com as políticas para desenvolvedores da Google Play Store. '
        'Para exercício de direitos de acesso, retificação ou exclusão, contacte: sac.perfectgest@gmail.com.',
  ),
  LegalSectionText(
    heading: '2. Armazenamento local e natureza dos dados',
    body:
        'O aplicativo opera em modelo local-first. Os dados de gestão comercial (clientes, orçamentos, fluxos de caixa e projetos) '
        'são armazenados exclusivamente no dispositivo do utilizador. Não há recolha, acesso ou transferência desses dados sensíveis para servidores. '
        'A saída de dados ocorre apenas por ação deliberada do utilizador, como backups e exportação de PDFs.',
  ),
  LegalSectionText(
    heading: '3. Serviços de terceiros e recolha mínima',
    body:
        'Para integridade técnica e licenciamento, podem ser utilizados serviços Google/Firebase com recolha estritamente necessária: '
        'Google Analytics para Firebase (eventos de uso e erros críticos), Firebase Remote Config (parâmetros de segurança), '
        'Cloud Firestore (metadados técnicos e controlo de período de avaliação com identificador pseudónimo) '
        'e Google Play Billing (processamento financeiro pela infraestrutura Google).',
  ),
  LegalSectionText(
    heading: '4. Segurança e transparência',
    body:
        'Todos os dados em trânsito (telemetria e metadados técnicos) utilizam HTTPS/TLS. '
        'A PerfectGest declara não vender ou partilhar dados técnicos/de uso para publicidade. '
        'Identificadores de dispositivo são utilizados exclusivamente para validação de período gratuito e segurança do software.',
  ),
  LegalSectionText(
    heading: '5. Retenção e exclusão',
    body:
        'Dados comerciais locais podem ser eliminados pelo utilizador ao limpar dados do app ou desinstalar. '
        'Registos de telemetria/suporte podem ser solicitados para exclusão por e-mail, com prazo de atendimento de até 15 dias úteis.',
  ),
  LegalSectionText(
    heading: '6. Permissões de sistema',
    body:
        'O aplicativo solicita armazenamento apenas para importar logótipos e salvar ficheiros gerados pelo utilizador '
        '(PDFs, backups e relatórios exportados).',
  ),
  LegalSectionText(
    heading: '7. Elegibilidade, foro e links externos',
    body:
        'O aplicativo destina-se a maiores de 18 anos. Esta política é regida pelas leis da República Federativa do Brasil, '
        'com foro da comarca de Caxias do Sul/RS. Referência externa atual: google.com.',
  ),
];

const List<LegalSectionText> _kDataDeletionPt = <LegalSectionText>[
  LegalSectionText(
    heading: '1. Eliminação de dados de gestão (locais)',
    body:
        'Os dados de clientes, orçamentos e finanças residem exclusivamente no dispositivo. '
        'Para eliminar: abrir PerfectGest I > Configurações > Dados no dispositivo > Eliminar todos os dados. '
        'Atenção: processo irreversível, com remoção permanente da base interna.',
  ),
  LegalSectionText(
    heading: '2. Eliminação de ficheiros exportados',
    body:
        'PDFs, backups manuais e relatórios exportados por WhatsApp/E-mail não permanecem vinculados à base do app após a exportação. '
        'A remoção deve ser feita manualmente nas pastas locais ou serviços de nuvem utilizados pelo utilizador.',
  ),
  LegalSectionText(
    heading: '3. Eliminação de dados técnicos (Firebase/Nuvem)',
    body:
        'O app utiliza dados técnicos mínimos (ID pseudónimo e marco temporal) em Firebase/Firestore para gestão de trial. '
        'Não são recolhidos dados nominais ou financeiros em nuvem. '
        'Solicitações de exclusão definitiva podem ser enviadas para sac.perfectgest@gmail.com '
        'com o assunto "Exclusão de Dados – [ID do Dispositivo]". '
        'Prazo de processamento: até 15 dias úteis.',
  ),
  LegalSectionText(
    heading: '4. Assinaturas e Google Play',
    body:
        'Excluir dados do app ou desinstalar não cancela assinaturas ativas. '
        'Pagamentos, cancelamentos e histórico de compras devem ser geridos diretamente na Conta Google > Pagamentos e Assinaturas.',
  ),
];

// =====================================================================
// Ingles
// =====================================================================

const List<LegalSectionText> _kPrivacyEn = <LegalSectionText>[
  LegalSectionText(
    heading: '1. Controller identification',
    body:
        'PerfectGest, under the responsibility of Marcos Leandro dos Santos, establishes this Privacy Policy '
        'in compliance with the Brazilian General Data Protection Law (LGPD - Law 13,709/18) and Google Play Store developer policies. '
        'To exercise access, rectification or erasure rights, contact: sac.perfectgest@gmail.com.',
  ),
  LegalSectionText(
    heading: '2. Local storage and nature of data',
    body:
        'The app operates in a local-first model. Business management data (clients, quotes, cash flow and projects) '
        'is stored exclusively on the user device. There is no collection, access or transfer of this sensitive data to servers. '
        'Data leaves the device only by deliberate user action, such as backups and PDF exports.',
  ),
  LegalSectionText(
    heading: '3. Third-party services and minimal collection',
    body:
        'For technical integrity and licensing, Google/Firebase services may be used with strictly necessary collection: '
        'Google Analytics for Firebase (usage events and critical errors), Firebase Remote Config (security parameters), '
        'Cloud Firestore (technical metadata and trial period control with a pseudonymous identifier) '
        'and Google Play Billing (financial processing by Google infrastructure).',
  ),
  LegalSectionText(
    heading: '4. Security and transparency',
    body:
        'All data in transit (telemetry and technical metadata) uses HTTPS/TLS. '
        'PerfectGest states that it does not sell or share technical/usage data for advertising. '
        'Device identifiers are used exclusively for free trial validation and software security.',
  ),
  LegalSectionText(
    heading: '5. Retention and deletion',
    body:
        'Local business data can be removed by the user by clearing app data or uninstalling. '
        'Telemetry/support records can be requested for deletion by email, with a service window of up to 15 business days.',
  ),
  LegalSectionText(
    heading: '6. System permissions',
    body:
        'The app requests storage only to import logos and save user-generated files '
        '(PDFs, backups and exported reports).',
  ),
  LegalSectionText(
    heading: '7. Eligibility, jurisdiction and external links',
    body:
        'The app is intended for users 18 years or older. This policy is governed by the laws of the Federative Republic of Brazil, '
        'with venue in the district of Caxias do Sul/RS. Current external reference: google.com.',
  ),
];

const List<LegalSectionText> _kDataDeletionEn = <LegalSectionText>[
  LegalSectionText(
    heading: '1. Deletion of management data (local)',
    body:
        'Client, quote and finance data resides exclusively on the device. '
        'To delete: open PerfectGest I > Settings > On-device data > Delete all data. '
        'Note: this is irreversible and permanently removes the internal database.',
  ),
  LegalSectionText(
    heading: '2. Deletion of exported files',
    body:
        'PDFs, manual backups and reports exported via WhatsApp/Email are not linked to the app database after export. '
        'They must be removed manually from local folders or cloud services used by the user.',
  ),
  LegalSectionText(
    heading: '3. Deletion of technical data (Firebase/Cloud)',
    body:
        'The app uses minimal technical data (pseudonymous ID and timestamp) on Firebase/Firestore for trial management. '
        'No personal or financial data is collected in the cloud. '
        'Definitive deletion requests can be sent to sac.perfectgest@gmail.com '
        'with the subject "Data Deletion – [Device ID]". '
        'Processing time: up to 15 business days.',
  ),
  LegalSectionText(
    heading: '4. Subscriptions and Google Play',
    body:
        'Deleting app data or uninstalling does not cancel active subscriptions. '
        'Payments, cancellations and purchase history must be managed directly in Google Account > Payments and Subscriptions.',
  ),
];

// =====================================================================
// Espanhol
// =====================================================================

const List<LegalSectionText> _kPrivacyEs = <LegalSectionText>[
  LegalSectionText(
    heading: '1. Identificacion del responsable',
    body:
        'PerfectGest, bajo la responsabilidad de Marcos Leandro dos Santos, establece esta Politica de Privacidad '
        'conforme a la Ley General de Proteccion de Datos de Brasil (LGPD - Ley 13.709/18) y a las politicas para desarrolladores de Google Play Store. '
        'Para ejercer derechos de acceso, rectificacion o supresion, contacte: sac.perfectgest@gmail.com.',
  ),
  LegalSectionText(
    heading: '2. Almacenamiento local y naturaleza de los datos',
    body:
        'La app opera en modelo local-first. Los datos de gestion comercial (clientes, presupuestos, flujos de caja y proyectos) '
        'se almacenan exclusivamente en el dispositivo del usuario. No hay recoleccion, acceso ni transferencia de estos datos sensibles a servidores. '
        'La salida de datos ocurre solo por accion deliberada del usuario, como backups y exportacion de PDFs.',
  ),
  LegalSectionText(
    heading: '3. Servicios de terceros y recoleccion minima',
    body:
        'Para integridad tecnica y licenciamiento se pueden utilizar servicios Google/Firebase con recoleccion estrictamente necesaria: '
        'Google Analytics para Firebase (eventos de uso y errores criticos), Firebase Remote Config (parametros de seguridad), '
        'Cloud Firestore (metadatos tecnicos y control del periodo de evaluacion con identificador seudonimo) '
        'y Google Play Billing (procesamiento financiero por la infraestructura de Google).',
  ),
  LegalSectionText(
    heading: '4. Seguridad y transparencia',
    body:
        'Todos los datos en transito (telemetria y metadatos tecnicos) utilizan HTTPS/TLS. '
        'PerfectGest declara que no vende ni comparte datos tecnicos o de uso con fines publicitarios. '
        'Los identificadores de dispositivo se usan exclusivamente para validacion del periodo gratuito y seguridad del software.',
  ),
  LegalSectionText(
    heading: '5. Conservacion y eliminacion',
    body:
        'Los datos comerciales locales pueden ser eliminados por el usuario al borrar los datos de la app o desinstalarla. '
        'Los registros de telemetria/soporte pueden solicitarse para eliminacion por correo, con un plazo de atencion de hasta 15 dias habiles.',
  ),
  LegalSectionText(
    heading: '6. Permisos del sistema',
    body:
        'La app solicita almacenamiento solo para importar logotipos y guardar archivos generados por el usuario '
        '(PDFs, backups e informes exportados).',
  ),
  LegalSectionText(
    heading: '7. Elegibilidad, jurisdiccion y enlaces externos',
    body:
        'La app esta destinada a mayores de 18 anos. Esta politica se rige por las leyes de la Republica Federativa de Brasil, '
        'con foro en la comarca de Caxias do Sul/RS. Referencia externa actual: google.com.',
  ),
];

const List<LegalSectionText> _kDataDeletionEs = <LegalSectionText>[
  LegalSectionText(
    heading: '1. Eliminacion de datos de gestion (locales)',
    body:
        'Los datos de clientes, presupuestos y finanzas residen exclusivamente en el dispositivo. '
        'Para eliminar: abrir PerfectGest I > Configuracion > Datos en el dispositivo > Eliminar todos los datos. '
        'Atencion: proceso irreversible, con remocion permanente de la base interna.',
  ),
  LegalSectionText(
    heading: '2. Eliminacion de archivos exportados',
    body:
        'Los PDFs, backups manuales e informes exportados por WhatsApp/Email no permanecen vinculados a la base de la app despues de la exportacion. '
        'La eliminacion debe hacerse manualmente en las carpetas locales o servicios en la nube utilizados por el usuario.',
  ),
  LegalSectionText(
    heading: '3. Eliminacion de datos tecnicos (Firebase/Nube)',
    body:
        'La app utiliza datos tecnicos minimos (ID seudonimo y marca temporal) en Firebase/Firestore para gestion de trial. '
        'No se recopilan datos nominales ni financieros en la nube. '
        'Las solicitudes de eliminacion definitiva pueden enviarse a sac.perfectgest@gmail.com '
        'con el asunto "Eliminacion de Datos – [ID del Dispositivo]". '
        'Plazo de procesamiento: hasta 15 dias habiles.',
  ),
  LegalSectionText(
    heading: '4. Suscripciones y Google Play',
    body:
        'Eliminar datos de la app o desinstalarla no cancela suscripciones activas. '
        'Pagos, cancelaciones e historial de compras deben gestionarse directamente en Cuenta Google > Pagos y Suscripciones.',
  ),
];

// =====================================================================
// Implementacoes concretas
// =====================================================================

class _PlayStoreAppLegalTextsPt extends PlayStoreAppLegalTexts {
  const _PlayStoreAppLegalTextsPt() : super();

  @override
  String get privacyPolicyPerfectGestITitle => 'Política de Privacidade PerfectGest I';

  @override
  String get dataDeletionPolicyPerfectGestITitle => 'Política de exclusão de Dados PerfectGest I';

  @override
  String get lastUpdatedMay2026 => 'Última atualização: Maio de 2026';

  @override
  List<LegalSectionText> get privacyPolicySections => _kPrivacyPt;

  @override
  List<LegalSectionText> get dataDeletionPolicySections => _kDataDeletionPt;
}

class _PlayStoreAppLegalTextsEn extends PlayStoreAppLegalTexts {
  const _PlayStoreAppLegalTextsEn() : super();

  @override
  String get privacyPolicyPerfectGestITitle => 'PerfectGest I Privacy Policy';

  @override
  String get dataDeletionPolicyPerfectGestITitle => 'PerfectGest I Data deletion policy';

  @override
  String get lastUpdatedMay2026 => 'Last updated: May 2026';

  @override
  List<LegalSectionText> get privacyPolicySections => _kPrivacyEn;

  @override
  List<LegalSectionText> get dataDeletionPolicySections => _kDataDeletionEn;
}

class _PlayStoreAppLegalTextsEs extends PlayStoreAppLegalTexts {
  const _PlayStoreAppLegalTextsEs() : super();

  @override
  String get privacyPolicyPerfectGestITitle => 'Politica de privacidad PerfectGest I';

  @override
  String get dataDeletionPolicyPerfectGestITitle => 'Politica de eliminacion de datos PerfectGest I';

  @override
  String get lastUpdatedMay2026 => 'Ultima actualizacion: mayo de 2026';

  @override
  List<LegalSectionText> get privacyPolicySections => _kPrivacyEs;

  @override
  List<LegalSectionText> get dataDeletionPolicySections => _kDataDeletionEs;
}
