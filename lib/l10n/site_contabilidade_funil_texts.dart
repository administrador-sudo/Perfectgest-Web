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
  String get heroHeadlineEmit;
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
  String get perYear;
  String get colBoletoAvista;
  String get planMeiDesconto;
  String proposalMeiAvista(String annual);
  String proposalNfObsMei(String annual);
  String get a1Price;
  String get a1VideoTitle;
  String get a1Body;
  String get a1BuyCta;
  String get a1PopTitle;
  String a1StepOf(int n, int total);
  String get a1StepTipo;
  String get a1TipoPj;
  String get a1TipoPf;
  String get a1Next;
  String get a1Back;
  String get a1Send;
  String get a1Sending;
  String get comprovanteAnexar;
  String get comprovanteTrocar;
  String get a1FieldCpf;
  String get a1FieldPhone;
  String get a1FieldCep;
  String get a1FieldLogradouro;
  String get a1FieldNumero;
  String get a1FieldBairro;
  String get a1FieldComplemento;
  String get a1FieldCidade;
  String get a1FieldUf;
  String get a1Avisos;
  String get a1Consent;
  String get a1Success;
  String get a1LinkQuality;
  String get a1LinkAr;
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
  String enquadramentoNome(String id);
  String enquadramentoQuadro(String id);
  String get crcLabel;
  String get crcYes;
  String get crcNo;
  String get faixaLabel;
  String get extraFolha;
  String get extraIr;
  String get extraA1;
  String get officeTotalLabel;
  String get itemHonorarios;
  String get itemFolha;
  String get itemA1;
  String get itemIr;
  String officeTotalHint(String items, String monthly);
  String proposalFirstNfBoleto(String items, String amount);
  String get proposalA1Rule;
  String get proposalIrRule;
  String get consentPrefix;
  String get consentLinkLabel;
  String get consentSuffix;
  String get submitLabel;
  String get submittingLabel;
  String get proposalTitle;
  String get proposalSend;
  String get proposalBack;
  String get proposalHonorariosLabel;
  String proposalNfObs(String monthly);
  String get proposalParcelar12;
  String proposalParcelarHint(String monthly);
  String get proposalRenewal;
  String get proposalCancel;
  String get proposalSla;
  String get proposalAceiteCobranca;
  String get successTitle;
  String get successBody;
  String get successPlayNote;
  String successCopyNote(String email);
  String get subscribeApp;
  String get playStoreLinkHint;
  String get backHome;
  String get demoTitle;
  String get zoomHint;
  String shotCaption(String id);
  String get faqTitle;
  List<FunilFaqItem> get faq;
  String get footerLegal;
  String get footerPrivacyApp;
  String get footerTerms;
  String get footerDeletion;
  String get footerFaqApp;
  String get footerPrivacySite;
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
      'Aplicativo de contabilidade com IA + Contador ativo + Suporte,';

  @override
  String get heroHeadlineEmit =>
      'Emissão de NFS-e e NF-e com controle total de NFs emitidas e tomadas pelo CNPJ na sua mão em tempo real.';

  @override
  String get heroLead =>
      'Todos os serviços de contabilidade como: Contas a receber, contas a pagar, Pró-labore, Retirada de lucros, Folha de pagamento e Imposto de renda.';

  @override
  String get ctaKnowApp => 'Conhecer o app';

  @override
  String get ctaSeePlans => 'Ver planos';

  @override
  String get ctaChoosePlan => 'Enviar Cadastro para o escritório';

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
  String get stepATitle => 'A. Escolha o plano nesta página';

  @override
  String get stepABody =>
      'A tabela é de honorários do escritório (boleto/CNPJ).';

  @override
  String get stepBTitle => 'B. Envie o pedido por e-mail';

  @override
  String get stepBBody =>
      'O escritório confirma o plano. Alterações de faixa, extras, upgrade ou downgrade: suporte@perfectgestdev.com.';

  @override
  String get stepCTitle => 'C. Envie o cadastro';

  @override
  String get stepCBody =>
      'O escritório recebe o pedido de honorários e confirma o plano. Depois do cadastro, você baixa o aplicativo para acompanhar a contabilidade em tempo real.';

  @override
  String get plansTitle => 'Planos';

  @override
  String get plansLead =>
      'Honorários do escritório nesta tabela: boleto/CNPJ, combinados na contratação.';

  @override
  String get plansGroupMei => 'Microempreendedor Individual (MEI) — sem acompanhamento do contador';

  @override
  String get plansGroupMe => 'Microempresa (ME) — com acompanhamento do contador';

  @override
  String get playNote =>
      'Planos Contabil+, Básico MEI (12 × R\$ 40,00) e Básico Fidelizado (MEI) à vista R\$ 456,99: honorários nesta página ou suporte@perfectgestdev.com.';

  @override
  String get extrasTitle => 'Extras (boleto CNPJ)';

  @override
  String get extrasBody =>
      'NF extra R\$ 12,99 · CLT extra R\$ 39,99/mês · Folha R\$ 99,99/mês · IR R\$ 49,99/ano · A1 R\$ 119,99/ano · Abertura de ME, SLU, LTDA, EI no Simples Nacional R\$ 490,00 · MEI para ME R\$ 350,00 · Viabilidade (Avaliação de Abertura / alteração) R\$ 100,00.';

  @override
  String get organsNote =>
      'Taxas de órgãos na abertura e na transformação MEI para ME são à parte.';

  @override
  String get perMonth => 'mês';

  @override
  String get perYear => 'ano';

  @override
  String get colBoletoAvista => 'À vista anual';

  @override
  String get planMeiDesconto =>
      '(desconto de R\$ 23,01).';

  @override
  String proposalMeiAvista(String annual) =>
      'Honorários à vista anual: $annual.';

  @override
  String proposalNfObsMei(String annual) =>
      'Uma vez ao ano será emitida uma nota fiscal e um boleto de honorários no valor de $annual.';

  @override
  String get a1Price => 'R\$ 119,99/ano';

  @override
  String get a1VideoTitle => 'Videoconferência 24h';

  @override
  String get a1Body =>
      'Emita ou renove o seu Certificado Digital a qualquer hora e lugar. Na QualityCert, o processo é rápido, simples e seguro, ideal para quem valoriza a praticidade sem abrir mão da proteção.';

  @override
  String get a1BuyCta => 'Adquirir só o certificado A1';

  @override
  String get a1PopTitle => 'Certificado A1 QualityCert';

  @override
  String a1StepOf(int n, int total) => 'Passo $n de $total';

  @override
  String get a1StepTipo => 'Tipo de pessoa';

  @override
  String get a1TipoPj => 'PJ — e-CNPJ';

  @override
  String get a1TipoPf => 'PF — e-CPF';

  @override
  String get a1Next => 'Continuar';

  @override
  String get a1Back => 'Voltar';

  @override
  String get a1Send => 'Enviar cadastro';
  @override
  String get comprovanteAnexar => 'Anexar comprovante de pagamento';
  @override
  String get comprovanteTrocar => 'Trocar comprovante';

  @override
  String get a1Sending => 'Enviando...';

  @override
  String get a1FieldCpf => 'CPF';

  @override
  String get a1FieldPhone => 'Telefone';

  @override
  String get a1FieldCep => 'CEP';

  @override
  String get a1FieldLogradouro => 'Logradouro';

  @override
  String get a1FieldNumero => 'Número';

  @override
  String get a1FieldBairro => 'Bairro';

  @override
  String get a1FieldComplemento => 'Complemento (opcional)';

  @override
  String get a1FieldCidade => 'Cidade';

  @override
  String get a1FieldUf => 'UF';

  @override
  String get a1Avisos =>
      'Pode solicitar para outro titular: o certificado é pessoal ou empresarial e deve estar vinculado ao solicitante.\n'
      'Após o envio, o titular tem 30 dias para a videochamada de habilitação e o download para instalação.\n'
      'Conferência QualityCert: plantão 24 horas, segunda a sexta. A PerfectGest não garante prazos de terceiros.\n'
      'Este cadastro não é o certificado. O arquivo .pfx só nasce na habilitação ICP-Brasil.';

  @override
  String get a1Consent =>
      'Li e aceito a politica de privacidade e autorizo o contato sobre o certificado A1 QualityCert.';

  @override
  String get a1Success =>
      'Solicitação recebida. O escritório entra em contato. A habilitação é na QualityCert.';

  @override
  String get a1LinkQuality => 'Site QualityCert';

  @override
  String get a1LinkAr => 'Conferência AR QualityCert';

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
  String enquadramentoNome(String id) {
    switch (id) {
      case 'mei':
        return 'Plano MEI';
      case 'me':
        return 'Plano ME';
      case 'abertura':
        return 'Abertura de ME, SLU, LTDA, EI no Simples Nacional (R\$ 490,00)';
      case 'transformacao_mei_me':
        return 'Transformação de MEI para ME (R\$ 350,00)';
      case 'viabilidade':
        return 'Viabilidade (Avaliação de Abertura / alteração) (R\$ 100,00)';
      default:
        return id;
    }
  }

  @override
  String enquadramentoQuadro(String id) {
    switch (id) {
      case 'abertura':
        return 'Abertura de ME, SLU, LTDA, EI\nno Simples Nacional (R\$ 490,00)';
      case 'transformacao_mei_me':
        return 'Transformação de MEI para ME\n(R\$ 350,00)';
      case 'viabilidade':
        return 'Viabilidade (Avaliação de Abertura / alteração)\n(R\$ 100,00)';
      default:
        return enquadramentoNome(id);
    }
  }

  @override
  String get crcLabel => 'Acompanhamento do contador';

  @override
  String get crcYes => 'Com contador ativo (planos contábeis)';

  @override
  String get crcNo => 'Sem contador (autocontabilidade)';

  @override
  String get faixaLabel => 'Faixa';

  @override
  String get extraFolha => 'Contador faz a folha (R\$ 99,99/mês)';

  @override
  String get extraIr => 'Imposto de renda (R\$ 49,99/ano)';

  @override
  String get extraA1 => 'Certificado A1 QualityCert (R\$ 119,99/ano)';

  @override
  String get officeTotalLabel => '12 parcelas mensais';

  @override
  String get itemHonorarios => 'Honorários';

  @override
  String get itemFolha => 'Contador faz a folha';

  @override
  String get itemA1 => 'A1';

  @override
  String get itemIr => 'IR';

  @override
  String officeTotalHint(String items, String monthly) =>
      '$items: 12 parcelas de $monthly, com renovação automática.';

  @override
  String proposalFirstNfBoleto(String items, String amount) =>
      'Primeira NF e primeiro boleto: $amount ($items).';

  @override
  String get proposalA1Rule => 'O certificado A1 é renovado em 12 meses.';

  @override
  String get proposalIrRule =>
      'O IR é cobrado no mês do imposto de renda do próximo ano.';

  @override
  String get consentPrefix => 'Li e aceito a ';

  @override
  String get consentLinkLabel => 'politica de privacidade';

  @override
  String get consentSuffix =>
      ' e autorizo o contato sobre honorarios e o app PerfectGest ContabilGest.';

  @override
  String get submitLabel => 'Enviar Cadastro para o Escritório';

  @override
  String get submittingLabel => 'Enviando...';

  @override
  String get proposalTitle => 'Resumo da proposta';

  @override
  String get proposalSend => 'Enviar a proposta para o escritório';

  @override
  String get proposalBack => 'Voltar ao formulário';

  @override
  String get proposalHonorariosLabel => 'Honorários no boleto CNPJ';

  @override
  String proposalNfObs(String monthly) =>
      'Nos meses Subsequentes será emitida uma nota fiscal e um boleto de honorários no valor de $monthly.';

  @override
  String get proposalParcelar12 => 'Parcelar honorários em 12 vezes';

  @override
  String proposalParcelarHint(String monthly) =>
      '12 parcelas de $monthly, com renovação automática.';

  @override
  String get proposalRenewal => 'O plano de honorários tem renovação automática.';

  @override
  String get proposalCancel =>
      'Para cancelar, avise com 30 dias de antecedência para interromper a cobrança. Sem esse aviso, cobra-se o proporcional até o dia em que cessarem os serviços.';

  @override
  String get proposalSla => 'O escritório responde em 1 dia útil.';

  @override
  String get proposalAceiteCobranca =>
      'Ao enviar esta ficha, você estará aceitando a cobrança.';

  @override
  String get successTitle => 'Envio realizado com sucesso';

  @override
  String get successBody =>
      'Cadastro recebido. O escritório confirma o plano de honorários. \nBaixe o ContabilGest na Google Play (Assinatura R\$ 19,99/mês): \nÉ a ferramenta de conexão necessária para realizar e acompanhar a contabilidade em tempo real.';

  @override
  String get successPlayNote =>
      'Na Google Play: R\$ 19,99/mês ou pagamento à vista R\$ 239,88.';

  @override
  String successCopyNote(String email) =>
      'Enviamos uma cópia deste cadastro para $email.';

  @override
  String get subscribeApp => 'Baixar o app na Play Store';

  @override
  String get playStoreLinkHint => 'Link da Play Store (ferramenta exclusiva do escritório):';

  @override
  String get backHome => 'Voltar ao inicio';

  @override
  String get demoTitle => 'Demo do app';

  @override
  String get zoomHint => 'Pinça ou use a roda do mouse para ampliar. Toque fora para fechar.';

  @override
  String shotCaption(String id) => switch (id) {
        'welcome' => 'Tela inicial: conhecer o app sem pagar',
        'accountant' => 'Planos Contábeis com contador ativo',
        'mei' => 'Básico Microempreendedor Individual (MEI): só o app (autocontabilidade)',
        'fidelizado' => 'Básico Fidelizado (MEI): à vista anual com desconto',
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
          question: 'Como funciona o contrato de honorários?',
          body:
              'O pedido é o contrato de honorários do escritório (boleto/CNPJ). Depois do cadastro, você baixa o aplicativo na Google Play para acompanhar a contabilidade em tempo real.',
        ),
        FunilFaqItem(
          question: 'O que o app traz de exclusivo?',
          body:
              'NFS-e e NF-e com controle em tempo real, contas a receber e a pagar, pró-labore, lucros, folha, IR, Livro Caixa, assistente IA e suporte. O app transmite os dados ao escritório (CRC) quando habilitado. Nos planos com acompanhamento, um contador habilitado assina os livros.',
        ),
        FunilFaqItem(
          question: 'Básico ou planos contábeis com contador ativo?',
          body:
              'Básico Microempreendedor Individual (MEI): 12 parcelas de R\$ 40,00. Básico Fidelizado (MEI): à vista anual R\$ 456,99, desconto de R\$ 23,01). Autocontabilidade no app. Planos com contador ativo: sistema com IA e contador habilitado assinando os livros. Essencial é o mais escolhido por ME. Mudança de plano: suporte@perfectgestdev.com.',
        ),
        FunilFaqItem(
          question: 'Quem cuida da contabilidade?',
          body:
              'Há um Programador/Contador certificado que trabalhao com um sistema fechado de IA ativa que auxilia na solução dos problemas e cuida das obrigalções.\nVocê acompanha no aplicativo em tempo real, os dados da sua contabilidade são processados no seu tele-movel, \n No dia 01 você envia para conferência os livros, esses livros são checados eletronicamente por meio de inteligencia artifivial em um circuito fechado, em seguida é devolvido os livros assinados para você arquivar.',
        ),
      ];

  @override
  String get footerLegal => 'Politica do app, termos, exclusao de dados, FAQ do app e privacidade do site.';

  @override
  String get footerPrivacyApp => 'Politica de privacidade';

  @override
  String get footerTerms => 'Termos de uso';

  @override
  String get footerDeletion => 'Exclusao de dados';

  @override
  String get footerFaqApp => 'FAQ';

  @override
  String get footerPrivacySite => 'Privacidade site';

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
        'tipo_pessoa_invalid' => 'Selecione PJ (e-CNPJ) ou PF (e-CPF).',
        'cpf_invalid' => 'Informe um CPF com 11 digitos.',
        'telefone_invalid' => 'Informe um telefone com 10 ou 11 digitos.',
        'cep_invalid' => 'Informe um CEP com 8 digitos.',
        'logradouro_invalid' => 'Informe o logradouro.',
        'numero_invalid' => 'Informe o numero.',
        'bairro_invalid' => 'Informe o bairro.',
        'cidade_invalid' => 'Informe a cidade.',
        'estado_invalid' => 'Informe a UF com 2 letras.',
        'file_too_large' => 'O comprovante deve ter no maximo 2 MB.',
        'file_type' => 'Use PDF, JPG ou PNG.',
        'network_error' =>
          'Nao foi possivel enviar o cadastro ao escritorio. Tente de novo; se estiver em 127.0.0.1, a Function Firebase precisa permitir essa origem.',
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
            'Honorários em 12 parcelas de R\$ 40,00',
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
            'Para Microempreendedor Individual (MEI)',
            'Honorários à vista anual R\$ 456,99 (12 × R\$ 40,00 = R\$ 480,00, desconto de R\$ 23,01)',
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
  String get colBoleto => 'Boleto CNPJ';

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
      'Accounting app with AI + active accountant + support.';

  @override
  String get heroHeadlineEmit =>
      'Issue NFS-e and NF-e with full control of invoices issued and received under your CNPJ, in your hand, in real time.';

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
  String get stepATitle => 'A. Choose the plan on this page';

  @override
  String get stepABody =>
      'The table is office fees (boleto/CNPJ).';

  @override
  String get stepBTitle => 'B. Send the request by email';

  @override
  String get stepBBody =>
      'The office confirms the plan. Band changes, add-ons, upgrade or downgrade: suporte@perfectgestdev.com.';

  @override
  String get stepCTitle => 'C. Send the registration';

  @override
  String get stepCBody =>
      'The office receives the fee request and confirms the plan. After registration, you download the app to follow your accounting in real time.';

  @override
  String get plansTitle => 'Plans';

  @override
  String get plansLead =>
      'Office fees in this table: boleto/CNPJ, agreed when you hire.';

  @override
  String get plansGroupMei => 'Individual Microentrepreneur (MEI) — no accountant follow-up';

  @override
  String get plansGroupMe => 'Microenterprise (ME) — with accountant follow-up';

  @override
  String get playNote =>
      'Contabil+, Basic MEI (12 × R\$ 40.00) and Basic Loyalty (MEI) cash R\$ 456.99: fees on this page or suporte@perfectgestdev.com.';

  @override
  String get extrasTitle => 'Extras (CNPJ boleto)';

  @override
  String get extrasBody =>
      'Extra invoice R\$ 12.99 · Extra CLT R\$ 39.99/month · Payroll R\$ 99.99/month · Income tax R\$ 49.99/year · A1 R\$ 119.99/year · Company opening R\$ 490.00 · MEI to ME R\$ 350.00 · Viability (opening / change review) R\$ 100.00.';

  @override
  String get organsNote =>
      'Government fees for company opening and MEI-to-ME conversion are extra.';

  @override
  String get perMonth => 'month';

  @override
  String get perYear => 'year';

  @override
  String get colBoletoAvista => 'Annual cash';

  @override
  String get planMeiDesconto =>
      '12 × R\$ 40.00 = R\$ 480.00. Cash R\$ 456.99 (R\$ 23.01 off).';

  @override
  String proposalMeiAvista(String annual) =>
      'Annual cash fees: $annual.';

  @override
  String proposalNfObsMei(String annual) =>
      'Once a year a tax invoice and a fee boleto will be issued in the amount of $annual.';

  @override
  String get a1Price => 'R\$ 119.99/year';

  @override
  String get a1VideoTitle => 'Video conference 24h';

  @override
  String get a1Body =>
      'Issue or renew your digital certificate anytime, anywhere. At QualityCert the process is fast, simple and secure, for those who value convenience without giving up protection.';

  @override
  String get a1BuyCta => 'Get only the A1 certificate';

  @override
  String get a1PopTitle => 'A1 QualityCert certificate';

  @override
  String a1StepOf(int n, int total) => 'Step $n of $total';

  @override
  String get a1StepTipo => 'Person type';

  @override
  String get a1TipoPj => 'Company — e-CNPJ';

  @override
  String get a1TipoPf => 'Individual — e-CPF';

  @override
  String get a1Next => 'Continue';

  @override
  String get a1Back => 'Back';

  @override
  String get a1Send => 'Send registration';
  @override
  String get comprovanteAnexar => 'Attach payment receipt';
  @override
  String get comprovanteTrocar => 'Replace receipt';

  @override
  String get a1Sending => 'Sending...';

  @override
  String get a1FieldCpf => 'CPF';

  @override
  String get a1FieldPhone => 'Phone';

  @override
  String get a1FieldCep => 'Postal code';

  @override
  String get a1FieldLogradouro => 'Street';

  @override
  String get a1FieldNumero => 'Number';

  @override
  String get a1FieldBairro => 'District';

  @override
  String get a1FieldComplemento => 'Complement (optional)';

  @override
  String get a1FieldCidade => 'City';

  @override
  String get a1FieldUf => 'State (UF)';

  @override
  String get a1Avisos =>
      'You may request for another holder: the certificate is personal or corporate and must be tied to the applicant.\n'
      'After sending, the holder has 30 days for the enablement video call and the download.\n'
      'QualityCert conference: 24-hour desk, Monday to Friday. PerfectGest does not guarantee third-party deadlines.\n'
      'This form is not the certificate. The .pfx file is created only at ICP-Brasil enablement.';

  @override
  String get a1Consent =>
      'I have read the privacy policy and authorize contact about the A1 QualityCert certificate.';

  @override
  String get a1Success =>
      'Request received. The office will contact you. Enablement is at QualityCert.';

  @override
  String get a1LinkQuality => 'QualityCert website';

  @override
  String get a1LinkAr => 'QualityCert AR conference';

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
  String get tipoLabel => 'Classification';

  @override
  String get tipoMei => 'Individual Microentrepreneur (MEI)';

  @override
  String get tipoMe => 'Microenterprise (ME)';

  @override
  String enquadramentoNome(String id) {
    switch (id) {
      case 'mei':
        return 'MEI plan';
      case 'me':
        return 'ME plan';
      case 'abertura':
        return 'Company opening (R\$ 490.00)';
      case 'transformacao_mei_me':
        return 'MEI to ME conversion (R\$ 350.00)';
      case 'viabilidade':
        return 'Viability (opening / change review) (R\$ 100.00)';
      default:
        return id;
    }
  }

  @override
  String enquadramentoQuadro(String id) {
    switch (id) {
      case 'abertura':
        return 'Company opening\n(R\$ 490.00)';
      case 'transformacao_mei_me':
        return 'MEI to ME conversion\n(R\$ 350.00)';
      case 'viabilidade':
        return 'Viability (opening / change review)\n(R\$ 100.00)';
      default:
        return enquadramentoNome(id);
    }
  }

  @override
  String get crcLabel => 'Accountant follow-up';

  @override
  String get crcYes => 'With an active accountant (accounting plans)';

  @override
  String get crcNo => 'Without an accountant (self-accounting)';

  @override
  String get faixaLabel => 'Plan band';

  @override
  String get extraFolha => 'Accountant runs payroll (R\$ 99.99/month)';

  @override
  String get extraIr => 'Income tax (R\$ 49.99/year)';

  @override
  String get extraA1 => 'A1 QualityCert certificate (R\$ 119.99/year)';

  @override
  String get officeTotalLabel => '12 monthly installments';

  @override
  String get itemHonorarios => 'Fees';

  @override
  String get itemFolha => 'Accountant runs payroll';

  @override
  String get itemA1 => 'A1';

  @override
  String get itemIr => 'Income tax';

  @override
  String officeTotalHint(String items, String monthly) =>
      '$items: 12 installments of $monthly, with automatic renewal.';

  @override
  String proposalFirstNfBoleto(String items, String amount) =>
      'First tax invoice and first boleto: $amount ($items).';

  @override
  String get proposalA1Rule => 'The A1 certificate is renewed every 12 months.';

  @override
  String get proposalIrRule =>
      'Income tax is charged in the income-tax month of the following year.';

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
  String get proposalTitle => 'Proposal summary';

  @override
  String get proposalSend => 'Send the proposal to the office';

  @override
  String get proposalBack => 'Back to the form';

  @override
  String get proposalHonorariosLabel => 'Fees on CNPJ boleto';

  @override
  String proposalNfObs(String monthly) =>
      'Every month a tax invoice and a fee boleto will be issued in the amount of $monthly.';

  @override
  String get proposalParcelar12 => 'Pay fees in 12 installments';

  @override
  String proposalParcelarHint(String monthly) =>
      '12 installments of $monthly, with automatic renewal.';

  @override
  String get proposalRenewal => 'The accounting-fee plan renews automatically.';

  @override
  String get proposalCancel =>
      'To cancel, give 30 days\' notice so billing can stop. Without that notice, charges run proportionally until the day services end.';

  @override
  String get proposalSla => 'The office replies within 1 business day.';

  @override
  String get proposalAceiteCobranca =>
      'By sending this form, you accept the charges.';

  @override
  String get successTitle => 'Submission completed successfully';

  @override
  String get successBody =>
      'Registration received. The office confirms the fee plan. Download ContabilGest on Google Play: it is the connection tool to follow your accounting in real time.';

  @override
  String get successPlayNote =>
      'On Google Play: R\$ 19.99/month or a one-time payment of R\$ 239.88.';

  @override
  String successCopyNote(String email) =>
      'We sent a copy of this registration to $email.';

  @override
  String get subscribeApp => 'Download the app on Play Store';

  @override
  String get playStoreLinkHint => 'Play Store link (exclusive office tool):';

  @override
  String get backHome => 'Back to home';

  @override
  String get demoTitle => 'App demo';

  @override
  String get zoomHint => 'Pinch or use the mouse wheel to zoom. Tap outside to close.';

  @override
  String shotCaption(String id) => switch (id) {
        'welcome' => 'Welcome screen: try the app at no charge',
        'accountant' => 'Accounting plans with an active accountant',
        'mei' => 'Basic Individual Microentrepreneur (MEI): app only (self-accounting)',
        'fidelizado' => 'Basic Loyalty (MEI): annual cash with discount',
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
          question: 'How does the fee contract work?',
          body:
              'The request is the office fee contract (boleto/CNPJ). After registration, you download the app on Google Play to follow your accounting in real time.',
        ),
        FunilFaqItem(
          question: 'What exclusive features does the app bring?',
          body:
              'NFS-e and NF-e with real-time control, accounts receivable and payable, owner drawings, profits, payroll, income tax, cash book, AI assistant and support. The app transmits data to the office (CRC) when enabled. On plans with follow-up, a licensed accountant signs the books.',
        ),
        FunilFaqItem(
          question: 'Basic or accounting plans with an active accountant?',
          body:
              'Basic Individual Microentrepreneur (MEI): 12 installments of R\$ 40.00. Basic Loyalty (MEI): annual cash R\$ 456.99 (12 × R\$ 40.00 = R\$ 480.00, R\$ 23.01 off). Self-accounting in the app. Plans with an active accountant: AI system and a licensed accountant signing the books. Essential is the most chosen plan for ME. Plan changes: suporte@perfectgestdev.com.',
        ),
        FunilFaqItem(
          question: 'Is there a team of accountants?',
          body:
              'No. There is one licensed accountant and an intelligent system; you follow everything in the app in real time (once enabled, the data reaches the office).',
        ),
      ];

  @override
  String get footerLegal => 'App policy, terms, data deletion, app FAQ, and site privacy.';

  @override
  String get footerPrivacyApp => 'Privacy policy';

  @override
  String get footerTerms => 'Terms of use';

  @override
  String get footerDeletion => 'Data deletion';

  @override
  String get footerFaqApp => 'FAQ';

  @override
  String get footerPrivacySite => 'Site privacy';

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
        'tipo_pessoa_invalid' => 'Select company (e-CNPJ) or individual (e-CPF).',
        'cpf_invalid' => 'Enter an 11-digit CPF.',
        'telefone_invalid' => 'Enter a phone with 10 or 11 digits.',
        'cep_invalid' => 'Enter an 8-digit postal code.',
        'logradouro_invalid' => 'Enter the street.',
        'numero_invalid' => 'Enter the number.',
        'bairro_invalid' => 'Enter the district.',
        'cidade_invalid' => 'Enter the city.',
        'estado_invalid' => 'Enter a 2-letter state code.',
        'file_too_large' => 'The receipt must be 2 MB or smaller.',
        'file_type' => 'Use PDF, JPG or PNG.',
        'network_error' =>
          'Could not send the registration. Try again; on 127.0.0.1 the Firebase Function must allow that origin.',
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
            'Fees in 12 installments of R\$ 40.00',
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
            'For Individual Microentrepreneurs (MEI)',
            'Annual cash fees R\$ 456.99 (12 × R\$ 40.00 = R\$ 480.00, R\$ 23.01 off)',
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
  String get colBoleto => 'CNPJ boleto';

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
      'Aplicación de contabilidad con IA + Contador activo + Soporte,';

  @override
  String get heroHeadlineEmit =>
      'Emisión de NFS-e y NF-e con control total de las NFs emitidas y recibidas por el CNPJ en su mano en tiempo real.';

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
  String get stepATitle => 'A. Elija el plan en esta página';

  @override
  String get stepABody =>
      'La tabla es de honorarios del despacho (boleto/CNPJ).';

  @override
  String get stepBTitle => 'B. Envíe el pedido por correo';

  @override
  String get stepBBody =>
      'El despacho confirma el plan. Cambios de franja, extras, upgrade o downgrade: suporte@perfectgestdev.com.';

  @override
  String get stepCTitle => 'C. Envíe el registro';

  @override
  String get stepCBody =>
      'El despacho recibe el pedido de honorarios y confirma el plan. Después del registro, usted descarga la aplicación para seguir la contabilidad en tiempo real.';

  @override
  String get plansTitle => 'Planes';

  @override
  String get plansLead =>
      'Honorarios del despacho en esta tabla: boleto/CNPJ, combinados al contratar.';

  @override
  String get plansGroupMei => 'Microemprendedor Individual (MEI) — sin seguimiento del contador';

  @override
  String get plansGroupMe => 'Microempresa (ME) — con seguimiento del contador';

  @override
  String get playNote =>
      'Planes Contabil+, Básico MEI (12 × R\$ 40,00) y Básico Fidelizado (MEI) al contado R\$ 456,99: honorarios en esta página o suporte@perfectgestdev.com.';

  @override
  String get extrasTitle => 'Extras (boleto CNPJ)';

  @override
  String get extrasBody =>
      'NF extra R\$ 12,99 · CLT extra R\$ 39,99/mes · Nómina R\$ 99,99/mes · IR R\$ 49,99/año · A1 R\$ 119,99/año · Apertura de empresa R\$ 490,00 · MEI a ME R\$ 350,00 · Viabilidad (evaluación de apertura / alteración) R\$ 100,00.';

  @override
  String get organsNote =>
      'Las tasas de organismos en la apertura y en la transformación MEI a ME van aparte.';

  @override
  String get perMonth => 'mes';

  @override
  String get perYear => 'año';

  @override
  String get colBoletoAvista => 'Al contado anual';

  @override
  String get planMeiDesconto =>
      '12 × R\$ 40,00 = R\$ 480,00. Al contado R\$ 456,99 (descuento de R\$ 23,01).';

  @override
  String proposalMeiAvista(String annual) =>
      'Honorarios al contado anual: $annual.';

  @override
  String proposalNfObsMei(String annual) =>
      'Una vez al año se emitirá una nota fiscal y un boleto de honorarios por el valor de $annual.';

  @override
  String get a1Price => 'R\$ 119,99/año';

  @override
  String get a1VideoTitle => 'Videoconferencia 24h';

  @override
  String get a1Body =>
      'Emita o renueve su Certificado Digital a cualquier hora y lugar. En QualityCert el proceso es rápido, simple y seguro, ideal para quien valora la practicidad sin renunciar a la protección.';

  @override
  String get a1BuyCta => 'Adquirir solo el certificado A1';

  @override
  String get a1PopTitle => 'Certificado A1 QualityCert';

  @override
  String a1StepOf(int n, int total) => 'Paso $n de $total';

  @override
  String get a1StepTipo => 'Tipo de persona';

  @override
  String get a1TipoPj => 'PJ — e-CNPJ';

  @override
  String get a1TipoPf => 'PF — e-CPF';

  @override
  String get a1Next => 'Continuar';

  @override
  String get a1Back => 'Volver';

  @override
  String get a1Send => 'Enviar registro';
  @override
  String get comprovanteAnexar => 'Adjuntar comprobante de pago';
  @override
  String get comprovanteTrocar => 'Cambiar comprobante';

  @override
  String get a1Sending => 'Enviando...';

  @override
  String get a1FieldCpf => 'CPF';

  @override
  String get a1FieldPhone => 'Teléfono';

  @override
  String get a1FieldCep => 'CEP';

  @override
  String get a1FieldLogradouro => 'Calle';

  @override
  String get a1FieldNumero => 'Número';

  @override
  String get a1FieldBairro => 'Barrio';

  @override
  String get a1FieldComplemento => 'Complemento (opcional)';

  @override
  String get a1FieldCidade => 'Ciudad';

  @override
  String get a1FieldUf => 'UF';

  @override
  String get a1Avisos =>
      'Puede solicitar para otro titular: el certificado es personal o empresarial y debe estar vinculado al solicitante.\n'
      'Tras el envío, el titular tiene 30 días para la videollamada de habilitación y la descarga.\n'
      'Conferencia QualityCert: plantón 24 horas, lunes a viernes. PerfectGest no garantiza plazos de terceros.\n'
      'Este registro no es el certificado. El archivo .pfx nace solo en la habilitación ICP-Brasil.';

  @override
  String get a1Consent =>
      'Leí y acepto la politica de privacidad y autorizo el contacto sobre el certificado A1 QualityCert.';

  @override
  String get a1Success =>
      'Solicitud recibida. El despacho entra en contacto. La habilitación es en QualityCert.';

  @override
  String get a1LinkQuality => 'Sitio QualityCert';

  @override
  String get a1LinkAr => 'Conferencia AR QualityCert';

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
  String get tipoLabel => 'Encuadramiento';

  @override
  String get tipoMei => 'Microemprendedor Individual (MEI)';

  @override
  String get tipoMe => 'Microempresa (ME)';

  @override
  String enquadramentoNome(String id) {
    switch (id) {
      case 'mei':
        return 'Plan MEI';
      case 'me':
        return 'Plan ME';
      case 'abertura':
        return 'Apertura de empresa (R\$ 490,00)';
      case 'transformacao_mei_me':
        return 'Transformación de MEI a ME (R\$ 350,00)';
      case 'viabilidade':
        return 'Viabilidad (evaluación de apertura / alteración) (R\$ 100,00)';
      default:
        return id;
    }
  }

  @override
  String enquadramentoQuadro(String id) {
    switch (id) {
      case 'abertura':
        return 'Apertura de empresa\n(R\$ 490,00)';
      case 'transformacao_mei_me':
        return 'Transformación de MEI a ME\n(R\$ 350,00)';
      case 'viabilidade':
        return 'Viabilidad (evaluación de apertura / alteración)\n(R\$ 100,00)';
      default:
        return enquadramentoNome(id);
    }
  }

  @override
  String get crcLabel => 'Seguimiento del contador';

  @override
  String get crcYes => 'Con contador activo (planes contables)';

  @override
  String get crcNo => 'Sin contador (autocontabilidad)';

  @override
  String get faixaLabel => 'Franja';

  @override
  String get extraFolha => 'El contador hace la nómina (R\$ 99,99/mes)';

  @override
  String get extraIr => 'Impuesto sobre la renta (R\$ 49,99/año)';

  @override
  String get extraA1 => 'Certificado A1 QualityCert (R\$ 119,99/año)';

  @override
  String get officeTotalLabel => '12 cuotas mensuales';

  @override
  String get itemHonorarios => 'Honorarios';

  @override
  String get itemFolha => 'El contador hace la nómina';

  @override
  String get itemA1 => 'A1';

  @override
  String get itemIr => 'IR';

  @override
  String officeTotalHint(String items, String monthly) =>
      '$items: 12 cuotas de $monthly, con renovación automática.';

  @override
  String proposalFirstNfBoleto(String items, String amount) =>
      'Primera NF y primer boleto: $amount ($items).';

  @override
  String get proposalA1Rule => 'El certificado A1 se renueva a los 12 meses.';

  @override
  String get proposalIrRule =>
      'El IR se cobra en el mes del impuesto sobre la renta del año siguiente.';

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
  String get proposalTitle => 'Resumen de la propuesta';

  @override
  String get proposalSend => 'Enviar la propuesta al despacho';

  @override
  String get proposalBack => 'Volver al formulario';

  @override
  String get proposalHonorariosLabel => 'Honorarios en boleto CNPJ';

  @override
  String proposalNfObs(String monthly) =>
      'Cada mes se emitirá una nota fiscal y un boleto de honorarios por el valor de $monthly.';

  @override
  String get proposalParcelar12 => 'Parcelar honorarios en 12 veces';

  @override
  String proposalParcelarHint(String monthly) =>
      '12 cuotas de $monthly, con renovación automática.';

  @override
  String get proposalRenewal => 'El plan de honorarios se renueva automáticamente.';

  @override
  String get proposalCancel =>
      'Para cancelar, avise con 30 días de antelación para interrumpir el cobro. Sin ese aviso, se cobra lo proporcional hasta el día en que cesen los servicios.';

  @override
  String get proposalSla => 'El despacho responde en 1 día hábil.';

  @override
  String get proposalAceiteCobranca =>
      'Al enviar esta ficha, usted estará aceptando el cobro.';

  @override
  String get successTitle => 'Envío realizado con éxito';

  @override
  String get successBody =>
      'Registro recibido. El despacho confirma el plan de honorarios. Descargue ContabilGest en Google Play: es la herramienta de conexión para seguir la contabilidad en tiempo real.';

  @override
  String get successPlayNote =>
      'En Google Play: R\$ 19,99/mes o pago único de R\$ 239,88.';

  @override
  String successCopyNote(String email) =>
      'Enviamos una copia de este registro a $email.';

  @override
  String get subscribeApp => 'Descargar la app en Play Store';

  @override
  String get playStoreLinkHint => 'Enlace de Play Store (herramienta exclusiva del despacho):';

  @override
  String get backHome => 'Volver al inicio';

  @override
  String get demoTitle => 'Demo de la app';

  @override
  String get zoomHint => 'Pellizque o use la rueda del ratón para ampliar. Toque fuera para cerrar.';

  @override
  String shotCaption(String id) => switch (id) {
        'welcome' => 'Pantalla inicial: conocer la app sin costo',
        'accountant' => 'Planes contables con contador activo',
        'mei' => 'Básico Microemprendedor Individual (MEI): solo la app (autocontabilidad)',
        'fidelizado' => 'Básico Fidelizado (MEI): al contado anual con descuento',
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
          question: 'Cómo funciona el contrato de honorarios?',
          body:
              'El pedido es el contrato de honorarios del despacho (boleto/CNPJ). Después del registro, usted descarga la aplicación en Google Play para seguir la contabilidad en tiempo real.',
        ),
        FunilFaqItem(
          question: 'Qué trae de exclusivo la app?',
          body:
              'NFS-e y NF-e con control en tiempo real, cuentas por cobrar y por pagar, pro-labore, utilidades, nómina, IR, libro de caja, asistente IA y soporte. La app transmite los datos al despacho (CRC) cuando está habilitada. En los planes con seguimiento, un contador habilitado firma los libros.',
        ),
        FunilFaqItem(
          question: 'Básico o planes contables con contador activo?',
          body:
              'Básico Microemprendedor Individual (MEI): 12 cuotas de R\$ 40,00. Básico Fidelizado (MEI): al contado anual R\$ 456,99 (12 × R\$ 40,00 = R\$ 480,00, descuento de R\$ 23,01). Autocontabilidad en la app. Planes con contador activo: sistema con IA y contador habilitado que firma los libros. Esencial es el más elegido por ME. Cambio de plan: suporte@perfectgestdev.com.',
        ),
        FunilFaqItem(
          question: 'Hay un equipo de contadores?',
          body:
              'No. Hay un contador habilitado y un sistema inteligente; usted acompaña en la aplicación en tiempo real (con la habilitación, los datos llegan al despacho).',
        ),
      ];

  @override
  String get footerLegal => 'Politica de la app, terminos, eliminacion de datos, FAQ de la app y privacidad del sitio.';

  @override
  String get footerPrivacyApp => 'Politica de privacidad';

  @override
  String get footerTerms => 'Terminos de uso';

  @override
  String get footerDeletion => 'Eliminacion de datos';

  @override
  String get footerFaqApp => 'FAQ';

  @override
  String get footerPrivacySite => 'Privacidad del sitio';

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
        'tipo_pessoa_invalid' => 'Seleccione PJ (e-CNPJ) o PF (e-CPF).',
        'cpf_invalid' => 'Indique un CPF con 11 digitos.',
        'telefone_invalid' => 'Indique un telefono con 10 o 11 digitos.',
        'cep_invalid' => 'Indique un CEP con 8 digitos.',
        'logradouro_invalid' => 'Indique la calle.',
        'numero_invalid' => 'Indique el numero.',
        'bairro_invalid' => 'Indique el barrio.',
        'cidade_invalid' => 'Indique la ciudad.',
        'estado_invalid' => 'Indique la UF con 2 letras.',
        'file_too_large' => 'El comprobante debe tener como maximo 2 MB.',
        'file_type' => 'Use PDF, JPG o PNG.',
        'network_error' =>
          'No se pudo enviar el registro. Intente de nuevo; en 127.0.0.1 la Function de Firebase debe permitir ese origen.',
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
            'Honorarios en 12 cuotas de R\$ 40,00',
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
            'Para Microemprendedor Individual (MEI)',
            'Honorarios al contado anual R\$ 456,99 (12 × R\$ 40,00 = R\$ 480,00, descuento de R\$ 23,01)',
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
  String get colBoleto => 'Boleto CNPJ';

  @override
  String get highlightBadge => 'El más elegido por Microempresa (ME)';

  @override
  String get a1Seal => 'A1 QualityCert';
}
