import 'package:flutter/widgets.dart';

import '../company_legal.dart';

/// Textos longos da pagina de politica de devolucao/reembolso (PT/EN/ES).
///
/// Objetivo: passar pela verificacao do Merchant Center e informar que o site
/// e uma vitrine (o produto e digital).
abstract class SiteReturnsPolicyTexts {
  const SiteReturnsPolicyTexts();

  static SiteReturnsPolicyTexts of(BuildContext context) {
    switch (Localizations.localeOf(context).languageCode) {
      case 'en':
        return const _SiteReturnsPolicyTextsEn();
      case 'es':
        return const _SiteReturnsPolicyTextsEs();
      case 'pt':
      default:
        return const _SiteReturnsPolicyTextsPt();
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

  String get footerCnpjLabel;
  String get footerContactLabel;
}

class _SiteReturnsPolicyTextsPt extends SiteReturnsPolicyTexts {
  const _SiteReturnsPolicyTextsPt() : super();

  @override
  String get semanticsLabel => 'Politica de devolucao e reembolso $kCompanyFantasyName';

  @override
  String get appBarTitle => 'Devolucao e reembolso';

  @override
  String get brandLabel => kCompanyFantasyName;

  @override
  String get docHeadline => 'Política de devolução e reembolso (site vitrine)';

  @override
  String introContactLine(String email) =>
      'Última atualização: documento institucional. Para solicitar reembolso, cancelamento ou esclarecimentos sobre o produto $kProductPerfectGestIName, contacte: $email.';

  @override
  String get section1Title => '1. Escopo (site vitrine)';

  @override
  String get section1Body =>
      'Este site é uma vitrine institucional de $kCompanyFantasyName ($kCompanyLegalName). '
      'As vendas e pagamentos do produto $kProductPerfectGestIName ocorrem fora deste site (por exemplo, na Google Play ou em canal comercial). '
      'Ainda assim, mantemos esta política pública para transparência e para verificação em plataformas Google.';

  @override
  String get section2Title => '2. Direito de arrependimento (Brasil)';

  @override
  String get section2Body =>
      'Quando aplicável a compras à distância (CDC, art. 49), o consumidor pode exercer o direito de arrependimento em até 7 dias corridos. '
      'Se a compra e o pagamento não ocorreram neste site, o pedido deve ser feito no canal onde a compra foi realizada (ex.: Google Play) e/ou pelo nosso contacto de suporte.';

  @override
  String get section3Title => '3. Produtos digitais, assinaturas e cancelamento';

  @override
  String get section3Body =>
      'Para produtos digitais e assinaturas, o processamento de reembolso/cancelamento depende do canal de compra. '
      'Quando a aquisição for feita via Google Play, aplicam-se os fluxos e prazos da própria plataforma. '
      'Em caso de falha técnica comprovada, analisamos a solicitação e orientamos o melhor caminho de resolução.';

  @override
  String get section4Title => '4. Como solicitar (passo a passo)';

  @override
  String get section4Body =>
      '1) Informe o canal de compra (Google Play, etc.), data e comprovante.\n'
      '2) Descreva o motivo (arrependimento, cobrança indevida, defeito técnico, etc.).\n'
      '3) Envie para o nosso e-mail de suporte.\n'
      'Responderemos com orientações e, quando aplicável, com o procedimento de reembolso/cancelamento adequado ao canal de compra.';

  @override
  String get footerCnpjLabel => 'CNPJ:';

  @override
  String get footerContactLabel => 'Contato com Empresa:';
}

class _SiteReturnsPolicyTextsEn extends SiteReturnsPolicyTexts {
  const _SiteReturnsPolicyTextsEn() : super();

  @override
  String get semanticsLabel => '$kCompanyFantasyName returns and refunds policy';

  @override
  String get appBarTitle => 'Returns & refunds';

  @override
  String get brandLabel => kCompanyFantasyName;

  @override
  String get docHeadline => 'Returns & refunds policy (showcase website)';

  @override
  String introContactLine(String email) =>
      'Last updated: institutional document. To request a refund, cancellation, or clarification about $kProductPerfectGestIName, contact: $email.';

  @override
  String get section1Title => '1. Scope (showcase website)';

  @override
  String get section1Body =>
      'This website is an institutional showcase for $kCompanyFantasyName ($kCompanyLegalName). '
      'Sales and payments for $kProductPerfectGestIName happen outside this website (for example, on Google Play or via a commercial channel). '
      'We keep this public policy for transparency and for Google platform verification.';

  @override
  String get section2Title => '2. Consumer withdrawal (Brazil)';

  @override
  String get section2Body =>
      'When applicable to remote purchases under Brazilian consumer law, a customer may exercise the withdrawal right within 7 calendar days. '
      'If the purchase and payment did not happen on this website, requests must be made through the original purchase channel (e.g., Google Play) and/or via our support contact.';

  @override
  String get section3Title => '3. Digital products, subscriptions, and cancellation';

  @override
  String get section3Body =>
      'For digital products and subscriptions, refund/cancellation processing depends on the purchase channel. '
      'When purchased via Google Play, the platform flows and timelines apply. '
      'In the event of a confirmed technical issue, we will review the request and guide the best resolution path.';

  @override
  String get section4Title => '4. How to request (step by step)';

  @override
  String get section4Body =>
      '1) Provide the purchase channel (Google Play, etc.), date, and proof.\n'
      '2) Describe the reason (withdrawal, incorrect charge, technical defect, etc.).\n'
      '3) Send it to our support email.\n'
      'We will reply with guidance and, when applicable, the correct procedure for the purchase channel.';

  @override
  String get footerCnpjLabel => 'CNPJ:';

  @override
  String get footerContactLabel => 'Company contact:';
}

class _SiteReturnsPolicyTextsEs extends SiteReturnsPolicyTexts {
  const _SiteReturnsPolicyTextsEs() : super();

  @override
  String get semanticsLabel => 'Política de devoluciones y reembolsos $kCompanyFantasyName';

  @override
  String get appBarTitle => 'Devoluciones y reembolsos';

  @override
  String get brandLabel => kCompanyFantasyName;

  @override
  String get docHeadline => 'Política de devoluciones y reembolsos (sitio vitrina)';

  @override
  String introContactLine(String email) =>
      'Última actualización: documento institucional. Para solicitar reembolso, cancelación o aclaraciones sobre $kProductPerfectGestIName, contacte: $email.';

  @override
  String get section1Title => '1. Alcance (sitio vitrina)';

  @override
  String get section1Body =>
      'Este sitio es una vitrina institucional de $kCompanyFantasyName ($kCompanyLegalName). '
      'Las ventas y pagos del producto $kProductPerfectGestIName ocurren fuera de este sitio (por ejemplo, en Google Play o por canal comercial). '
      'Mantenemos esta política pública para transparencia y para verificación en plataformas de Google.';

  @override
  String get section2Title => '2. Derecho de desistimiento (Brasil)';

  @override
  String get section2Body =>
      'Cuando aplique a compras a distancia según la ley brasileña, el consumidor puede ejercer el derecho de desistimiento dentro de 7 días calendario. '
      'Si la compra y el pago no ocurrieron en este sitio, la solicitud debe hacerse en el canal de compra (p. ej., Google Play) y/o por nuestro contacto de soporte.';

  @override
  String get section3Title => '3. Productos digitales, suscripciones y cancelación';

  @override
  String get section3Body =>
      'Para productos digitales y suscripciones, el reembolso/cancelación depende del canal de compra. '
      'Cuando la compra sea vía Google Play, se aplican los flujos y plazos de la plataforma. '
      'En caso de fallo técnico comprobado, revisaremos la solicitud y orientaremos el mejor camino de resolución.';

  @override
  String get section4Title => '4. Cómo solicitar (paso a paso)';

  @override
  String get section4Body =>
      '1) Indique el canal de compra (Google Play, etc.), fecha y comprobante.\n'
      '2) Describa el motivo (desistimiento, cobro indebido, defecto técnico, etc.).\n'
      '3) Envíelo a nuestro correo de soporte.\n'
      'Responderemos con orientaciones y, cuando aplique, con el procedimiento correcto según el canal de compra.';

  @override
  String get footerCnpjLabel => 'CNPJ:';

  @override
  String get footerContactLabel => 'Contacto con la empresa:';
}

