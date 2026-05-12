import 'package:flutter/widgets.dart';

class TechStackCard {
  const TechStackCard({required this.title, required this.body, required this.example});
  final String title;
  final String body;
  final String example;
}

abstract class SiteTecnologiasTexts {
  const SiteTecnologiasTexts();

  static SiteTecnologiasTexts of(BuildContext context) {
    switch (Localizations.localeOf(context).languageCode) {
      case 'en':
        return const _SiteTecnologiasTextsEn();
      case 'es':
        return const _SiteTecnologiasTextsEs();
      case 'pt':
      default:
        return const _SiteTecnologiasTextsPt();
    }
  }

  String get semanticsLabel;
  String get heroTitle;
  String get heroIntro1;
  String get heroIntro2;
  String get portfolioDifferentialsTitle;
  String get conceptAppliedLabel;
  List<TechStackCard> get stackCards;
}

const List<TechStackCard> _kPtCards = <TechStackCard>[
  TechStackCard(
    title: 'Clean Arch',
    body:
        'Aplicamos arquitetura limpa com separação clara de responsabilidades, camadas desacopladas e componentes reutilizáveis. Isso acelera evolução de produto, melhora testes e reduz custo de manutenção.',
    example:
        'Exemplo prático: ao alterar uma regra de orçamento, ajustamos somente a camada de domínio sem quebrar interface ou integrações externas.',
  ),
  TechStackCard(
    title: 'Segurança',
    body:
        'Adotamos boas práticas de segurança em autenticação, gestão de sessão, políticas de conteúdo web e proteção de dados. O objetivo é reduzir risco operacional e elevar confiança em produção.',
    example:
        'Exemplo prático: protegemos rotas sensíveis com validação de sessão e aplicamos CSP no web para bloquear scripts não autorizados.',
  ),
  TechStackCard(
    title: 'Escala',
    body:
        'Projetamos soluções para crescer com o negócio, com foco em performance, observabilidade e integração de serviços. A arquitetura é preparada para aumento de utilizadores e novos módulos.',
    example:
        'Exemplo prático: em campanhas sazonais, ampliamos serviços de API e cache sem refazer o app, mantendo estabilidade durante pico de acesso.',
  ),
  TechStackCard(
    title: 'Full-Stack',
    body:
        'Atuamos do front-end ao back-end, conectando Flutter, APIs, serviços de dados, integrações corporativas e automação de build. Isso garante entregas consistentes em todo o ciclo do produto.',
    example:
        'Exemplo prático: publicamos uma funcionalidade completa de venda, desde a tela mobile até API, banco de dados e monitoramento.',
  ),
  TechStackCard(
    title: 'Flutter + Dart (base multiplataforma)',
    body:
        'Usamos Flutter como framework principal e Dart como linguagem para entregar uma base única de código com alta produtividade, consistência de interface e excelente performance em Android, iOS, Web e Desktop.',
    example:
        'Exemplo prático: um mesmo módulo de cadastro é compartilhado entre mobile e web, reduzindo retrabalho e tempo de lançamento.',
  ),
  TechStackCard(
    title: 'Banco de dados offline (Dart/Flutter)',
    body:
        'Para persistência local e uso sem internet, utilizamos SQLite (sqflite/drift), Isar e Hive. Essa camada local mantém performance, resposta rápida da interface e continuidade das operações mesmo em cenários com conectividade limitada.',
    example:
        'Exemplo prático: técnico em campo registra atendimento sem internet e o app mantém os dados locais até a conexão voltar.',
  ),
  TechStackCard(
    title: 'Banco de dados online (Dart/Flutter)',
    body:
        'Para sincronização e dados em nuvem, trabalhamos com Cloud Firestore, Firebase Realtime Database e Supabase/PostgreSQL. Isso permite backup, atualização em tempo real e acesso multiutilizador com confiabilidade em produção.',
    example:
        'Exemplo prático: alterações no estoque feitas no painel web aparecem quase em tempo real no app da equipe comercial.',
  ),
  TechStackCard(
    title: 'Java (integrações e backend enterprise)',
    body:
        'Utilizamos Java em integrações corporativas e serviços de apoio para ambientes que exigem robustez, segurança e compatibilidade com ecossistemas enterprise, conectando aplicações Flutter a APIs e sistemas legados.',
    example:
        'Exemplo prático: integração com ERP legado para sincronizar pedidos e faturamento sem alterar o sistema principal do cliente.',
  ),
  TechStackCard(
    title: 'Gradle (build e automação Android)',
    body:
        'No Android, usamos Gradle para gerenciamento de dependências, variantes de build e automação de pipeline. Isso melhora a previsibilidade de releases, organização de ambientes e qualidade contínua de entrega.',
    example:
        'Exemplo prático: geramos builds separados para homologação e produção com variáveis de ambiente e assinaturas distintas.',
  ),
  TechStackCard(
    title: 'SDKs de terceiros e integrações nativas',
    body:
        'Integramos SDKs nativos e bibliotecas especializadas para recursos de negócio como autenticação, pagamentos, analytics, notificações e serviços proprietários, mantendo estabilidade e desempenho em produção.',
    example:
        'Exemplo prático: adicionamos gateway de pagamento e autenticação biométrica mantendo UX fluida em Android e iOS.',
  ),
  TechStackCard(
    title: 'Material 3 e UI responsiva',
    body:
        'Adotamos Material 3, LayoutBuilder e breakpoints responsivos para criar interfaces adaptáveis a celulares, tablets e desktop. Isso melhora experiência do utilizador, retenção e métricas de usabilidade.',
    example:
        'Exemplo prático: a mesma jornada de compra se reorganiza automaticamente para tablet e desktop sem duplicar tela.',
  ),
  TechStackCard(
    title: 'Integrações web e SEO técnico',
    body:
        'Implementamos metatags dinâmicas, Open Graph, canonical, robots.txt e sitemap.xml para melhorar rastreamento e indexação no Google. Também aplicamos boas práticas de segurança com Content Security Policy e políticas de permissões.',
    example:
        'Exemplo prático: página de serviço ganha preview otimizado no WhatsApp e melhor posicionamento orgânico no Google.',
  ),
  TechStackCard(
    title: 'Analytics e consentimento (GA4)',
    body:
        'Medição com Google Analytics 4 integrada ao fluxo de consentimento de cookies. Isso permite análise de comportamento com respeito à privacidade e conformidade com políticas modernas de medição.',
    example:
        'Exemplo prático: funil de conversão registra apenas eventos consentidos e orienta ajustes de UX com base em dados reais.',
  ),
  TechStackCard(
    title: 'Arquitetura limpa e manutenção',
    body:
        'Priorizamos código organizado, componentes reutilizáveis e separação de responsabilidades para facilitar evolução contínua do produto, redução de bugs e menor custo de manutenção.',
    example:
        'Exemplo prático: nova funcionalidade de assinatura é incluída reaproveitando componentes e reduzindo esforço de QA.',
  ),
  TechStackCard(
    title: 'Integrações HTTP e serviços externos',
    body:
        'Integramos APIs externas e serviços de dados para fluxos reais de negócio, incluindo endpoints de back-end e serviços de observabilidade, garantindo confiabilidade operacional e evolução orientada a métricas.',
    example:
        'Exemplo prático: monitoramos latência e erro das APIs em produção para agir rápido antes de impactar clientes.',
  ),
];

class _SiteTecnologiasTextsPt extends SiteTecnologiasTexts {
  const _SiteTecnologiasTextsPt() : super();

  @override
  String get semanticsLabel => 'Tecnologias Flutter e stack principal da PerfectGest';

  @override
  String get heroTitle => 'Stack Flutter e tecnologias da PerfectGest';

  @override
  String get heroIntro1 =>
      'Nossa estratégia técnica conecta arquitetura, dados, experiência de utilização e operação contínua. Cada componente abaixo foi pensado para funcionar em conjunto, reduzindo riscos e acelerando entregas com qualidade previsível.';

  @override
  String get heroIntro2 =>
      'Fluxo integrado: base técnica sólida -> dados confiáveis -> experiência consistente -> operação mensurável. Assim, cada decisão reforça a próxima etapa e mantém coerência entre discurso comercial e execução de produto.';

  @override
  String get portfolioDifferentialsTitle => 'Diferenciais do Portfólio';

  @override
  String get conceptAppliedLabel => 'Conceito aplicado:';

  @override
  List<TechStackCard> get stackCards => _kPtCards;
}

const List<TechStackCard> _kEnCards = <TechStackCard>[
  TechStackCard(
    title: 'Clean Arch',
    body:
        'We apply clean architecture with clear separation of concerns, decoupled layers and reusable components. This speeds product evolution, improves testing and lowers maintenance cost.',
    example:
        'Practical example: when a quoting rule changes, we adjust only the domain layer without breaking the UI or external integrations.',
  ),
  TechStackCard(
    title: 'Security',
    body:
        'We adopt security best practices for authentication, session management, web content policies and data protection. The goal is to reduce operational risk and increase production trust.',
    example:
        'Practical example: we protect sensitive routes with session validation and apply CSP on the web to block unauthorized scripts.',
  ),
  TechStackCard(
    title: 'Scale',
    body:
        'We design solutions to grow with the business, focusing on performance, observability and service integration. Architecture is ready for more users and new modules.',
    example:
        'Practical example: in seasonal campaigns we scale API and cache services without rebuilding the app, keeping stability at peak traffic.',
  ),
  TechStackCard(
    title: 'Full-Stack',
    body:
        'We work from front-end to back-end, connecting Flutter, APIs, data services, enterprise integrations and build automation. This keeps delivery consistent across the product lifecycle.',
    example:
        'Practical example: we ship a full sales feature from the mobile screen to API, database and monitoring.',
  ),
  TechStackCard(
    title: 'Flutter + Dart (cross-platform foundation)',
    body:
        'We use Flutter as the main framework and Dart as the language to deliver a single codebase with high productivity, consistent UI and strong performance on Android, iOS, Web and Desktop.',
    example:
        'Practical example: one registration module is shared between mobile and web, reducing rework and release time.',
  ),
  TechStackCard(
    title: 'Offline databases (Dart/Flutter)',
    body:
        'For local persistence and offline use we rely on SQLite (sqflite/drift), Isar and Hive. This local layer keeps performance, fast UI response and continuity even with limited connectivity.',
    example:
        'Practical example: a field technician logs service offline and the app keeps data local until connectivity returns.',
  ),
  TechStackCard(
    title: 'Online databases (Dart/Flutter)',
    body:
        'For sync and cloud data we work with Cloud Firestore, Firebase Realtime Database and Supabase/PostgreSQL. This enables backup, near real-time updates and multi-user access in production.',
    example:
        'Practical example: stock changes made in the web panel appear almost in real time in the sales team app.',
  ),
  TechStackCard(
    title: 'Java (enterprise integrations and backend)',
    body:
        'We use Java for corporate integrations and supporting services where robustness, security and enterprise ecosystem compatibility matter, connecting Flutter apps to APIs and legacy systems.',
    example:
        'Practical example: integration with a legacy ERP to sync orders and billing without changing the client’s core system.',
  ),
  TechStackCard(
    title: 'Gradle (Android build and automation)',
    body:
        'On Android we use Gradle for dependency management, build variants and pipeline automation. This improves release predictability, environment organization and continuous delivery quality.',
    example:
        'Practical example: separate staging and production builds with environment variables and distinct signing configs.',
  ),
  TechStackCard(
    title: 'Third-party SDKs and native integrations',
    body:
        'We integrate native SDKs and specialized libraries for business features such as authentication, payments, analytics, notifications and proprietary services, keeping stability and performance in production.',
    example:
        'Practical example: we add a payment gateway and biometric authentication while keeping fluid UX on Android and iOS.',
  ),
  TechStackCard(
    title: 'Material 3 and responsive UI',
    body:
        'We adopt Material 3, LayoutBuilder and responsive breakpoints for interfaces that adapt to phones, tablets and desktop. This improves UX, retention and usability metrics.',
    example:
        'Practical example: the same purchase journey rearranges automatically for tablet and desktop without duplicating screens.',
  ),
  TechStackCard(
    title: 'Web integrations and technical SEO',
    body:
        'We implement dynamic meta tags, Open Graph, canonical, robots.txt and sitemap.xml to improve crawling and indexing on Google. We also apply security practices such as Content Security Policy and permission policies.',
    example:
        'Practical example: a service page gets an optimized WhatsApp preview and better organic positioning on Google.',
  ),
  TechStackCard(
    title: 'Analytics and consent (GA4)',
    body:
        'Measurement with Google Analytics 4 integrated into the cookie consent flow. This enables behavioral analysis with respect for privacy and alignment with modern measurement policies.',
    example:
        'Practical example: the conversion funnel records only consented events and guides UX improvements with real data.',
  ),
  TechStackCard(
    title: 'Clean architecture and maintenance',
    body:
        'We prioritize organized code, reusable components and separation of concerns to support continuous product evolution, fewer bugs and lower maintenance cost.',
    example:
        'Practical example: a new subscription feature is added by reusing components and reducing QA effort.',
  ),
  TechStackCard(
    title: 'HTTP integrations and external services',
    body:
        'We integrate external APIs and data services for real business flows, including back-end endpoints and observability services, ensuring operational reliability and metric-driven evolution.',
    example:
        'Practical example: we monitor API latency and errors in production to act before customers are impacted.',
  ),
];

const List<TechStackCard> _kEsCards = <TechStackCard>[
  TechStackCard(
    title: 'Clean Arch',
    body:
        'Aplicamos arquitectura limpia con separacion clara de responsabilidades, capas desacopladas y componentes reutilizables. Esto acelera la evolucion del producto, mejora pruebas y reduce coste de mantenimiento.',
    example:
        'Ejemplo practico: al cambiar una regla de presupuesto, ajustamos solo la capa de dominio sin romper la interfaz ni integraciones externas.',
  ),
  TechStackCard(
    title: 'Seguridad',
    body:
        'Adoptamos buenas practicas de seguridad en autenticacion, gestion de sesion, politicas de contenido web y proteccion de datos. El objetivo es reducir riesgo operativo y aumentar la confianza en produccion.',
    example:
        'Ejemplo practico: protegemos rutas sensibles con validacion de sesion y aplicamos CSP en web para bloquear scripts no autorizados.',
  ),
  TechStackCard(
    title: 'Escala',
    body:
        'Disenamos soluciones para crecer con el negocio, con foco en rendimiento, observabilidad e integracion de servicios. La arquitectura esta preparada para mas usuarios y nuevos modulos.',
    example:
        'Ejemplo practico: en campanas estacionales ampliamos API y cache sin rehacer la app, manteniendo estabilidad en picos de trafico.',
  ),
  TechStackCard(
    title: 'Full-Stack',
    body:
        'Actuamos de front-end a back-end, conectando Flutter, APIs, servicios de datos, integraciones corporativas y automatizacion de build. Garantizamos entregas coherentes en todo el ciclo del producto.',
    example:
        'Ejemplo practico: publicamos una funcionalidad completa de venta, desde la pantalla movil hasta API, base de datos y monitorizacion.',
  ),
  TechStackCard(
    title: 'Flutter + Dart (base multiplataforma)',
    body:
        'Usamos Flutter como framework principal y Dart como lenguaje para entregar una base unica de codigo con alta productividad, consistencia de interfaz y excelente rendimiento en Android, iOS, Web y Desktop.',
    example:
        'Ejemplo practico: un mismo modulo de registro se comparte entre movil y web, reduciendo retrabajo y tiempo de lanzamiento.',
  ),
  TechStackCard(
    title: 'Base de datos offline (Dart/Flutter)',
    body:
        'Para persistencia local y uso sin internet usamos SQLite (sqflite/drift), Isar y Hive. Esta capa local mantiene rendimiento, respuesta rapida de la interfaz y continuidad con conectividad limitada.',
    example:
        'Ejemplo practico: un tecnico en campo registra atencion sin internet y la app conserva los datos locales hasta que vuelva la conexion.',
  ),
  TechStackCard(
    title: 'Base de datos online (Dart/Flutter)',
    body:
        'Para sincronizacion y datos en la nube trabajamos con Cloud Firestore, Firebase Realtime Database y Supabase/PostgreSQL. Permite backup, actualizacion casi en tiempo real y acceso multiusuario fiable en produccion.',
    example:
        'Ejemplo practico: cambios de stock hechos en el panel web aparecen casi en tiempo real en la app del equipo comercial.',
  ),
  TechStackCard(
    title: 'Java (integraciones y backend enterprise)',
    body:
        'Utilizamos Java en integraciones corporativas y servicios de apoyo para entornos que exigen robustez, seguridad y compatibilidad con ecosistemas enterprise, conectando apps Flutter a APIs y sistemas legacy.',
    example:
        'Ejemplo practico: integracion con ERP legacy para sincronizar pedidos y facturacion sin alterar el sistema principal del cliente.',
  ),
  TechStackCard(
    title: 'Gradle (build y automatizacion Android)',
    body:
        'En Android usamos Gradle para dependencias, variantes de build y automatizacion de pipeline. Mejora la previsibilidad de releases, la organizacion de entornos y la calidad continua de entrega.',
    example:
        'Ejemplo practico: generamos builds separados para homologacion y produccion con variables de entorno y firmas distintas.',
  ),
  TechStackCard(
    title: 'SDKs de terceros e integraciones nativas',
    body:
        'Integramos SDKs nativos y bibliotecas especializadas para negocio: autenticacion, pagos, analytics, notificaciones y servicios propietarios, manteniendo estabilidad y rendimiento en produccion.',
    example:
        'Ejemplo practico: añadimos pasarela de pago y autenticacion biometrica manteniendo UX fluida en Android e iOS.',
  ),
  TechStackCard(
    title: 'Material 3 y UI responsiva',
    body:
        'Adoptamos Material 3, LayoutBuilder y breakpoints responsivos para interfaces adaptables a moviles, tablets y escritorio. Mejora la experiencia de usuario, retencion y metricas de usabilidad.',
    example:
        'Ejemplo practico: la misma jornada de compra se reorganiza automaticamente en tablet y escritorio sin duplicar pantallas.',
  ),
  TechStackCard(
    title: 'Integraciones web y SEO tecnico',
    body:
        'Implementamos metatags dinamicas, Open Graph, canonical, robots.txt y sitemap.xml para mejorar rastreo e indexacion en Google. Tambien aplicamos buenas practicas con Content Security Policy y politicas de permisos.',
    example:
        'Ejemplo practico: la pagina de servicio gana preview optimizado en WhatsApp y mejor posicionamiento organico en Google.',
  ),
  TechStackCard(
    title: 'Analytics y consentimiento (GA4)',
    body:
        'Medicion con Google Analytics 4 integrada al flujo de consentimiento de cookies. Permite analisis de comportamiento respetando la privacidad y politicas modernas de medicion.',
    example:
        'Ejemplo practico: el embudo de conversion registra solo eventos consentidos y orienta mejoras de UX con datos reales.',
  ),
  TechStackCard(
    title: 'Arquitectura limpia y mantenimiento',
    body:
        'Priorizamos codigo organizado, componentes reutilizables y separacion de responsabilidades para evolucion continua del producto, menos errores y menor coste de mantenimiento.',
    example:
        'Ejemplo practico: una nueva funcionalidad de suscripcion se anade reutilizando componentes y reduciendo esfuerzo de QA.',
  ),
  TechStackCard(
    title: 'Integraciones HTTP y servicios externos',
    body:
        'Integramos APIs externas y servicios de datos para flujos reales de negocio, incluyendo endpoints de back-end y observabilidad, garantizando fiabilidad operativa y evolucion guiada por metricas.',
    example:
        'Ejemplo practico: monitorizamos latencia y error de APIs en produccion para actuar antes de impactar a clientes.',
  ),
];

class _SiteTecnologiasTextsEn extends SiteTecnologiasTexts {
  const _SiteTecnologiasTextsEn() : super();

  @override
  String get semanticsLabel => 'Flutter technologies and PerfectGest core stack';

  @override
  String get heroTitle => 'Flutter stack and PerfectGest technologies';

  @override
  String get heroIntro1 =>
      'Our technical strategy connects architecture, data, user experience and continuous operations. Each component below is designed to work together, reducing risk and accelerating predictable-quality delivery.';

  @override
  String get heroIntro2 =>
      'Integrated flow: solid technical foundation -> reliable data -> consistent experience -> measurable operations. Each decision reinforces the next and keeps commercial narrative aligned with product execution.';

  @override
  String get portfolioDifferentialsTitle => 'Portfolio differentiators';

  @override
  String get conceptAppliedLabel => 'Applied concept:';

  @override
  List<TechStackCard> get stackCards => _kEnCards;
}

class _SiteTecnologiasTextsEs extends SiteTecnologiasTexts {
  const _SiteTecnologiasTextsEs() : super();

  @override
  String get semanticsLabel => 'Tecnologias Flutter y stack principal de PerfectGest';

  @override
  String get heroTitle => 'Stack Flutter y tecnologias de PerfectGest';

  @override
  String get heroIntro1 =>
      'Nuestra estrategia tecnica conecta arquitectura, datos, experiencia de uso y operacion continua. Cada componente debajo esta pensado para funcionar junto, reducir riesgos y acelerar entregas con calidad previsible.';

  @override
  String get heroIntro2 =>
      'Flujo integrado: base tecnica solida -> datos fiables -> experiencia consistente -> operacion medible. Asi, cada decision refuerza la siguiente y mantiene coherencia entre discurso comercial y ejecucion de producto.';

  @override
  String get portfolioDifferentialsTitle => 'Diferenciales del portafolio';

  @override
  String get conceptAppliedLabel => 'Concepto aplicado:';

  @override
  List<TechStackCard> get stackCards => _kEsCards;
}
