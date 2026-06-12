import 'package:flutter/widgets.dart';

import '../company_legal.dart';
import '../site_public_urls.dart';

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
  String get semanticsLabel => 'Politica de privacidade, dados, cookies e termos $kCompanyFantasyName';

  @override
  String get appBarTitle => 'Privacidade e termos';

  @override
  String get brandLabel => kCompanyFantasyName;

  @override
  String get docHeadline => 'Política de privacidade, dados pessoais, cookies e termos de uso';

  @override
  String introContactLine(String email) =>
      'Última atualização: documento institucional. Em caso de dúvida sobre tratamento de dados, contacte: $email.';

  @override
  String get section1Title => '1. Quem somos';

  @override
  String get section1Body =>
      'Este documento aplica-se ao site institucional $kSitePublicOrigin, operado por $kCompanyFantasyName ($kCompanyLegalName). '
      'Somos uma software house de desenvolvimento mobile, web e desktop. '
      'Abrange cookies, medição de audiência, formulário de pré-cadastro e contacto neste site — não o aplicativo móvel. '
      'Documentação legal do produto $kProductPerfectGestIName (FAQ, privacidade, exclusão de dados e termos) não faz parte deste documento — consulte a secção Soluções deste site.';

  @override
  String get section2Title => '2. Que dados podemos recolher';

  @override
  String get section2Body =>
      '• Dados técnicos de navegação: endereço IP (muitas vezes truncado ou agregado pelo fornecedor de analytics), tipo de navegador, idioma, páginas visitadas e horários aproximados.\n'
      '• Dados que nos enviar voluntariamente: por exemplo, se nos contactar por WhatsApp ou e-mail, o conteúdo da mensagem e os metadados necessários à comunicação.\n'
      '• Dados do formulário de pré-cadastro (nome, e-mail, comentário opcional e idioma): recolhidos apenas com consentimento explícito, transmitidos por HTTPS para base de dados gerida por nós (alojamento Render). '
      'Utilizamos estes dados para contacto comercial, convites ao programa de pré-lançamento (acesso a builds em desenvolvimento e recolha de feedback), novidades sobre produtos e resposta a pedidos. Não vendemos estes contactos a terceiros.\n'
      'Não vendemos listas de contactos nem dados pessoais a terceiros para fins comerciais independentes.';

  @override
  String get section3Title => '3. Cookies e tecnologias similares';

  @override
  String get section3Body =>
      'Utilizamos cookies e armazenamento local estritamente necessários ao funcionamento do site e, quando ativado com o seu consentimento, cookies de medição de audiência '
      'para compreender de forma agregada como o site é utilizado. Pode gerir ou apagar cookies nas definições do seu navegador. '
      'Se recusar cookies de medição, limitamos o envio de sinais de analytics conforme a configuração do seu browser e as nossas definições de consentimento.';

  @override
  String get section4Title => '4. Medição de audiência';

  @override
  String get section4Body =>
      'Quando activa a medição de audiência, utilizamos um prestador externo de estatísticas agregadas. '
      'O tratamento limita-se a dados técnicos e agregados, sem venda de dados pessoais. '
      'Pode alterar a sua escolha a qualquer momento na secção «Gerenciar cookies» do rodapé ou nesta página.';

  @override
  String get section5Title => '5. Base legal e retenção';

  @override
  String get section5Body =>
      'O tratamento de dados técnicos e de medição pode basear-se no interesse legítimo em melhorar o site e na execução de medidas pré-contratuais ou contratuais quando nos contacta. '
      'O pré-cadastro baseia-se no seu consentimento, que pode revogar a qualquer momento (ver secção 6). '
      'Conservamos mensagens de contacto e registos de pré-cadastro apenas pelo tempo necessário à finalidade indicada ou até pedido de eliminação, respeitando obrigações legais aplicáveis.';

  @override
  String get section6Title => '6. Os seus direitos';

  @override
  String section6Body(String email) =>
      'No Brasil, aplica-se a Lei Geral de Proteção de Dados (LGPD, Lei 13.709/2018). Na União Europeia, aplica-se o RGPD. '
      'Dependendo da lei aplicável, poderá solicitar acesso, retificação, apagamento, limitação, portabilidade ou oposição ao tratamento dos seus dados pessoais, '
      'incluindo dados de pré-cadastro. Para exercer direitos ou questões de privacidade, escreva para $email.';

  @override
  String get section7Title => '7. Termos de uso do site';

  @override
  String get section7Body =>
      'O conteúdo deste site (textos, identidade visual e materiais) destina-se a informação sobre $kCompanyFantasyName e os seus produtos. '
      'A reprodução não autorizada para fins comerciais pode ser proibida. '
      'Os links externos são fornecidos por conveniência; não controlamos sites de terceiros. O uso do site é por sua conta e risco, na medida permitida pela lei.';

  @override
  String get cookieMeasurementTitle => 'Gerenciar cookies de medição';

  @override
  String get cookieMeasurementBody =>
      'Se aceitar, gravamos a sua escolha no navegador e, na próxima carga da página, a medição poderá operar apenas conforme o consentimento dado. '
      'Pode recusar ou revogar apagando os dados do site nas definições do browser ou usando o botão «Recusar» abaixo.';

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
  String get semanticsLabel => 'Perfect Gest Dev privacy policy, data, cookies and terms';

  @override
  String get appBarTitle => 'Privacy and terms';

  @override
  String get brandLabel => kCompanyFantasyName;

  @override
  String get docHeadline => 'Privacy policy, personal data, cookies and terms of use';

  @override
  String introContactLine(String email) =>
      'Last updated: institutional document. If you have questions about data processing, contact: $email.';

  @override
  String get section1Title => '1. Who we are';

  @override
  String get section1Body =>
      'This document applies to the institutional website $kSitePublicOrigin, operated by $kCompanyFantasyName ($kCompanyLegalName). '
      'We are a software house for mobile, web and desktop development. '
      'It covers cookies, audience measurement, the pre-registration form and contact on this site — not the mobile app. '
      'Legal documentation for the $kProductPerfectGestIName product (FAQ, privacy, data deletion and terms) is not part of this document — see the Solutions section of this site.';

  @override
  String get section2Title => '2. Data we may collect';

  @override
  String get section2Body =>
      '• Technical browsing data: IP address (often truncated or aggregated by the analytics provider), browser type, language, pages visited and approximate times.\n'
      '• Data you send voluntarily: for example, if you contact us via WhatsApp or email, the message content and metadata needed for communication.\n'
      '• Pre-registration form data (name, email, optional comment and language): collected only with your explicit consent, sent over HTTPS to a database managed by us (Render hosting). '
      'We use this data for commercial contact, pre-launch program invitations (access to in-development builds and feedback collection), product updates and responding to requests. We do not sell these contacts to third parties.\n'
      'We do not sell contact lists or personal data to third parties for independent commercial purposes.';

  @override
  String get section3Title => '3. Cookies and similar technologies';

  @override
  String get section3Body =>
      'We use cookies and local storage strictly necessary for the site to work and, when enabled with your consent, audience measurement cookies '
      'to understand in aggregate how the site is used. You can manage or delete cookies in your browser settings. '
      'If you decline measurement cookies, we limit analytics signals according to your browser configuration and our consent settings.';

  @override
  String get section4Title => '4. Audience measurement';

  @override
  String get section4Body =>
      'When you enable audience measurement, we use an external aggregated statistics provider. '
      'Processing is limited to technical and aggregated data; we do not sell personal data. '
      'You can change your choice at any time via «Manage cookies» in the footer or on this page.';

  @override
  String get section5Title => '5. Legal basis and retention';

  @override
  String get section5Body =>
      'Processing of technical and measurement data may rely on legitimate interest in improving the site and on pre-contractual or contractual measures when you contact us. '
      'Pre-registration relies on your consent, which you may withdraw at any time (see section 6). '
      'We keep contact messages and pre-registration records only as long as needed for the stated purpose or until a deletion request, subject to applicable legal obligations.';

  @override
  String get section6Title => '6. Your rights';

  @override
  String section6Body(String email) =>
      'In Brazil, the General Data Protection Law (LGPD, Law 13,709/2018) applies. In the European Union, the GDPR applies. '
      'Depending on applicable law, you may request access, rectification, erasure, restriction, portability or objection to processing of your personal data, '
      'including pre-registration data. To exercise rights or ask privacy questions, write to $email.';

  @override
  String get section7Title => '7. Website terms of use';

  @override
  String get section7Body =>
      'The content of this site (text, visual identity and materials) is for information about $kCompanyFantasyName and its products. Unauthorized reproduction for commercial purposes may be prohibited. '
      'External links are provided for convenience; we do not control third-party sites. You use the site at your own risk, to the extent permitted by law.';

  @override
  String get cookieMeasurementTitle => 'Manage measurement cookies';

  @override
  String get cookieMeasurementBody =>
      'If you accept, we store your choice in the browser and, on the next page load, measurement may run only according to your consent. '
      'You can decline or revoke by clearing site data in your browser settings or using «Decline» below.';

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
  String get semanticsLabel => 'Politica de privacidad, datos, cookies y terminos $kCompanyFantasyName';

  @override
  String get appBarTitle => 'Privacidad y terminos';

  @override
  String get brandLabel => kCompanyFantasyName;

  @override
  String get docHeadline => 'Politica de privacidad, datos personales, cookies y terminos de uso';

  @override
  String introContactLine(String email) =>
      'Ultima actualizacion: documento institucional. Si tiene dudas sobre el tratamiento de datos, contacte: $email.';

  @override
  String get section1Title => '1. Quienes somos';

  @override
  String get section1Body =>
      'Este documento se aplica al sitio institucional $kSitePublicOrigin, operado por $kCompanyFantasyName ($kCompanyLegalName). '
      'Somos una software house de desarrollo movil, web y escritorio. '
      'Cubre cookies, medicion de audiencia, formulario de pre-registro y contacto en este sitio — no la aplicacion movil. '
      'La documentacion legal del producto $kProductPerfectGestIName (FAQ, privacidad, eliminacion de datos y terminos) no forma parte de este documento — consulte la seccion Soluciones de este sitio.';

  @override
  String get section2Title => '2. Datos que podemos recopilar';

  @override
  String get section2Body =>
      '• Datos tecnicos de navegacion: direccion IP (a menudo truncada o agregada por el proveedor de analytics), tipo de navegador, idioma, paginas visitadas y horarios aproximados.\n'
      '• Datos que nos envie voluntariamente: por ejemplo, si nos contacta por WhatsApp o correo, el contenido del mensaje y los metadatos necesarios para la comunicacion.\n'
      '• Datos del formulario de pre-registro (nombre, correo, comentario opcional e idioma): recopilados solo con su consentimiento explicito, transmitidos por HTTPS a una base de datos gestionada por nosotros (alojamiento Render). '
      'Utilizamos estos datos para contacto comercial, invitaciones al programa de prelanzamiento (acceso a builds en desarrollo y recogida de retroalimentacion), novedades sobre productos y respuesta a solicitudes. No vendemos estos contactos a terceros.\n'
      'No vendemos listas de contactos ni datos personales a terceros para fines comerciales independientes.';

  @override
  String get section3Title => '3. Cookies y tecnologias similares';

  @override
  String get section3Body =>
      'Utilizamos cookies y almacenamiento local estrictamente necesarios para el funcionamiento del sitio y, cuando esta activado con su consentimiento, cookies de medicion de audiencia '
      'para entender de forma agregada como se usa el sitio. Puede gestionar o borrar cookies en la configuracion del navegador. '
      'Si rechaza cookies de medicion, limitamos el envio de senales de analytics segun la configuracion del navegador y nuestras opciones de consentimiento.';

  @override
  String get section4Title => '4. Medicion de audiencia';

  @override
  String get section4Body =>
      'Cuando activa la medicion de audiencia, utilizamos un proveedor externo de estadisticas agregadas. '
      'El tratamiento se limita a datos tecnicos y agregados; no vendemos datos personales. '
      'Puede cambiar su eleccion en cualquier momento en «Gestionar cookies» del pie de pagina o en esta pagina.';

  @override
  String get section5Title => '5. Base legal y conservacion';

  @override
  String get section5Body =>
      'El tratamiento de datos tecnicos y de medicion puede basarse en el interes legitimo de mejorar el sitio y en medidas precontractuales o contractuales cuando nos contacta. '
      'El pre-registro se basa en su consentimiento, que puede revocar en cualquier momento (ver seccion 6). '
      'Conservamos los mensajes de contacto y registros de pre-registro solo el tiempo necesario para la finalidad indicada o hasta una solicitud de eliminacion, respetando obligaciones legales aplicables.';

  @override
  String get section6Title => '6. Sus derechos';

  @override
  String section6Body(String email) =>
      'En Brasil, se aplica la Ley General de Proteccion de Datos (LGPD, Ley 13.709/2018). En la Union Europea, se aplica el RGPD. '
      'Segun la ley aplicable, puede solicitar acceso, rectificacion, supresion, limitacion, portabilidad u oposicion al tratamiento de sus datos personales, '
      'incluidos datos de pre-registro. Para ejercer derechos o consultas de privacidad, escriba a $email.';

  @override
  String get section7Title => '7. Terminos de uso del sitio';

  @override
  String get section7Body =>
      'El contenido de este sitio (textos, identidad visual y materiales) tiene fines informativos sobre $kCompanyFantasyName y sus productos. La reproduccion no autorizada con fines comerciales puede estar prohibida. '
      'Los enlaces externos se ofrecen por conveniencia; no controlamos sitios de terceros. El uso del sitio es bajo su propio riesgo, en la medida permitida por la ley.';

  @override
  String get cookieMeasurementTitle => 'Gestionar cookies de medicion';

  @override
  String get cookieMeasurementBody =>
      'Si acepta, guardamos su eleccion en el navegador y, en la proxima carga de la pagina, la medicion puede operar solo segun el consentimiento dado. '
      'Puede rechazar o revocar borrando los datos del sitio en la configuracion del navegador o usando «Rechazar» abajo.';

  @override
  String get snackPreferenceSavedOnce =>
      'Preferencia guardada. Recargue la pagina una vez para aplicar la medicion.';

  @override
  String get acceptMeasurementShort => 'Aceptar medicion';

  @override
  String get acceptMeasurementLong => 'Aceptar cookies de medicion';
}
