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
  String get navContact;
  String get menuToggleTheme;
  String get menuOpen;
  String get menuSacEmail;
  String get themeLight;
  String get themeDark;
  String get tooltipSacEmail;

  // ---- Hero (Fase 2b) ----
  String get heroSemanticsLabel;
  String get heroBrandLinkSemantics;
  String get heroHeadline1;
  String get heroHeadline2;
  String get heroSubline;
  String get heroCloser;

  // ---- Secoes Solucoes / Portfolio / Contato (Fase 2c) ----
  String get solAppsTitle;
  String get solAppsBody;
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
  String get footerBtnPolicyShort;
  String get footerBtnPolicyFull;
  String get footerLinkGooglePrivacy;
  String get footerLinkGoogleCookies;
  String get footerLinkGoogleTerms;
  String get cookieBannerNarrow;
  String get cookieBannerWide;
  String get cookieBtnPolicy;
  String get cookieBtnDeny;
  String get cookieBtnAccept;
  String get cookieSnackReload;

  String get solShowcaseSemantics;
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
  String get heroBrandLinkSemantics => 'PerfectGest, ir para a raiz do site';
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
  String get footerComplianceTitle => 'Privacidade, dados e cookies';

  @override
  String get solAppsTitle => 'Apps Nativos com Performance de Proxima Geracao';
  @override
  String get solAppsBody =>
      'Com Flutter, entregamos uma base unica para iOS e Android sem sacrificar performance nativa, com integracao de SDKs e APIs complexas.';
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
      'Olá! Gostaria de falar com a PerfectGest sobre um projeto.\n\n';
  @override
  String get footerSemantics => 'Privacidade, dados, cookies e termos PerfectGest';
  @override
  String get footerComplianceBody =>
      'Leia a política completa da PerfectGest (privacidade, dados, cookies e termos). Para serviços Google (ex.: Analytics), aplicam-se também as políticas oficiais do Google.';
  @override
  String get footerBtnPolicyShort => 'Política completa';
  @override
  String get footerBtnPolicyFull => 'Ver política completa';
  @override
  String get footerLinkGooglePrivacy => 'Privacidade Google';
  @override
  String get footerLinkGoogleCookies => 'Cookies Google';
  @override
  String get footerLinkGoogleTerms => 'Termos Google';
  @override
  String get cookieBannerNarrow =>
      'Cookies de medição (Google). Pode aceitar, recusar ou ler a política.';
  @override
  String get cookieBannerWide =>
      'Utilizamos cookies de medição (Google Analytics) conforme a nossa política e o Consent Mode.';
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
  String get aboutPageSemantics => 'Pagina institucional Sobre nos da PerfectGest';
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
      'Marca, logotipos, textos e ilustracoes deste site sao de uso exclusivo da PerfectGest, salvo indicacao em contrario. E proibida a reproducao total ou parcial para fins comerciais sem autorizacao previa por escrito.';
  @override
  String aboutFooterCopyright(int year) => '© $year PerfectGest. Todos os direitos reservados.';
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
  String get heroBrandLinkSemantics => 'PerfectGest, go to site home';
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
  String get footerComplianceTitle => 'Privacy, data and cookies';

  @override
  String get solAppsTitle => 'Native Apps with Next-Generation Performance';
  @override
  String get solAppsBody =>
      'With Flutter, we deliver a single codebase for iOS and Android without sacrificing native performance, integrating proprietary SDKs and complex APIs.';
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
      "Hi! I'd like to talk to PerfectGest about a project.\n\n";
  @override
  String get footerSemantics => 'PerfectGest privacy, data, cookies and terms';
  @override
  String get footerComplianceBody =>
      "Read PerfectGest's full policy (privacy, data, cookies, and terms). For Google services (e.g., Analytics), Google's official policies also apply.";
  @override
  String get footerBtnPolicyShort => 'Full policy';
  @override
  String get footerBtnPolicyFull => 'View full policy';
  @override
  String get footerLinkGooglePrivacy => 'Google Privacy';
  @override
  String get footerLinkGoogleCookies => 'Google Cookies';
  @override
  String get footerLinkGoogleTerms => 'Google Terms';
  @override
  String get cookieBannerNarrow =>
      'Measurement cookies (Google). You can accept, decline, or read the policy.';
  @override
  String get cookieBannerWide =>
      'We use measurement cookies (Google Analytics) in accordance with our policy and Consent Mode.';
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
  String get aboutPageSemantics => 'PerfectGest institutional About page';
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
      'Brand, logos, text, and illustrations on this site are for exclusive use by PerfectGest unless stated otherwise. Total or partial reproduction for commercial purposes is prohibited without prior written authorization.';
  @override
  String aboutFooterCopyright(int year) => '© $year PerfectGest. All rights reserved.';
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
  String get heroBrandLinkSemantics => 'PerfectGest, ir a la raíz del sitio';
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
  String get footerComplianceTitle => 'Privacidad, datos y cookies';

  @override
  String get solAppsTitle => 'Apps Nativas con Rendimiento de Próxima Generación';
  @override
  String get solAppsBody =>
      'Con Flutter entregamos una base única para iOS y Android sin sacrificar rendimiento nativo, integrando SDKs propietarios y APIs complejas.';
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
      '¡Hola! Me gustaría hablar con PerfectGest sobre un proyecto.\n\n';
  @override
  String get footerSemantics => 'Privacidad, datos, cookies y términos PerfectGest';
  @override
  String get footerComplianceBody =>
      'Lee la política completa de PerfectGest (privacidad, datos, cookies y términos). Para servicios de Google (p.ej., Analytics), también aplican las políticas oficiales de Google.';
  @override
  String get footerBtnPolicyShort => 'Política completa';
  @override
  String get footerBtnPolicyFull => 'Ver política completa';
  @override
  String get footerLinkGooglePrivacy => 'Privacidad Google';
  @override
  String get footerLinkGoogleCookies => 'Cookies Google';
  @override
  String get footerLinkGoogleTerms => 'Términos Google';
  @override
  String get cookieBannerNarrow =>
      'Cookies de medición (Google). Puede aceptar, rechazar o leer la política.';
  @override
  String get cookieBannerWide =>
      'Utilizamos cookies de medición (Google Analytics) conforme a nuestra política y el Consent Mode.';
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
  String get aboutPageSemantics => 'Página institucional Sobre nosotros de PerfectGest';
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
      'Marca, logotipos, textos e ilustraciones de este sitio son de uso exclusivo de PerfectGest salvo indicación en contrario. Queda prohibida la reproducción total o parcial con fines comerciales sin autorización previa por escrito.';
  @override
  String aboutFooterCopyright(int year) => '© $year PerfectGest. Todos los derechos reservados.';
}
