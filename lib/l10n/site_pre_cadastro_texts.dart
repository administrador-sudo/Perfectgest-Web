import 'package:flutter/widgets.dart';

import '../company_legal.dart';
import '../site_public_urls.dart';

/// Textos da pagina `/pre-cadastro` (PT / EN / ES).
abstract class SitePreCadastroTexts {
  const SitePreCadastroTexts();

  static SitePreCadastroTexts of(BuildContext context) {
    switch (Localizations.localeOf(context).languageCode) {
      case 'en':
        return const _SitePreCadastroTextsEn();
      case 'es':
        return const _SitePreCadastroTextsEs();
      case 'pt':
      default:
        return const _SitePreCadastroTextsPt();
    }
  }

  String get semanticsLabel;
  String get appBarTitle;
  String get headline;
  String get intro;
  String get purposeNote;
  String get fieldNameLabel;
  String get fieldNameHint;
  String get fieldEmailLabel;
  String get fieldEmailHint;
  String get fieldCommentLabel;
  String get fieldCommentHint;
  String get consentPrefix;
  String get consentLinkLabel;
  String get consentSuffix;
  String get submitLabel;
  String get submittingLabel;
  String get successTitle;
  String get successBody;
  String get errorGeneric;
  String errorForCode(String code);
  String get backHomeLabel;
}

class _SitePreCadastroTextsPt extends SitePreCadastroTexts {
  const _SitePreCadastroTextsPt() : super();

  @override
  String get semanticsLabel => 'Pre-cadastro $kCompanyFantasyName';

  @override
  String get appBarTitle => 'Pre-cadastro';

  @override
  String get headline => 'Deixe seu contato';

  @override
  String get intro =>
      'Informe nome e e-mail para receber novidades sobre $kProductPerfectGestIName e soluções $kCompanyFantasyName.';

  @override
  String get purposeNote =>
      'Parte deste pré-cadastro destina-se a convites para o nosso programa de pré-lançamento: '
      'acesso integral às versões em desenvolvimento dos aplicativos, com oportunidade de testar funcionalidades em antecipação '
      'e contribuir com feedback que orienta a evolução do produto antes do lançamento público.';

  @override
  String get fieldNameLabel => 'Nome';

  @override
  String get fieldNameHint => 'Seu nome completo';

  @override
  String get fieldEmailLabel => 'E-mail';

  @override
  String get fieldEmailHint => 'seu@email.com';

  @override
  String get fieldCommentLabel => 'Comentário';

  @override
  String get fieldCommentHint => 'Opcional — como podemos ajudar?';

  @override
  String get consentPrefix => 'Li e aceito a ';

  @override
  String get consentLinkLabel => 'política de privacidade';

  @override
  String get consentSuffix =>
      ' e autorizo o contacto sobre novidades, convites de pré-lançamento e serviços indicados.';

  @override
  String get submitLabel => 'Enviar pre-cadastro';

  @override
  String get submittingLabel => 'Enviando…';

  @override
  String get successTitle => 'Pre-cadastro recebido';

  @override
  String get successBody =>
      'Obrigado! Entraremos em contacto em breve no e-mail informado.';

  @override
  String get errorGeneric =>
      'Não foi possível enviar agora. Tente novamente ou escreva para $kCompanyContactEmail.';

  @override
  String errorForCode(String code) => switch (code) {
        'consent_required' => 'Aceite a política de privacidade para continuar.',
        'name_invalid' => 'Informe um nome válido (mínimo 2 caracteres).',
        'email_invalid' => 'Informe um e-mail válido.',
        'network_error' =>
          'Não foi possível contactar o servidor de registos. Verifique a internet ou tente de novo em instantes.',
        'api_waking' =>
          'O servidor está a iniciar (pode demorar até 1 minuto no plano gratuito). Aguarde e envie novamente.',
        'api_not_deployed' =>
          'Serviço de registos ainda não está activo. Contacte $kCompanyContactEmail ou tente mais tarde.',
        'api_unavailable' => 'Serviço temporariamente indisponível. Tente mais tarde.',
        'api_unconfigured' => 'API de leads ainda não configurada no ambiente.',
        _ => errorGeneric,
      };

  @override
  String get backHomeLabel => 'Voltar ao início';
}

class _SitePreCadastroTextsEn extends SitePreCadastroTexts {
  const _SitePreCadastroTextsEn() : super();

  @override
  String get semanticsLabel => 'Pre-registration $kCompanyFantasyName';

  @override
  String get appBarTitle => 'Pre-registration';

  @override
  String get headline => 'Leave your contact details';

  @override
  String get intro =>
      'Enter your name and email to receive updates about $kProductPerfectGestIName and $kCompanyFantasyName solutions.';

  @override
  String get purposeNote =>
      'Pre-registration also enables us to invite selected participants to our pre-launch program: '
      'full access to in-development app builds, early feature testing, and feedback that helps shape the product before public release.';

  @override
  String get fieldNameLabel => 'Name';

  @override
  String get fieldNameHint => 'Your full name';

  @override
  String get fieldEmailLabel => 'Email';

  @override
  String get fieldEmailHint => 'you@email.com';

  @override
  String get fieldCommentLabel => 'Comment';

  @override
  String get fieldCommentHint => 'Optional — how can we help?';

  @override
  String get consentPrefix => 'I have read and accept the ';

  @override
  String get consentLinkLabel => 'privacy policy';

  @override
  String get consentSuffix =>
      ' and authorize contact about updates, pre-launch invitations, and the services mentioned.';

  @override
  String get submitLabel => 'Submit pre-registration';

  @override
  String get submittingLabel => 'Sending…';

  @override
  String get successTitle => 'Pre-registration received';

  @override
  String get successBody =>
      'Thank you! We will contact you soon at the email provided.';

  @override
  String get errorGeneric =>
      'Could not submit right now. Try again or email $kCompanyContactEmail.';

  @override
  String errorForCode(String code) => switch (code) {
        'consent_required' => 'Please accept the privacy policy to continue.',
        'name_invalid' => 'Enter a valid name (at least 2 characters).',
        'email_invalid' => 'Enter a valid email address.',
        'network_error' =>
          'Could not reach the registration server. Check your connection or try again shortly.',
        'api_waking' =>
          'The server is starting (free tier may take up to 1 minute). Wait and submit again.',
        'api_not_deployed' =>
          'Registration service is not active yet. Email $kCompanyContactEmail or try later.',
        'api_unavailable' => 'Service temporarily unavailable. Try again later.',
        'api_unconfigured' => 'Lead API is not configured in this environment.',
        _ => errorGeneric,
      };

  @override
  String get backHomeLabel => 'Back to home';
}

class _SitePreCadastroTextsEs extends SitePreCadastroTexts {
  const _SitePreCadastroTextsEs() : super();

  @override
  String get semanticsLabel => 'Pre-registro $kCompanyFantasyName';

  @override
  String get appBarTitle => 'Pre-registro';

  @override
  String get headline => 'Deje su contacto';

  @override
  String get intro =>
      'Indique nombre y correo para recibir novedades sobre $kProductPerfectGestIName y soluciones $kCompanyFantasyName.';

  @override
  String get purposeNote =>
      'Parte de este pre-registro sirve para invitar a participantes seleccionados al programa de prelanzamiento: '
      'acceso completo a las versiones en desarrollo de las aplicaciones, prueba anticipada de funcionalidades '
      'y retroalimentación que orienta la evolución del producto antes del lanzamiento público.';

  @override
  String get fieldNameLabel => 'Nombre';

  @override
  String get fieldNameHint => 'Su nombre completo';

  @override
  String get fieldEmailLabel => 'Correo electrónico';

  @override
  String get fieldEmailHint => 'su@email.com';

  @override
  String get fieldCommentLabel => 'Comentario';

  @override
  String get fieldCommentHint => 'Opcional — ¿cómo podemos ayudar?';

  @override
  String get consentPrefix => 'He leído y acepto la ';

  @override
  String get consentLinkLabel => 'política de privacidad';

  @override
  String get consentSuffix =>
      ' y autorizo el contacto sobre novedades, invitaciones de prelanzamiento y los servicios indicados.';

  @override
  String get submitLabel => 'Enviar pre-registro';

  @override
  String get submittingLabel => 'Enviando…';

  @override
  String get successTitle => 'Pre-registro recibido';

  @override
  String get successBody =>
      '¡Gracias! Le contactaremos pronto en el correo indicado.';

  @override
  String get errorGeneric =>
      'No se pudo enviar ahora. Intente de nuevo o escriba a $kCompanyContactEmail.';

  @override
  String errorForCode(String code) => switch (code) {
        'consent_required' =>
          'Acepte la política de privacidad para continuar.',
        'name_invalid' => 'Indique un nombre válido (mínimo 2 caracteres).',
        'email_invalid' => 'Indique un correo electrónico válido.',
        'network_error' =>
          'No se pudo contactar el servidor de registros. Verifique internet o intente de nuevo.',
        'api_waking' =>
          'El servidor está iniciando (el plan gratuito puede tardar 1 minuto). Espere e intente de nuevo.',
        'api_not_deployed' =>
          'El servicio de registro aún no está activo. Escriba a $kCompanyContactEmail.',
        'api_unavailable' =>
          'Servicio temporalmente no disponible. Intente más tarde.',
        'api_unconfigured' => 'La API de leads aún no está configurada.',
        _ => errorGeneric,
      };

  @override
  String get backHomeLabel => 'Volver al inicio';
}

/// URL pública documentada (redes / campanhas).
String preCadastroPublicUrlHint() => kPreCadastroPublicUrl;
