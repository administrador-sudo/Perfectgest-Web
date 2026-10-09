import 'package:flutter/widgets.dart';

class SiteFaqLink {
  const SiteFaqLink({required this.label, required this.url});
  final String label;
  final String url;
}

class SiteFaqItem {
  const SiteFaqItem({
    required this.question,
    required this.body,
    this.links = const <SiteFaqLink>[],
  });
  final String question;
  final String body;
  final List<SiteFaqLink> links;
}

const List<SiteFaqLink> kContabilgestOfficialSourceLinks = <SiteFaqLink>[
  SiteFaqLink(
    label: 'Simples / PGDAS / DAS',
    url: 'https://www8.receita.fazenda.gov.br/SimplesNacional/',
  ),
  SiteFaqLink(
    label: 'MEI (Portal do Empreendedor)',
    url: 'https://www.gov.br/empresas-e-negocios/pt-br/empreendedor',
  ),
  SiteFaqLink(label: 'eSocial', url: 'https://www.esocial.gov.br/'),
  SiteFaqLink(
    label: 'e-CAC / DCTFWeb',
    url: 'https://cav.receita.fazenda.gov.br/',
  ),
  SiteFaqLink(
    label: 'FGTS Digital',
    url: 'https://www.gov.br/trabalho-e-emprego/pt-br/servicos/empregador/fgtsdigital',
  ),
  SiteFaqLink(label: 'NFS-e Nacional', url: 'https://www.gov.br/nfse/pt-br'),
  SiteFaqLink(
    label: 'IRPF',
    url: 'https://www.gov.br/receitafederal/pt-br/assuntos/meu-imposto-de-renda',
  ),
];

abstract class SiteContabilgestFaqTexts {
  const SiteContabilgestFaqTexts();

  static SiteContabilgestFaqTexts of(BuildContext context) {
    switch (Localizations.localeOf(context).languageCode) {
      case 'en':
        return const _SiteContabilgestFaqTextsEn();
      case 'es':
        return const _SiteContabilgestFaqTextsEs();
      case 'pt':
      default:
        return const _SiteContabilgestFaqTextsPt();
    }
  }

  String get semanticsLabel;
  String get appBarTitle;
  String get brandLabel;
  String get docHeadline;
  List<SiteFaqItem> get items;
}

class _SiteContabilgestFaqTextsPt extends SiteContabilgestFaqTexts {
  const _SiteContabilgestFaqTextsPt();

  @override
  String get semanticsLabel => 'Perguntas e respostas PerfectGest ContabilGest';
  @override
  String get appBarTitle => 'Perguntas e respostas';
  @override
  String get brandLabel => 'PerfectGest ContabilGest';
  @override
  String get docHeadline => 'Perguntas e respostas sobre o Aplicativo';

  @override
  List<SiteFaqItem> get items => const <SiteFaqItem>[
        SiteFaqItem(
          question: 'O que é o app?',
          body:
              'O PerfectGest ContabilGest é a ferramenta que registra o movimento da empresa no aparelho (Livro Caixa, NFS-e, NF-e e obrigações) e, quando o escritório habilita as funções, transmite esses dados ao escritório de contabilidade (CRC). O uso diário no aparelho é offline por padrão. A assinatura na Google Play abre o aplicativo; o envio ao escritório e as funções online só existem depois da habilitação.',
        ),
        SiteFaqItem(
          question: 'O ContabilGest é um app oficial do governo?',
          body:
              'Não. É um produto privado da Perfect Gest Dev (CNPJ 66.889.409/0001-19). Não somos afiliados nem endossados pela Receita Federal, eSocial, FGTS Digital ou prefeituras. A fonte oficial de obrigações e guias é sempre o portal do governo.',
        ),
        SiteFaqItem(
          question: 'Quais são as fontes oficiais?',
          body: 'Use sempre os portais do governo.',
          links: kContabilgestOfficialSourceLinks,
        ),
        SiteFaqItem(
          question: 'Preciso de internet?',
          body:
              '- Lançar, fechar o mês e gerar PDF: não\n'
              '- Assinar ou restaurar a compra do aplicativo na Google Play: sim\n'
              '- Enviar dados ao escritório, certificado A1 e Assistente IA: sim, e só depois da habilitação pelo escritório\n'
              '- Abrir portais do governo (DAS, eSocial, DCTFWeb, FGTS Digital, prefeitura): sim',
        ),
        SiteFaqItem(
          question: 'O app substitui meu contador?',
          body:
              'Não. O aplicativo organiza os dados e, com a habilitação, envia-os ao escritório. Nos planos com acompanhamento, um contador habilitado revisa e assina os livros. No Básico MEI você opera no app, no seu ritmo, e continua responsável por conferir o que usa. Em qualquer plano, confira PDFs, holerites e comunicações antes de usar.',
        ),
        SiteFaqItem(
          question: 'O app envia declarações sozinho aos portais do governo?',
          body:
              'Não. O app não transmite sozinho no eSocial, DCTFWeb, FGTS Digital, DAS ou prefeitura. Quem envia nesses portais é você ou o contador, no serviço contratado. Com a habilitação, o app transmite os dados do usuário para o escritório (CRC), não para o governo.',
        ),
        SiteFaqItem(
          question: 'Como emito NFS-e / NF-e no plano Básico?',
          body:
              'A emissão exige certificado A1 do emitente e as autorizações do portal (prefeitura, NFS-e Nacional e/ou SEFAZ). Login e senha do portal municipal não substituem o A1. Sem habilitação do escritório, a assinatura da Play não basta para emitir.',
        ),
        SiteFaqItem(
          question: 'Como emito NFS-e / NF-e com Contabil+ ou pacote com contador?',
          body:
              'Fluxo homologado: NFS-e com A1 do escritório + procuração (CRC); NF-e com A1 do emitente na SEFAZ. O contador apoia autorizações e emissão no escopo contratado. Login e senha de portal não substituem o A1. A habilitação é do escritório, não um upgrade na Google Play.',
        ),
        SiteFaqItem(
          question: 'A NF-e de venda aceita login/senha do portal?',
          body:
              'Não. A SEFAZ exige certificado A1 (assinatura e ligação) para NF-e. Login e senha de portal não autorizam NF-e, nem no plano Básico nem nos planos com contador.',
        ),
        SiteFaqItem(
          question: 'O app movimenta dinheiro da minha conta?',
          body: 'Não. Não acessa banco nem faz transferências.',
        ),
        SiteFaqItem(
          question: 'Posso usar sem assinar?',
          body:
              '- Demonstração («Conhecer o app»): navegar menus e telas\n'
              '- Assinatura na Google Play: acesso ao aplicativo\n'
              '- Funções plenas (envio ao escritório e funções online): depois da Play, contacte o escritório para habilitar; sem isso, a Play só abre o app\n'
              '- Oferta só certificado A1 (avulso), quando indicada: não inclui o uso completo do Livro Caixa / app\n\n'
              'Compra do aplicativo: tela de assinatura da Play, ou Recuperar a conta / Restaurar compra. Plano contábil: escritório / suporte@perfectgestdev.com.',
        ),
        SiteFaqItem(
          question: 'Assinaturas (política Google Play)',
          body:
              'Isto vale só para a assinatura do aplicativo, não para o plano contábil.\n'
              'Cobrança, renovação e cancelamento: Google Play. Renovação automática até cancelar em Play → Pagamentos e assinaturas → Assinaturas. Desinstalar o app não cancela. Reembolsos: política da Google Play. Sem teste gratuito, salvo campanha na Play Console. Preço oficial: o do checkout na Play. O plano (faixa, extras, upgrade/downgrade) é gerido pelo escritório, não pela Play.',
        ),
        SiteFaqItem(
          question: 'Como restauro uma compra?',
          body:
              'Mais → Assinatura Google Play → Restaurar compra (ou Recuperar a conta / «Já tenho conta»). Isso restaura só a assinatura do aplicativo. Plano e habilitação: escritório / suporte@perfectgestdev.com.',
        ),
        SiteFaqItem(
          question: 'Como altero meu plano (faixa, downgrade ou extras como folha e IR)?',
          body:
              'Toda alteração de plano é pedida por e-mail a suporte@perfectgestdev.com. O escritório gere as faixas e os extras (upgrade aplica; downgrade no fim do ciclo). A Google Play não troca Essencial, Standard ou Avançado.',
        ),
        SiteFaqItem(
          question: 'O app avisa antes da renovação?',
          body:
              'Quando a Play informar a data do ciclo da assinatura do aplicativo, o app pode avisar até 30 dias antes. Sem data da Play, não há prazo inventado — consulte Play → Assinaturas. Honorários e plano contábil: com o escritório.',
        ),
        SiteFaqItem(
          question: 'A assinatura da Play já libera tudo?',
          body:
              'Não. A Play libera o acesso ao aplicativo. Para sincronização, envio de dados ao escritório e funções online, contacte o escritório depois de assinar. Sem habilitação, você entra no app, mas sem envio ao CRC e sem contato com o escritório.',
        ),
      ];
}

class _SiteContabilgestFaqTextsEn extends SiteContabilgestFaqTexts {
  const _SiteContabilgestFaqTextsEn();

  @override
  String get semanticsLabel => 'Questions and answers PerfectGest ContabilGest';
  @override
  String get appBarTitle => 'Questions and answers';
  @override
  String get brandLabel => 'PerfectGest ContabilGest';
  @override
  String get docHeadline => 'Questions and answers about the App';

  @override
  List<SiteFaqItem> get items => const <SiteFaqItem>[
        SiteFaqItem(
          question: 'What is the app?',
          body:
              'PerfectGest ContabilGest is the tool that records the company\'s activity on the device (Cash Book, NFS-e, NF-e, and tax duties) and, when the office enables the functions, transmits that data to the accounting office (CRC). Daily use on the device is offline by default. A Google Play subscription opens the app; sending data to the office and online functions exist only after enablement.',
        ),
        SiteFaqItem(
          question: 'Is ContabilGest an official government app?',
          body:
              'No. It is a private product of Perfect Gest Dev (CNPJ 66.889.409/0001-19). We are not affiliated with or endorsed by the Federal Revenue Service, eSocial, FGTS Digital, or city halls. The official source of obligations and guides is always the government portal.',
        ),
        SiteFaqItem(
          question: 'What are the official sources?',
          body: 'Always use government portals.',
          links: kContabilgestOfficialSourceLinks,
        ),
        SiteFaqItem(
          question: 'Do I need the internet?',
          body:
              '- Record entries, close the month, and generate PDF: no\n'
              '- Subscribe or restore the app purchase on Google Play: yes\n'
              '- Send data to the office, A1 certificate, and AI Assistant: yes, and only after the office enables those functions\n'
              '- Open government portals (DAS, eSocial, DCTFWeb, FGTS Digital, city hall): yes',
        ),
        SiteFaqItem(
          question: 'Does the app replace my accountant?',
          body:
              'No. The app organizes the data and, once enabled, sends it to the office. On plans with follow-up, a licensed accountant reviews and signs the books. On Basic MEI you operate in the app at your own pace and remain responsible for checking what you use. On any plan, check PDFs, payslips, and notices before using them.',
        ),
        SiteFaqItem(
          question: 'Does the app file returns on government portals by itself?',
          body:
              'No. The app does not transmit by itself to eSocial, DCTFWeb, FGTS Digital, DAS, or city hall. You or the accountant, under the contracted service, send filings on those portals. Once enabled, the app transmits the user\'s data to the accounting office (CRC), not to the government.',
        ),
        SiteFaqItem(
          question: 'How do I issue NFS-e / NF-e on the Basic plan?',
          body:
              'Issuance requires the issuer A1 certificate and the portal authorizations (city hall, National NFS-e and/or SEFAZ). Municipal portal username and password do not replace the A1. Without office enablement, a Play subscription is not enough to issue invoices.',
        ),
        SiteFaqItem(
          question: 'How do I issue NFS-e / NF-e with Contabil+ or an accountant package?',
          body:
              'Approved flow: NFS-e with the office A1 plus power of attorney (CRC); NF-e with the issuer A1 at SEFAZ. The accountant supports authorizations and issuance in the contracted scope. Portal login and password do not replace the A1. Enablement is done by the office, not as a Google Play upgrade.',
        ),
        SiteFaqItem(
          question: 'Does a sales NF-e accept portal login/password?',
          body:
              'No. SEFAZ requires an A1 certificate (signature and connection) for NF-e. Portal login and password do not authorize NF-e, neither on the Basic plan nor on plans with an accountant.',
        ),
        SiteFaqItem(
          question: 'Does the app move money from my bank account?',
          body: 'No. It does not access your bank or make transfers.',
        ),
        SiteFaqItem(
          question: 'Can I use it without a subscription?',
          body:
              '- Demo ("See the app"): browse menus and screens\n'
              '- Google Play subscription: access to the app\n'
              '- Full functions (sending data to the office and online features): after Play, contact the office to enable them; without that, Play only opens the app\n'
              '- A1 certificate-only offer (standalone), when shown: does not include full Cash Book / app use\n\n'
              'App purchase: Play subscription screen, or Recover account / Restore purchase. Accounting plan: the office / suporte@perfectgestdev.com.',
        ),
        SiteFaqItem(
          question: 'Subscriptions (Google Play policy)',
          body:
              'This applies only to the app subscription, not to the accounting plan.\n'
              'Billing, renewal, and cancellation: Google Play. Auto-renews until you cancel in Play → Payments and subscriptions → Subscriptions. Uninstalling the app does not cancel. Refunds: Google Play policy. No free trial unless a Play Console campaign says so. Official price: the Play checkout price. The plan (band, add-ons, upgrade/downgrade) is managed by the office, not by Play.',
        ),
        SiteFaqItem(
          question: 'How do I restore a purchase?',
          body:
              'More → Google Play Subscription → Restore purchase (or Recover account / "I already have an account"). This restores only the app subscription. Plan and enablement: the office / suporte@perfectgestdev.com.',
        ),
        SiteFaqItem(
          question: 'How do I change my plan (band, downgrade, or add-ons such as payroll and income tax)?',
          body:
              'Every plan change is requested by email to suporte@perfectgestdev.com. The office manages bands and add-ons (upgrade applies; downgrade at the end of the cycle). Google Play does not switch Essential, Standard, or Advanced.',
        ),
        SiteFaqItem(
          question: 'Does the app warn before renewal?',
          body:
              'When Play provides the app subscription cycle date, the app may warn up to 30 days ahead. Without a Play date, there is no invented deadline — check Play → Subscriptions. Accounting fees and plan: with the office.',
        ),
        SiteFaqItem(
          question: 'Does a Play subscription already unlock everything?',
          body:
              'No. Play unlocks access to the app. For sync, sending data to the office, and online functions, contact the office after you subscribe. Without enablement you can open the app, but with no data sent to the CRC and no office contact.',
        ),
      ];
}

class _SiteContabilgestFaqTextsEs extends SiteContabilgestFaqTexts {
  const _SiteContabilgestFaqTextsEs();

  @override
  String get semanticsLabel => 'Preguntas y respuestas PerfectGest ContabilGest';
  @override
  String get appBarTitle => 'Preguntas y respuestas';
  @override
  String get brandLabel => 'PerfectGest ContabilGest';
  @override
  String get docHeadline => 'Preguntas y respuestas sobre la Aplicación';

  @override
  List<SiteFaqItem> get items => const <SiteFaqItem>[
        SiteFaqItem(
          question: '¿Qué es la app?',
          body:
              'PerfectGest ContabilGest es la herramienta que registra el movimiento de la empresa en el aparato (Libro de caja, NFS-e, NF-e y obligaciones) y, cuando el despacho habilita las funciones, transmite esos datos al despacho de contabilidad (CRC). El uso diario en el aparato es offline por defecto. La suscripción en Google Play abre la aplicación; el envío al despacho y las funciones online solo existen después de la habilitación.',
        ),
        SiteFaqItem(
          question: '¿ContabilGest es una app oficial del gobierno?',
          body:
              'No. Es un producto privado de Perfect Gest Dev (CNPJ 66.889.409/0001-19). No estamos afiliados ni respaldados por la Receita Federal, eSocial, FGTS Digital o prefecturas. La fuente oficial de obligaciones y guías es siempre el portal del gobierno.',
        ),
        SiteFaqItem(
          question: '¿Cuáles son las fuentes oficiales?',
          body: 'Use siempre los portales del gobierno.',
          links: kContabilgestOfficialSourceLinks,
        ),
        SiteFaqItem(
          question: '¿Necesito internet?',
          body:
              '- Registrar, cerrar el mes y generar PDF: no\n'
              '- Suscribir o restaurar la compra de la aplicación en Google Play: sí\n'
              '- Enviar datos al despacho, certificado A1 y Asistente IA: sí, y solo después de la habilitación por el despacho\n'
              '- Abrir portales del gobierno (DAS, eSocial, DCTFWeb, FGTS Digital, prefectura): sí',
        ),
        SiteFaqItem(
          question: '¿La app sustituye a mi contador?',
          body:
              'No. La aplicación organiza los datos y, con la habilitación, los envía al despacho. En los planes con seguimiento, un contador habilitado revisa y firma los libros. En el Básico MEI usted opera en la app, a su ritmo, y sigue siendo responsable de revisar lo que usa. En cualquier plan, revise PDF, recibos de sueldo y comunicaciones antes de usarlos.',
        ),
        SiteFaqItem(
          question: '¿La app envía declaraciones sola a los portales del gobierno?',
          body:
              'No. La app no transmite sola en eSocial, DCTFWeb, FGTS Digital, DAS o prefectura. Quien envía en esos portales es usted o el contador, en el servicio contratado. Con la habilitación, la app transmite los datos del usuario al despacho (CRC), no al gobierno.',
        ),
        SiteFaqItem(
          question: '¿Cómo emito NFS-e / NF-e en el plan Básico?',
          body:
              'La emisión exige certificado A1 del emisor y las autorizaciones del portal (prefectura, NFS-e Nacional y/o SEFAZ). Usuario y contraseña del portal municipal no sustituyen el A1. Sin habilitación del despacho, la suscripción de Play no basta para emitir.',
        ),
        SiteFaqItem(
          question: '¿Cómo emito NFS-e / NF-e con Contabil+ o paquete con contador?',
          body:
              'Flujo homologado: NFS-e con A1 del despacho + poder (CRC); NF-e con A1 del emisor en SEFAZ. El contador apoya autorizaciones y emisión en el alcance contratado. Usuario y contraseña de portal no sustituyen el A1. La habilitación es del despacho, no una mejora en Google Play.',
        ),
        SiteFaqItem(
          question: '¿La NF-e de venta acepta usuario/contraseña del portal?',
          body:
              'No. SEFAZ exige certificado A1 (firma y conexión) para NF-e. Usuario y contraseña de portal no autorizan NF-e, ni en el plan Básico ni en los planes con contador.',
        ),
        SiteFaqItem(
          question: '¿La app mueve dinero de mi cuenta?',
          body: 'No. No accede al banco ni hace transferencias.',
        ),
        SiteFaqItem(
          question: '¿Puedo usarla sin suscribirme?',
          body:
              '- Demostración («Conocer la app»): navegar menús y pantallas\n'
              '- Suscripción en Google Play: acceso a la aplicación\n'
              '- Funciones plenas (envío al despacho y funciones online): después de Play, contacte al despacho para habilitar; sin eso, Play solo abre la app\n'
              '- Oferta solo certificado A1 (suelto), cuando esté indicada: no incluye el uso completo del Libro de caja / app\n\n'
              'Compra de la aplicación: pantalla de suscripción de Play, o Recuperar la cuenta / Restaurar compra. Plan contable: despacho / suporte@perfectgestdev.com.',
        ),
        SiteFaqItem(
          question: 'Suscripciones (política Google Play)',
          body:
              'Esto vale solo para la suscripción de la aplicación, no para el plan contable.\n'
              'Cobro, renovación y cancelación: Google Play. Renovación automática hasta cancelar en Play → Pagos y suscripciones → Suscripciones. Desinstalar la app no cancela. Reembolsos: política de Google Play. Sin prueba gratuita, salvo campaña en Play Console. Precio oficial: el del checkout en Play. El plan (franja, extras, upgrade/downgrade) lo gestiona el despacho, no Play.',
        ),
        SiteFaqItem(
          question: '¿Cómo restauro una compra?',
          body:
              'Más → Suscripción Google Play → Restaurar compra (o Recuperar la cuenta / «Ya tengo cuenta»). Eso restaura solo la suscripción de la aplicación. Plan y habilitación: despacho / suporte@perfectgestdev.com.',
        ),
        SiteFaqItem(
          question: '¿Cómo cambio mi plan (franja, downgrade o extras como nómina e IR)?',
          body:
              'Todo cambio de plan se pide por correo a suporte@perfectgestdev.com. El despacho gestiona las franjas y los extras (el upgrade aplica; el downgrade al final del ciclo). Google Play no cambia Esencial, Standard o Avanzado.',
        ),
        SiteFaqItem(
          question: '¿La app avisa antes de la renovación?',
          body:
              'Cuando Play informe la fecha del ciclo de la suscripción de la aplicación, la app puede avisar hasta 30 días antes. Sin fecha de Play, no hay plazo inventado — consulte Play → Suscripciones. Honorarios y plan contable: con el despacho.',
        ),
        SiteFaqItem(
          question: '¿La suscripción de Play ya libera todo?',
          body:
              'No. Play libera el acceso a la aplicación. Para sincronización, envío de datos al despacho y funciones online, contacte al despacho después de suscribirse. Sin habilitación, usted entra en la app, pero sin envío al CRC y sin contacto con el despacho.',
        ),
      ];
}
