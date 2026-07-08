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
  LegalSectionText(heading: 'Introdução', body: '''Última atualização: 7 de julho de 2026
Responsável: Marcos Leandro dos Santos · suporte@perfectgestdev.com'''),
  LegalSectionText(heading: 'Seus dados ficam no seu celular', body: '''O PerfectGest I foi feito para funcionar sem internet no dia a dia. Por padrão:

- Clientes, orçamentos, caixa, ordens de serviço e dados da empresa ficam só no seu celular
- O app não envia esses dados para os nossos servidores automaticamente
- O app não tem anúncios e não rastreia o que você registra'''),
  LegalSectionText(heading: 'O que o app guarda', body: '''Dados que você preenche (ficam no celular)

| O que é | Exemplos |
|---------|----------|
| Clientes | Nome, contato, histórico |
| Orçamentos | Itens, valores, estado |
| Caixa | Entradas, saídas, categorias |
| Ordens de serviço | Descrição, valores |
| Dados da empresa | Nome, CNPJ, logo, contatos |
| Preferências | Tema, configurações do app |

O que o app não coleta

- Sua localização (GPS)
- Contatos do telefone
- Histórico de navegação
- Qualquer dado para anúncios'''),
  LegalSectionText(heading: 'Quando seus dados saem do celular', body: '''Os dados só saem do aparelho quando você mesmo decide compartilhar:

| Ação | O que é enviado |
|------|-----------------|
| Compartilhar PDF (orçamento, caixa, relatório) | O PDF gerado naquele momento |
| Compartilhar cartão de visita (PNG ou vCard) | Só dados profissionais da empresa — nunca clientes ou financeiro |
| Exportar backup | Arquivo com seus dados (guarde em local seguro) |

Recomendamos backup com senha (disponível no Plano Pro) para maior segurança.'''),
  LegalSectionText(heading: 'Uso gratuito e Plano Pro', body: '''Uso gratuito (freemium): você pode criar 1 cliente, 1 orçamento e 1 lançamento de caixa sem assinar nenhum plano. Esses limites são permanentes — sem prazo para vencer.

Plano Pro: uso ilimitado + backup com senha + cartão de visita completo. Assinatura mensal ou anual via Google Play.'''),
  LegalSectionText(heading: 'Cartão de visita digital', body: '''O cartão usa os dados da aba Empresa (nome, logo, contatos profissionais). Esses dados ficam no celular.

- Sem Plano Pro: pode compartilhar a imagem do cartão; edição avançada fica pausada
- Com Plano Pro: edita, gera vCard, QR Code e preview interativo — tudo dentro do app

Clientes, orçamentos e caixa nunca entram no cartão.'''),
  LegalSectionText(heading: 'Serviços do Google usados pelo app', body: '''| Serviço | Para quê | O que é enviado |
|---------|----------|-----------------|
| Google Play Billing | Gerenciar assinatura | Dados da compra (pela Google) |
| Firebase Analytics | Medir uso do app | Eventos genéricos (sem nomes ou valores financeiros) |
| Firebase Remote Config | Configurações do app | Nenhum dado pessoal |
| Cloud Firestore | Controle do limite freemium por aparelho | ID anônimo do aparelho — sem clientes, orçamentos ou caixa |

O Firebase Analytics registra apenas eventos genéricos de navegação — não envia nomes de clientes, valores de caixa nem conteúdo de orçamentos.'''),
  LegalSectionText(heading: 'Notificações', body: 'Apenas lembretes locais no celular para obrigações fiscais. Nada é enviado para servidores externos.'),
  LegalSectionText(heading: 'Por quanto tempo guardamos seus dados', body: '''- No celular: até você usar "Eliminar todos os dados" ou desinstalar o app
- Firebase (técnico): solicite exclusão por e-mail em até 15 dias úteis'''),
  LegalSectionText(heading: 'Seus direitos', body: '''Você pode a qualquer momento:
- Ver e editar seus dados diretamente no app
- Exportar seus dados (backup)
- Apagar tudo do celular: Configurações → Dados no dispositivo → Eliminar todos os dados
- Pedir exclusão de dados técnicos (Firebase) por e-mail: suporte@perfectgestdev.com'''),
  LegalSectionText(heading: 'Crianças', body: 'O app é destinado a adultos (18 anos ou mais) e empreendedores.'),
  LegalSectionText(heading: 'Atualizações desta política', body: 'Quando houver mudanças relevantes, avisamos no app. A versão mais recente está sempre no link abaixo.'),
  LegalSectionText(heading: 'Links', body: '''- Política de privacidade
- FAQ
- Exclusão de dados
- Termos e Condições'''),
];

const List<LegalSectionText> _kTermsPt = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: 'Última atualização: 7 de julho de 2026'),
  LegalSectionText(heading: 'O que é o app', body: '''O PerfectGest I é um aplicativo de gestão para autônomos e pequenas empresas. Você gerencia clientes, orçamentos, caixa, ordens de serviço, lembretes fiscais e cartão de visita digital — tudo guardado no seu celular.

Os dados de clientes e financeiros não são enviados automaticamente para servidores. Só saem do aparelho por ação sua (compartilhar PDF, backup exportado ou cartão de visita).

Responsável pelo app: Marcos Leandro dos Santos · suporte@perfectgestdev.com'''),
  LegalSectionText(heading: 'Quem pode usar', body: 'Pessoas com 18 anos ou mais.'),
  LegalSectionText(heading: 'Uso gratuito e Plano Pro', body: '''Uso gratuito (freemium): sem assinar nada, você pode criar 1 cliente, 1 orçamento e 1 lançamento de caixa. Esses limites são permanentes — não têm prazo de vencimento.

Plano Pro: uso ilimitado (clientes, orçamentos, caixa, PDFs), backup com senha e cartão de visita com edição completa. Assinatura mensal ou anual via Google Play.

A assinatura renova automaticamente até você cancelar na Play Store → Pagamentos e subscrições → Subscrições.'''),
  LegalSectionText(heading: 'Cancelamento e reembolso', body: 'O cancelamento é feito na Google Play. Reembolsos seguem a política da Google Play Store. Quando aplicável no Brasil (CDC), você tem 7 dias corridos para arrependimento.'),
  LegalSectionText(heading: 'Lembretes fiscais', body: 'São informativos. Não substituem um contador ou assessor fiscal. A responsabilidade pelas obrigações fiscais é sempre do usuário.'),
  LegalSectionText(heading: 'Limitação de responsabilidade', body: 'O app é uma ferramenta de apoio. Não substitui assessoria profissional (contábil, jurídica, financeira). As decisões de negócio são de sua responsabilidade.'),
  LegalSectionText(heading: 'Propriedade intelectual', body: 'Você recebe uma licença de uso, não exclusiva e não transferível. É proibido copiar, modificar ou fazer engenharia reversa do app.'),
  LegalSectionText(heading: 'Alterações nestes termos', body: 'A versão vigente está sempre publicada no link abaixo. Mudanças relevantes serão comunicadas no app.'),
  LegalSectionText(heading: 'Foro', body: 'Leis do Brasil. Foro: Caxias do Sul — RS, respeitados os direitos do consumidor.'),
  LegalSectionText(heading: 'Contato', body: 'suporte@perfectgestdev.com'),
  LegalSectionText(heading: 'Links', body: '''- Política de privacidade
- FAQ
- Exclusão de dados
- Termos e Condições'''),
];

const List<LegalSectionText> _kDeletionPt = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: '''Última atualização: 7 de julho de 2026
O PerfectGest I guarda seus dados só no celular. Você tem controle total.'''),
  LegalSectionText(heading: 'O que pode ser apagado pelo app', body: '''Ao eliminar os dados, tudo isso é removido do seu celular:

- Lista de clientes e histórico
- Orçamentos, valores e itens
- Lançamentos de caixa (entradas e saídas)
- Ordens de serviço
- Dados da empresa (nome, logo, contatos)
- Cartão de visita digital salvo no app
- Lembretes fiscais configurados
- Preferências e configurações'''),
  LegalSectionText(heading: 'Como apagar tudo no app', body: '''Configurações → Dados no dispositivo → Eliminar todos os dados neste aparelho

Também é possível pelo Android: Configurações do celular → Apps → PerfectGest I → Armazenamento → Limpar dados.

Desinstalar o app também remove os dados locais.

Atenção: sem backup exportado, não é possível recuperar os dados. O app não mantém cópias nos nossos servidores.'''),
  LegalSectionText(heading: 'O que não é apagado automaticamente', body: '''- PDFs que você exportou para outros apps
- Backups que você enviou por WhatsApp, e-mail ou guardou em nuvem pessoal — apague manualmente nesses locais
- Registro da compra na Google Play'''),
  LegalSectionText(heading: 'Dados técnicos (Firebase)', body: '''O app usa Firebase para controlar o limite gratuito por aparelho (ID anônimo — sem seus dados de clientes ou financeiro). Para pedir a exclusão desses dados técnicos:

E-mail: suporte@perfectgestdev.com
Assunto: Solicitação de Exclusão de Dados Técnicos
Prazo: até 15 dias úteis'''),
  LegalSectionText(heading: 'Prazos', body: '''| Ação | Prazo |
|------|-------|
| Apagar do celular | Imediato |
| Exclusão de dados técnicos Firebase | Até 15 dias úteis |'''),
  LegalSectionText(heading: 'Links', body: '''- Política de privacidade
- FAQ
- Exclusão de dados
- Termos e Condições'''),
];

const List<LegalSectionText> _kFaqPt = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: 'Última atualização: 7 de julho de 2026'),
  LegalSectionText(heading: 'O que é o PerfectGest I?', body: 'Um app de gestão no celular para autônomos e pequenas empresas. Clientes, orçamentos, caixa, ordens de serviço e lembretes fiscais — tudo guardado só no seu celular, sem conta na nuvem.'),
  LegalSectionText(heading: 'Preciso de internet para usar?', body: '''No dia a dia, não precisa. O app funciona offline. Só precisam de internet:
- Assinar ou restaurar um plano (Google Play)
- Verificar atualizações do app'''),
  LegalSectionText(heading: 'Posso usar de graça?', body: '''Sim! Sem assinar nada, você pode criar:
- 1 cliente
- 1 orçamento (com PDF)
- 1 lançamento de caixa (com PDF)

Esses limites são permanentes — sem prazo para vencer. Para usar sem limites, assine o Plano Pro em Configurações → Assinatura Google Play.'''),
  LegalSectionText(heading: 'O que é o Plano Pro?', body: '''Com o Plano Pro (mensal ou anual na Google Play) você tem:
- Clientes, orçamentos e lançamentos ilimitados
- PDFs ilimitados
- Backup com proteção por senha
- Cartão de visita digital com edição, vCard, QR e preview interativo'''),
  LegalSectionText(heading: 'Como compro ou gerencio minha assinatura?', body: '''Configurações → Assinatura Google Play

Para cancelar: Google Play → Pagamentos e subscrições → Subscrições.'''),
  LegalSectionText(heading: 'O que é o cartão de visita digital?', body: '''Na aba Empresa você configura seus dados profissionais (nome, contatos, logo, slogan). O app gera um cartão digital que você pode compartilhar como imagem (PNG) ou vCard.

- Sem Plano Pro: pode criar o primeiro cartão e compartilhar a imagem; edição e funções avançadas ficam pausadas.
- Com Plano Pro: edita quando quiser, gera QR Code, exporta vCard e compartilha.

Dados de clientes e financeiros nunca entram no cartão — ficam só no seu celular.'''),
  LegalSectionText(heading: 'Meus dados de clientes e financeiros estão seguros?', body: '''Sim. Tudo fica guardado localmente no seu celular. Só saem do aparelho se você escolher compartilhar:
- Um PDF de orçamento, caixa ou relatório
- A imagem ou vCard do cartão de visita (só dados profissionais)
- Um arquivo de backup que você mesmo exportou

Recomendamos usar backup com senha (Plano Pro) para maior segurança.'''),
  LegalSectionText(heading: 'O que são os lembretes fiscais?', body: 'Alertas no celular para obrigações como DAS, declarações e outros vencimentos de MEI, autônomos e ME. São informativos — não substituem um contador.'),
  LegalSectionText(heading: 'O que são os "Últimos lançamentos" na tela inicial?', body: 'Atalhos rápidos para o último cliente, orçamento, ordem de serviço e lançamento de caixa que você registrou.'),
  LegalSectionText(heading: 'O app manda notificações?', body: 'Apenas lembretes locais para obrigações fiscais. Nada é enviado para servidores externos.'),
  LegalSectionText(heading: 'O app tem anúncios?', body: 'Não.'),
  LegalSectionText(heading: 'Em quais idiomas está disponível?', body: 'Português (Brasil), Inglês e Espanhol.'),
  LegalSectionText(heading: 'Como apago todos os dados do celular?', body: '''Configurações → Dados no dispositivo → Eliminar todos os dados neste aparelho

PDFs e backups que você já exportou para outros apps ou serviços não são apagados por esse botão — exclua-os manualmente onde os guardou.'''),
  LegalSectionText(heading: 'Como entro em contato ou dou sugestões?', body: 'Aba Empresa → Dê sua contribuição ou e-mail: suporte@perfectgestdev.com'),
  LegalSectionText(heading: 'Links', body: '''- Política de privacidade
- FAQ
- Exclusão de dados
- Termos e Condições'''),
];

const List<LegalSectionText> _kPrivacyEn = <LegalSectionText>[
  LegalSectionText(heading: 'Introduction', body: '''Last updated: 7 July 2026
Developer: Marcos Leandro dos Santos · suporte@perfectgestdev.com'''),
  LegalSectionText(heading: 'Your data stays on your phone', body: '''PerfectGest I is built to work offline every day. By default:

- Clients, estimates, cash, service orders, and company data stay only on your device
- The app does not send this data to our servers automatically
- The app has no ads and does not track what you register'''),
  LegalSectionText(heading: 'What the app stores', body: '''Data you enter (stays on your device)

| Type | Examples |
|------|----------|
| Clients | Name, contact, history |
| Estimates | Items, amounts, status |
| Cash | Income, expenses, categories |
| Service orders | Description, values |
| Company data | Name, tax ID, logo, contacts |
| Preferences | Theme, app settings |

What the app does not collect

- Your location (GPS)
- Phone contacts
- Browsing history
- Any advertising data'''),
  LegalSectionText(heading: 'When data leaves your device', body: '''Data only leaves your phone when you decide to share:

| Action | What is sent |
|--------|-------------|
| Share a PDF (estimate, cash, report) | The PDF generated at that moment |
| Share business card (PNG or vCard) | Professional details only — never clients or financials |
| Export backup | A file with your data (store it securely) |

We recommend using a password-protected backup (Pro Plan) for extra security.'''),
  LegalSectionText(heading: 'Free use and Pro Plan', body: '''Free use (freemium): create 1 client, 1 estimate, and 1 cash entry without subscribing. These limits are permanent — they don't expire.

Pro Plan: unlimited use + password-protected backup + full business card. Monthly or annual via Google Play.'''),
  LegalSectionText(heading: 'Digital business card', body: '''The card uses data from the Company tab (name, logo, professional contacts). This data stays on your device.

- Without Pro Plan: share the card image; advanced editing is paused
- With Pro Plan: edit anytime, generate vCard, QR Code, and interactive preview — all within the app

Client data, estimates, and cash entries never appear on the card.'''),
  LegalSectionText(heading: 'Google services used', body: '''| Service | Purpose | What is sent |
|---------|---------|-------------|
| Google Play Billing | Manage subscription | Purchase data (handled by Google) |
| Firebase Analytics | Measure app usage | Generic events (no names or financial values) |
| Firebase Remote Config | App configuration | No personal data |
| Cloud Firestore | Freemium limit control per device | Anonymous device ID — no clients, estimates, or cash |

Firebase Analytics only records generic navigation events — no client names, financial values, or estimate content.'''),
  LegalSectionText(heading: 'Notifications', body: 'Local reminders only for fiscal obligations. Nothing is sent to external servers.'),
  LegalSectionText(heading: 'How long we keep data', body: '''- On your device: until you delete all data or uninstall the app
- Firebase (technical): request deletion by email within 15 business days'''),
  LegalSectionText(heading: 'Your rights', body: '''At any time you can:
- View and edit your data in the app
- Export your data (backup)
- Delete everything: Settings → Data on this device → Delete all data
- Request deletion of technical data (Firebase): suporte@perfectgestdev.com'''),
  LegalSectionText(heading: 'Children', body: 'The app is for adults (18+) and entrepreneurs only.'),
  LegalSectionText(heading: 'Updates to this policy', body: 'Significant changes will be communicated in the app. The latest version is always at the link below.'),
  LegalSectionText(heading: 'Links', body: '''- Privacy policy
- FAQ
- Data deletion
- Terms and Conditions'''),
];

const List<LegalSectionText> _kTermsEn = <LegalSectionText>[
  LegalSectionText(heading: 'Introduction', body: 'Last updated: 7 July 2026'),
  LegalSectionText(heading: 'What is the app', body: '''PerfectGest I is a business management app for freelancers and small businesses. Manage clients, estimates, cash, service orders, fiscal reminders, and a digital business card — all stored on your device.

Client and financial data are not sent automatically to servers. They only leave your device if you choose to share a PDF, exported backup, or business card.

Developer: Marcos Leandro dos Santos · suporte@perfectgestdev.com'''),
  LegalSectionText(heading: 'Who can use it', body: 'Users 18 years or older.'),
  LegalSectionText(heading: 'Free use and Pro Plan', body: '''Free use (freemium): without subscribing, you can create 1 client, 1 estimate, and 1 cash entry. These limits are permanent — they do not expire.

Pro Plan: unlimited use (clients, estimates, cash, PDFs), password-protected backup, and full business card features. Monthly or annual subscription via Google Play.

Subscriptions renew automatically until you cancel in Google Play → Payments & subscriptions → Subscriptions.'''),
  LegalSectionText(heading: 'Cancellation and refunds', body: 'Cancel via Google Play. Refunds follow Google Play Store policy. In Brazil, a 7-day right of withdrawal applies when applicable (Consumer Protection Code).'),
  LegalSectionText(heading: 'Fiscal reminders', body: 'Informational only. They do not replace a qualified accountant. The user is responsible for all fiscal obligations.'),
  LegalSectionText(heading: 'Limitation of liability', body: '''The app is a support tool. It does not replace professional advice (accounting, legal, financial). Business decisions are the user's responsibility.'''),
  LegalSectionText(heading: 'Intellectual property', body: 'You receive a non-exclusive, non-transferable license to use the app. Reverse engineering and unauthorized copying are prohibited.'),
  LegalSectionText(heading: 'Changes to these terms', body: 'The current version is always published at the link below. Significant changes will be communicated in the app.'),
  LegalSectionText(heading: 'Governing law', body: 'Laws of Brazil. Jurisdiction: Caxias do Sul — RS, without prejudice to consumer rights.'),
  LegalSectionText(heading: 'Contact', body: 'suporte@perfectgestdev.com'),
  LegalSectionText(heading: 'Links', body: '''- Privacy policy
- FAQ
- Data deletion
- Terms and Conditions'''),
];

const List<LegalSectionText> _kDeletionEn = <LegalSectionText>[
  LegalSectionText(heading: 'Introduction', body: '''Last updated: 7 July 2026
PerfectGest I stores your data only on your device. You have full control.'''),
  LegalSectionText(heading: 'What can be deleted from the app', body: '''Deleting data removes everything from your phone:

- Client list and history
- Estimates, amounts, and items
- Cash entries (income and expenses)
- Service orders
- Company data (name, logo, contacts)
- Digital business card saved in the app
- Fiscal reminders
- Preferences and settings'''),
  LegalSectionText(heading: 'How to delete everything in the app', body: '''Settings → Data on this device → Delete all data on this device

You can also use Android settings: Phone Settings → Apps → PerfectGest I → Storage → Clear data.

Uninstalling the app also removes all local data.

Warning: without an exported backup, data cannot be recovered. We do not keep copies on our servers.'''),
  LegalSectionText(heading: 'What is NOT automatically deleted', body: '''- PDFs you exported to other apps
- Backups you sent via WhatsApp, email, or personal cloud — delete them manually in those locations
- Your purchase record on Google Play'''),
  LegalSectionText(heading: 'Technical data (Firebase)', body: '''The app uses Firebase to control the free usage limit per device (anonymous ID — no client or financial data). To request deletion of this technical data:

Email: suporte@perfectgestdev.com
Subject: Technical Data Deletion Request
Response time: up to 15 business days'''),
  LegalSectionText(heading: 'Timelines', body: '''| Action | Timeline |
|--------|----------|
| Delete from device | Immediate |
| Firebase technical data deletion | Up to 15 business days |'''),
  LegalSectionText(heading: 'Links', body: '''- Privacy policy
- FAQ
- Data deletion
- Terms and Conditions'''),
];

const List<LegalSectionText> _kFaqEn = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: 'Last updated: 7 July 2026'),
  LegalSectionText(heading: 'What is PerfectGest I?', body: 'A mobile business management app for freelancers and small businesses. Manage clients, estimates, cash, service orders, and fiscal reminders — all stored locally on your phone, no cloud account required.'),
  LegalSectionText(heading: 'Does it work offline?', body: 'Yes. Daily use (clients, estimates, cash) works offline. Internet is only needed to subscribe or restore a plan via Google Play.'),
  LegalSectionText(heading: 'Can I use it for free?', body: '''Yes! Without subscribing, you can create:
- 1 client
- 1 estimate (with PDF)
- 1 cash entry (with PDF)

These limits are permanent — they don't expire. For unlimited use, subscribe to the Pro Plan in Settings → Google Play subscription.'''),
  LegalSectionText(heading: 'What is the Pro Plan?', body: '''With Pro Plan (monthly or annual on Google Play) you get:
- Unlimited clients, estimates, and cash entries
- Unlimited PDFs
- Password-protected backup
- Full digital business card (edit, vCard, QR, interactive preview)'''),
  LegalSectionText(heading: 'Where do I manage my subscription?', body: '''Settings → Google Play subscription

To cancel: Google Play → Payments & subscriptions → Subscriptions.'''),
  LegalSectionText(heading: 'What is the digital business card?', body: '''In the Company tab, set up your professional details (name, contacts, logo, tagline). The app generates a digital card you can share as an image (PNG) or vCard.

- Without Pro Plan: create your first card and share the image; editing and advanced features are paused.
- With Pro Plan: edit anytime, generate QR Code, export vCard, interactive preview — all inside the app.

Client and financial data never appear on the card — they stay only on your phone.'''),
  LegalSectionText(heading: 'Are my client and financial data protected?', body: '''Yes. Everything is stored locally. Data only leaves your device when you choose to share:
- A PDF (estimate, cash report, etc.)
- A business card image or vCard (professional details only — never clients or financials)
- An exported backup file

We recommend using a password-protected backup (Pro Plan) for extra security.'''),
  LegalSectionText(heading: 'What are fiscal reminders?', body: '''On-device alerts for MEI, freelancer, and ME obligations. Informational only — they don't replace an accountant.'''),
  LegalSectionText(heading: 'Does the app send notifications?', body: 'Only local reminders for fiscal obligations. Nothing is sent to external servers.'),
  LegalSectionText(heading: 'Does the app have ads?', body: 'No.'),
  LegalSectionText(heading: 'What languages are supported?', body: 'Portuguese (Brazil), English, and Spanish.'),
  LegalSectionText(heading: 'How do I delete all my data?', body: '''Settings → Data on this device → Delete all data on this device

PDFs and backups you already exported to other apps are not deleted by this — remove them manually where you saved them.'''),
  LegalSectionText(heading: 'How do I contact support or send feedback?', body: 'Company tab → Share your feedback, or email: suporte@perfectgestdev.com'),
  LegalSectionText(heading: 'Links', body: '''- Privacy policy
- FAQ
- Data deletion
- Terms and Conditions'''),
];

const List<LegalSectionText> _kPrivacyEs = <LegalSectionText>[
  LegalSectionText(heading: 'Introducción', body: '''Última actualización: 7 de julio de 2026
Desarrollador: Marcos Leandro dos Santos · suporte@perfectgestdev.com'''),
  LegalSectionText(heading: 'Sus datos permanecen en su teléfono', body: '''PerfectGest I está diseñado para funcionar sin internet en el día a día. De forma predeterminada:

- Clientes, presupuestos, caja, órdenes de servicio y datos de la empresa quedan solo en su dispositivo
- La app no envía estos datos a nuestros servidores automáticamente
- La app no tiene anuncios y no rastrea lo que usted registra'''),
  LegalSectionText(heading: 'Qué guarda la app', body: '''Datos que usted introduce (quedan en el dispositivo)

| Tipo | Ejemplos |
|------|----------|
| Clientes | Nombre, contacto, historial |
| Presupuestos | Ítems, valores, estado |
| Caja | Ingresos, gastos, categorías |
| Órdenes de servicio | Descripción, valores |
| Datos de la empresa | Nombre, ID fiscal, logo, contactos |
| Preferencias | Tema, configuración de la app |

Qué no recopila la app

- Su ubicación (GPS)
- Contactos del teléfono
- Historial de navegación
- Ningún dato publicitario'''),
  LegalSectionText(heading: 'Cuándo los datos salen de su dispositivo', body: '''Los datos solo salen de su teléfono cuando usted decide compartir:

| Acción | Qué se envía |
|--------|-------------|
| Compartir un PDF (presupuesto, caja, informe) | El PDF generado en ese momento |
| Compartir tarjeta de visita (PNG o vCard) | Solo datos profesionales — nunca clientes ni finanzas |
| Exportar backup | Archivo con sus datos (guárdelo en lugar seguro) |

Recomendamos usar backup con contraseña (Plan Pro) para mayor seguridad.'''),
  LegalSectionText(heading: 'Uso gratuito y Plan Pro', body: '''Uso gratuito (freemium): cree 1 cliente, 1 presupuesto y 1 movimiento de caja sin suscripción. Estos límites son permanentes — no tienen fecha de vencimiento.

Plan Pro: uso ilimitado + backup con contraseña + tarjeta de visita completa. Suscripción mensual o anual en Google Play.'''),
  LegalSectionText(heading: 'Tarjeta de visita digital', body: '''La tarjeta usa datos de la pestaña Empresa (nombre, logo, contactos profesionales). Estos datos quedan en el dispositivo.

- Sin Plan Pro: comparta la imagen de la tarjeta; la edición avanzada queda pausada
- Con Plan Pro: edite cuando quiera, genere vCard, QR y vista previa interactiva — todo en la app

Los datos de clientes, presupuestos y caja nunca aparecen en la tarjeta.'''),
  LegalSectionText(heading: 'Servicios de Google utilizados', body: '''| Servicio | Para qué | Qué se envía |
|---------|---------|-------------|
| Google Play Billing | Gestionar suscripción | Datos de compra (gestionados por Google) |
| Firebase Analytics | Medir uso de la app | Eventos genéricos (sin nombres ni valores financieros) |
| Firebase Remote Config | Configuración de la app | Ningún dato personal |
| Cloud Firestore | Control del límite gratuito por dispositivo | ID anónimo del dispositivo — sin clientes, presupuestos ni caja |

Firebase Analytics solo registra eventos genéricos de navegación — sin nombres de clientes, valores financieros ni contenido de presupuestos.'''),
  LegalSectionText(heading: 'Notificaciones', body: 'Solo recordatorios locales para obligaciones fiscales. Nada se envía a servidores externos.'),
  LegalSectionText(heading: 'Por cuánto tiempo guardamos sus datos', body: '''- En el dispositivo: hasta que elimine todos los datos o desinstale la app
- Firebase (técnico): solicite la eliminación por email en un plazo de 15 días hábiles'''),
  LegalSectionText(heading: 'Sus derechos', body: '''En cualquier momento puede:
- Ver y editar sus datos en la app
- Exportar sus datos (backup)
- Eliminar todo: Ajustes → Datos en el dispositivo → Eliminar todos los datos
- Solicitar eliminación de datos técnicos (Firebase): suporte@perfectgestdev.com'''),
  LegalSectionText(heading: 'Menores de edad', body: 'La app es para adultos (18 años o más) y emprendedores.'),
  LegalSectionText(heading: 'Actualizaciones de esta política', body: 'Los cambios relevantes se comunicarán en la app. La versión más reciente siempre está en el enlace de abajo.'),
  LegalSectionText(heading: 'Enlaces', body: '''- Política de privacidad
- FAQ
- Eliminación de datos
- Términos y Condiciones'''),
];

const List<LegalSectionText> _kTermsEs = <LegalSectionText>[
  LegalSectionText(heading: 'Introducción', body: 'Última actualización: 7 de julio de 2026'),
  LegalSectionText(heading: '¿Qué es la app?', body: '''PerfectGest I es una app de gestión para autónomos y pequeñas empresas. Gestione clientes, presupuestos, caja, órdenes de servicio, recordatorios fiscales y tarjeta de visita digital — todo guardado en su dispositivo.

Los datos de clientes y financieros no se envían automáticamente a servidores. Solo salen del dispositivo si usted elige compartir un PDF, backup exportado o tarjeta de visita.

Desarrollador: Marcos Leandro dos Santos · suporte@perfectgestdev.com'''),
  LegalSectionText(heading: '¿Quién puede usar la app?', body: 'Personas mayores de 18 años.'),
  LegalSectionText(heading: 'Uso gratuito y Plan Pro', body: '''Uso gratuito (freemium): sin suscripción, puede crear 1 cliente, 1 presupuesto y 1 movimiento de caja. Estos límites son permanentes — no tienen fecha de vencimiento.

Plan Pro: uso ilimitado (clientes, presupuestos, caja, PDFs), backup con contraseña y tarjeta de visita completa. Suscripción mensual o anual en Google Play.

La suscripción se renueva automáticamente hasta que la cancele en Google Play → Pagos y suscripciones → Suscripciones.'''),
  LegalSectionText(heading: 'Cancelación y reembolsos', body: 'Cancele en Google Play. Los reembolsos siguen la política de Google Play Store.'),
  LegalSectionText(heading: 'Recordatorios fiscales', body: 'Son informativos. No reemplazan a un asesor contable. El usuario es responsable de todas sus obligaciones fiscales.'),
  LegalSectionText(heading: 'Limitación de responsabilidad', body: 'La app es una herramienta de apoyo. No reemplaza asesoramiento profesional (contable, legal, financiero). Las decisiones de negocio son responsabilidad del usuario.'),
  LegalSectionText(heading: 'Propiedad intelectual', body: 'Usted recibe una licencia de uso no exclusiva e intransferible. Está prohibido copiar, modificar o realizar ingeniería inversa de la app.'),
  LegalSectionText(heading: 'Cambios en estos términos', body: 'La versión vigente siempre está publicada en el enlace de abajo. Los cambios relevantes se comunicarán en la app.'),
  LegalSectionText(heading: 'Ley aplicable y jurisdicción', body: 'Leyes de Brasil. Jurisdicción: Caxias do Sul — RS, sin perjuicio de los derechos del consumidor.'),
  LegalSectionText(heading: 'Contacto', body: 'suporte@perfectgestdev.com'),
  LegalSectionText(heading: 'Enlaces', body: '''- Política de privacidad
- FAQ
- Eliminación de datos
- Términos y Condiciones'''),
];

const List<LegalSectionText> _kDeletionEs = <LegalSectionText>[
  LegalSectionText(heading: 'Introducción', body: '''Última actualización: 7 de julio de 2026
PerfectGest I guarda sus datos solo en su dispositivo. Usted tiene el control total.'''),
  LegalSectionText(heading: 'Qué puede eliminarse desde la app', body: '''Al eliminar los datos, todo esto se borra de su teléfono:

- Lista de clientes e historial
- Presupuestos, valores e ítems
- Movimientos de caja (ingresos y gastos)
- Órdenes de servicio
- Datos de la empresa (nombre, logo, contactos)
- Tarjeta de visita digital guardada en la app
- Recordatorios fiscales configurados
- Preferencias y configuración'''),
  LegalSectionText(heading: 'Cómo eliminar todo en la app', body: '''Ajustes → Datos en el dispositivo → Eliminar todos los datos en este dispositivo

También puede usar los ajustes de Android: Configuración del teléfono → Aplicaciones → PerfectGest I → Almacenamiento → Borrar datos.

Desinstalar la app también elimina todos los datos locales.

Atención: sin un backup exportado, los datos no se pueden recuperar. No guardamos copias en nuestros servidores.'''),
  LegalSectionText(heading: 'Qué NO se elimina automáticamente', body: '''- PDFs que exportó a otras apps
- Backups enviados por WhatsApp, email o guardados en nube personal — elimínelos manualmente en esos lugares
- El registro de compra en Google Play'''),
  LegalSectionText(heading: 'Datos técnicos (Firebase)', body: '''La app usa Firebase para controlar el límite gratuito por dispositivo (ID anónimo — sin datos de clientes ni financieros). Para solicitar la eliminación de estos datos técnicos:

Email: suporte@perfectgestdev.com
Asunto: Solicitud de Eliminación de Datos Técnicos
Plazo de respuesta: hasta 15 días hábiles'''),
  LegalSectionText(heading: 'Plazos', body: '''| Acción | Plazo |
|--------|-------|
| Eliminar del dispositivo | Inmediato |
| Eliminación de datos técnicos Firebase | Hasta 15 días hábiles |'''),
  LegalSectionText(heading: 'Enlaces', body: '''- Política de privacidad
- FAQ
- Eliminación de datos
- Términos y Condiciones'''),
];

const List<LegalSectionText> _kFaqEs = <LegalSectionText>[
  LegalSectionText(heading: 'Introdução', body: 'Última actualización: 7 de julio de 2026'),
  LegalSectionText(heading: '¿Qué es PerfectGest I?', body: 'Una app de gestión empresarial para autónomos y pequeñas empresas. Gestione clientes, presupuestos, caja, órdenes de servicio y recordatorios fiscales — todo guardado solo en su teléfono, sin cuenta en la nube.'),
  LegalSectionText(heading: '¿Funciona sin internet?', body: 'Sí. El uso diario (clientes, presupuestos, caja) funciona sin conexión. Solo necesita internet para suscribirse o restaurar un plan en Google Play.'),
  LegalSectionText(heading: '¿Puedo usarlo gratis?', body: '''¡Sí! Sin suscripción, puede crear:
- 1 cliente
- 1 presupuesto (con PDF)
- 1 movimiento de caja (con PDF)

Estos límites son permanentes — no tienen fecha de vencimiento. Para uso ilimitado, suscríbase al Plan Pro en Ajustes → Suscripción de Google Play.'''),
  LegalSectionText(heading: '¿Qué es el Plan Pro?', body: '''Con el Plan Pro (mensual o anual en Google Play) tiene:
- Clientes, presupuestos y movimientos de caja ilimitados
- PDFs ilimitados
- Backup con contraseña
- Tarjeta de visita digital completa (edición, vCard, QR, vista previa interactiva)'''),
  LegalSectionText(heading: '¿Dónde gestiono mi suscripción?', body: '''Ajustes → Suscripción de Google Play

Para cancelar: Google Play → Pagos y suscripciones → Suscripciones.'''),
  LegalSectionText(heading: '¿Qué es la tarjeta de visita digital?', body: '''En la pestaña Empresa, configure sus datos profesionales (nombre, contactos, logo, eslogan). La app genera una tarjeta digital que puede compartir como imagen (PNG) o vCard.

- Sin Plan Pro: cree su primera tarjeta y comparta la imagen; la edición y funciones avanzadas quedan pausadas.
- Con Plan Pro: edite cuando quiera, genere QR, exporte vCard y vista previa interactiva — todo en la app.

Los datos de clientes y financieros nunca aparecen en la tarjeta — quedan solo en su teléfono.'''),
  LegalSectionText(heading: '¿Están protegidos mis datos de clientes y financieros?', body: '''Sí. Todo se guarda localmente. Los datos solo salen del dispositivo cuando usted elige compartir:
- Un PDF (presupuesto, caja, informe)
- La imagen o vCard de la tarjeta (solo datos profesionales — nunca clientes ni finanzas)
- Un archivo de backup exportado

Recomendamos usar backup con contraseña (Plan Pro) para mayor seguridad.'''),
  LegalSectionText(heading: '¿Qué son los recordatorios fiscales?', body: 'Alertas locales para obligaciones fiscales de autónomos y pequeñas empresas. Son informativos — no reemplazan a un asesor contable.'),
  LegalSectionText(heading: '¿La app envía notificaciones?', body: 'Solo recordatorios locales para obligaciones fiscales. Nada se envía a servidores externos.'),
  LegalSectionText(heading: '¿La app tiene anuncios?', body: 'No.'),
  LegalSectionText(heading: '¿En qué idiomas está disponible?', body: 'Portugués (Brasil), Inglés y Español.'),
  LegalSectionText(heading: '¿Cómo elimino todos mis datos?', body: '''Ajustes → Datos en el dispositivo → Eliminar todos los datos en este dispositivo

Los PDFs y backups ya exportados a otras apps no se eliminan con esto — elimínelos manualmente donde los guardó.'''),
  LegalSectionText(heading: '¿Cómo contacto el soporte o envío sugerencias?', body: 'Pestaña Empresa → Dé su contribución, o por email: suporte@perfectgestdev.com'),
  LegalSectionText(heading: 'Enlaces', body: '''- Política de privacidad
- FAQ
- Eliminación de datos
- Términos y Condiciones'''),
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
