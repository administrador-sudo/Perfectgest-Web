import 'package:flutter/widgets.dart';

import '../company_legal.dart';
import '../site_public_urls.dart';

/// Textos longos da pagina de politica de devolucao/reembolso (PT/EN/ES).
///
/// Site vitrine: vendas do produto ocorrem fora deste dominio. Linguagem neutra
/// (sem citar lojas ou plataformas de terceiros).
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
  String get semanticsLabel => 'Etica e compliance $kCompanyFantasyName';

  @override
  String get appBarTitle => 'Ética e Compliance';

  @override
  String get brandLabel => kCompanyFantasyName;

  @override
  String get docHeadline => 'Ética, conformidade e devoluções (site vitrine)';

  @override
  String introContactLine(String email) =>
      'Última atualização: documento institucional. Para solicitar reembolso, cancelamento ou esclarecimentos sobre o produto $kProductPerfectGestIName, contacte: $email.';

  @override
  String get section1Title => '1. Escopo (site vitrine)';

  @override
  String get section1Body =>
      'Este site é a vitrine institucional de $kCompanyFantasyName ($kCompanyLegalName), em $kSitePublicOrigin. '
      'As vendas e pagamentos do produto $kProductPerfectGestIName não são processados neste site — ocorrem no canal de distribuição oficial do produto ou por acordo comercial directo connosco. '
      'Publicamos esta política em favor da transparência com o nosso público e utilizadores.';

  @override
  String get section2Title => '2. Direito de arrependimento (Brasil)';

  @override
  String get section2Body =>
      'Quando aplicável a compras à distância (CDC, art. 49), o consumidor pode exercer o direito de arrependimento em até 7 dias corridos. '
      'Se a compra não ocorreu neste site, o pedido deve ser feito no canal onde adquiriu o produto e/ou pelo nosso contacto de suporte — estamos do lado do utilizador para orientar o processo.';

  @override
  String get section3Title => '3. Produtos digitais, assinaturas e cancelamento';

  @override
  String get section3Body =>
      'Para produtos digitais e assinaturas, reembolso e cancelamento dependem do canal de aquisição; cada canal tem fluxos e prazos próprios. '
      'Independentemente do canal, pode contactar-nos: analisamos pedidos de forma imparcial e orientamos a melhor resolução, incluindo falhas técnicas comprovadas.';

  @override
  String get section4Title => '4. Como solicitar (passo a passo)';

  @override
  String get section4Body =>
      '1) Informe onde adquiriu o produto, data e comprovante.\n'
      '2) Descreva o motivo (arrependimento, cobrança indevida, defeito técnico, etc.).\n'
      '3) Envie para o nosso e-mail de suporte.\n'
      'Responderemos com orientações claras e, quando aplicável, com o procedimento adequado ao seu caso.';

  @override
  String get footerCnpjLabel => 'CNPJ:';

  @override
  String get footerContactLabel => 'Contato com Empresa:';
}

class _SiteReturnsPolicyTextsEn extends SiteReturnsPolicyTexts {
  const _SiteReturnsPolicyTextsEn() : super();

  @override
  String get semanticsLabel => 'Ethics and compliance $kCompanyFantasyName';

  @override
  String get appBarTitle => 'Ethics & Compliance';

  @override
  String get brandLabel => kCompanyFantasyName;

  @override
  String get docHeadline => 'Ethics, compliance and returns (showcase website)';

  @override
  String introContactLine(String email) =>
      'Last updated: institutional document. To request a refund, cancellation, or clarification about $kProductPerfectGestIName, contact: $email.';

  @override
  String get section1Title => '1. Scope (showcase website)';

  @override
  String get section1Body =>
      'This website is the institutional showcase of $kCompanyFantasyName ($kCompanyLegalName) at $kSitePublicOrigin. '
      'Sales and payments for $kProductPerfectGestIName are not processed on this site — they happen through the product\'s official distribution channel or a direct commercial agreement with us. '
      'We publish this policy for transparency with our audience and users.';

  @override
  String get section2Title => '2. Consumer withdrawal (Brazil)';

  @override
  String get section2Body =>
      'When applicable to remote purchases under Brazilian consumer law, a customer may exercise the withdrawal right within 7 calendar days. '
      'If the purchase did not happen on this website, the request must be made through the channel where you bought the product and/or via our support contact — we are on the user\'s side to guide the process.';

  @override
  String get section3Title => '3. Digital products, subscriptions, and cancellation';

  @override
  String get section3Body =>
      'For digital products and subscriptions, refunds and cancellation depend on the purchase channel; each channel has its own flows and timelines. '
      'Regardless of channel, you may contact us: we review requests impartially and guide the best resolution, including confirmed technical issues.';

  @override
  String get section4Title => '4. How to request (step by step)';

  @override
  String get section4Body =>
      '1) State where you purchased the product, date, and proof.\n'
      '2) Describe the reason (withdrawal, incorrect charge, technical defect, etc.).\n'
      '3) Send it to our support email.\n'
      'We will reply with clear guidance and, when applicable, the right procedure for your case.';

  @override
  String get footerCnpjLabel => 'CNPJ:';

  @override
  String get footerContactLabel => 'Company contact:';
}

class _SiteReturnsPolicyTextsEs extends SiteReturnsPolicyTexts {
  const _SiteReturnsPolicyTextsEs() : super();

  @override
  String get semanticsLabel => 'Etica y cumplimiento $kCompanyFantasyName';

  @override
  String get appBarTitle => 'Ética y cumplimiento';

  @override
  String get brandLabel => kCompanyFantasyName;

  @override
  String get docHeadline => 'Ética, cumplimiento y devoluciones (sitio vitrina)';

  @override
  String introContactLine(String email) =>
      'Última actualización: documento institucional. Para solicitar reembolso, cancelación o aclaraciones sobre $kProductPerfectGestIName, contacte: $email.';

  @override
  String get section1Title => '1. Alcance (sitio vitrina)';

  @override
  String get section1Body =>
      'Este sitio es la vitrina institucional de $kCompanyFantasyName ($kCompanyLegalName), en $kSitePublicOrigin. '
      'Las ventas y pagos del producto $kProductPerfectGestIName no se procesan en este sitio — ocurren en el canal de distribución oficial del producto o por acuerdo comercial directo con nosotros. '
      'Publicamos esta política en favor de la transparencia con nuestro público y usuarios.';

  @override
  String get section2Title => '2. Derecho de desistimiento (Brasil)';

  @override
  String get section2Body =>
      'Cuando aplique a compras a distancia según la ley brasileña, el consumidor puede ejercer el derecho de desistimiento dentro de 7 días calendario. '
      'Si la compra no ocurrió en este sitio, la solicitud debe hacerse en el canal donde adquirió el producto y/o por nuestro contacto de soporte — estamos del lado del usuario para orientar el proceso.';

  @override
  String get section3Title => '3. Productos digitales, suscripciones y cancelación';

  @override
  String get section3Body =>
      'Para productos digitales y suscripciones, reembolso y cancelación dependen del canal de adquisición; cada canal tiene flujos y plazos propios. '
      'Independientemente del canal, puede contactarnos: revisamos solicitudes de forma imparcial y orientamos la mejor resolución, incluidas fallas técnicas comprobadas.';

  @override
  String get section4Title => '4. Cómo solicitar (paso a paso)';

  @override
  String get section4Body =>
      '1) Indique dónde adquirió el producto, fecha y comprobante.\n'
      '2) Describa el motivo (desistimiento, cobro indebido, defecto técnico, etc.).\n'
      '3) Envíelo a nuestro correo de soporte.\n'
      'Responderemos con orientaciones claras y, cuando aplique, con el procedimiento adecuado a su caso.';

  @override
  String get footerCnpjLabel => 'CNPJ:';

  @override
  String get footerContactLabel => 'Contacto con la empresa:';
}
