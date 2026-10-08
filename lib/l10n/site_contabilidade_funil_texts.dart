import 'package:flutter/widgets.dart';

import '../company_legal.dart';

class FunilFaqItem {
  const FunilFaqItem({required this.question, required this.body});
  final String question;
  final String body;
}

/// Copy da pagina isolada `/contabilidade` (PT / EN / ES).
abstract class SiteContabilidadeFunilTexts {
  const SiteContabilidadeFunilTexts();

  static SiteContabilidadeFunilTexts of(BuildContext context) {
    switch (Localizations.localeOf(context).languageCode) {
      case 'en':
        return const _SiteContabilidadeFunilTextsEn();
      case 'es':
        return const _SiteContabilidadeFunilTextsEs();
      case 'pt':
      default:
        return const _SiteContabilidadeFunilTextsPt();
    }
  }

  String get semanticsLabel;
  String get brandLabel;
  String get heroHeadline;
  String get heroLead;
  String get ctaKnowApp;
  String get ctaSeePlans;
  String get ctaChoosePlan;
  String get proofTitle;
  String get proofBody;
  String get featuresTitle;
  List<String> get features;
  String get stepsTitle;
  String get stepATitle;
  String get stepABody;
  String get stepBTitle;
  String get stepBBody;
  String get stepCTitle;
  String get stepCBody;
  String get plansTitle;
  String get plansLead;
  String get plansGroupMei;
  String get plansGroupMe;
  String get playNote;
  String get extrasTitle;
  String get extrasBody;
  String get organsNote;
  String get perMonth;
  String get a1Price;
  String get a1Body;
  String get paymentLaterNote;
  String get urgencyNote;
  String get formTitle;
  String get formLead;
  String get fieldName;
  String get fieldEmail;
  String get fieldWhatsApp;
  String get fieldRazao;
  String get fieldCnpj;
  String get tipoLabel;
  String get tipoMei;
  String get tipoMe;
  String get crcLabel;
  String get crcYes;
  String get crcNo;
  String get faixaLabel;
  String get extraFolha;
  String get extraIr;
  String get extraA1;
  String get officeTotalLabel;
  String officeTotalHint(String boleto);
  String get consentPrefix;
  String get consentLinkLabel;
  String get consentSuffix;
  String get submitLabel;
  String get submittingLabel;
  String get successTitle;
  String get successBody;
  String get subscribeApp;
  String get backHome;
  String get demoTitle;
  String shotCaption(String id);
  String get faqTitle;
  List<FunilFaqItem> get faq;
  String get footerLegal;
  String get footerCrc;
  String get honorariosEmail;
  String get appEmail;
  String get langPt;
  String get langEn;
  String get langEs;
  String get whatsAppFab;
  String get errorGeneric;
  String errorForCode(String code);
  String planName(String id);
  List<String> planItems(String id);
  String get colPlan;
  String get colBoleto;
  String get highlightBadge;
  String get a1Seal;
}

class _SiteContabilidadeFunilTextsPt extends SiteContabilidadeFunilTexts {
  const _SiteContabilidadeFunilTextsPt();

  @override
  String get semanticsLabel => 'Honorarios de contabilidade PerfectGest ContabilGest';

  @override
  String get brandLabel => kProductPerfectGestContabilIName;

  @override
  String get heroHeadline =>
      'Aplicativo de contabilidade com IA + Contador ativo + Suporte, Emissão de NFS-e e NF-e com controle total de NFs emitidas e tomadas pelo CNPJ na sua mão em tempo real.';

  @override
  String get heroLead =>
      'Todos os serviços de contabilidade como: Contas a receber, contas a pagar, Pró-labore, Retirada de lucros, Folha de pagamento e Imposto de renda.';

  @override
  String get ctaKnowApp => 'Conhecer o app';

  @override
  String get ctaSeePlans => 'Ver planos';

  @override
  String get ctaChoosePlan => 'Quero este plano';

  @override
  String get proofTitle => 'Escritório com sistema de gerenciamento digital em Caxias do Sul/RS';

  @override
  String get proofBody =>
      'PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA atende Microempreendedor Individual (MEI) e Microempresa (ME). '
      'Sistema de gerenciamento digital por IA, com um contador habilitado assinando os livros oficiais (PAdES). Sem 13o do contabilista. '
      'Não é aplicativo do governo: portais oficiais continuam sendo a fonte das obrigações.';

  @override
  String get featuresTitle => 'O que o app faz';

  @override
  List<String> get features => const <String>[
        'Emissão de NFS-e e NF-e na palma da mão, em tempo real',
        'Controle das notas emitidas e tomadas pelo CNPJ',
        'Contas a receber e contas a pagar',
        'Pró-labore e retirada de lucros',
        'Folha de pagamento e Imposto de renda',
        'Livro Caixa e fecho do mês no celular',
        'Assistente IA para tirar dúvidas do dia a dia',
        'Contador habilitado assinando os livros nos planos com acompanhamento',
        'Rotinas do dia a dia no aparelho, com LGPD',
      ];

  @override
  String get stepsTitle => 'Como funciona';

  @override
  String get stepATitle => 'A. Conheça o app';

  @override
  String get stepABody =>
      'Explore de graça: lançamentos, notas, obrigações e o assistente IA. Sem compromisso.';

  @override
  String get stepBTitle => 'B. Escolha o plano que combina com você';

  @override
  String get stepBBody =>
      'Planos para Microempreendedor Individual (MEI) e Microempresa (ME). O escritório confirma e explica tudo com calma.';

  @override
  String get stepCTitle => 'C. Conte com suporte e o app no celular';

  @override
  String get stepCBody =>
      'Sistema de gerenciamento digital por IA e, nos planos com acompanhamento, um contador habilitado assinando os livros.';

  @override
  String get plansTitle => 'Planos';

  @override
  String get plansLead =>
      'Assinatura mensal simples. Sem surpresa nesta página: a forma de pagamento é combinada na contratação.';

  @override
  String get plansGroupMei => 'Microempreendedor Individual (MEI) — sem acompanhamento do contador';

  @override
  String get plansGroupMe => 'Microempresa (ME) — com acompanhamento do contador';

  @override
  String get playNote => '';

  @override
  String get extrasTitle => 'Add-on';

  @override
  String get extrasBody => '';

  @override
  String get organsNote => '';

  @override
  String get perMonth => 'mês';

  @override
  String get a1Price => 'R\$ 119,99/ano';

  @override
  String get a1Body =>
      'Certificado A1 QualityCert: emita NFS-e e NF-e com segurança, direto no app.';

  @override
  String get paymentLaterNote =>
      'A forma de pagamento é apresentada na contratação, com clareza e sem pressa.';

  @override
  String get urgencyNote =>
      'Estamos prontos para receber você. Confirmamos o plano e os próximos passos assim que o pedido chegar.';

  @override
  String get formTitle => 'Escolher meu plano';

  @override
  String get formLead =>
      'Conte um pouco da empresa. O escritório confirma o plano e explica a forma de pagamento na contratação.';

  @override
  String get fieldName => 'Nome';

  @override
  String get fieldEmail => 'E-mail';

  @override
  String get fieldWhatsApp => 'WhatsApp';

  @override
  String get fieldRazao => 'Razao social';

  @override
  String get fieldCnpj => 'CNPJ';

  @override
  String get tipoLabel => 'Enquadramento';

  @override
  String get tipoMei => 'Microempreendedor Individual (MEI)';

  @override
  String get tipoMe => 'Microempresa (ME)';

  @override
  String get crcLabel => 'Acompanhamento do contador';

  @override
  String get crcYes => 'Com contador ativo (planos contábeis)';

  @override
  String get crcNo => 'Sem contador (autocontabilidade)';

  @override
  String get faixaLabel => 'Faixa';

  @override
  String get extraFolha => 'Folha de pagamento (R\$ 99,99/mês)';

  @override
  String get extraIr => 'Imposto de renda (R\$ 49,99/ano)';

  @override
  String get extraA1 => 'Certificado A1 QualityCert (R\$ 119,99/ano)';

  @override
  String get officeTotalLabel => '';

  @override
  String officeTotalHint(String boleto) => '';

  @override
  String get consentPrefix => 'Li e aceito a ';

  @override
  String get consentLinkLabel => 'politica de privacidade';

  @override
  String get consentSuffix =>
      ' e autorizo o contato sobre honorarios e o app PerfectGest ContabilGest.';

  @override
  String get submitLabel => 'Quero este plano';

  @override
  String get submittingLabel => 'Enviando...';

  @override
  String get successTitle => 'Pedido recebido';

  @override
  String get successBody =>
      'Recebemos o seu pedido. O escritório confirma o plano, explica a forma de pagamento na contratação e avisa quando puder assinar o app. '
      'Você não fica sozinho: suporte e contador habilitado nos planos com acompanhamento.';

  @override
  String get subscribeApp => 'Assinar o app';

  @override
  String get backHome => 'Voltar ao inicio';

  @override
  String get demoTitle => 'Demo do app';

  @override
  String shotCaption(String id) => switch (id) {
        'welcome' => 'Tela inicial: conhecer o app sem pagar',
        'accountant' => 'Planos Contábeis com contador ativo',
        'mei' => 'Básico Microempreendedor Individual (MEI): só o app (autocontabilidade)',
        'tabletNfe' => 'Tablet: emitir NFS-e e painel financeiro',
        'home' => 'Inicio: checklist do mes e saldo',
        'close' => 'Fecho do mes: graficos e Livro Caixa',
        'duties' => 'Obrigacoes e prazos do mes',
        'menu' => 'Menu: IA, conferencia, folha, IR e LGPD',
        'invoices' => 'Resumo de notas fiscais',
        'phoneNfe' => 'Celular: modo demonstracao, emitir NFS-e',
        _ => '',
      };

  @override
  String get faqTitle => 'Perguntas frequentes';

  @override
  List<FunilFaqItem> get faq => const <FunilFaqItem>[
        FunilFaqItem(
          question: 'Isto e um aplicativo do governo?',
          body:
              'Não. É um produto privado da Perfect Gest Dev (CNPJ 66.889.409/0001-19), com sistema de gerenciamento digital por IA e um contador habilitado assinando os livros. Não somos afiliados à Receita Federal, eSocial, FGTS Digital ou prefeituras.',
        ),
        FunilFaqItem(
          question: 'Quando assino na Google Play?',
          body:
              'Depois do escritório confirmar o plano e explicar os próximos passos. Conheça o app primeiro, sem pressa.',
        ),
        FunilFaqItem(
          question: 'O que o app traz de exclusivo?',
          body:
              'NFS-e e NF-e com controle em tempo real, contas a receber e a pagar, pró-labore, lucros, folha, IR, Livro Caixa, assistente IA e suporte. Nos planos com acompanhamento, um contador habilitado assina os livros.',
        ),
        FunilFaqItem(
          question: 'Básico ou planos contábeis com contador ativo?',
          body:
              'Básico Microempreendedor Individual (MEI) é autocontabilidade no app, no seu ritmo. Os planos contábeis com contador ativo incluem o sistema de gerenciamento digital por IA e um contador habilitado assinando os livros. Essencial é o mais escolhido por Microempresa (ME).',
        ),
        FunilFaqItem(
          question: 'Há uma equipe de contabilistas?',
          body:
              'Não. Há um contador habilitado e um sistema inteligente que juntos prestam um serviço ágil e preciso, sem perder nenhuma obrigação, e você acompanha tudo em tempo real no aplicativo.',
        ),
      ];

  @override
  String get footerLegal => 'Politica do app, termos, FAQ do app e privacidade do site.';

  @override
  String get footerCrc =>
      'CRC-RS RS-011403/O · RT Marcos Santos · Caxias do Sul/RS · CNPJ 66.889.409/0001-19';

  @override
  String get honorariosEmail => 'contabilidade@perfectgestdev.com';

  @override
  String get appEmail => kCompanyContactEmail;

  @override
  String get langPt => 'PT';

  @override
  String get langEn => 'EN';

  @override
  String get langEs => 'ES';

  @override
  String get whatsAppFab => 'WhatsApp';

  @override
  String get errorGeneric =>
      'Nao foi possivel enviar agora. Tente de novo ou escreva para contabilidade@perfectgestdev.com.';

  @override
  String errorForCode(String code) => switch (code) {
        'consent_required' => 'Aceite a politica de privacidade para continuar.',
        'name_invalid' => 'Informe um nome valido (minimo 2 caracteres).',
        'email_invalid' => 'Informe um e-mail valido.',
        'whatsapp_invalid' => 'Informe um WhatsApp valido.',
        'razao_invalid' => 'Informe a razao social.',
        'cnpj_invalid' => 'Informe um CNPJ com 14 digitos.',
        'tipo_required' => 'Selecione MEI ou ME.',
        'crc_required' => 'Selecione com ou sem acompanhamento do contador.',
        'faixa_required' => 'Selecione a faixa.',
        'network_error' => 'Sem ligacao a internet. Verifique a conexao e tente de novo.',
        'api_waking' =>
          'O servidor esta a iniciar (pode demorar 1 min). Aguarde e envie de novo.',
        'api_not_deployed' =>
          'Servico temporariamente indisponivel. Escreva para contabilidade@perfectgestdev.com.',
        'api_unavailable' =>
          'Servico temporariamente indisponivel. Tente mais tarde.',
        'api_unconfigured' => 'API nao configurada. Contacte o suporte.',
        _ => errorGeneric,
      };

  @override
  String planName(String id) => switch (id) {
        'mei' => 'Básico Microempreendedor Individual (MEI)',
        'fidelizado' => 'Básico Fidelizado (MEI)',
        'essencial' => 'Planos Contábeis Essencial',
        'standard' => 'Planos Contábeis Intermediário',
        'avancado' => 'Planos Contábeis Avançado',
        _ => id,
      };

  @override
  List<String> planItems(String id) => switch (id) {
        'mei' => const <String>[
            'Para Microempreendedor Individual (MEI)',
            'Autocontabilidade no aplicativo',
            'Livro Caixa',
            'Contas a receber e a pagar',
            'Obrigações do mês',
            'Assistente de inteligência artificial',
            'Emissão de notas fiscais eletrônicas',
            'Até 5 notas fiscais (NFs) por mês',
            'Sem empregados com carteira assinada',
            'Sem contador assinando os livros',
          ],
        'fidelizado' => const <String>[
            'Para Microempreendedor Individual (MEI) que permanece com o escritório',
            'Autocontabilidade no aplicativo',
            'Livro Caixa',
            'Contas a receber e a pagar',
            'Obrigações do mês',
            'Assistente de inteligência artificial',
            'Emissão de notas fiscais eletrônicas',
            'Até 5 notas fiscais (NFs) por mês',
            'Sem empregados com carteira assinada',
            'Sem contador assinando os livros',
          ],
        'essencial' => const <String>[
            'Para Microempresa (ME)',
            'Livro Caixa',
            'Contas a receber e a pagar',
            'Pró-labore',
            'Retirada de lucros',
            'Obrigações do mês',
            'Assistente de inteligência artificial',
            'Emissão de notas fiscais eletrônicas',
            'Contador habilitado confere o mês e assina os livros',
            'Até 10 notas fiscais por mês',
            '0 empregados com carteira assinada neste plano',
            'Suporte do escritório',
          ],
        'standard' => const <String>[
            'Para Microempresa (ME) em crescimento',
            'Livro Caixa',
            'Contas a receber e a pagar',
            'Pró-labore',
            'Retirada de lucros',
            'Obrigações do mês',
            'Assistente de inteligência artificial',
            'Emissão de notas fiscais eletrônicas',
            'Contador habilitado confere o mês e assina os livros',
            'Até 20 notas fiscais por mês',
            'Até 2 empregados com carteira assinada',
            'Suporte do escritório',
          ],
        'avancado' => const <String>[
            'Para Microempresa (ME) com mais movimento',
            'Livro Caixa',
            'Contas a receber e a pagar',
            'Pró-labore',
            'Retirada de lucros',
            'Obrigações do mês',
            'Assistente de inteligência artificial',
            'Emissão de notas fiscais eletrônicas',
            'Contador habilitado confere o mês e assina os livros',
            'Até 30 notas fiscais por mês',
            'Até 4 empregados com carteira assinada',
            'Suporte próximo do escritório',
          ],
        _ => const <String>[],
      };

  @override
  String get colPlan => 'Plano';

  @override
  String get colBoleto => 'Boleto / PIX';

  @override
  String get highlightBadge => 'Mais escolhido por Microempresa (ME)';

  @override
  String get a1Seal => 'A1 QualityCert';
}

class _SiteContabilidadeFunilTextsEn extends SiteContabilidadeFunilTexts {
  const _SiteContabilidadeFunilTextsEn();

  @override
  String get semanticsLabel => 'Accounting fees PerfectGest ContabilGest';

  @override
  String get brandLabel => kProductPerfectGestContabilIName;

  @override
  String get heroHeadline =>
      'Accounting app with AI + active accountant + support. Issue NFS-e and NF-e with full control of invoices issued and received under your CNPJ, in your hand, in real time.';

  @override
  String get heroLead =>
      'All accounting services such as: accounts receivable, accounts payable, owner drawings, profit withdrawals, payroll and income tax.';

  @override
  String get ctaKnowApp => 'Try the app';

  @override
  String get ctaSeePlans => 'See plans';

  @override
  String get ctaChoosePlan => 'I want this plan';

  @override
  String get proofTitle => 'Office with a digital management system in Caxias do Sul, RS';

  @override
  String get proofBody =>
      'PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA serves Individual Microentrepreneurs (MEI) and Microenterprises (ME). '
      'Digital management system with AI, and a licensed accountant signing the official books (PAdES). No 13th salary for the accountant. '
      'This is not a government app: official portals remain the source of tax duties.';

  @override
  String get featuresTitle => 'What the app does';

  @override
  List<String> get features => const <String>[
        'Issue NFS-e and NF-e from your phone, in real time',
        'Full control of invoices issued and received under your CNPJ',
        'Accounts receivable and accounts payable',
        'Owner drawings and profit withdrawals',
        'Payroll and income tax',
        'Cash book and month close on your phone',
        'AI assistant for day-to-day questions',
        'Licensed accountant signing the books on plans with follow-up',
        'Daily routines on the device, with LGPD',
      ];

  @override
  String get stepsTitle => 'How it works';

  @override
  String get stepATitle => 'A. Try the app';

  @override
  String get stepABody =>
      'Explore at no charge: entries, invoices, duties and the AI assistant. No commitment.';

  @override
  String get stepBTitle => 'B. Pick the plan that fits you';

  @override
  String get stepBBody =>
      'Plans for Individual Microentrepreneurs (MEI) and Microenterprises (ME). The office confirms and explains everything calmly.';

  @override
  String get stepCTitle => 'C. Get support and the app on your phone';

  @override
  String get stepCBody =>
      'A digital management system with AI and, on plans with follow-up, a licensed accountant signing the books.';

  @override
  String get plansTitle => 'Plans';

  @override
  String get plansLead =>
      'A clear monthly subscription. No surprises on this page: payment details come when you hire.';

  @override
  String get plansGroupMei => 'Individual Microentrepreneur (MEI) — no accountant follow-up';

  @override
  String get plansGroupMe => 'Microenterprise (ME) — with accountant follow-up';

  @override
  String get playNote => '';

  @override
  String get extrasTitle => 'Add-on';

  @override
  String get extrasBody => '';

  @override
  String get organsNote => '';

  @override
  String get perMonth => 'month';

  @override
  String get a1Price => 'R\$ 119.99/year';

  @override
  String get a1Body =>
      'A1 QualityCert certificate: issue NFS-e and NF-e securely, right in the app.';

  @override
  String get paymentLaterNote =>
      'Payment details are presented when you hire, clearly and without rush.';

  @override
  String get urgencyNote =>
      'We are ready to welcome you. We confirm the plan and next steps as soon as the request arrives.';

  @override
  String get formTitle => 'Choose my plan';

  @override
  String get formLead =>
      'Tell us a little about the company. The office confirms the plan and explains payment when you hire.';

  @override
  String get fieldName => 'Name';

  @override
  String get fieldEmail => 'Email';

  @override
  String get fieldWhatsApp => 'WhatsApp';

  @override
  String get fieldRazao => 'Legal name';

  @override
  String get fieldCnpj => 'CNPJ';

  @override
  String get tipoLabel => 'Company type';

  @override
  String get tipoMei => 'Individual Microentrepreneur (MEI)';

  @override
  String get tipoMe => 'Microenterprise (ME)';

  @override
  String get crcLabel => 'Accountant follow-up';

  @override
  String get crcYes => 'With an active accountant (accounting plans)';

  @override
  String get crcNo => 'Without an accountant (self-accounting)';

  @override
  String get faixaLabel => 'Plan band';

  @override
  String get extraFolha => 'Payroll (R\$ 99.99/month)';

  @override
  String get extraIr => 'Income tax (R\$ 49.99/year)';

  @override
  String get extraA1 => 'A1 QualityCert certificate (R\$ 119.99/year)';

  @override
  String get officeTotalLabel => '';

  @override
  String officeTotalHint(String boleto) => '';

  @override
  String get consentPrefix => 'I have read and accept the ';

  @override
  String get consentLinkLabel => 'privacy policy';

  @override
  String get consentSuffix =>
      ' and I authorize contact about fees and the PerfectGest ContabilGest app.';

  @override
  String get submitLabel => 'I want this plan';

  @override
  String get submittingLabel => 'Sending...';

  @override
  String get successTitle => 'Request received';

  @override
  String get successBody =>
      'We received your request. The office confirms the plan, explains payment when you hire, and tells you when you may subscribe to the app. '
      'You are not alone: support and a licensed accountant on plans with follow-up.';

  @override
  String get subscribeApp => 'Subscribe to the app';

  @override
  String get backHome => 'Back to home';

  @override
  String get demoTitle => 'App demo';

  @override
  String shotCaption(String id) => switch (id) {
        'welcome' => 'Welcome screen: try the app at no charge',
        'accountant' => 'Accounting plans with an active accountant',
        'mei' => 'Basic Individual Microentrepreneur (MEI): app only (self-accounting)',
        'tabletNfe' => 'Tablet: issue NFS-e and financial panel',
        'home' => 'Home: month checklist and balance',
        'close' => 'Month close: charts and cash book',
        'duties' => 'Duties and deadlines for the month',
        'menu' => 'Menu: AI, review, payroll, income tax and LGPD',
        'invoices' => 'Invoice summary',
        'phoneNfe' => 'Phone: demo mode, issue NFS-e',
        _ => '',
      };

  @override
  String get faqTitle => 'Short FAQ';

  @override
  List<FunilFaqItem> get faq => const <FunilFaqItem>[
        FunilFaqItem(
          question: 'Is this a government app?',
          body:
              'No. It is a private product of Perfect Gest Dev (CNPJ 66.889.409/0001-19), with a digital management system with AI and a licensed accountant signing the books. We are not affiliated with the Federal Revenue Service, eSocial, FGTS Digital, or city halls.',
        ),
        FunilFaqItem(
          question: 'When do I subscribe on Google Play?',
          body:
              'After the office confirms your plan and explains the next steps. Explore the app first, with no rush.',
        ),
        FunilFaqItem(
          question: 'What exclusive features does the app bring?',
          body:
              'NFS-e and NF-e with real-time control, accounts receivable and payable, owner drawings, profits, payroll, income tax, cash book, AI assistant and support. On plans with follow-up, a licensed accountant signs the books.',
        ),
        FunilFaqItem(
          question: 'Basic or accounting plans with an active accountant?',
          body:
              'Basic Individual Microentrepreneur (MEI) is self-accounting in the app, at your pace. Accounting plans with an active accountant include the digital management system with AI and a licensed accountant signing the books. Essential is the most chosen plan for Microenterprise (ME).',
        ),
        FunilFaqItem(
          question: 'Is there a team of accountants?',
          body:
              'No. There is one licensed accountant and an intelligent system that together deliver a fast, precise service without missing any duty, and you follow everything in real time in the app.',
        ),
      ];

  @override
  String get footerLegal => 'App policy, terms, app FAQ, and site privacy.';

  @override
  String get footerCrc =>
      'CRC-RS RS-011403/O · RT Marcos Santos · Caxias do Sul/RS · CNPJ 66.889.409/0001-19';

  @override
  String get honorariosEmail => 'contabilidade@perfectgestdev.com';

  @override
  String get appEmail => kCompanyContactEmail;

  @override
  String get langPt => 'PT';

  @override
  String get langEn => 'EN';

  @override
  String get langEs => 'ES';

  @override
  String get whatsAppFab => 'WhatsApp';

  @override
  String get errorGeneric =>
      'Could not send now. Try again or write to contabilidade@perfectgestdev.com.';

  @override
  String errorForCode(String code) => switch (code) {
        'consent_required' => 'Accept the privacy policy to continue.',
        'name_invalid' => 'Enter a valid name (at least 2 characters).',
        'email_invalid' => 'Enter a valid email.',
        'whatsapp_invalid' => 'Enter a valid WhatsApp number.',
        'razao_invalid' => 'Enter the legal name.',
        'cnpj_invalid' => 'Enter a CNPJ with 14 digits.',
        'tipo_required' => 'Select MEI or ME.',
        'crc_required' => 'Select with or without accountant follow-up.',
        'faixa_required' => 'Select a plan band.',
        'network_error' => 'No internet connection. Check the network and try again.',
        'api_waking' => 'The server is starting (up to 1 min). Wait and send again.',
        'api_not_deployed' =>
          'Service temporarily unavailable. Write to contabilidade@perfectgestdev.com.',
        'api_unavailable' => 'Service temporarily unavailable. Try later.',
        'api_unconfigured' => 'API is not configured. Contact support.',
        _ => errorGeneric,
      };

  @override
  String planName(String id) => switch (id) {
        'mei' => 'Basic Individual Microentrepreneur (MEI)',
        'fidelizado' => 'Basic Loyalty (MEI)',
        'essencial' => 'Accounting Plans Essential',
        'standard' => 'Accounting Plans Intermediate',
        'avancado' => 'Accounting Plans Advanced',
        _ => id,
      };

  @override
  List<String> planItems(String id) => switch (id) {
        'mei' => const <String>[
            'For Individual Microentrepreneurs (MEI)',
            'Self-accounting in the app',
            'Cash book',
            'Accounts receivable and payable',
            'Monthly duties',
            'Artificial intelligence assistant',
            'Electronic invoices',
            'Up to 5 invoices (NFs) per month',
            'No employees on the payroll',
            'No accountant signing the books',
          ],
        'fidelizado' => const <String>[
            'For Individual Microentrepreneurs (MEI) who stay with the office',
            'Self-accounting in the app',
            'Cash book',
            'Accounts receivable and payable',
            'Monthly duties',
            'Artificial intelligence assistant',
            'Electronic invoices',
            'Up to 5 invoices (NFs) per month',
            'No employees on the payroll',
            'No accountant signing the books',
          ],
        'essencial' => const <String>[
            'For Microenterprise (ME)',
            'Cash book',
            'Accounts receivable and payable',
            'Owner drawings',
            'Profit withdrawals',
            'Monthly duties',
            'Artificial intelligence assistant',
            'Electronic invoices',
            'Licensed accountant reviews the month and signs the books',
            'Up to 10 invoices per month',
            '0 employees on the payroll in this plan',
            'Office support',
          ],
        'standard' => const <String>[
            'For growing Microenterprise (ME)',
            'Cash book',
            'Accounts receivable and payable',
            'Owner drawings',
            'Profit withdrawals',
            'Monthly duties',
            'Artificial intelligence assistant',
            'Electronic invoices',
            'Licensed accountant reviews the month and signs the books',
            'Up to 20 invoices per month',
            'Up to 2 employees on the payroll',
            'Office support',
          ],
        'avancado' => const <String>[
            'For busier Microenterprise (ME)',
            'Cash book',
            'Accounts receivable and payable',
            'Owner drawings',
            'Profit withdrawals',
            'Monthly duties',
            'Artificial intelligence assistant',
            'Electronic invoices',
            'Licensed accountant reviews the month and signs the books',
            'Up to 30 invoices per month',
            'Up to 4 employees on the payroll',
            'Close office support',
          ],
        _ => const <String>[],
      };

  @override
  String get colPlan => 'Plan';

  @override
  String get colBoleto => 'Boleto / PIX';

  @override
  String get highlightBadge => 'Most chosen by Microenterprise (ME)';

  @override
  String get a1Seal => 'A1 QualityCert';
}

class _SiteContabilidadeFunilTextsEs extends SiteContabilidadeFunilTexts {
  const _SiteContabilidadeFunilTextsEs();

  @override
  String get semanticsLabel => 'Honorarios de contabilidad PerfectGest ContabilGest';

  @override
  String get brandLabel => kProductPerfectGestContabilIName;

  @override
  String get heroHeadline =>
      'Aplicación de contabilidad con IA + Contador activo + Soporte, emisión de NFS-e y NF-e con control total de las NFs emitidas y recibidas por el CNPJ en su mano en tiempo real.';

  @override
  String get heroLead =>
      'Todos los servicios de contabilidad como: cuentas por cobrar, cuentas por pagar, pro-labore, retiro de utilidades, nómina e impuesto de renta.';

  @override
  String get ctaKnowApp => 'Conocer la app';

  @override
  String get ctaSeePlans => 'Ver planes';

  @override
  String get ctaChoosePlan => 'Quiero este plan';

  @override
  String get proofTitle => 'Estudio con sistema de gestión digital en Caxias do Sul/RS';

  @override
  String get proofBody =>
      'PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA atiende Microemprendedor Individual (MEI) y Microempresa (ME). '
      'Sistema de gestión digital con IA, con un contador habilitado que firma los libros oficiales (PAdES). Sin 13er sueldo del contador. '
      'No es una aplicación del gobierno: los portales oficiales siguen siendo la fuente de las obligaciones.';

  @override
  String get featuresTitle => 'Que hace la app';

  @override
  List<String> get features => const <String>[
        'Emisión de NFS-e y NF-e en la palma de la mano, en tiempo real',
        'Control de las notas emitidas y recibidas por el CNPJ',
        'Cuentas por cobrar y cuentas por pagar',
        'Pro-labore y retiro de utilidades',
        'Nómina e impuesto de renta',
        'Libro de caja y cierre del mes en el celular',
        'Asistente IA para dudas del día a día',
        'Contador habilitado que firma los libros en los planes con seguimiento',
        'Rutinas del día a día en el aparato, con LGPD',
      ];

  @override
  String get stepsTitle => 'Como funciona';

  @override
  String get stepATitle => 'A. Conozca la app';

  @override
  String get stepABody =>
      'Explore sin costo: lanzamientos, notas, obligaciones y el asistente IA. Sin compromiso.';

  @override
  String get stepBTitle => 'B. Elija el plan que combina con usted';

  @override
  String get stepBBody =>
      'Planes para Microemprendedor Individual (MEI) y Microempresa (ME). El estudio confirma y explica todo con calma.';

  @override
  String get stepCTitle => 'C. Cuente con soporte y la app en el celular';

  @override
  String get stepCBody =>
      'Sistema de gestión digital con IA y, en los planes con seguimiento, un contador habilitado que firma los libros.';

  @override
  String get plansTitle => 'Planes';

  @override
  String get plansLead =>
      'Suscripción mensual simple. Sin sorpresas en esta página: la forma de pago se combina al contratar.';

  @override
  String get plansGroupMei => 'Microemprendedor Individual (MEI) — sin seguimiento del contador';

  @override
  String get plansGroupMe => 'Microempresa (ME) — con seguimiento del contador';

  @override
  String get playNote => '';

  @override
  String get extrasTitle => 'Add-on';

  @override
  String get extrasBody => '';

  @override
  String get organsNote => '';

  @override
  String get perMonth => 'mes';

  @override
  String get a1Price => 'R\$ 119,99/año';

  @override
  String get a1Body =>
      'Certificado A1 QualityCert: emita NFS-e y NF-e con seguridad, directo en la app.';

  @override
  String get paymentLaterNote =>
      'La forma de pago se presenta al contratar, con claridad y sin prisa.';

  @override
  String get urgencyNote =>
      'Estamos listos para recibirle. Confirmamos el plan y los próximos pasos cuando llegue el pedido.';

  @override
  String get formTitle => 'Elegir mi plan';

  @override
  String get formLead =>
      'Cuéntenos un poco de la empresa. El estudio confirma el plan y explica la forma de pago al contratar.';

  @override
  String get fieldName => 'Nombre';

  @override
  String get fieldEmail => 'Correo';

  @override
  String get fieldWhatsApp => 'WhatsApp';

  @override
  String get fieldRazao => 'Razon social';

  @override
  String get fieldCnpj => 'CNPJ';

  @override
  String get tipoLabel => 'Tipo de empresa';

  @override
  String get tipoMei => 'Microemprendedor Individual (MEI)';

  @override
  String get tipoMe => 'Microempresa (ME)';

  @override
  String get crcLabel => 'Seguimiento del contador';

  @override
  String get crcYes => 'Con contador activo (planes contables)';

  @override
  String get crcNo => 'Sin contador (autocontabilidad)';

  @override
  String get faixaLabel => 'Franja';

  @override
  String get extraFolha => 'Nómina (R\$ 99,99/mes)';

  @override
  String get extraIr => 'Impuesto sobre la renta (R\$ 49,99/año)';

  @override
  String get extraA1 => 'Certificado A1 QualityCert (R\$ 119,99/año)';

  @override
  String get officeTotalLabel => '';

  @override
  String officeTotalHint(String boleto) => '';

  @override
  String get consentPrefix => 'He leido y acepto la ';

  @override
  String get consentLinkLabel => 'politica de privacidad';

  @override
  String get consentSuffix =>
      ' y autorizo el contacto sobre honorarios y la app PerfectGest ContabilGest.';

  @override
  String get submitLabel => 'Quiero este plan';

  @override
  String get submittingLabel => 'Enviando...';

  @override
  String get successTitle => 'Pedido recibido';

  @override
  String get successBody =>
      'Recibimos su pedido. El estudio confirma el plan, explica la forma de pago al contratar y avisa cuando pueda suscribir la app. '
      'No está solo: soporte y contador habilitado en los planes con seguimiento.';

  @override
  String get subscribeApp => 'Suscribir la app';

  @override
  String get backHome => 'Volver al inicio';

  @override
  String get demoTitle => 'Demo de la app';

  @override
  String shotCaption(String id) => switch (id) {
        'welcome' => 'Pantalla inicial: conocer la app sin costo',
        'accountant' => 'Planes contables con contador activo',
        'mei' => 'Básico Microemprendedor Individual (MEI): solo la app (autocontabilidad)',
        'tabletNfe' => 'Tablet: emitir NFS-e y panel financiero',
        'home' => 'Inicio: checklist del mes y saldo',
        'close' => 'Cierre del mes: graficos y libro de caja',
        'duties' => 'Obligaciones y plazos del mes',
        'menu' => 'Menu: IA, revision, nomina, IR y LGPD',
        'invoices' => 'Resumen de notas fiscales',
        'phoneNfe' => 'Celular: modo demostracion, emitir NFS-e',
        _ => '',
      };

  @override
  String get faqTitle => 'Preguntas frecuentes';

  @override
  List<FunilFaqItem> get faq => const <FunilFaqItem>[
        FunilFaqItem(
          question: 'Esto es una aplicacion del gobierno?',
          body:
              'No. Es un producto privado de Perfect Gest Dev (CNPJ 66.889.409/0001-19), con sistema de gestión digital con IA y un contador habilitado que firma los libros. No estamos afiliados a la Receita Federal, eSocial, FGTS Digital ni prefecturas.',
        ),
        FunilFaqItem(
          question: 'Cuando suscribo en Google Play?',
          body:
              'Después de que el estudio confirme el plan y explique los próximos pasos. Conozca la app primero, sin prisa.',
        ),
        FunilFaqItem(
          question: 'Qué trae de exclusivo la app?',
          body:
              'NFS-e y NF-e con control en tiempo real, cuentas por cobrar y por pagar, pro-labore, utilidades, nómina, IR, libro de caja, asistente IA y soporte. En los planes con seguimiento, un contador habilitado firma los libros.',
        ),
        FunilFaqItem(
          question: 'Básico o planes contables con contador activo?',
          body:
              'Básico Microemprendedor Individual (MEI) es autocontabilidad en la app, a su ritmo. Los planes contables con contador activo incluyen el sistema de gestión digital con IA y un contador habilitado que firma los libros. Esencial es el más elegido por Microempresa (ME).',
        ),
        FunilFaqItem(
          question: 'Hay un equipo de contadores?',
          body:
              'No. Hay un contador habilitado y un sistema inteligente que juntos prestan un servicio ágil y preciso, sin perder ninguna obligación, y usted acompaña todo en tiempo real en la aplicación.',
        ),
      ];

  @override
  String get footerLegal => 'Politica de la app, terminos, FAQ de la app y privacidad del sitio.';

  @override
  String get footerCrc =>
      'CRC-RS RS-011403/O · RT Marcos Santos · Caxias do Sul/RS · CNPJ 66.889.409/0001-19';

  @override
  String get honorariosEmail => 'contabilidade@perfectgestdev.com';

  @override
  String get appEmail => kCompanyContactEmail;

  @override
  String get langPt => 'PT';

  @override
  String get langEn => 'EN';

  @override
  String get langEs => 'ES';

  @override
  String get whatsAppFab => 'WhatsApp';

  @override
  String get errorGeneric =>
      'No se pudo enviar ahora. Intente de nuevo o escriba a contabilidade@perfectgestdev.com.';

  @override
  String errorForCode(String code) => switch (code) {
        'consent_required' => 'Acepte la politica de privacidad para continuar.',
        'name_invalid' => 'Indique un nombre valido (minimo 2 caracteres).',
        'email_invalid' => 'Indique un correo valido.',
        'whatsapp_invalid' => 'Indique un WhatsApp valido.',
        'razao_invalid' => 'Indique la razon social.',
        'cnpj_invalid' => 'Indique un CNPJ con 14 digitos.',
        'tipo_required' => 'Seleccione MEI o ME.',
        'crc_required' => 'Seleccione con o sin seguimiento del contador.',
        'faixa_required' => 'Seleccione la franja.',
        'network_error' => 'Sin conexion a internet. Verifique e intente de nuevo.',
        'api_waking' => 'El servidor esta iniciando (puede tardar 1 min). Espere y envie de nuevo.',
        'api_not_deployed' =>
          'Servicio temporalmente no disponible. Escriba a contabilidade@perfectgestdev.com.',
        'api_unavailable' => 'Servicio temporalmente no disponible. Intente mas tarde.',
        'api_unconfigured' => 'API no configurada. Contacte el soporte.',
        _ => errorGeneric,
      };

  @override
  String planName(String id) => switch (id) {
        'mei' => 'Básico Microemprendedor Individual (MEI)',
        'fidelizado' => 'Básico Fidelizado (MEI)',
        'essencial' => 'Planes Contables Esencial',
        'standard' => 'Planes Contables Intermedio',
        'avancado' => 'Planes Contables Avanzado',
        _ => id,
      };

  @override
  List<String> planItems(String id) => switch (id) {
        'mei' => const <String>[
            'Para Microemprendedor Individual (MEI)',
            'Autocontabilidad en la aplicación',
            'Libro de caja',
            'Cuentas por cobrar y por pagar',
            'Obligaciones del mes',
            'Asistente de inteligencia artificial',
            'Notas fiscales electrónicas',
            'Hasta 5 notas fiscales (NFs) por mes',
            'Sin empleados con contrato formal',
            'Sin contador que firme los libros',
          ],
        'fidelizado' => const <String>[
            'Para Microemprendedor Individual (MEI) que permanece con el estudio',
            'Autocontabilidad en la aplicación',
            'Libro de caja',
            'Cuentas por cobrar y por pagar',
            'Obligaciones del mes',
            'Asistente de inteligencia artificial',
            'Notas fiscales electrónicas',
            'Hasta 5 notas fiscales (NFs) por mes',
            'Sin empleados con contrato formal',
            'Sin contador que firme los libros',
          ],
        'essencial' => const <String>[
            'Para Microempresa (ME)',
            'Libro de caja',
            'Cuentas por cobrar y por pagar',
            'Pro-labore',
            'Retiro de utilidades',
            'Obligaciones del mes',
            'Asistente de inteligencia artificial',
            'Notas fiscales electrónicas',
            'Contador habilitado revisa el mes y firma los libros',
            'Hasta 10 notas fiscales por mes',
            '0 empleados con contrato formal en este plan',
            'Soporte del estudio',
          ],
        'standard' => const <String>[
            'Para Microempresa (ME) en crecimiento',
            'Libro de caja',
            'Cuentas por cobrar y por pagar',
            'Pro-labore',
            'Retiro de utilidades',
            'Obligaciones del mes',
            'Asistente de inteligencia artificial',
            'Notas fiscales electrónicas',
            'Contador habilitado revisa el mes y firma los libros',
            'Hasta 20 notas fiscales por mes',
            'Hasta 2 empleados con contrato formal',
            'Soporte del estudio',
          ],
        'avancado' => const <String>[
            'Para Microempresa (ME) con más movimiento',
            'Libro de caja',
            'Cuentas por cobrar y por pagar',
            'Pro-labore',
            'Retiro de utilidades',
            'Obligaciones del mes',
            'Asistente de inteligencia artificial',
            'Notas fiscales electrónicas',
            'Contador habilitado revisa el mes y firma los libros',
            'Hasta 30 notas fiscales por mes',
            'Hasta 4 empleados con contrato formal',
            'Soporte cercano del estudio',
          ],
        _ => const <String>[],
      };

  @override
  String get colPlan => 'Plan';

  @override
  String get colBoleto => 'Boleto / PIX';

  @override
  String get highlightBadge => 'El más elegido por Microempresa (ME)';

  @override
  String get a1Seal => 'A1 QualityCert';
}
