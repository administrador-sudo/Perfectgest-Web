// Implementacao manual de AppLocalizations.
//
// As chaves espelham os ficheiros `app_pt.arb`, `app_en.arb` e `app_es.arb`
// (fonte da verdade textual). Quando passarmos dos ~30/40 chaves, considerar
// migrar para o codegen oficial via `flutter gen-l10n` (recriar `l10n.yaml`
// com `arb-dir`/`template-arb-file` e adicionar `generate: true` em
// `pubspec.yaml`).
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class AppLocalizations {
  const AppLocalizations(this.localeName);

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    final l = Localizations.of<AppLocalizations>(context, AppLocalizations);
    assert(l != null, 'AppLocalizations nao foi instalado em MaterialApp.localizationsDelegates.');
    return l!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = <Locale>[
    Locale('pt'),
    Locale('en'),
    Locale('es'),
  ];

  // ---- Selector de idioma (Fase 1) ----
  String get languageMenuTooltip;
  String get languageNamePortuguese;
  String get languageNameEnglish;
  String get languageNameSpanish;
  String get languageFollowSystem;

  // ---- Header / Navegacao (Fase 2a) ----
  String get navHome;
  String get navSolutionsShort;
  String get navSolutions;
  String get navPortfolio;
  String get navAboutShort;
  String get navAbout;
  String get navPreCadastro;
  String get navContact;
  String get menuToggleTheme;
  String get menuOpen;
  String get menuSacEmail;
  String get themeLight;
  String get themeDark;
  String get tooltipSacEmail;

  // ---- Hero (Fase 2b) ----
  String get heroSemanticsLabel;
  String get siteBrandLogoSemantics;
  String get heroBrandLinkSemantics;
  String get siteHeaderLandmarkSemantics;
  String get siteMainLandmarkSemantics;
  String get heroHeadline1;
  String get heroHeadline2;
  String get heroSubline;
  String get heroCloser;
  String get heroContabilTitle;
  String get heroContabilMei2027;
  String get heroContabilLead;
  String get heroContabilWhyNowTitle;
  String get heroContabilWhyNowBody;
  String get heroContabilBulletPix;
  String get heroContabilBulletLimit;
  String get heroContabilBulletMandatory;
  String get heroContabilFeaturesTitle;
  String get heroContabilFeaturesLead;
  String get heroContabilFeatEmit;
  String get heroContabilFeatThermometer;
  String get heroContabilFeatRadar;
  String get heroContabilFeatCashbook;
  String get heroContabilMoreThanApp;
  String get heroContabilPartnerOffice;
  String get heroContabilHumanSupport;
  String get heroContabilBulletSupport;
  String get heroContabilBulletGrowth;
  String get heroContabilNoRisk;
  String get heroContabilStartToday;
  String get heroContabilAndroid;
  String get heroContabilLgpd;
  String get heroContabilPlansIntro;
  String get heroContabilPlanBasicTitle;
  String get heroContabilPlanBasicBody;
  String get heroContabilPlanActiveTitle;
  String get heroContabilPlanActiveBody;
  String get heroContabilFaqLink;
  String get heroAppsQualityTitle;

  // ---- Secoes Solucoes / Portfolio / Contato (Fase 2c) ----
  String get solAppsTitle;
  String get solAppsPlatformLabel;
  String get solAppsTagline;
  String get solAppsBody;
  String get solAppsGetAppLabel;
  String get solAppsSupportPortalLabel;
  String get solAppsHashtags;
  String get solContabilAppsTitle;
  String get solContabilAppsTagline;
  String get solContabilAppsBody;
  String get solContabilAppsSupportPortalLabel;
  String get solWebTitle;
  String get solWebBody;
  String get portDifferentialsTitle;
  String get portDifferentialsBody;
  String get portChipCleanArch;
  String get portChipSecurity;
  String get portChipScale;
  String get portChipFullStack;
  String get portBtnPartners;
  String get portBtnCloud;
  String get contactSemantics;
  String get contactCtaTitle;
  String get contactCtaBody;
  String get contactBtnSend;
  String get contactWhatsappPrefilled;

  // ---- Footer / Cookie banner (Fase 2c/2d) ----
  String get footerComplianceTitle;
  String get footerSemantics;
  String get footerComplianceBody;
  String get footerLinkPrivacyPolicy;
  String get footerLinkManageCookies;
  String get footerLinkEthicsCompliance;
  String get footerCompanyLegalSemantics;
  String get cookieBannerNarrow;
  String get cookieBannerWide;
  String get cookieBtnPolicy;
  String get cookieBtnDeny;
  String get cookieBtnAccept;
  String get cookieSnackReload;

  String get solShowcaseSemantics;
  String get solPreviewDialogSemantics;
  String get solShowcaseTapToExpand;
  String get solPreviewPhoneInicio;
  String get solPreviewPhoneOrcamentos;
  String get solPreviewTabletInicio;
  String get solPreviewTabletOrcamentos;
  String get solPreviewContabilPhoneEmpresa;
  String get solPreviewContabilTabletLancar;
  String get solPreviewClose;
  String get solPreviewZoomHint;
  String get tooltipWhatsApp;
  String get navBack;
  String get navBackHome;

  String get cloudPageTitle;
  String get cloudHeaderTitle;
  String get cloudManagedTitle;
  String get cloudManagedBody;
  String get cloudScaleTitle;
  String get cloudScaleBody;
  String get cloudDataTitle;
  String get cloudDataBody;
  String get cloudBigDataTitle;
  String get cloudBigDataBody;
  String get cloudSqlTitle;
  String get cloudSqlBody;
  String get cloudFirebaseTitle;
  String get cloudFirebaseBody;

  String get aboutPageSemantics;
  String get aboutBackTooltip;
  String get aboutHeroSubtitle;
  String get aboutHeroIntro;
  String get aboutCompanyTitle;
  String get aboutCompanyBody;
  String get aboutAppsTitle;
  String get aboutAppsBody;
  String get aboutWebTitle;
  String get aboutWebBody;
  String get aboutDesktopTitle;
  String get aboutDesktopBody;
  String get aboutWhyTitle;
  String get aboutWhyBody;
  String get aboutFooterSemantics;
  String get aboutFooterDisclaimer;
  String aboutFooterCopyright(int year);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(_lookup(locale));
  }

  @override
  bool isSupported(Locale locale) => const <String>{'pt', 'en', 'es'}.contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations _lookup(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return const _AppLocalizationsEn();
    case 'es':
      return const _AppLocalizationsEs();
    case 'pt':
    default:
      return const _AppLocalizationsPt();
  }
}

class _AppLocalizationsPt extends AppLocalizations {
  const _AppLocalizationsPt() : super('pt');

  @override
  String get languageMenuTooltip => 'Escolher idioma';
  @override
  String get languageNamePortuguese => 'Português';
  @override
  String get languageNameEnglish => 'English';
  @override
  String get languageNameSpanish => 'Español';
  @override
  String get languageFollowSystem => 'Automático (sistema)';

  @override
  String get navHome => 'Home';
  @override
  String get navSolutionsShort => 'Solucoes';
  @override
  String get navSolutions => 'Solucoes (App/Web)';
  @override
  String get navPortfolio => 'Portfolio';
  @override
  String get navAboutShort => 'Sobre';
  @override
  String get navAbout => 'Sobre nós';
  @override
  String get navPreCadastro => 'Pré-cadastro';
  @override
  String get navContact => 'Contato';
  @override
  String get menuToggleTheme => 'Alternar tema';
  @override
  String get menuOpen => 'Abrir menu';
  @override
  String get menuSacEmail => 'E-mail SAC';
  @override
  String get themeLight => 'Tema claro';
  @override
  String get themeDark => 'Tema escuro';
  @override
  String get tooltipSacEmail => 'E-mail SAC';

  @override
  String get heroSemanticsLabel => 'Secao principal de apresentacao';
  @override
  String get siteBrandLogoSemantics => 'Logotipo Perfect Gest Dev';
  @override
  String get heroBrandLinkSemantics => 'Perfect Gest Dev, ir para a raiz do site';
  @override
  String get siteHeaderLandmarkSemantics => 'Cabecalho com navegacao principal';
  @override
  String get siteMainLandmarkSemantics => 'Conteudo principal do site';
  @override
  String get heroHeadline1 => 'Inovacao em Flutter, Java e SDKs';
  @override
  String get heroHeadline2 =>
      'Criamos apps Flutter, sistemas web e integrações Java/SDK com foco em performance, segurança e escalabilidade para o seu negócio.';
  @override
  String get heroSubline =>
      'Software house especializada em aplicativo mobile, plataforma web rápida (Core Web Vitals) e SEO técnico para crescer no Google.';
  @override
  String get heroCloser =>
      'Soluções digitais com arquitetura robusta, código limpo e resultados mensuráveis.';
  @override
  String get heroContabilTitle => 'SETOR DE CONTABILIDADE';
  @override
  String get heroContabilMei2027 =>
      'O MEI vai mudar em 2027.\nO seu CNPJ está preparado para a nova Nota Fiscal?';
  @override
  String get heroContabilLead =>
      'Não espere o bloqueio do seu CNPJ ou multas retroativas. Conheça o único aplicativo que emite NFS-e/NF-e em segundos e controla o seu limite do MEI automaticamente.';
  @override
  String get heroContabilWhyNowTitle =>
      'Por que você precisa agir agora e não em 2027?';
  @override
  String get heroContabilWhyNowBody =>
      'A fiscalização sobre o Microempreendedor Individual será 100% eletrônica e automatizada em tempo real.\nA desorganização vai custar caro.';
  @override
  String get heroContabilBulletPix =>
      '--> Fiscalização do PIX e Cartão: A Receita Federal cruza tudo o que você recebe com as notas que você compra. A conta precisa fechar.';
  @override
  String get heroContabilBulletLimit =>
      '--> O Fantasma do Limite: Se você estourar o teto do MEI por R\$ 1,00, a cobrança do imposto é retroativa e vem com juros pesados.';
  @override
  String get heroContabilBulletMandatory =>
      '--> Obrigatoriedade Geral: Emitir NFS-e e NF-e será a única forma de manter suas portas abertas e vender para empresas ou órgãos públicos.';
  @override
  String get heroContabilFeaturesTitle =>
      'Tudo o que o seu CNPJ precisa na palma da sua mão';
  @override
  String get heroContabilFeaturesLead =>
      'Desenvolvemos uma ferramenta intuitiva para quem não tem tempo a perder com burocracia.';
  @override
  String get heroContabilFeatEmit =>
      '--> Emissão Relâmpago em 1 Minuto: Chega de portais do governo lentos e complicados. Emita suas Notas Fiscais de produto ou serviço direto pelo celular.';
  @override
  String get heroContabilFeatThermometer =>
      '--> Termômetro do Limite MEI: O app calcula seu faturamento acumulado mês a mês e avisa quando você estiver chegando perto do teto.';
  @override
  String get heroContabilFeatRadar =>
      '--> Radar de Compras (Notas de Entrada): Saiba na hora quando um fornecedor emitir uma nota contra o seu CNPJ. Monitore suas compras automaticamente.';
  @override
  String get heroContabilFeatCashbook =>
      '--> Livro Caixa Oficial Automatizado: Tenha um relatório financeiro profissional pronto. Use para comprovar renda no banco e liberar empréstimos mais fáceis.';
  @override
  String get heroContabilMoreThanApp => 'Muito mais que um aplicativo.';
  @override
  String get heroContabilPartnerOffice => 'Um escritório de contabilidade parceiro.';
  @override
  String get heroContabilHumanSupport =>
      'Aplicativos comuns te dão uma mensagem de erro e somem. O nosso diferencial é o suporte humano de verdade.';
  @override
  String get heroContabilBulletSupport =>
      '--> Suporte Técnico Integrado: Se alguma nota der erro no sistema da prefeitura ou do governo, nosso time de contadores resolve para você.';
  @override
  String get heroContabilBulletGrowth =>
      '--> Crescimento Sem Medo: O seu negócio cresceu e passou do limite do MEI? Nós cuidamos de toda a transição burocrática para transformar sua empresa em ME (Microempresa) com desconto exclusivo para usuários do app.';
  @override
  String get heroContabilNoRisk => 'Chega de correr riscos com o Leão.';
  @override
  String get heroContabilStartToday => 'Comece a controlar hoje!';
  @override
  String get heroContabilAndroid => '--> Disponível para Android.';
  @override
  String get heroContabilLgpd =>
      '--> Seus dados estão protegidos de acordo com a LGPD.';
  @override
  String get heroContabilPlansIntro =>
      'Conheça nossos planos e escolha a modalidade ideal para o momento do seu negócio:';
  @override
  String get heroContabilPlanBasicTitle => 'Plano Básico (Indicado para MEI):';
  @override
  String get heroContabilPlanBasicBody =>
      'Acesso completo a todas as ferramentas e funcionalidades automáticas do aplicativo para você gerenciar sua empresa com autonomia, sem a necessidade de um contador ativo.';
  @override
  String get heroContabilPlanActiveTitle =>
      'Plano Contabilidade Ativa (Indicado para ME):';
  @override
  String get heroContabilPlanActiveBody =>
      'Acesso total à plataforma integrado ao suporte de um contador responsável, garantindo a emissão e assinatura dos livros contábeis obrigatórios por lei. Esta modalidade possui 3 faixas de preço, e "você ganha um Certificado A1", categorizadas de acordo com o volume de movimentações e o número de funcionários da sua empresa.';
  @override
  String get heroContabilFaqLink =>
      'Acesse Perguntas e respostas sobre o Aplicativo';
  @override
  String get heroAppsQualityTitle => 'Qualidade dos Nossos Aplicativos';

  @override
  String get footerComplianceTitle => 'Ética e Compliance';

  @override
  String get solAppsTitle => 'PerfectGest I';
  @override
  String get solAppsPlatformLabel => 'Aplicativos para Android';
  @override
  String get solAppsTagline => 'Gestão para ME, MEI e autônomos';
  @override
  String get solAppsBody =>
      'Cadastre clientes, crie orçamentos em PDF, controle o caixa e receba lembretes fiscais com alarme. Funciona offline no seu celular.';
  @override
  String get solAppsGetAppLabel => 'Obter o aplicativo';
  @override
  String get solAppsSupportPortalLabel => 'FAQ e políticas do app';
  @override
  String get solAppsHashtags =>
      '#MEI #gestão #empreendedor #autônomo #microempresa #controleFinanceiro #orçamento #caixa #PerfectGest';
  @override
  String get solContabilAppsTitle => 'ContabilGest - Gestão Contabil';
  @override
  String get solContabilAppsTagline => 'Livro caixa, IR com IA e conferência contábil';
  @override
  String get solContabilAppsBody =>
      'Configure a empresa, lance movimentos com chat e IA, prepare o IR e envie o mês para conferência do escritório. Criptografia AES-256 no dispositivo.';
  @override
  String get solContabilAppsSupportPortalLabel => 'FAQ e políticas do app';
  @override
  String get solWebTitle => 'Web Apps Rapidos, Responsivos e Indexaveis';
  @override
  String get solWebBody =>
      'Solucoes com foco em Core Web Vitals e Google Search Console, orientadas para carregamento rapido e conversao.';
  @override
  String get portDifferentialsTitle => 'Diferenciais';
  @override
  String get portDifferentialsBody => '- Codigo Limpo\n- Seguranca\n- Escalabilidade\n- Suporte Full-Stack';
  @override
  String get portChipCleanArch => 'Clean Arch';
  @override
  String get portChipSecurity => 'Seguranca';
  @override
  String get portChipScale => 'Escala';
  @override
  String get portChipFullStack => 'Full-Stack';
  @override
  String get portBtnPartners => 'Parceiros tecnológicos';
  @override
  String get portBtnCloud => 'Soluções em nuvem';
  @override
  String get contactSemantics => 'Contacto WhatsApp e e-mail';
  @override
  String get contactCtaTitle => 'Vamos construir seu proximo produto';
  @override
  String get contactCtaBody =>
      'Foco em eficiencia, estabilidade e entrega continua para mobile, web e desktop.';
  @override
  String get contactBtnSend => 'Enviar mensagem (WhatsApp)';
  @override
  String get contactWhatsappPrefilled =>
      'Olá! Gostaria de falar com a Perfect Gest Dev sobre um projeto.\n\n';
  @override
  String get footerSemantics => 'Ética, compliance, privacidade e cookies — Perfect Gest Dev';
  @override
  String get footerComplianceBody =>
      'O nosso compromisso é com o utilizador: transparência, respeito e contacto directo connosco. '
      'Este site é vitrine institucional; a documentação dos produtos apresentados neste site encontra-se na própria secção Soluções.';
  @override
  String get footerLinkPrivacyPolicy => 'Políticas de Privacidade';
  @override
  String get footerLinkManageCookies => 'Gerenciar cookies';
  @override
  String get footerLinkEthicsCompliance => 'Ética e Compliance';
  @override
  String get footerCompanyLegalSemantics =>
      'Identificacao legal da empresa desenvolvedora';
  @override
  String get cookieBannerNarrow =>
      'Utilizamos cookies de medição. Pode aceitar, recusar ou ler a nossa política de privacidade.';
  @override
  String get cookieBannerWide =>
      'Utilizamos cookies de medição de audiência apenas com o seu consentimento, conforme a nossa política de privacidade.';
  @override
  String get cookieBtnPolicy => 'Política';
  @override
  String get cookieBtnDeny => 'Recusar';
  @override
  String get cookieBtnAccept => 'Aceitar';
  @override
  String get cookieSnackReload =>
      'Preferência gravada. Recarregue a página (F5 ou ícone atualizar) para aplicar a medição.';

  @override
  String get solShowcaseSemantics => 'Vitrine de projetos em mockups de dispositivos';
  @override
  String get solPreviewDialogSemantics => 'Pre-visualizacao ampliada da captura de ecrã';
  @override
  String get solShowcaseTapToExpand => 'Clique para ampliar a captura de tela';
  @override
  String get solPreviewPhoneInicio => 'PerfectGest I — Inicio (celular)';
  @override
  String get solPreviewPhoneOrcamentos => 'PerfectGest I — Orcamentos (celular)';
  @override
  String get solPreviewTabletInicio => 'PerfectGest I — Inicio (tablet)';
  @override
  String get solPreviewTabletOrcamentos => 'PerfectGest I — Orcamentos (tablet)';
  @override
  String get solPreviewContabilPhoneEmpresa =>
      'PerfectGest ContábilSigilo — Empresa e contador CRC (celular)';
  @override
  String get solPreviewContabilTabletLancar => 'PerfectGest ContabilGest — Lancar (tablet)';
  @override
  String get solPreviewClose => 'Fechar';
  @override
  String get solPreviewZoomHint =>
      'Use a roda do mouse ou gestos para ampliar. Toque fora para fechar.';
  @override
  String get tooltipWhatsApp => 'WhatsApp';
  @override
  String get navBack => 'Voltar';
  @override
  String get navBackHome => 'Voltar ao inicio';

  @override
  String get cloudPageTitle => 'Solucoes em Nuvem';
  @override
  String get cloudHeaderTitle => 'Solucoes em Nuvem com Implementacao Especializada';
  @override
  String get cloudManagedTitle => 'Desenvolvimento e Deploy Gerenciado';
  @override
  String get cloudManagedBody =>
      'Eu projeto e coloco seu servico web no ar via Cloud Run, cuidando de toda a infraestrutura tecnica para sua empresa focar no negocio.';
  @override
  String get cloudScaleTitle => 'Escalabilidade de Infraestrutura';
  @override
  String get cloudScaleBody =>
      'Implemento clusters de computacao de alta performance no Compute Engine, dimensionando o poder de processamento conforme a sua demanda cresce.';
  @override
  String get cloudDataTitle => 'Gestao Estrategica de Dados';
  @override
  String get cloudDataBody =>
      'Configuro e gerencio o armazenamento de grandes volumes de informacoes no Cloud Storage, garantindo seguranca e acesso rapido aos seus ativos digitais.';
  @override
  String get cloudBigDataTitle => 'Arquitetura de Big Data';
  @override
  String get cloudBigDataBody =>
      'Intermedio a analise de dados complexos com BigQuery, entregando dashboards e insights prontos para apoiar suas decisoes comerciais.';
  @override
  String get cloudSqlTitle => 'Bancos de Dados Prontos para Uso';
  @override
  String get cloudSqlBody =>
      'Cuido da configuracao e manutencao de instancias MySQL no Cloud SQL, assegurando que seus dados estejam sempre disponiveis e protegidos.';
  @override
  String get cloudFirebaseTitle => 'Integracao e Autenticacao com Firebase';
  @override
  String get cloudFirebaseBody =>
      'Desenvolvo aplicacoes modernas utilizando o ecossistema Firebase para entregas rapidas, notificacoes push e autenticacao segura de usuarios.';

  @override
  String get aboutPageSemantics => 'Pagina institucional Sobre nos da Perfect Gest Dev';
  @override
  String get aboutBackTooltip => 'Voltar ao inicio';
  @override
  String get aboutHeroSubtitle => 'Software house · Flutter · Java · Mobile, Web e Desktop';
  @override
  String get aboutHeroIntro =>
      'Transformacao digital e robustez do codigo. Conteudo pensado para clareza institucional e boa leitura em qualquer dispositivo.';
  @override
  String get aboutCompanyTitle => 'Codificando o Amanha, Hoje.';
  @override
  String get aboutCompanyBody =>
      'Somos uma software house especializada em arquiteturas de alta performance. Unimos o poder do Dart/Flutter a robustez do Java para criar ecossistemas digitais que nao apenas funcionam, mas escalam. Nossa missao e transformar logica complexa em experiencias de usuario simplificadas, garantindo que sua infraestrutura tecnica seja o alicerce do seu crescimento, e nao um gargalo.';
  @override
  String get aboutAppsTitle => 'Apps Nativos com Performance de Proxima Geracao';
  @override
  String get aboutAppsBody =>
      'Desenvolvemos aplicacoes moveis utilizando as ferramentas mais avancadas do mercado. Com Flutter, entregamos uma base de codigo unica para iOS e Android sem sacrificar a performance nativa. Dominamos a integracao de SDKs proprietarios e APIs complexas, garantindo que seu aplicativo tenha acesso total ao hardware e ofereca uma fluidez impecavel para o usuario final.';
  @override
  String get aboutWebTitle => 'Web Apps Rapidos, Responsivos e Indexaveis';
  @override
  String get aboutWebBody =>
      'Sua presenca na web precisa ser instantanea. Criamos plataformas web modernas com foco total em Core Web Vitals. Nossas solucoes web sao projetadas para carregamento ultra-rapido e total conformidade com os algoritmos de busca do Google. De paineis administrativos complexos a interfaces de consumo, entregamos codigo limpo, otimizado para conversao e 100% responsivo.';
  @override
  String get aboutDesktopTitle => 'Software Desktop: Potencia Maxima no Windows';
  @override
  String get aboutDesktopBody =>
      'Levamos a experiencia do usuario para o desktop com aplicacoes Windows robustas. Utilizamos o potencial do ecossistema Dart e integracao Java para criar softwares que aproveitam ao maximo o poder de processamento local. Ideal para ferramentas de produtividade, sistemas de gestao offline ou softwares que exigem alta capacidade de resposta e integracao profunda com o sistema operacional.';
  @override
  String get aboutWhyTitle => 'Por que nos?';
  @override
  String get aboutWhyBody =>
      '• Codigo Limpo: Arquitetura limpa (Clean Architecture) para facil manutencao.\n• Seguranca: Implementacao de protocolos de seguranca de nivel bancario.\n• Escalabilidade: Sistemas prontos para suportar de 100 a 1 milhao de usuarios.\n• Suporte Full-Stack: Do design da UI a engenharia de back-end.';
  @override
  String get aboutFooterSemantics => 'Rodape legal e direitos autorais';
  @override
  String get aboutFooterDisclaimer =>
      'Marca, logotipos, textos e ilustracoes deste site sao de uso exclusivo da Perfect Gest Dev, salvo indicacao em contrario. E proibida a reproducao total ou parcial para fins comerciais sem autorizacao previa por escrito.';
  @override
  String aboutFooterCopyright(int year) => '© $year Perfect Gest Dev. Todos os direitos reservados.';
}

class _AppLocalizationsEn extends AppLocalizations {
  const _AppLocalizationsEn() : super('en');

  @override
  String get languageMenuTooltip => 'Choose language';
  @override
  String get languageNamePortuguese => 'Português';
  @override
  String get languageNameEnglish => 'English';
  @override
  String get languageNameSpanish => 'Español';
  @override
  String get languageFollowSystem => 'Automatic (system)';

  @override
  String get navHome => 'Home';
  @override
  String get navSolutionsShort => 'Solutions';
  @override
  String get navSolutions => 'Solutions (App/Web)';
  @override
  String get navPortfolio => 'Portfolio';
  @override
  String get navAboutShort => 'About';
  @override
  String get navAbout => 'About us';
  @override
  String get navPreCadastro => 'Pre-registration';
  @override
  String get navContact => 'Contact';
  @override
  String get menuToggleTheme => 'Toggle theme';
  @override
  String get menuOpen => 'Open menu';
  @override
  String get menuSacEmail => 'Support email';
  @override
  String get themeLight => 'Light theme';
  @override
  String get themeDark => 'Dark theme';
  @override
  String get tooltipSacEmail => 'Support email';

  @override
  String get heroSemanticsLabel => 'Main introduction section';
  @override
  String get siteBrandLogoSemantics => 'Perfect Gest Dev logo';
  @override
  String get heroBrandLinkSemantics => 'Perfect Gest Dev, go to site home';
  @override
  String get siteHeaderLandmarkSemantics => 'Header with main navigation';
  @override
  String get siteMainLandmarkSemantics => 'Main site content';
  @override
  String get heroHeadline1 => 'Innovation in Flutter, Java and SDKs';
  @override
  String get heroHeadline2 =>
      'We build Flutter apps, web platforms, and Java/SDK integrations focused on performance, security, and scalability for your business.';
  @override
  String get heroSubline =>
      'Software house specialized in mobile apps, fast web platforms (Core Web Vitals), and technical SEO to grow on Google.';
  @override
  String get heroCloser =>
      'Digital solutions with robust architecture, clean code, and measurable results.';
  @override
  String get heroContabilTitle => 'ACCOUNTING DIVISION';
  @override
  String get heroContabilMei2027 =>
      'MEI rules change in 2027.\nIs your CNPJ ready for the new electronic invoice?';
  @override
  String get heroContabilLead =>
      'Do not wait for a CNPJ block or retroactive fines. Meet the only app that issues NFS-e/NF-e in seconds and automatically tracks your MEI revenue cap.';
  @override
  String get heroContabilWhyNowTitle =>
      'Why you need to act now, not in 2027?';
  @override
  String get heroContabilWhyNowBody =>
      'Enforcement on Individual Microentrepreneurs will be 100% electronic and automated in real time.\nDisorganization will cost you.';
  @override
  String get heroContabilBulletPix =>
      '--> PIX and card monitoring: The Federal Revenue Service matches everything you receive against the invoices you buy. The numbers must add up.';
  @override
  String get heroContabilBulletLimit =>
      '--> The cap ghost: If you exceed the MEI ceiling by even R\$ 1.00, the tax is charged retroactively with heavy interest.';
  @override
  String get heroContabilBulletMandatory =>
      '--> General mandate: Issuing NFS-e and NF-e will be the only way to keep your doors open and sell to companies or public bodies.';
  @override
  String get heroContabilFeaturesTitle =>
      'Everything your CNPJ needs in the palm of your hand';
  @override
  String get heroContabilFeaturesLead =>
      'We built an intuitive tool for people who have no time to waste on bureaucracy.';
  @override
  String get heroContabilFeatEmit =>
      '--> Lightning issuance in 1 minute: No more slow, complicated government portals. Issue product or service invoices right from your phone.';
  @override
  String get heroContabilFeatThermometer =>
      '--> MEI cap thermometer: The app calculates your accumulated revenue month by month and alerts you when you are approaching the ceiling.';
  @override
  String get heroContabilFeatRadar =>
      '--> Purchase radar (inbound invoices): Know immediately when a supplier issues an invoice against your CNPJ. Monitor your purchases automatically.';
  @override
  String get heroContabilFeatCashbook =>
      '--> Automated official cash book: Get a professional financial report ready. Use it to prove income at the bank and unlock easier loans.';
  @override
  String get heroContabilMoreThanApp => 'Much more than an app.';
  @override
  String get heroContabilPartnerOffice => 'A partner accounting office.';
  @override
  String get heroContabilHumanSupport =>
      'Ordinary apps give you an error message and disappear. Our difference is real human support.';
  @override
  String get heroContabilBulletSupport =>
      '--> Integrated technical support: If an invoice fails in the city hall or government system, our accounting team resolves it for you.';
  @override
  String get heroContabilBulletGrowth =>
      '--> Growth without fear: Did your business grow past the MEI cap? We handle the entire bureaucratic transition to turn your company into ME (Microempresa) with an exclusive discount for app users.';
  @override
  String get heroContabilNoRisk => 'Stop taking risks with the taxman.';
  @override
  String get heroContabilStartToday => 'Start controlling today!';
  @override
  String get heroContabilAndroid => '--> Available for Android.';
  @override
  String get heroContabilLgpd =>
      '--> Your data is protected in accordance with the LGPD.';
  @override
  String get heroContabilPlansIntro =>
      'Get to know our plans and choose the option that fits your business right now:';
  @override
  String get heroContabilPlanBasicTitle => 'Basic Plan (Recommended for MEI):';
  @override
  String get heroContabilPlanBasicBody =>
      'Full access to all automatic tools and features of the app so you can manage your company independently, without an active accountant.';
  @override
  String get heroContabilPlanActiveTitle =>
      'Active Accounting Plan (Recommended for ME):';
  @override
  String get heroContabilPlanActiveBody =>
      'Full platform access plus support from a responsible accountant, ensuring issuance and signing of the accounting books required by law. This option has 3 price bands, and "you get an A1 Certificate", categorized by transaction volume and the number of employees in your company.';
  @override
  String get heroContabilFaqLink => 'Open Questions and answers about the App';
  @override
  String get heroAppsQualityTitle => 'Quality of Our Apps';

  @override
  String get footerComplianceTitle => 'Ethics & Compliance';

  @override
  String get solAppsTitle => 'PerfectGest I';
  @override
  String get solAppsPlatformLabel => 'Android apps';
  @override
  String get solAppsTagline => 'Management for LLCs, MEI, and solo professionals';
  @override
  String get solAppsBody =>
      'Register clients, create PDF quotes, manage cash flow, and get tax reminders with alerts. Works offline on your phone.';
  @override
  String get solAppsGetAppLabel => 'Get the app';
  @override
  String get solAppsSupportPortalLabel => 'App FAQ and policies';
  @override
  String get solAppsHashtags =>
      '#MEI #management #entrepreneur #freelancer #smallBusiness #cashFlow #quotes #PerfectGest';
  @override
  String get solContabilAppsTitle => 'ContabilGest - Accounting Management';
  @override
  String get solContabilAppsTagline => 'Cash book, AI tax prep, and accounting review';
  @override
  String get solContabilAppsBody =>
      'Set up your company, record entries via AI chat, prepare your tax return, and send closed months for office review. AES-256 encryption on device.';
  @override
  String get solContabilAppsSupportPortalLabel => 'App FAQ and policies';
  @override
  String get solWebTitle => 'Fast, Responsive and Indexable Web Apps';
  @override
  String get solWebBody =>
      'Solutions focused on Core Web Vitals and Google Search Console, optimized for fast loading and conversion.';
  @override
  String get portDifferentialsTitle => 'What sets us apart';
  @override
  String get portDifferentialsBody => '- Clean Code\n- Security\n- Scalability\n- Full-Stack Support';
  @override
  String get portChipCleanArch => 'Clean Arch';
  @override
  String get portChipSecurity => 'Security';
  @override
  String get portChipScale => 'Scale';
  @override
  String get portChipFullStack => 'Full-Stack';
  @override
  String get portBtnPartners => 'Tech partners';
  @override
  String get portBtnCloud => 'Cloud solutions';
  @override
  String get contactSemantics => 'WhatsApp and email contact';
  @override
  String get contactCtaTitle => "Let's build your next product";
  @override
  String get contactCtaBody =>
      'Focus on efficiency, stability, and continuous delivery for mobile, web, and desktop.';
  @override
  String get contactBtnSend => 'Send message (WhatsApp)';
  @override
  String get contactWhatsappPrefilled =>
      "Hi! I'd like to talk to Perfect Gest Dev about a project.\n\n";
  @override
  String get footerSemantics => 'Ethics, compliance, privacy and cookies — Perfect Gest Dev';
  @override
  String get footerComplianceBody =>
      'Our commitment is to you: transparency, respect and direct contact with us. '
      'This site is an institutional showcase; documentation for the products featured on this site is in the Solutions section itself.';
  @override
  String get footerLinkPrivacyPolicy => 'Privacy policies';
  @override
  String get footerLinkManageCookies => 'Manage cookies';
  @override
  String get footerLinkEthicsCompliance => 'Ethics & compliance';
  @override
  String get footerCompanyLegalSemantics =>
      'Legal identification of the developer company';
  @override
  String get cookieBannerNarrow =>
      'We use measurement cookies. You can accept, decline or read our privacy policy.';
  @override
  String get cookieBannerWide =>
      'We use audience measurement cookies only with your consent, as described in our privacy policy.';
  @override
  String get cookieBtnPolicy => 'Policy';
  @override
  String get cookieBtnDeny => 'Decline';
  @override
  String get cookieBtnAccept => 'Accept';
  @override
  String get cookieSnackReload =>
      'Preference saved. Reload the page (F5 or refresh icon) to apply measurement.';

  @override
  String get solShowcaseSemantics => 'Project showcase in device mockups';
  @override
  String get solPreviewDialogSemantics => 'Enlarged screenshot preview dialog';
  @override
  String get solShowcaseTapToExpand => 'Click to enlarge the screenshot';
  @override
  String get solPreviewPhoneInicio => 'PerfectGest I — Home (phone)';
  @override
  String get solPreviewPhoneOrcamentos => 'PerfectGest I — Quotes (phone)';
  @override
  String get solPreviewTabletInicio => 'PerfectGest I — Home (tablet)';
  @override
  String get solPreviewTabletOrcamentos => 'PerfectGest I — Quotes (tablet)';
  @override
  String get solPreviewContabilPhoneEmpresa =>
      'PerfectGest ContábilSigilo — Company and CRC accountant (phone)';
  @override
  String get solPreviewContabilTabletLancar => 'PerfectGest ContabilGest — Record entry (tablet)';
  @override
  String get solPreviewClose => 'Close';
  @override
  String get solPreviewZoomHint =>
      'Use the mouse wheel or gestures to zoom. Tap outside to close.';
  @override
  String get tooltipWhatsApp => 'WhatsApp';
  @override
  String get navBack => 'Back';
  @override
  String get navBackHome => 'Back to home';

  @override
  String get cloudPageTitle => 'Cloud solutions';
  @override
  String get cloudHeaderTitle => 'Cloud solutions with specialized implementation';
  @override
  String get cloudManagedTitle => 'Managed development and deployment';
  @override
  String get cloudManagedBody =>
      'I design and launch your web service on Cloud Run, handling the full technical infrastructure so your company can focus on the business.';
  @override
  String get cloudScaleTitle => 'Infrastructure scalability';
  @override
  String get cloudScaleBody =>
      'I implement high-performance compute clusters on Compute Engine, scaling processing power as your demand grows.';
  @override
  String get cloudDataTitle => 'Strategic data management';
  @override
  String get cloudDataBody =>
      'I configure and manage storage for large volumes of information on Cloud Storage, ensuring security and fast access to your digital assets.';
  @override
  String get cloudBigDataTitle => 'Big data architecture';
  @override
  String get cloudBigDataBody =>
      'I support complex data analysis with BigQuery, delivering dashboards and insights ready to inform your commercial decisions.';
  @override
  String get cloudSqlTitle => 'Production-ready databases';
  @override
  String get cloudSqlBody =>
      'I handle configuration and maintenance of MySQL instances on Cloud SQL, keeping your data available and protected.';
  @override
  String get cloudFirebaseTitle => 'Firebase integration and authentication';
  @override
  String get cloudFirebaseBody =>
      'I build modern applications using the Firebase ecosystem for fast delivery, push notifications, and secure user authentication.';

  @override
  String get aboutPageSemantics => 'Perfect Gest Dev institutional About page';
  @override
  String get aboutBackTooltip => 'Back to home';
  @override
  String get aboutHeroSubtitle => 'Software house · Flutter · Java · Mobile, Web and Desktop';
  @override
  String get aboutHeroIntro =>
      'Digital transformation and code robustness. Content designed for institutional clarity and comfortable reading on any device.';
  @override
  String get aboutCompanyTitle => 'Coding Tomorrow, Today.';
  @override
  String get aboutCompanyBody =>
      'We are a software house specialized in high-performance architectures. We combine the power of Dart/Flutter with the robustness of Java to build digital ecosystems that not only work, but scale. Our mission is to turn complex logic into simplified user experiences, ensuring your technical infrastructure supports growth rather than becoming a bottleneck.';
  @override
  String get aboutAppsTitle => 'Native apps with next-generation performance';
  @override
  String get aboutAppsBody =>
      'We develop mobile applications using the most advanced tools on the market. With Flutter, we deliver a single codebase for iOS and Android without sacrificing native performance. We master integration of proprietary SDKs and complex APIs, ensuring your app has full hardware access and delivers a flawless experience for end users.';
  @override
  String get aboutWebTitle => 'Fast, responsive and indexable web apps';
  @override
  String get aboutWebBody =>
      'Your web presence must feel instant. We build modern web platforms with a strong focus on Core Web Vitals. Our web solutions are designed for ultra-fast loading and full alignment with Google\'s search algorithms. From complex admin panels to consumer interfaces, we deliver clean code optimized for conversion and fully responsive layouts.';
  @override
  String get aboutDesktopTitle => 'Desktop software: maximum power on Windows';
  @override
  String get aboutDesktopBody =>
      'We bring the user experience to the desktop with robust Windows applications. We leverage the Dart ecosystem and Java integration to create software that maximizes local processing power. Ideal for productivity tools, offline management systems, or apps that require high responsiveness and deep OS integration.';
  @override
  String get aboutWhyTitle => 'Why us?';
  @override
  String get aboutWhyBody =>
      '• Clean code: Clean Architecture for easier maintenance.\n• Security: Bank-grade security protocols.\n• Scalability: Systems ready to support from 100 to one million users.\n• Full-stack support: From UI design to back-end engineering.';
  @override
  String get aboutFooterSemantics => 'Legal footer and copyright';
  @override
  String get aboutFooterDisclaimer =>
      'Brand, logos, text, and illustrations on this site are for exclusive use by Perfect Gest Dev unless stated otherwise. Total or partial reproduction for commercial purposes is prohibited without prior written authorization.';
  @override
  String aboutFooterCopyright(int year) => '© $year Perfect Gest Dev. All rights reserved.';
}

class _AppLocalizationsEs extends AppLocalizations {
  const _AppLocalizationsEs() : super('es');

  @override
  String get languageMenuTooltip => 'Elegir idioma';
  @override
  String get languageNamePortuguese => 'Português';
  @override
  String get languageNameEnglish => 'English';
  @override
  String get languageNameSpanish => 'Español';
  @override
  String get languageFollowSystem => 'Automático (sistema)';

  @override
  String get navHome => 'Inicio';
  @override
  String get navSolutionsShort => 'Soluciones';
  @override
  String get navSolutions => 'Soluciones (App/Web)';
  @override
  String get navPortfolio => 'Portafolio';
  @override
  String get navAboutShort => 'Acerca';
  @override
  String get navAbout => 'Sobre nosotros';
  @override
  String get navPreCadastro => 'Pre-registro';
  @override
  String get navContact => 'Contacto';
  @override
  String get menuToggleTheme => 'Cambiar tema';
  @override
  String get menuOpen => 'Abrir menú';
  @override
  String get menuSacEmail => 'Correo de soporte';
  @override
  String get themeLight => 'Tema claro';
  @override
  String get themeDark => 'Tema oscuro';
  @override
  String get tooltipSacEmail => 'Correo de soporte';

  @override
  String get heroSemanticsLabel => 'Sección principal de presentación';
  @override
  String get siteBrandLogoSemantics => 'Logotipo Perfect Gest Dev';
  @override
  String get heroBrandLinkSemantics => 'Perfect Gest Dev, ir a la raíz del sitio';
  @override
  String get siteHeaderLandmarkSemantics => 'Encabezado con navegacion principal';
  @override
  String get siteMainLandmarkSemantics => 'Contenido principal del sitio';
  @override
  String get heroHeadline1 => 'Innovación en Flutter, Java y SDKs';
  @override
  String get heroHeadline2 =>
      'Creamos apps Flutter, plataformas web e integraciones Java/SDK con foco en rendimiento, seguridad y escalabilidad para tu negocio.';
  @override
  String get heroSubline =>
      'Software house especializada en aplicaciones móviles, plataformas web rápidas (Core Web Vitals) y SEO técnico para crecer en Google.';
  @override
  String get heroCloser =>
      'Soluciones digitales con arquitectura robusta, código limpio y resultados medibles.';
  @override
  String get heroContabilTitle => 'SECTOR DE CONTABILIDAD';
  @override
  String get heroContabilMei2027 =>
      'El MEI cambiará en 2027.\n¿Su CNPJ está preparado para la nueva Nota Fiscal?';
  @override
  String get heroContabilLead =>
      'No espere el bloqueo de su CNPJ ni multas retroactivas. Conozca la única aplicación que emite NFS-e/NF-e en segundos y controla su límite del MEI automáticamente.';
  @override
  String get heroContabilWhyNowTitle =>
      '¿Por qué debe actuar ahora y no en 2027?';
  @override
  String get heroContabilWhyNowBody =>
      'La fiscalización sobre el Microemprendedor Individual será 100% electrónica y automatizada en tiempo real.\nLa desorganización le costará caro.';
  @override
  String get heroContabilBulletPix =>
      '--> Fiscalización de PIX y tarjeta: La Receita Federal cruza todo lo que usted recibe con las notas que compra. La cuenta tiene que cuadrar.';
  @override
  String get heroContabilBulletLimit =>
      '--> El fantasma del límite: Si supera el tope del MEI por R\$ 1,00, el cobro del impuesto es retroactivo y llega con intereses altos.';
  @override
  String get heroContabilBulletMandatory =>
      '--> Obligatoriedad general: Emitir NFS-e y NF-e será la única forma de mantener las puertas abiertas y vender a empresas u organismos públicos.';
  @override
  String get heroContabilFeaturesTitle =>
      'Todo lo que su CNPJ necesita en la palma de su mano';
  @override
  String get heroContabilFeaturesLead =>
      'Desarrollamos una herramienta intuitiva para quien no tiene tiempo que perder con burocracia.';
  @override
  String get heroContabilFeatEmit =>
      '--> Emisión relámpago en 1 minuto: Basta de portales del gobierno lentos y complicados. Emita sus Notas Fiscales de producto o servicio directo desde el celular.';
  @override
  String get heroContabilFeatThermometer =>
      '--> Termómetro del límite MEI: La app calcula su facturación acumulada mes a mes y avisa cuando se acerque al tope.';
  @override
  String get heroContabilFeatRadar =>
      '--> Radar de compras (notas de entrada): Entérese al momento cuando un proveedor emita una nota contra su CNPJ. Monitore sus compras automáticamente.';
  @override
  String get heroContabilFeatCashbook =>
      '--> Libro de caja oficial automatizado: Tenga un informe financiero profesional listo. Úselo para comprobar ingresos en el banco y facilitar préstamos.';
  @override
  String get heroContabilMoreThanApp => 'Mucho más que una aplicación.';
  @override
  String get heroContabilPartnerOffice => 'Un despacho de contabilidad asociado.';
  @override
  String get heroContabilHumanSupport =>
      'Las aplicaciones comunes te dan un mensaje de error y desaparecen. Nuestra diferencia es el soporte humano de verdad.';
  @override
  String get heroContabilBulletSupport =>
      '--> Soporte técnico integrado: Si alguna nota falla en el sistema de la prefectura o del gobierno, nuestro equipo de contadores lo resuelve por usted.';
  @override
  String get heroContabilBulletGrowth =>
      '--> Crecimiento sin miedo: ¿Su negocio creció y superó el límite del MEI? Nosotros cuidamos toda la transición burocrática para transformar su empresa en ME (Microempresa) con descuento exclusivo para usuarios de la app.';
  @override
  String get heroContabilNoRisk => 'Basta de correr riesgos con el Leão.';
  @override
  String get heroContabilStartToday => '¡Empiece a controlar hoy!';
  @override
  String get heroContabilAndroid => '--> Disponible para Android.';
  @override
  String get heroContabilLgpd =>
      '--> Sus datos están protegidos de acuerdo con la LGPD.';
  @override
  String get heroContabilPlansIntro =>
      'Conozca nuestros planes y elija la modalidad ideal para el momento de su negocio:';
  @override
  String get heroContabilPlanBasicTitle => 'Plan Básico (Indicada para MEI):';
  @override
  String get heroContabilPlanBasicBody =>
      'Acceso completo a todas las herramientas y funciones automáticas de la aplicación para gestionar su empresa con autonomía, sin necesidad de un contador activo.';
  @override
  String get heroContabilPlanActiveTitle =>
      'Plan Contabilidad Activa (Indicada para ME):';
  @override
  String get heroContabilPlanActiveBody =>
      'Acceso total a la plataforma integrado al soporte de un contador responsable, garantizando la emisión y firma de los libros contables obligatorios por ley. Esta modalidad tiene 3 franjas de precio, y "usted gana un Certificado A1", categorizadas según el volumen de movimientos y el número de empleados de su empresa.';
  @override
  String get heroContabilFaqLink =>
      'Acceda a Preguntas y respuestas sobre la Aplicación';
  @override
  String get heroAppsQualityTitle => 'Calidad de Nuestros Aplicativos';

  @override
  String get footerComplianceTitle => 'Ética y cumplimiento';

  @override
  String get solAppsTitle => 'PerfectGest I';
  @override
  String get solAppsPlatformLabel => 'Aplicativos para Android';
  @override
  String get solAppsTagline => 'Gestión para ME, MEI y autónomos';
  @override
  String get solAppsBody =>
      'Registre clientes, cree presupuestos en PDF, controle la caja y reciba recordatorios fiscales con alarma. Funciona sin conexión en su móvil.';
  @override
  String get solAppsGetAppLabel => 'Obtener la aplicación';
  @override
  String get solAppsSupportPortalLabel => 'FAQ y políticas de la app';
  @override
  String get solAppsHashtags =>
      '#MEI #gestión #emprendedor #autónomo #microempresa #controlFinanciero #presupuesto #caja #PerfectGest';
  @override
  String get solContabilAppsTitle => 'ContabilGest - Gestión Contable';
  @override
  String get solContabilAppsTagline => 'Libro de caja, IR con IA y revisión contable';
  @override
  String get solContabilAppsBody =>
      'Configure la empresa, registre movimientos con chat e IA, prepare el IR y envíe el mes cerrado a revisión de la oficina. Cifrado AES-256 en el dispositivo.';
  @override
  String get solContabilAppsSupportPortalLabel => 'FAQ y políticas de la app';
  @override
  String get solWebTitle => 'Web Apps Rápidas, Responsivas e Indexables';
  @override
  String get solWebBody =>
      'Soluciones enfocadas en Core Web Vitals y Google Search Console, orientadas a carga rápida y conversión.';
  @override
  String get portDifferentialsTitle => 'Diferenciales';
  @override
  String get portDifferentialsBody => '- Código Limpio\n- Seguridad\n- Escalabilidad\n- Soporte Full-Stack';
  @override
  String get portChipCleanArch => 'Clean Arch';
  @override
  String get portChipSecurity => 'Seguridad';
  @override
  String get portChipScale => 'Escala';
  @override
  String get portChipFullStack => 'Full-Stack';
  @override
  String get portBtnPartners => 'Socios tecnológicos';
  @override
  String get portBtnCloud => 'Soluciones en la nube';
  @override
  String get contactSemantics => 'Contacto WhatsApp y correo';
  @override
  String get contactCtaTitle => 'Construyamos tu próximo producto';
  @override
  String get contactCtaBody =>
      'Foco en eficiencia, estabilidad y entrega continua para móvil, web y escritorio.';
  @override
  String get contactBtnSend => 'Enviar mensaje (WhatsApp)';
  @override
  String get contactWhatsappPrefilled =>
      '¡Hola! Me gustaría hablar con Perfect Gest Dev sobre un proyecto.\n\n';
  @override
  String get footerSemantics => 'Ética, cumplimiento, privacidad y cookies — Perfect Gest Dev';
  @override
  String get footerComplianceBody =>
      'Nuestro compromiso es con el usuario: transparencia, respeto y contacto directo con nosotros. '
      'Este sitio es vitrina institucional; la documentación de los productos presentados en este sitio se encuentra en la propia sección Soluciones.';
  @override
  String get footerLinkPrivacyPolicy => 'Políticas de privacidad';
  @override
  String get footerLinkManageCookies => 'Gestionar cookies';
  @override
  String get footerLinkEthicsCompliance => 'Ética y cumplimiento';
  @override
  String get footerCompanyLegalSemantics =>
      'Identificacion legal de la empresa desarrolladora';
  @override
  String get cookieBannerNarrow =>
      'Utilizamos cookies de medición. Puede aceptar, rechazar o leer nuestra política de privacidad.';
  @override
  String get cookieBannerWide =>
      'Utilizamos cookies de medición de audiencia solo con su consentimiento, según nuestra política de privacidad.';
  @override
  String get cookieBtnPolicy => 'Política';
  @override
  String get cookieBtnDeny => 'Rechazar';
  @override
  String get cookieBtnAccept => 'Aceptar';
  @override
  String get cookieSnackReload =>
      'Preferencia guardada. Recargue la página (F5 o icono actualizar) para aplicar la medición.';

  @override
  String get solShowcaseSemantics => 'Vitrina de proyectos en maquetas de dispositivos';
  @override
  String get solPreviewDialogSemantics => 'Dialogo de vista previa ampliada de la captura';
  @override
  String get solShowcaseTapToExpand => 'Pulse para ampliar la captura de pantalla';
  @override
  String get solPreviewPhoneInicio => 'PerfectGest I — Inicio (movil)';
  @override
  String get solPreviewPhoneOrcamentos => 'PerfectGest I — Presupuestos (movil)';
  @override
  String get solPreviewTabletInicio => 'PerfectGest I — Inicio (tablet)';
  @override
  String get solPreviewTabletOrcamentos => 'PerfectGest I — Presupuestos (tablet)';
  @override
  String get solPreviewContabilPhoneEmpresa =>
      'PerfectGest ContábilSigilo — Empresa y contador CRC (movil)';
  @override
  String get solPreviewContabilTabletLancar => 'PerfectGest ContabilGest — Registrar (tablet)';
  @override
  String get solPreviewClose => 'Cerrar';
  @override
  String get solPreviewZoomHint =>
      'Use la rueda del ratón o gestos para ampliar. Toque fuera para cerrar.';
  @override
  String get tooltipWhatsApp => 'WhatsApp';
  @override
  String get navBack => 'Volver';
  @override
  String get navBackHome => 'Volver al inicio';

  @override
  String get cloudPageTitle => 'Soluciones en la nube';
  @override
  String get cloudHeaderTitle => 'Soluciones en la nube con implementación especializada';
  @override
  String get cloudManagedTitle => 'Desarrollo y despliegue gestionado';
  @override
  String get cloudManagedBody =>
      'Diseño y pongo en marcha tu servicio web en Cloud Run, cuidando toda la infraestructura técnica para que tu empresa se centre en el negocio.';
  @override
  String get cloudScaleTitle => 'Escalabilidad de infraestructura';
  @override
  String get cloudScaleBody =>
      'Implemento clústeres de computación de alto rendimiento en Compute Engine, escalando la capacidad de procesamiento a medida que crece tu demanda.';
  @override
  String get cloudDataTitle => 'Gestión estratégica de datos';
  @override
  String get cloudDataBody =>
      'Configuro y gestiono el almacenamiento de grandes volúmenes de información en Cloud Storage, garantizando seguridad y acceso rápido a tus activos digitales.';
  @override
  String get cloudBigDataTitle => 'Arquitectura de Big Data';
  @override
  String get cloudBigDataBody =>
      'Apoyo el análisis de datos complejos con BigQuery, entregando paneles e insights listos para respaldar tus decisiones comerciales.';
  @override
  String get cloudSqlTitle => 'Bases de datos listas para producción';
  @override
  String get cloudSqlBody =>
      'Me encargo de la configuración y el mantenimiento de instancias MySQL en Cloud SQL, asegurando que tus datos estén siempre disponibles y protegidos.';
  @override
  String get cloudFirebaseTitle => 'Integración y autenticación con Firebase';
  @override
  String get cloudFirebaseBody =>
      'Desarrollo aplicaciones modernas con el ecosistema Firebase para entregas rápidas, notificaciones push y autenticación segura de usuarios.';

  @override
  String get aboutPageSemantics => 'Página institucional Sobre nosotros de Perfect Gest Dev';
  @override
  String get aboutBackTooltip => 'Volver al inicio';
  @override
  String get aboutHeroSubtitle => 'Software house · Flutter · Java · Móvil, Web y Escritorio';
  @override
  String get aboutHeroIntro =>
      'Transformación digital y solidez del código. Contenido pensado para claridad institucional y buena lectura en cualquier dispositivo.';
  @override
  String get aboutCompanyTitle => 'Codificando el Mañana, Hoy.';
  @override
  String get aboutCompanyBody =>
      'Somos una software house especializada en arquitecturas de alto rendimiento. Unimos el poder de Dart/Flutter con la solidez de Java para crear ecosistemas digitales que no solo funcionan, sino que escalan. Nuestra misión es transformar la lógica compleja en experiencias de usuario simplificadas, garantizando que tu infraestructura técnica sea la base de tu crecimiento y no un cuello de botella.';
  @override
  String get aboutAppsTitle => 'Apps nativas con rendimiento de próxima generación';
  @override
  String get aboutAppsBody =>
      'Desarrollamos aplicaciones móviles con las herramientas más avanzadas del mercado. Con Flutter, entregamos una base de código única para iOS y Android sin sacrificar el rendimiento nativo. Dominamos la integración de SDKs propietarios y APIs complejas, asegurando que tu app tenga acceso total al hardware y ofrezca una fluidez impecable al usuario final.';
  @override
  String get aboutWebTitle => 'Web apps rápidas, responsivas e indexables';
  @override
  String get aboutWebBody =>
      'Tu presencia web debe ser instantánea. Creamos plataformas web modernas con foco total en Core Web Vitals. Nuestras soluciones web están pensadas para carga ultra rápida y alineación con los algoritmos de búsqueda de Google. Desde paneles administrativos complejos hasta interfaces de consumo, entregamos código limpio, optimizado para conversión y 100% responsivo.';
  @override
  String get aboutDesktopTitle => 'Software de escritorio: máxima potencia en Windows';
  @override
  String get aboutDesktopBody =>
      'Llevamos la experiencia de usuario al escritorio con aplicaciones Windows robustas. Aprovechamos el ecosistema Dart y la integración Java para crear software que maximiza el poder de procesamiento local. Ideal para herramientas de productividad, sistemas de gestión offline o software que exige alta capacidad de respuesta e integración profunda con el sistema operativo.';
  @override
  String get aboutWhyTitle => '¿Por qué nosotros?';
  @override
  String get aboutWhyBody =>
      '• Código limpio: Clean Architecture para un mantenimiento sencillo.\n• Seguridad: Protocolos de seguridad de nivel bancario.\n• Escalabilidad: Sistemas listos para soportar de 100 a un millón de usuarios.\n• Soporte full-stack: Del diseño de UI a la ingeniería de back-end.';
  @override
  String get aboutFooterSemantics => 'Pie legal y derechos de autor';
  @override
  String get aboutFooterDisclaimer =>
      'Marca, logotipos, textos e ilustraciones de este sitio son de uso exclusivo de Perfect Gest Dev salvo indicación en contrario. Queda prohibida la reproducción total o parcial con fines comerciales sin autorización previa por escrito.';
  @override
  String aboutFooterCopyright(int year) => '© $year Perfect Gest Dev. Todos los derechos reservados.';
}
