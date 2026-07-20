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
  LegalSectionText(heading: 'Introdução', body: '''Última atualização: Julho de 2026
A PerfectGest I, sob responsabilidade de Marcos Leandro dos Santos, estabelece esta Política de Privacidade em conformidade com a Lei Geral de Proteção de Dados (LGPD - Lei 13.709/18) e as políticas para desenvolvedores da Google Play Store.'''),
  LegalSectionText(heading: 'Controlador de Dados e Contato', body: 'O responsável pelo tratamento de dados é Marcos Leandro dos Santos. Para o exercício de direitos de acesso, retificação ou exclusão, entre em contato via e-mail: suporte@perfectgestdev.com.'),
  LegalSectionText(heading: 'Armazenamento local e natureza dos dados', body: '''O aplicativo opera em modelo local-first. Os dados de gestão comercial são armazenados exclusivamente no dispositivo do usuário via SQLite. A PerfectGest I não coleta, não acede e não transfere automaticamente esses dados para servidores próprios.

Dados de gestão — protegidos no aparelho

Permanecem no dispositivo e não saem da app por iniciativa do sistema:

- Cadastro e histórico de clientes
- Orçamentos comerciais, itens, valores e estados
- Orçamentos fiscais (aba Orç/NF-e/NFS-e) e códigos fiscais de consulta/cadastro (ex.: NCM, CFOP, LC 116) — documentos de apoio locais; a app não emite NF-e/NFS-e electrónica junto à SEFAZ/prefeitura
- Caixa — entradas, saídas, categorias e saldos
- Ordens de serviço / produção e projetos
- Contratos e documentos auxiliares de gestão
- Qualquer valor, nome de cliente ou movimento financeiro registado na app

Não enviamos estes dados para Firebase, Firestore, Analytics nem outros servidores por iniciativa da app. O Firebase Analytics regista apenas eventos genéricos de uso (ex.: navegação entre ecrãs), sem nomes de clientes, valores de caixa ou conteúdo de orçamentos.

Quando os dados podem sair do aparelho (sempre por acção do utilizador)

A saída ocorre somente se o utilizador decidir explicitamente:

- Partilhar ou guardar PDF (orçamento comercial ou fiscal, caixa, relatório, etc.) — o documento gerado naquele momento
- Partilhar cartão de visita (PNG) — apenas dados profissionais da empresa (nome, contactos, redes, logótipo); nunca a lista de clientes nem dados financeiros
- Partilhar ficheiro de contactos (vCard) ou mostrar QR com dados profissionais (funções avançadas do cartão — ver abaixo)
- Criar e partilhar backup — ficheiro de backup (simples ou encriptado) que o utilizador escolhe enviar por WhatsApp, e-mail, Drive, etc.

Importante: partilhar um backup é responsabilidade do utilizador quanto ao destino e à segurança do ficheiro. Recomendamos backups encriptados (Plano Pro) e destinatários de confiança.

Dados da empresa no cartão de visita

Os contactos da aba Empresa (telefone, e-mail, WhatsApp, etc.) servem também o cartão de visita, mas não misturam nem expõem automaticamente os módulos Clientes, Orçamentos, Orç/NF-e/NFS-e ou Caixa.'''),
  LegalSectionText(heading: 'Cartão de visita — armazenamento local e modo estático', body: '''O cartão de visita digital (aba Empresa) utiliza os dados da empresa guardados no dispositivo. Ao concluir a criação do primeiro cartão, o aplicativo pode guardar uma cópia congelada (snapshot) local — imagem PNG e dados do layout — para exibição em modo estático quando não houver assinatura Plano Pro activa.

- No dispositivo: snapshot, logótipo e ficheiros temporários de partilha permanecem no aparelho até limpar dados ou desinstalar.
- Partilha PNG: mesmo em modo estático, pode partilhar a imagem do snapshot (ex.: WhatsApp, e-mail) por acção explícita; não enviamos essa imagem automaticamente a servidores PerfectGest.
- Edição e funcionalidades avançadas (vCard, QR, preview interactivo com toques em contactos, extras como Pix/agendamento no cartão): requerem Plano Pro após o primeiro cartão válido — sempre dentro da app; não há página web do cartão alojada pela PerfectGest.'''),
  LegalSectionText(heading: 'Cartão de visita interactivo na app (Plano Pro)', body: '''Com Plano Pro, após o primeiro cartão, pode continuar a editar e usar funções avançadas no telemóvel:

- Preview interactivo (toques abrem WhatsApp, telefone, e-mail, site ou mapa, conforme configurado)
- Exportar vCard (.vcf) e gerar QR com dados de contacto
- Partilhar PNG actualizado

Tudo permanece no dispositivo até partilhar ou mostrar o QR por acção explícita. Não publicamos nem alojamos o cartão num site PerfectGest; não enviamos o conteúdo do cartão para Firestore nem outros servidores por iniciativa da app.

O que nunca entra no cartão: cadastro de clientes, orçamentos (comerciais ou fiscais), lançamentos de caixa, valores financeiros, contratos ou backups.'''),
  LegalSectionText(heading: 'Modelo de acesso — exploração e Plano Pro', body: '''- Após o download: pode explorar a app (navegar ecrãs e consultar a interface) sem assinatura.
- Operações (criar clientes, orçamentos comerciais ou fiscais, lançamentos de caixa; gerar PDFs de gestão; restauro de backup encriptado; e demais acções condicionadas) exigem Plano Pro. Ao tentar uma operação sem Pro, a app apresenta um aviso com o plano (referência R\$ 9,90/mês; o valor cobrado é o da Google Play) e as opções Assinar ou Continuar a explorar recursos do Aplicativo.
- Plano Pro: uso ilimitado das funções activas, restauro de backup encriptado e cartão de visita interactivo na app (edição após o primeiro cartão, vCard, QR, preview com toques), via assinatura mensal ou anual na Google Play.
- Logótipo da empresa: escolhido na aba Empresa, guardado apenas no dispositivo e usado nos cabeçalhos dos PDFs — não é enviado a servidores PerfectGest.

Metadados anónimos por aparelho (Firebase) podem registar instalação / elegibilidade de assinatura (anti-abuso) e consumo do 1.º cartão — sem dados de clientes, orçamentos ou caixa.'''),
  LegalSectionText(heading: 'Coleta de dados e serviços de terceiros', body: '''- Google Analytics (Firebase): eventos genéricos de uso; sem Crashlytics; sem nomes ou valores financeiros.
- Firebase Remote Config: versões mínimas e flags de segurança.
- Cloud Firestore: metadados anónimos por aparelho — identificador de instalação, elegibilidade de assinatura / anti-abuso e consumo do 1.º cartão (sem dados de clientes, orçamentos ou caixa).
- Google Play Billing: subscrições.'''),
  LegalSectionText(heading: 'Notificações locais', body: 'Lembretes fiscais processados no dispositivo; sem envio a servidores externos. Permissão POST_NOTIFICATIONS no Android 13+.'),
  LegalSectionText(heading: 'Declarações de segurança', body: '''- HTTPS/TLS em telemetria e metadados técnicos.
- Sem venda de dados para publicidade. Sem anúncios dentro da app.
- Separação cartão vs. gestão: cartão = só informação profissional configurada; clientes e financeiro locais, excepto PDFs ou backups partilhados pelo utilizador.'''),
  LegalSectionText(heading: 'Retenção e exclusão', body: '''- Dados comerciais locais e snapshot do cartão: eliminados ao limpar dados da app ou desinstalar.
- Telemetria (Firebase): pedido por e-mail, até 15 dias úteis.'''),
  LegalSectionText(heading: 'Permissões de sistema', body: 'Importar logótipos; guardar PDFs e backups; notificações locais (Android 13+).'),
  LegalSectionText(heading: 'Elegibilidade e foro', body: 'Utilizadores maiores de 18 anos. Leis do Brasil; foro de Caxias do Sul/RS.'),
];

const List<LegalSectionText> _kTermsPt = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: 'Última atualização: Julho de 2026'),
  LegalSectionText(heading: '1. Objeto', body: '''Estes Termos regem a app PerfectGest I, para gestão empresarial no telemóvel: clientes, orçamentos comerciais, orçamentos fiscais (aba Orç/NF-e/NFS-e — documentos locais de apoio; sem emissão electrónica de NF-e/NFS-e), caixa, ordem de serviço, lembretes fiscais e cartão de visita digital, com dados principalmente no dispositivo.

Dados de clientes e financeiros permanecem no aparelho e não são transmitidos automaticamente. Podem sair somente por acção do utilizador (partilha de PDF, backup exportado, cartão de visita PNG/vCard/QR). Ver Política de Privacidade.

Editor: Marcos Leandro dos Santos.'''),
  LegalSectionText(heading: '2. Elegibilidade', body: 'Utilizadores maiores de 18 anos.'),
  LegalSectionText(heading: '3. Exploração, Plano Pro e assinaturas', body: '''- Após o download: pode explorar a app (navegar e consultar a interface) sem assinatura.
- Operações (criar registos, gerar PDFs de gestão, restauro de backup encriptado e demais acções condicionadas) exigem Plano Pro. Sem assinatura, a app mostra um aviso com o plano (referência R\$ 9,90/mês; preço oficial na Google Play) e as opções Assinar ou Continuar a explorar recursos do Aplicativo.
- Plano Pro: uso ilimitado das funções activas, restauro de backup encriptado e cartão de visita interactivo na app — assinatura mensal ou anual via Google Play (preço e condições na loja).
- Renovação automática até cancelar na Play Store: Pagamentos e subscrições → Subscrições.'''),
  LegalSectionText(heading: '4. Cancelamento', body: 'Google Play Store → Pagamentos e subscrições → Subscrições.'),
  LegalSectionText(heading: '5. Direito de arrependimento (Brasil — CDC)', body: 'Direito legal de arrependimento de 7 dias corridos quando aplicável ao consumidor brasileiro, sem prejuízo das regras Google Play. Reembolsos via canais Google.'),
  LegalSectionText(heading: '6. Lembretes fiscais e orçamentos fiscais', body: 'Lembretes e documentos fiscais na app são meramente informativos / de apoio; não substituem contabilista nem constituem emissão oficial de notas fiscais. Responsabilidade do utilizador.'),
  LegalSectionText(heading: '7. Limitação de responsabilidade', body: 'Ferramenta de apoio; não substitui assessoria profissional. Decisões de negócio são do utilizador.'),
  LegalSectionText(heading: '8. Propriedade intelectual', body: 'Licença revogável, não exclusiva. Proibida engenharia inversa ilícita.'),
  LegalSectionText(heading: '9. Alterações', body: 'Versão vigente publicada no URL abaixo.'),
  LegalSectionText(heading: '10. Lei e foro', body: 'Leis do Brasil; foro Caxias do Sul/RS, sem prejuízo do consumidor.'),
  LegalSectionText(heading: '11. Contacto', body: 'suporte@perfectgestdev.com'),
];

const List<LegalSectionText> _kDeletionPt = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: '''Última atualização: Julho de 2026
O PerfectGest I oferece controlo claro dos dados, em conformidade com a Google Play e a LGPD. A app é local-first.'''),
  LegalSectionText(heading: 'Resumo', body: 'Dados de clientes e financeiros não são enviados automaticamente para servidores PerfectGest. Só podem sair do telemóvel se partilhar PDFs, partilhar ficheiros de backup que exportou, partilhar PNG/vCard do cartão de visita ou mostrar um QR com contactos profissionais.'),
  LegalSectionText(heading: '1. Dados de gestão (local)', body: '''Armazenados em SQLite no dispositivo: clientes, orçamentos comerciais, orçamentos fiscais e códigos fiscais, caixa, ordens de serviço, dados da empresa (incluindo logótipo), cópia do cartão de visita, lembretes fiscais.

Como eliminar

- Na app: Configurações → Dados no dispositivo → Eliminar todos os dados neste aparelho
- Android: Definições → Apps → PerfectGest I → Armazenamento → Limpar dados
- Desinstalar a app

Aviso: sem cópia externa, não há recuperação — não guardamos cópias nos nossos servidores.

Backups partilhados: elimine manualmente no WhatsApp, e-mail ou nuvem onde os guardou.'''),
  LegalSectionText(heading: '2. Firebase / telemetria', body: '''Metadados anónimos de instalação e métricas de uso (elegibilidade de assinatura / anti-abuso; consumo do 1.º cartão). Não alojamos conteúdo do cartão de visita nem o logótipo em servidores.

E-mail: suporte@perfectgestdev.com — Assunto: Solicitação de Exclusão de Dados Técnicos'''),
  LegalSectionText(heading: '3. Notificações locais', body: 'Canceladas ao desinstalar ou ao apagar os dados na app.'),
  LegalSectionText(heading: '4. Prazos', body: 'Dados locais: imediato. Telemetria Firebase: até 15 dias úteis após pedido por e-mail.'),
];

const List<LegalSectionText> _kFaqPt = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: 'Última atualização: Julho de 2026'),
  LegalSectionText(heading: 'O que é o PerfectGest I?', body: 'Aplicação de gestão no telemóvel, com dados guardados localmente (SQLite). Não há «conta na nuvem» PerfectGest para clientes, orçamentos ou caixa.'),
  LegalSectionText(heading: 'A app funciona sem internet?', body: 'Sim, o uso diário é offline-first. Serviços Google opcionais (Analytics, Remote Config, Firestore mínimo para elegibilidade de assinatura) podem usar rede quando activos.'),
  LegalSectionText(heading: 'Posso usar a app sem assinatura?', body: 'Sim, para explorar (navegar ecrãs e consultar a interface). Para operações (criar clientes, orçamentos comerciais ou fiscais, caixa; gerar PDFs de gestão; restauro de backup encriptado; e demais acções condicionadas) é necessário o Plano Pro. Ao tentar uma operação sem assinatura, surge um aviso com o plano (referência R\$ 9,90/mês; preço na Google Play) e os botões Assinar ou Continuar a explorar recursos do Aplicativo.'),
  LegalSectionText(heading: 'Como funciona o Plano Pro?', body: 'Assinatura mensal ou anual na Google Play: clientes, orçamentos, caixa e PDFs sem limite prático; restauro de backup encriptado; cartão de visita interactivo (vCard, QR, preview). Gerir em Configurações → Assinatura Google Play.'),
  LegalSectionText(heading: 'Onde compro ou gerencio a subscrição?', body: 'Configurações → Assinatura Google Play. Pagamentos pelo Google. Cancelamento: Play Store → Pagamentos e subscrições → Subscrições.'),
  LegalSectionText(heading: 'O que é a aba Orç/NF-e/NFS-e?', body: 'Orçamento fiscal local (produtos e serviços, códigos NCM/CFOP/LC 116, PDF de apoio) e consulta/cadastro de códigos. Não emite NF-e nem NFS-e electrónica junto à SEFAZ/prefeitura.'),
  LegalSectionText(heading: 'O que é o cartão de visita digital?', body: '''Na aba Empresa edita os dados profissionais da empresa (não inclui clientes nem caixa). Pode escolher o logótipo (guardado no aparelho) para aparecer nos PDFs. O cartão mostra logótipo, nome, slogan, CNPJ, nome do profissional e contactos com rótulos no rodapé (até 2 por linha). Temas: branco, cinza ou preto.

Partilhar cartão de visita gera PNG e abre a folha de partilha (WhatsApp, e-mail, etc.). Após o primeiro cartão, sem Plano Pro o cartão fica em modo estático (pode partilhar o PNG do snapshot); com Pro, edita e usa funções avançadas só na app (vCard, QR, preview interactivo) — sem página web alojada pela PerfectGest.

Clientes e dados financeiros ficam protegidos: só no telemóvel; não entram no cartão nem são enviados automaticamente para servidores.'''),
  LegalSectionText(heading: 'Os meus dados de clientes e financeiros estão protegidos?', body: '''Sim. Clientes, orçamentos (comerciais e fiscais), caixa e valores ficam na base local. A app não envia esses dados para servidores.

Só saem do telemóvel se você decidir:

- Partilhar um PDF
- Partilhar o cartão de visita (PNG, vCard ou QR — contactos profissionais)
- Partilhar um backup exportado em Configurações (recomendamos backup encriptado no Plano Pro)'''),
  LegalSectionText(heading: 'O que são os lembretes fiscais?', body: 'Obrigações pré-configuradas (MEI, Autônomo, ME) com alarmes no dispositivo. Meramente informativos — não substituem contabilista.'),
  LegalSectionText(heading: 'O que é o calendário semanal?', body: 'Na aba Empresa, calendário da semana com indicadores de vencimentos fiscais.'),
  LegalSectionText(heading: 'O que são os «Últimos lançamentos»?', body: 'Atalhos na página inicial para o último cliente, orçamento, ordem de serviço e lançamento de caixa.'),
  LegalSectionText(heading: 'A app envia notificações?', body: 'Apenas notificações locais para lembretes fiscais. Sem envio a servidores externos.'),
  LegalSectionText(heading: 'Onde está a política de privacidade?', body: 'Configurações → Ajuda e suporte — links para Política, Exclusão de dados e Termos. E-mail: suporte@perfectgestdev.com.'),
  LegalSectionText(heading: 'Como apago todos os dados neste aparelho?', body: 'Configurações → Dados no dispositivo → Eliminar todos os dados neste aparelho. Não apaga PDFs ou backups já exportados. Para dados técnicos Google: página de exclusão de dados.'),
  LegalSectionText(heading: 'A app tem anúncios?', body: 'Não.'),
  LegalSectionText(heading: 'Há Firebase Crashlytics?', body: 'Não. Analytics regista eventos genéricos; não envia crash reports automáticos.'),
  LegalSectionText(heading: 'Em que idiomas está a app?', body: 'Português (Brasil), inglês (EUA), espanhol (Espanha).'),
  LegalSectionText(heading: 'Como posso dar sugestões?', body: 'Aba Empresa → Dê sua contribuição → e-mail suporte@perfectgestdev.com.'),
];

const List<LegalSectionText> _kPrivacyEn = <LegalSectionText>[
  LegalSectionText(heading: 'Introduction', body: '''Last updated: July 2026
PerfectGest I, operated by Marcos Leandro dos Santos, provides this Privacy Policy in compliance with Brazil’s LGPD (Law 13.709/18) and Google Play developer policies.'''),
  LegalSectionText(heading: 'Data controller and contact', body: 'Controller: Marcos Leandro dos Santos. Contact: suporte@perfectgestdev.com.'),
  LegalSectionText(heading: 'Local storage', body: '''The app is local-first. Business data is stored only on your device (SQLite). PerfectGest I does not automatically collect, access, or transfer that data to its own servers.

Management data — protected on the device

These stay on the device and do not leave the app unless you choose to:

- Client records and history
- Commercial estimates, line items, amounts, and status
- Fiscal quotes (Quote/NF-e/NFS-e tab) and fiscal codes for lookup/registration (e.g. NCM, CFOP, LC 116) — local support documents only; the app does not issue electronic NF-e/NFS-e to tax authorities
- Cash flow — income, expenses, categories, balances
- Work orders, projects, contracts, and management documents
- Any client name, amount, or financial movement in the app

We do not send this data to Firebase, Firestore, Analytics, or other servers. Firebase Analytics logs generic usage events only — not client names, cash amounts, or estimate content.

When data may leave the device (your explicit action only)

- Share or save a PDF (commercial or fiscal quote, cash report, etc.)
- Share business card PNG — professional company contacts only; never your client list or financial data
- Share vCard or show QR with professional contacts (advanced card features — see below)
- Share a backup file you exported (plain or encrypted) via WhatsApp, email, Drive, etc.

Important: sharing a backup is your responsibility regarding destination and security. We recommend encrypted backups (Pro Plan).

Business card vs. management data

The Company tab feeds the digital business card with your business contact info only. It does not expose Clients, Estimates, Quote/NF-e/NFS-e, or Cash modules.'''),
  LegalSectionText(heading: 'Business card — local storage and static mode', body: 'After your first card is saved, a local snapshot (PNG + layout) may be shown in static mode without Pro. You may still share that snapshot PNG via the system share sheet. Advanced features (edit after freeze, vCard, QR, interactive preview with tappable contacts, extras such as Pix/scheduling on the card) require Pro Plan after the first valid card — inside the app only; PerfectGest does not host a public web page for your card.'),
  LegalSectionText(heading: 'Interactive business card in the app (Pro Plan)', body: '''With Pro Plan, after your first card you can keep editing and use advanced features on your phone:

- Interactive preview (taps open WhatsApp, phone, email, website, or maps as configured)
- Export vCard (.vcf) and generate QR with contact data
- Share an updated PNG

Everything stays on the device until you share or show the QR. We do not publish or host your card on a PerfectGest website or upload card content to Firestore.

Never included in the card: clients, estimates (commercial or fiscal), cash entries, financial amounts, contracts, or backups.'''),
  LegalSectionText(heading: 'Access model — explore and Pro Plan', body: '''- After download: you may explore the app (browse screens and the interface) without a subscription.
- Operations (creating clients, commercial or fiscal estimates, cash entries; generating management PDFs; encrypted backup restore; and other gated actions) require Pro Plan. If you try an operation without Pro, the app shows a notice with the plan (reference price R\$ 9.90/month; the amount charged is the one on Google Play) and the options Subscribe or Continue exploring app features.
- Pro Plan: unlimited use of active features, encrypted backup restore, and interactive business card in the app (edit after first card, vCard, QR, tappable preview), monthly or annual via Google Play.
- Company logo: chosen in the Company tab, stored only on the device, and used in PDF headers — not uploaded to PerfectGest servers.

Anonymous per-device metadata (Firebase) may record installation / subscription eligibility (anti-abuse) and first-card use — not client, estimate, or cash data.'''),
  LegalSectionText(heading: 'Third-party services', body: 'Firebase Analytics (generic events, no Crashlytics), Remote Config, Firestore (minimal anonymous device metadata — installation identifier, subscription eligibility / anti-abuse, and first business-card save — not clients, estimates, or cash data), Google Play Billing. No in-app ads.'),
  LegalSectionText(heading: 'Local notifications', body: 'Fiscal reminders on-device only; no external server transfer. POST_NOTIFICATIONS on Android 13+.'),
  LegalSectionText(heading: 'Security', body: 'HTTPS/TLS for telemetry; no sale of data for ads; business card contains only professional info you configure.'),
  LegalSectionText(heading: 'Retention and deletion', body: 'Local business data and card snapshot: removed when you clear app data or uninstall. Telemetry (Firebase): email request, up to 15 business days.'),
  LegalSectionText(heading: 'Permissions', body: 'Import logos; save PDFs and backups; local notifications.'),
  LegalSectionText(heading: 'Eligibility and law', body: 'Users 18+. Laws of Brazil; venue Caxias do Sul/RS.'),
];

const List<LegalSectionText> _kTermsEn = <LegalSectionText>[
  LegalSectionText(heading: 'Introduction', body: 'Last updated: July 2026'),
  LegalSectionText(heading: '1. Purpose', body: '''These Terms govern PerfectGest I (customers, commercial budgets, fiscal quotes on the Quote/NF-e/NFS-e tab — local support documents only; no electronic NF-e/NFS-e issuance, cash, work orders, fiscal reminders, digital business card), with data primarily on your device.

Client and financial data stay on the device and are not transmitted automatically. They may leave only through your actions (share PDF, exported backup, business card PNG/vCard/QR). See Privacy Policy.

Publisher: Marcos Leandro dos Santos.'''),
  LegalSectionText(heading: '2. Eligibility', body: 'Users aged 18 or over.'),
  LegalSectionText(heading: '3. Explore mode, Pro Plan, and subscriptions', body: '''- After download: you may explore the app (browse and view the interface) without a subscription.
- Operations (creating records, generating management PDFs, encrypted backup restore, and other gated actions) require Pro Plan. Without a subscription, the app shows a notice with the plan (reference R\$ 9.90/month; official price on Google Play) and the options Subscribe or Continue exploring app features.
- Pro Plan: unlimited use of active features, encrypted backup restore, and interactive business card in the app — monthly or annual subscription via Google Play (price and terms in the store).
- Auto-renewal until cancelled in the Play Store: Payments & subscriptions → Subscriptions.'''),
  LegalSectionText(heading: '4. Cancellation', body: 'Google Play Store → Payments & subscriptions.'),
  LegalSectionText(heading: '5. Statutory rights (Brazil)', body: 'Brazil’s Consumer Code may grant a 7-day withdrawal right where applicable. Refunds via Google Play rules and channels.'),
  LegalSectionText(heading: '6. Fiscal reminders and fiscal quotes', body: 'Informational / support only; not tax advice and not official electronic invoice issuance. User responsibility.'),
  LegalSectionText(heading: '7. Limitation of liability', body: 'Management tool; user responsible for business decisions.'),
  LegalSectionText(heading: '8. Intellectual property', body: 'Revocable license; no unlawful reverse engineering.'),
  LegalSectionText(heading: '9. Changes', body: 'Current version at URL below.'),
  LegalSectionText(heading: '10. Governing law', body: 'Brazil; venue Caxias do Sul/RS.'),
  LegalSectionText(heading: '11. Contact', body: 'suporte@perfectgestdev.com'),
];

const List<LegalSectionText> _kDeletionEn = <LegalSectionText>[
  LegalSectionText(heading: 'Introduction', body: '''Last updated: July 2026
PerfectGest I provides clear data control under Google Play and Brazil’s LGPD. The app is local-first.'''),
  LegalSectionText(heading: 'Summary', body: 'Client and financial data are not sent automatically to PerfectGest servers. They leave the phone only if you share PDFs, exported backup files, business card PNG/vCard, or show a QR with professional contacts.'),
  LegalSectionText(heading: '1. Local management data', body: '''Stored in SQLite on the device: clients, commercial estimates, fiscal quotes and fiscal codes, cash, work orders, company data (including logo), business-card snapshot, fiscal reminders.

How to delete

- In the app: Settings → Data on this device → Delete all data on this device
- Android: Settings → Apps → PerfectGest I → Storage → Clear data
- Uninstall the app

Warning: without an external copy, there is no recovery — we do not keep copies on our servers.

Shared backups: delete them manually where you saved them (WhatsApp, email, cloud).'''),
  LegalSectionText(heading: '2. Firebase / telemetry', body: '''Anonymous installation metadata and usage metrics (subscription eligibility / anti-abuse; first business-card save). We do not host card content or logos on servers.

Email: suporte@perfectgestdev.com — Subject: Technical Data Deletion Request'''),
  LegalSectionText(heading: '3. Local notifications', body: 'Cancelled when you uninstall or wipe app data.'),
  LegalSectionText(heading: '4. Timelines', body: 'Local data: immediate. Firebase telemetry: up to 15 business days after an email request.'),
];

const List<LegalSectionText> _kFaqEn = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: 'Last updated: July 2026'),
  LegalSectionText(heading: 'What is PerfectGest I?', body: 'A mobile business management app. Data is stored locally (SQLite). No PerfectGest cloud account for clients, estimates, or cash.'),
  LegalSectionText(heading: 'Does it work offline?', body: 'Offline-first for daily use. Optional Google services (Analytics, Remote Config, minimal Firestore for subscription eligibility) may need a network when active.'),
  LegalSectionText(heading: 'Can I use the app without a subscription?', body: 'Yes, to explore (browse screens and the interface). Operations (creating clients, commercial or fiscal estimates, cash entries; generating management PDFs; encrypted backup restore; and other gated actions) require Pro Plan. Trying an operation without a subscription shows a notice with the plan (reference R\$ 9.90/month; price on Google Play) and Subscribe or Continue exploring app features.'),
  LegalSectionText(heading: 'How does the Pro Plan work?', body: 'Monthly or annual subscription on Google Play: clients, estimates, cash and PDFs without practical limits; encrypted backup restore; interactive business card (vCard, QR, preview). Manage in Settings → Google Play subscription.'),
  LegalSectionText(heading: 'Where do I manage the subscription?', body: 'Settings → Google Play subscription. Cancel via Play Store → Payments & subscriptions.'),
  LegalSectionText(heading: 'What is the Quote/NF-e/NFS-e tab?', body: 'A local fiscal quote (products and services, NCM/CFOP/LC 116 codes, support PDF) plus code lookup/registration. It does not issue electronic NF-e/NFS-e to tax authorities.'),
  LegalSectionText(heading: 'What is the digital business card?', body: '''In Company, edit professional business details only (not clients or cash). Share card generates a PNG via the system share sheet. After your first card, without Pro Plan the card is static (you can still share the snapshot PNG); with Pro, edit and use advanced features in the app only (vCard, QR, interactive preview) — no PerfectGest-hosted web page.

Clients and financial data stay protected on the device and are not sent to servers automatically.'''),
  LegalSectionText(heading: 'Are my client and financial data protected?', body: 'Yes. Stored locally (including fiscal quotes). They leave the device only if you share a PDF, card PNG/vCard/QR, or an exported backup file (encrypted backup recommended on Pro).'),
  LegalSectionText(heading: 'Fiscal reminders, weekly calendar, Latest entries, notifications, ads, Crashlytics, languages?', body: 'On-device fiscal reminders (informational only); weekly calendar in Company; home shortcuts to recent records; local notifications only; no ads; no Crashlytics; PT / EN / ES.'),
  LegalSectionText(heading: 'Privacy, deletion, suggestions?', body: 'Settings → Help and support for legal links. Wipe device: Settings → Data on this device → Delete all data. Feedback: Company tab → email suporte@perfectgestdev.com.'),
];

const List<LegalSectionText> _kPrivacyEs = <LegalSectionText>[
  LegalSectionText(heading: 'Introducción', body: '''Última actualización: Julio de 2026
PerfectGest I, bajo responsabilidad de Marcos Leandro dos Santos, establece esta Política de Privacidad conforme a la LGPD de Brasil (Ley 13.709/18) y las políticas de Google Play.'''),
  LegalSectionText(heading: 'Responsable y contacto', body: 'Responsable: Marcos Leandro dos Santos. Contacto: suporte@perfectgestdev.com.'),
  LegalSectionText(heading: 'Almacenamiento local', body: '''La app es local-first. Los datos de gestión se guardan solo en el dispositivo (SQLite). PerfectGest I no recoge, accede ni transfiere automáticamente esos datos a servidores propios.

Datos de gestión — protegidos en el dispositivo

Permanecen en el dispositivo y no salen de la app por iniciativa del sistema:

- Registro e historial de clientes
- Presupuestos comerciales, ítems, importes y estados
- Presupuestos fiscales (pestaña Presup./NF-e/NFS-e) y códigos fiscales de consulta/registro (p. ej. NCM, CFOP, LC 116) — documentos de apoyo locales; la app no emite NF-e/NFS-e electrónica ante la autoridad fiscal
- Caja — ingresos, gastos, categorías y saldos
- Órdenes de servicio, proyectos, contratos y documentos de gestión
- Cualquier nombre de cliente, importe o movimiento financiero

No enviamos estos datos a Firebase, Firestore, Analytics u otros servidores. Firebase Analytics registra solo eventos genéricos de uso, sin nombres de clientes ni importes de caja.

Cuándo pueden salir del dispositivo (solo por su acción)

- Compartir o guardar PDF (presupuesto comercial o fiscal, informe de caja, etc.)
- Compartir tarjeta de visita (PNG) — solo datos profesionales; nunca lista de clientes ni datos financieros
- Compartir vCard o mostrar QR con contactos profesionales (funciones avanzadas de la tarjeta — ver abajo)
- Compartir archivo de backup que exportó (simple o cifrado)

Importante: compartir un backup es responsabilidad del usuario sobre destino y seguridad. Recomendamos copias cifradas (Plan Pro).

Tarjeta de visita vs. gestión interna

La pestaña Empresa alimenta la tarjeta con contactos profesionales; no expone Clientes, Presupuestos, Presup./NF-e/NFS-e ni Caja.'''),
  LegalSectionText(heading: 'Tarjeta de visita — modo estático', body: 'Tras guardar la primera tarjeta, puede mostrarse una copia congelada local sin Pro. Puede seguir compartiendo el PNG por la hoja de compartir del sistema. Funciones avanzadas (editar tras congelar, vCard, QR, vista previa interactiva con toques, extras como Pix/agendamiento en la tarjeta) requieren Plan Pro tras la primera tarjeta válida — solo en la app; PerfectGest no aloja una página web pública de su tarjeta.'),
  LegalSectionText(heading: 'Tarjeta interactiva en la app (Plan Pro)', body: '''Con Plan Pro, tras la primera tarjeta puede seguir editando y usar funciones avanzadas en el teléfono:

- Vista previa interactiva (toques abren WhatsApp, teléfono, correo, web o mapa)
- Exportar vCard (.vcf) y generar QR con datos de contacto
- Compartir PNG actualizado

Todo permanece en el dispositivo hasta que comparta o muestre el QR. No publicamos ni alojamos la tarjeta en un sitio PerfectGest ni enviamos su contenido a Firestore.

Nunca incluidos en la tarjeta: clientes, presupuestos (comerciales o fiscales), caja, importes financieros, contratos ni backups.'''),
  LegalSectionText(heading: 'Modelo de acceso — exploración y Plan Pro', body: '''- Tras la descarga: puede explorar la app (navegar pantallas e interfaz) sin suscripción.
- Operaciones (crear clientes, presupuestos comerciales o fiscales, movimientos de caja; generar PDF de gestión; restaurar backup cifrado; y demás acciones condicionadas) requieren Plan Pro. Al intentar una operación sin Pro, la app muestra un aviso con el plan (precio de referencia R\$ 9,90/mes; el importe cobrado es el de Google Play) y las opciones Suscribirse o Continuar explorando los recursos de la aplicación.
- Plan Pro: uso ilimitado de las funciones activas, restauración de backup cifrado y tarjeta interactiva en la app (editar tras la primera tarjeta, vCard, QR, vista previa con toques), mensual o anual vía Google Play.
- Logotipo de la empresa: se elige en la pestaña Empresa, se guarda solo en el dispositivo y se usa en los encabezados de PDF — no se envía a servidores PerfectGest.

Metadatos anónimos por dispositivo (Firebase) pueden registrar instalación / elegibilidad de suscripción (antiabuso) y el primer uso de tarjeta — sin datos de clientes, presupuestos ni caja.'''),
  LegalSectionText(heading: 'Servicios de terceros', body: 'Firebase Analytics (eventos genéricos, sin Crashlytics), Remote Config, Firestore (metadatos anónimos mínimos por dispositivo: identificador de instalación, elegibilidad de suscripción / antiabuso y primer guardado de tarjeta — sin clientes, presupuestos ni caja), Google Play Billing. Sin publicidad en la app.'),
  LegalSectionText(heading: 'Notificaciones locales', body: 'Recordatorios fiscales solo en el dispositivo. Permiso POST_NOTIFICATIONS en Android 13+.'),
  LegalSectionText(heading: 'Seguridad y retención', body: 'HTTPS/TLS; no venta de datos para anuncios. Datos locales y snapshot de tarjeta: se eliminan al borrar datos o desinstalar. Telemetría (Firebase): solicitud por correo, hasta 15 días hábiles.'),
  LegalSectionText(heading: 'Permisos, elegibilidad y foro', body: 'Logotipos, PDFs, backups, notificaciones. Usuarios mayores de 18 años. Leyes de Brasil; fuero Caxias do Sul/RS.'),
];

const List<LegalSectionText> _kTermsEs = <LegalSectionText>[
  LegalSectionText(heading: 'Introducción', body: 'Última actualización: Julio de 2026'),
  LegalSectionText(heading: '1. Objeto', body: '''Estos Términos rigen la app PerfectGest I (clientes, presupuestos comerciales, presupuestos fiscales en la pestaña Presup./NF-e/NFS-e — documentos locales de apoyo; sin emisión electrónica de NF-e/NFS-e, caja, órdenes de servicio, recordatorios fiscales y tarjeta de visita digital), con datos principalmente en el dispositivo.

Datos de clientes y financieros permanecen en el dispositivo y no se transmiten automáticamente. Solo pueden salir por acción explícita (compartir PDF, backup exportado, PNG/vCard/QR de la tarjeta). Véase Política de Privacidad.

Editor: Marcos Leandro dos Santos.'''),
  LegalSectionText(heading: '2. Elegibilidad', body: 'Usuarios mayores de 18 años.'),
  LegalSectionText(heading: '3. Exploración, Plan Pro y suscripciones', body: '''- Tras la descarga: puede explorar la app (navegar y consultar la interfaz) sin suscripción.
- Operaciones (crear registros, generar PDF de gestión, restaurar backup cifrado y demás acciones condicionadas) requieren Plan Pro. Sin suscripción, la app muestra un aviso con el plan (referencia R\$ 9,90/mes; precio oficial en Google Play) y las opciones Suscribirse o Continuar explorando los recursos de la aplicación.
- Plan Pro: uso ilimitado de las funciones activas, restauración de backup cifrado y tarjeta de visita interactiva en la app — suscripción mensual o anual vía Google Play (precio y condiciones en la tienda).
- Renovación automática hasta cancelar en Play Store: Pagos y suscripciones → Suscripciones.'''),
  LegalSectionText(heading: '4. Cancelación', body: 'Google Play Store → Pagos y suscripciones → Suscripciones.'),
  LegalSectionText(heading: '5. Derecho de desistimiento (Brasil — CDC)', body: 'Puede aplicar el derecho legal de desistimiento de 7 días corridos al consumidor brasileño, sin perjuicio de las reglas de Google Play. Reembolsos por canales de Google.'),
  LegalSectionText(heading: '6. Recordatorios fiscales y presupuestos fiscales', body: 'Informativos / de apoyo; no sustituyen asesoría contable ni constituyen emisión oficial de facturas. Responsabilidad del usuario.'),
  LegalSectionText(heading: '7. Limitación de responsabilidad', body: 'Herramienta de apoyo; el usuario es responsable de las decisiones de negocio.'),
  LegalSectionText(heading: '8. Propiedad intelectual', body: 'Licencia revocable, no exclusiva. Prohibida la ingeniería inversa ilícita.'),
  LegalSectionText(heading: '9. Cambios', body: 'Versión vigente en la URL abajo.'),
  LegalSectionText(heading: '10. Ley y fuero', body: 'Leyes de Brasil; fuero Caxias do Sul/RS.'),
  LegalSectionText(heading: '11. Contacto', body: 'suporte@perfectgestdev.com'),
];

const List<LegalSectionText> _kDeletionEs = <LegalSectionText>[
  LegalSectionText(heading: 'Introducción', body: '''Última actualización: Julio de 2026
PerfectGest I ofrece control claro de los datos conforme a Google Play y la LGPD. La app es local-first.'''),
  LegalSectionText(heading: 'Resumen', body: 'Datos de clientes y financieros no se envían automáticamente a servidores PerfectGest. Solo salen del teléfono si usted comparte PDF, backups exportados, PNG/vCard de la tarjeta o muestra un QR con contactos profesionales.'),
  LegalSectionText(heading: '1. Datos de gestión (local)', body: '''Almacenados en SQLite en el dispositivo: clientes, presupuestos comerciales, presupuestos fiscales y códigos fiscales, caja, órdenes de servicio, datos de empresa (incluido logotipo), copia de la tarjeta, recordatorios fiscales.

Cómo eliminar

- En la app: Ajustes → Datos en este dispositivo → Eliminar todos los datos
- Android: Ajustes → Aplicaciones → PerfectGest I → Almacenamiento → Borrar datos
- Desinstalar la app

Aviso: sin copia externa, no hay recuperación — no guardamos copias en nuestros servidores.

Backups compartidos: elimínelos manualmente donde los guardó.'''),
  LegalSectionText(heading: '2. Firebase / telemetría', body: '''Metadatos anónimos de instalación y métricas de uso (elegibilidad de suscripción / antiabuso; primer guardado de tarjeta). No alojamos contenido de la tarjeta ni el logotipo en servidores.

Correo: suporte@perfectgestdev.com — Asunto: Solicitud de Eliminación de Datos Técnicos'''),
  LegalSectionText(heading: '3. Notificaciones locales', body: 'Se cancelan al desinstalar o borrar los datos de la app.'),
  LegalSectionText(heading: '4. Plazos', body: 'Datos locales: inmediato. Telemetría Firebase: hasta 15 días hábiles tras la solicitud por correo.'),
];

const List<LegalSectionText> _kFaqEs = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: 'Última actualización: Julio de 2026'),
  LegalSectionText(heading: '¿Qué es PerfectGest I?', body: 'App de gestión en el teléfono, con datos locales (SQLite). No hay «cuenta en la nube» PerfectGest para clientes, presupuestos o caja.'),
  LegalSectionText(heading: '¿Funciona sin internet?', body: 'Sí, uso diario offline-first. Servicios Google opcionales (Analytics, Remote Config, Firestore mínimo de elegibilidad) pueden usar red cuando están activos.'),
  LegalSectionText(heading: '¿Puedo usar la app sin suscripción?', body: 'Sí, para explorar (navegar pantallas y consultar la interfaz). Las operaciones (crear clientes, presupuestos comerciales o fiscales, caja; generar PDF de gestión; restaurar backup cifrado; y demás acciones condicionadas) requieren Plan Pro. Al intentar una operación sin suscripción aparece un aviso con el plan (referencia R\$ 9,90/mes; precio en Google Play) y Suscribirse o Continuar explorando los recursos de la aplicación.'),
  LegalSectionText(heading: '¿Cómo funciona el Plan Pro?', body: 'Suscripción mensual o anual en Google Play: clientes, presupuestos, caja y PDF sin límite práctico; restauración de backup cifrado; tarjeta interactiva (vCard, QR, vista previa). Gestionar en Ajustes → Suscripción Google Play.'),
  LegalSectionText(heading: '¿Dónde gestiono la suscripción?', body: 'Ajustes → Suscripción Google Play. Cancelación: Play Store → Pagos y suscripciones.'),
  LegalSectionText(heading: '¿Qué es la pestaña Presup./NF-e/NFS-e?', body: 'Presupuesto fiscal local (productos y servicios, códigos NCM/CFOP/LC 116, PDF de apoyo) y consulta/registro de códigos. No emite NF-e ni NFS-e electrónica ante la autoridad fiscal.'),
  LegalSectionText(heading: '¿Qué es la tarjeta de visita digital?', body: '''En Empresa, edita datos profesionales (no clientes ni caja). Compartir tarjeta genera PNG en la hoja de compartir. Tras la primera tarjeta, sin Plan Pro queda en modo estático (puede compartir el PNG); con Pro, edita y usa funciones avanzadas solo en la app (vCard, QR, vista previa interactiva) — sin página web alojada por PerfectGest.

Clientes y datos financieros protegidos en el teléfono; no se envían automáticamente a servidores.'''),
  LegalSectionText(heading: '¿Están protegidos mis datos de clientes y financieros?', body: 'Sí. Solo salen si usted comparte PDF, PNG/vCard/QR de la tarjeta o backup exportado (cifrado recomendado en Pro). Incluye presupuestos fiscales locales.'),
  LegalSectionText(heading: 'Recordatorios fiscales, calendario, últimos registros, notificaciones, anuncios, Crashlytics, idiomas?', body: 'Recordatorios locales informativos; calendario semanal en Empresa; atajos en inicio; solo notificaciones locales; sin anuncios; sin Crashlytics; PT / EN / ES.'),
  LegalSectionText(heading: 'Privacidad, eliminación, sugerencias?', body: 'Ajustes → Ayuda y soporte para enlaces legales. Borrar datos: Ajustes → Datos en este dispositivo. Sugerencias: pestaña Empresa → suporte@perfectgestdev.com.'),
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
