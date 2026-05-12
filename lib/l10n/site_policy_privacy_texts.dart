import 'package:flutter/widgets.dart';

/// Textos longos da pagina [PoliticaPrivacidadePage] (PT/EN/ES).
///
/// Mantidos em Dart para nao inflar `app_localizations.dart`; alinham-se ao
/// conteudo juridico original em portugues e traducoes EN/ES para leitura.
abstract class SitePolicyPrivacyTexts {
  const SitePolicyPrivacyTexts();

  static SitePolicyPrivacyTexts of(BuildContext context) {
    switch (Localizations.localeOf(context).languageCode) {
      case 'en':
        return const _SitePolicyPrivacyTextsEn();
      case 'es':
        return const _SitePolicyPrivacyTextsEs();
      case 'pt':
      default:
        return const _SitePolicyPrivacyTextsPt();
    }
  }

  String get semanticsLabel;
  String get appBarTitle;
  String get brandLabel;
  String get docHeadline;
  String introContactLine(String email);
  String get section1Title;
  String get section1Body;
  String get section2Title;
  String get section2Body;
  String get section3Title;
  String get section3Body;
  String get section4Title;
  String get section4Body;
  String get section5Title;
  String get section5Body;
  String get section6Title;
  String section6Body(String email);
  String get section7Title;
  String get section7Body;
  String get cookieMeasurementTitle;
  String get cookieMeasurementBody;
  String get snackPreferenceSavedOnce;
  String get acceptMeasurementShort;
  String get acceptMeasurementLong;
}

class _SitePolicyPrivacyTextsPt extends SitePolicyPrivacyTexts {
  const _SitePolicyPrivacyTextsPt() : super();

  @override
  String get semanticsLabel => 'Politica de privacidade, dados, cookies e termos PerfectGest';

  @override
  String get appBarTitle => 'Privacidade e termos';

  @override
  String get brandLabel => 'PerfectGest';

  @override
  String get docHeadline => 'Política de privacidade, dados pessoais, cookies e termos de uso';

  @override
  String introContactLine(String email) =>
      'Última atualização: documento institucional. Em caso de dúvida sobre tratamento de dados, contacte: $email.';

  @override
  String get section1Title => '1. Quem somos';

  @override
  String get section1Body =>
      'O presente site é operado pela PerfectGest (“nós”, “nossa”). Somos uma software house focada em desenvolvimento de software (mobile, web e desktop), '
      'consultoria técnica e conteúdo institucional. O domínio de referência do projeto é perfectpro-webpageoficial.onrender.com.';

  @override
  String get section2Title => '2. Que dados podemos recolher';

  @override
  String get section2Body =>
      '• Dados técnicos de navegação: endereço IP (muitas vezes truncado ou agregado pelo fornecedor de analytics), tipo de navegador, idioma, páginas visitadas e horários aproximados.\n'
      '• Dados que nos enviar voluntariamente: por exemplo, se nos contactar por WhatsApp ou e-mail, o conteúdo da mensagem e os metadados necessários à comunicação.\n'
      'Não vendemos listas de contactos nem dados pessoais a terceiros para fins comerciais independentes.';

  @override
  String get section3Title => '3. Cookies e tecnologias similares';

  @override
  String get section3Body =>
      'Utilizamos cookies e armazenamento local estritamente necessários ao funcionamento do site e, quando ativado, cookies de medição de audiência (Google Analytics / gtag) '
      'para compreender de forma agregada como o site é utilizado. Pode gerir ou apagar cookies nas definições do seu navegador. '
      'Se recusar cookies de medição, limitamos o envio de sinais de analytics conforme a configuração do seu browser e as nossas definições de consentimento.';

  @override
  String get section4Title => '4. Google Analytics e serviços Google';

  @override
  String get section4Body =>
      'Quando o Google Analytics está configurado neste site, o tratamento de dados associado segue as políticas do Google. '
      'Recomendamos a leitura das páginas oficiais do Google sobre privacidade, cookies e parceiros tecnológicos.';

  @override
  String get section5Title => '5. Base legal e retenção';

  @override
  String get section5Body =>
      'O tratamento de dados técnicos e de medição pode basear-se no interesse legítimo em melhorar o site e na execução de medidas pré-contratuais ou contratuais quando nos contacta. '
      'Conservamos mensagens de contacto apenas pelo tempo necessário a responder e a cumprir obrigações legais aplicáveis.';

  @override
  String get section6Title => '6. Os seus direitos';

  @override
  String section6Body(String email) =>
      'Dependendo da lei aplicável (por exemplo RGPD na UE), poderá solicitar acesso, retificação, apagamento, limitação, portabilidade ou oposição ao tratamento dos seus dados pessoais. '
      'Para exercer direitos ou questões de privacidade, escreva para $email.';

  @override
  String get section7Title => '7. Termos de uso do site';

  @override
  String get section7Body =>
      'O conteúdo deste site (textos, identidade visual e materiais) destina-se a informação sobre a PerfectGest. A reprodução não autorizada para fins comerciais pode ser proibida. '
      'Os links externos são fornecidos por conveniência; não controlamos sites de terceiros. O uso do site é por sua conta e risco, na medida permitida pela lei.';

  @override
  String get cookieMeasurementTitle => 'Cookies de medição (Google)';

  @override
  String get cookieMeasurementBody =>
      'Se aceitar, gravamos a sua escolha no navegador e, na próxima carga da página, o script de medição poderá operar conforme as regras do Google (Consent Mode). '
      'Pode revogar apagando os dados do site nas definições do browser.';

  @override
  String get snackPreferenceSavedOnce =>
      'Preferência gravada. Recarregue a página uma vez para aplicar a medição.';

  @override
  String get acceptMeasurementShort => 'Aceitar medição';

  @override
  String get acceptMeasurementLong => 'Aceitar cookies de medição';
}

class _SitePolicyPrivacyTextsEn extends SitePolicyPrivacyTexts {
  const _SitePolicyPrivacyTextsEn() : super();

  @override
  String get semanticsLabel => 'PerfectGest privacy policy, data, cookies and terms';

  @override
  String get appBarTitle => 'Privacy and terms';

  @override
  String get brandLabel => 'PerfectGest';

  @override
  String get docHeadline => 'Privacy policy, personal data, cookies and terms of use';

  @override
  String introContactLine(String email) =>
      'Last updated: institutional document. If you have questions about data processing, contact: $email.';

  @override
  String get section1Title => '1. Who we are';

  @override
  String get section1Body =>
      'This website is operated by PerfectGest (“we”, “our”). We are a software house focused on software development (mobile, web and desktop), '
      'technical consulting and institutional content. The reference project domain is perfectpro-webpageoficial.onrender.com.';

  @override
  String get section2Title => '2. Data we may collect';

  @override
  String get section2Body =>
      '• Technical browsing data: IP address (often truncated or aggregated by the analytics provider), browser type, language, pages visited and approximate times.\n'
      '• Data you send voluntarily: for example, if you contact us via WhatsApp or email, the message content and metadata needed for communication.\n'
      'We do not sell contact lists or personal data to third parties for independent commercial purposes.';

  @override
  String get section3Title => '3. Cookies and similar technologies';

  @override
  String get section3Body =>
      'We use cookies and local storage strictly necessary for the site to work and, when enabled, audience measurement cookies (Google Analytics / gtag) '
      'to understand in aggregate how the site is used. You can manage or delete cookies in your browser settings. '
      'If you decline measurement cookies, we limit analytics signals according to your browser configuration and our consent settings.';

  @override
  String get section4Title => '4. Google Analytics and Google services';

  @override
  String get section4Body =>
      'When Google Analytics is configured on this site, associated data processing follows Google policies. '
      'We recommend reading Google’s official pages on privacy, cookies and technology partners.';

  @override
  String get section5Title => '5. Legal basis and retention';

  @override
  String get section5Body =>
      'Processing of technical and measurement data may rely on legitimate interest in improving the site and on pre-contractual or contractual measures when you contact us. '
      'We keep contact messages only as long as needed to respond and to meet applicable legal obligations.';

  @override
  String get section6Title => '6. Your rights';

  @override
  String section6Body(String email) =>
      'Depending on applicable law (for example GDPR in the EU), you may request access, rectification, erasure, restriction, portability or objection to processing of your personal data. '
      'To exercise rights or ask privacy questions, write to $email.';

  @override
  String get section7Title => '7. Website terms of use';

  @override
  String get section7Body =>
      'The content of this site (text, visual identity and materials) is for information about PerfectGest. Unauthorized reproduction for commercial purposes may be prohibited. '
      'External links are provided for convenience; we do not control third-party sites. You use the site at your own risk, to the extent permitted by law.';

  @override
  String get cookieMeasurementTitle => 'Measurement cookies (Google)';

  @override
  String get cookieMeasurementBody =>
      'If you accept, we store your choice in the browser and, on the next page load, the measurement script may run according to Google rules (Consent Mode). '
      'You can revoke by clearing site data in your browser settings.';

  @override
  String get snackPreferenceSavedOnce =>
      'Preference saved. Reload the page once to apply measurement.';

  @override
  String get acceptMeasurementShort => 'Accept measurement';

  @override
  String get acceptMeasurementLong => 'Accept measurement cookies';
}

class _SitePolicyPrivacyTextsEs extends SitePolicyPrivacyTexts {
  const _SitePolicyPrivacyTextsEs() : super();

  @override
  String get semanticsLabel => 'Politica de privacidad, datos, cookies y terminos PerfectGest';

  @override
  String get appBarTitle => 'Privacidad y terminos';

  @override
  String get brandLabel => 'PerfectGest';

  @override
  String get docHeadline => 'Politica de privacidad, datos personales, cookies y terminos de uso';

  @override
  String introContactLine(String email) =>
      'Ultima actualizacion: documento institucional. Si tiene dudas sobre el tratamiento de datos, contacte: $email.';

  @override
  String get section1Title => '1. Quienes somos';

  @override
  String get section1Body =>
      'Este sitio web es operado por PerfectGest (“nosotros”, “nuestra”). Somos una software house enfocada en desarrollo de software (movil, web y escritorio), '
      'consultoria tecnica y contenido institucional. El dominio de referencia del proyecto es perfectpro-webpageoficial.onrender.com.';

  @override
  String get section2Title => '2. Datos que podemos recopilar';

  @override
  String get section2Body =>
      '• Datos tecnicos de navegacion: direccion IP (a menudo truncada o agregada por el proveedor de analytics), tipo de navegador, idioma, paginas visitadas y horarios aproximados.\n'
      '• Datos que nos envie voluntariamente: por ejemplo, si nos contacta por WhatsApp o correo, el contenido del mensaje y los metadatos necesarios para la comunicacion.\n'
      'No vendemos listas de contactos ni datos personales a terceros para fines comerciales independientes.';

  @override
  String get section3Title => '3. Cookies y tecnologias similares';

  @override
  String get section3Body =>
      'Utilizamos cookies y almacenamiento local estrictamente necesarios para el funcionamiento del sitio y, cuando esta activado, cookies de medicion de audiencia (Google Analytics / gtag) '
      'para entender de forma agregada como se usa el sitio. Puede gestionar o borrar cookies en la configuracion del navegador. '
      'Si rechaza cookies de medicion, limitamos el envio de senales de analytics segun la configuracion del navegador y nuestras opciones de consentimiento.';

  @override
  String get section4Title => '4. Google Analytics y servicios de Google';

  @override
  String get section4Body =>
      'Cuando Google Analytics esta configurado en este sitio, el tratamiento de datos asociado sigue las politicas de Google. '
      'Recomendamos leer las paginas oficiales de Google sobre privacidad, cookies y socios tecnologicos.';

  @override
  String get section5Title => '5. Base legal y conservacion';

  @override
  String get section5Body =>
      'El tratamiento de datos tecnicos y de medicion puede basarse en el interes legitimo de mejorar el sitio y en medidas precontractuales o contractuales cuando nos contacta. '
      'Conservamos los mensajes de contacto solo el tiempo necesario para responder y cumplir obligaciones legales aplicables.';

  @override
  String get section6Title => '6. Sus derechos';

  @override
  String section6Body(String email) =>
      'Segun la ley aplicable (por ejemplo el RGPD en la UE), puede solicitar acceso, rectificacion, supresion, limitacion, portabilidad u oposicion al tratamiento de sus datos personales. '
      'Para ejercer derechos o consultas de privacidad, escriba a $email.';

  @override
  String get section7Title => '7. Terminos de uso del sitio';

  @override
  String get section7Body =>
      'El contenido de este sitio (textos, identidad visual y materiales) tiene fines informativos sobre PerfectGest. La reproduccion no autorizada con fines comerciales puede estar prohibida. '
      'Los enlaces externos se ofrecen por conveniencia; no controlamos sitios de terceros. El uso del sitio es bajo su propio riesgo, en la medida permitida por la ley.';

  @override
  String get cookieMeasurementTitle => 'Cookies de medicion (Google)';

  @override
  String get cookieMeasurementBody =>
      'Si acepta, guardamos su eleccion en el navegador y, en la proxima carga de la pagina, el script de medicion puede operar segun las reglas de Google (Consent Mode). '
      'Puede revocar borrando los datos del sitio en la configuracion del navegador.';

  @override
  String get snackPreferenceSavedOnce =>
      'Preferencia guardada. Recargue la pagina una vez para aplicar la medicion.';

  @override
  String get acceptMeasurementShort => 'Aceptar medicion';

  @override
  String get acceptMeasurementLong => 'Aceptar cookies de medicion';
}
