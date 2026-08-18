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
              'O PerfectGest ContabilGest ajuda MEI e pequenos empresários a registrar entradas e saídas (Livro Caixa), acompanhar obrigações fiscais, simular Imposto de Renda, gerenciar funcionários, pró-labore e, nos planos contratados, enviar o mês para conferência do contador. O uso diário é offline por padrão.',
        ),
        SiteFaqItem(
          question: 'O ContabilGest é um app oficial do governo?',
          body:
              'Não. É um produto privado da Perfect Gest Dev (CNPJ 66.889.409/0001-19). Não somos afiliados nem endossados pela Receita Federal, eSocial, FGTS Digital ou prefeituras. A fonte oficial de obrigações e guias é sempre o portal do governo.',
        ),
        SiteFaqItem(
          question: 'Quais são as fontes oficiais?',
          body: 'Use sempre os portais do governo para obrigações e guias:',
          links: kContabilgestOfficialSourceLinks,
        ),
        SiteFaqItem(
          question: 'Preciso de internet?',
          body:
              '- Lançar, fechar o mês e gerar PDF: não\n'
              '- Assinar plano, restaurar compra, enviar ao contador, certificado A1, Assistente IA: sim\n'
              '- Abrir portais do governo (DAS, eSocial, DCTFWeb, FGTS Digital, prefeitura): sim',
        ),
        SiteFaqItem(
          question: 'O app substitui meu contador?',
          body:
              'Não por completo. Nos planos básicos você opera sozinho e é responsável por conferir tudo. Nos planos Contabil+ / pacote anual, o contador revisa e assina conforme o escopo contratado — você ainda deve conferir PDFs, holerites e comunicações antes de usar.',
        ),
        SiteFaqItem(
          question: 'O app envia declarações sozinho aos portais do governo?',
          body:
              'Não. O app é portal assistido: calcula, organiza prazos e abre o link do portal. Quem transmite no eSocial, DCTFWeb, FGTS Digital, DAS etc. é você (ou o contador no serviço contratado), nunca o app de forma automática.',
        ),
        SiteFaqItem(
          question: 'Como emito NFS-e no plano Básico?',
          body:
              'No Básico, o app pode pedir o utilizador e a senha do portal municipal. O pedido vai para a fila e o Worker autentica com essa credencial. Não é o certificado A1. Captcha/2FA no portal podem exigir que conclua o acesso no site da prefeitura.',
        ),
        SiteFaqItem(
          question: 'Como emito NFS-e / NF-e com Contabil+ ou pacote com contador?',
          body:
              'Continua o fluxo homologado: NFS-e com A1 do escritório + procuração (CRC); NF-e com A1 do emitente na SEFAZ. O login/senha do portal do Básico não substitui esse processo.',
        ),
        SiteFaqItem(
          question: 'A NF-e de venda aceita login/senha do portal?',
          body:
              'Não. A SEFAZ exige certificado A1 (assinatura e ligação). Login/senha de site não autoriza NF-e.',
        ),
        SiteFaqItem(
          question: 'O app movimenta dinheiro da minha conta?',
          body: 'Não. Não acessa banco nem faz transferências.',
        ),
        SiteFaqItem(
          question: 'Posso usar sem assinar?',
          body:
              '- Modo demonstração («Conhecer o app»): pode navegar menus e ecrãs para conhecer o ContabilGest.\n'
              '- Funções de uso (lançar, gravar, fechar mês, enviar ao contador, etc.): exigem assinatura activa na Google Play.\n'
              '- Oferta só certificado A1 (avulso): não inclui o uso completo do Livro Caixa / app.\n\n'
              'Para utilizar o app, escolha um plano na tela de assinatura. Se já comprou: «Já tenho conta» / Restaurar compra.',
        ),
        SiteFaqItem(
          question: 'Assinaturas (política Google Play)',
          body:
              '- Assinatura necessária para utilizar o ContabilGest (exceto oferta avulsa «só certificado», quando indicada)\n'
              '- Cobrança e renovação: geridas pela Google Play\n'
              '- Renovação automática até cancelar em Play → Pagamentos e subscrições → Subscrições\n'
              '- Em planos Parcelas (contador / pacotes), há compromisso de 12 meses; cancelamento ou mudança pode só valer no fim desse compromisso, conforme a Play\n'
              '- Desinstalar o app não cancela a assinatura\n'
              '- Na app: Mais → Assinatura Google Play (planos) · Cancelar / gerir cobrança (abre o Centro de Assinaturas)\n'
              '- Reembolsos: política da Google Play\n'
              '- Não há período de teste gratuito, salvo campanha expressa na Play Console\n'
              '- O preço oficial é o exibido na Play no checkout; tabelas neste FAQ são só referência\n'
              '- No ecrã de planos, a app mostra termos da oferta (preço, frequência, renovação, cancelamento) e o fluxo de upgrade Contabil+',
        ),
        SiteFaqItem(
          question: 'Como restauro uma compra?',
          body:
              'Mais → Assinatura Google Play → Restaurar compra (ou «Já tenho conta» na landing)',
        ),
        SiteFaqItem(
          question: 'Posso mudar de Essencial para Standard ou Avançado?',
          body:
              'Sim. Com Contabil+ activo: Mais → Alterar plano Contabil+ → Actualizar plano na faixa superior. A Google Play cobra a diferença proporcional (substituição de assinatura). Também pode usar o botão «Actualizar plano» / «Gerir plano» no paywall.',
        ),
        SiteFaqItem(
          question: 'Posso baixar de Avançado para Standard ou Essencial?',
          body:
              'Não há botão de «downgrade imediato» na app. Cancele a renovação automática na Google Play, use até ao fim do período já pago e, depois, assine o plano desejado na app. Detalhes: Mais → Alterar plano Contabil+ → «Precisa de um plano inferior?»',
        ),
        SiteFaqItem(
          question: 'Posso adicionar lançamentos, folha ou IR depois?',
          body:
              'Sim, se tiver Contabil+ (qualquer faixa) ou pacote anual com contador: Mais → Complementar plano (folha e IR). A Conferencia do Contador já está incluída. Planos Básico sem Contabil+ não são elegíveis.',
        ),
        SiteFaqItem(
          question: 'A app avisa antes da renovação?',
          body:
              'Quando a Play informar a data do ciclo, a app pode avisar até 30 dias antes (Início / Mais). Sem data da Play, não há contagem inventada — consulte Play → Assinaturas.',
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
              'PerfectGest ContabilGest helps MEI and small business owners record income and expenses (Cash Book), track tax obligations, simulate Income Tax, manage employees and owner draws, and, on contracted plans, send the month to the accountant for review. Daily use is offline by default.',
        ),
        SiteFaqItem(
          question: 'Is ContabilGest an official government app?',
          body:
              'No. It is a private product of Perfect Gest Dev (CNPJ 66.889.409/0001-19). We are not affiliated with or endorsed by the Federal Revenue Service, eSocial, FGTS Digital, or city halls. The official source of obligations and guides is always the government portal.',
        ),
        SiteFaqItem(
          question: 'What are the official sources?',
          body: 'Always use government portals for obligations and guides:',
          links: kContabilgestOfficialSourceLinks,
        ),
        SiteFaqItem(
          question: 'Do I need the internet?',
          body:
              '- Record entries, close the month, and generate PDF: no\n'
              '- Subscribe, restore a purchase, send to the accountant, A1 certificate, AI Assistant: yes\n'
              '- Open government portals (DAS, eSocial, DCTFWeb, FGTS Digital, city hall): yes',
        ),
        SiteFaqItem(
          question: 'Does the app replace my accountant?',
          body:
              'Not completely. On basic plans you operate on your own and you are responsible for checking everything. On Contabil+ / annual packages, the accountant reviews and signs according to the contracted scope — you must still check PDFs, payslips, and notices before using them.',
        ),
        SiteFaqItem(
          question: 'Does the app file returns on government portals by itself?',
          body:
              'No. The app is an assisted portal: it calculates, organizes deadlines, and opens the portal link. You (or the accountant under a contracted service) transmit in eSocial, DCTFWeb, FGTS Digital, DAS, and so on. The app never transmits automatically.',
        ),
        SiteFaqItem(
          question: 'How do I issue NFS-e on the Basic plan?',
          body:
              'On Basic, the app may ask for the municipal portal username and password. The request goes to the queue and the Worker authenticates with that credential. It is not the A1 certificate. Captcha/2FA on the portal may require you to finish access on the city hall website.',
        ),
        SiteFaqItem(
          question: 'How do I issue NFS-e / NF-e with Contabil+ or an accountant package?',
          body:
              'The approved flow remains: NFS-e with the office A1 plus power of attorney (CRC); NF-e with the issuer A1 at SEFAZ. The Basic portal login/password does not replace that process.',
        ),
        SiteFaqItem(
          question: 'Does a sales NF-e accept portal login/password?',
          body:
              'No. SEFAZ requires an A1 certificate (signature and connection). A website login/password does not authorize NF-e.',
        ),
        SiteFaqItem(
          question: 'Does the app move money from my bank account?',
          body: 'No. It does not access your bank or make transfers.',
        ),
        SiteFaqItem(
          question: 'Can I use it without a subscription?',
          body:
              '- Demo mode ("Explore the app"): you can browse menus and screens to learn ContabilGest.\n'
              '- Usage functions (record, save, close the month, send to the accountant, etc.): require an active Google Play subscription.\n'
              '- A1 certificate-only offer (standalone): does not include full Cash Book / app use.\n\n'
              'To use the app, choose a plan on the subscription screen. If you already purchased: "I already have an account" / Restore purchase.',
        ),
        SiteFaqItem(
          question: 'Subscriptions (Google Play policy)',
          body:
              '- A subscription is required to use ContabilGest (except the standalone "certificate only" offer, when shown)\n'
              '- Billing and renewal: managed by Google Play\n'
              '- Auto-renews until you cancel in Play → Payments and subscriptions → Subscriptions\n'
              '- On Installment plans (accountant / packages), there is a 12-month commitment; cancellation or change may only take effect at the end of that commitment, according to Play\n'
              '- Uninstalling the app does not cancel the subscription\n'
              '- In the app: More → Google Play Subscription (plans) · Cancel / manage billing (opens the Subscriptions Center)\n'
              '- Refunds: Google Play policy\n'
              '- There is no free trial unless an express campaign is set in Play Console\n'
              '- The official price is the one shown in Play at checkout; tables in this FAQ are reference only\n'
              '- On the plans screen, the app shows offer terms (price, frequency, renewal, cancellation) and the Contabil+ upgrade flow',
        ),
        SiteFaqItem(
          question: 'How do I restore a purchase?',
          body:
              'More → Google Play Subscription → Restore purchase (or "I already have an account" on the landing)',
        ),
        SiteFaqItem(
          question: 'Can I change from Essential to Standard or Advanced?',
          body:
              'Yes. With Contabil+ active: More → Change Contabil+ plan → Update plan on the upper band. Google Play charges the prorated difference (subscription replacement). You can also use the "Update plan" / "Manage plan" button on the paywall.',
        ),
        SiteFaqItem(
          question: 'Can I drop from Advanced to Standard or Essential?',
          body:
              'There is no "immediate downgrade" button in the app. Cancel auto-renewal in Google Play, use the remaining paid period, then subscribe to the desired plan in the app. Details: More → Change Contabil+ plan → "Need a lower plan?"',
        ),
        SiteFaqItem(
          question: 'Can I add entries, payroll, or income tax later?',
          body:
              'Yes, if you have Contabil+ (any band) or an annual accountant package: More → Complement plan (payroll and income tax). Accountant Review is already included. Basic plans without Contabil+ are not eligible.',
        ),
        SiteFaqItem(
          question: 'Does the app warn before renewal?',
          body:
              'When Play provides the cycle date, the app may warn up to 30 days ahead (Home / More). Without a Play date, there is no invented countdown — check Play → Subscriptions.',
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
              'PerfectGest ContabilGest ayuda a MEI y pequeños empresarios a registrar entradas y salidas (Libro de caja), seguir obligaciones fiscales, simular Impuesto de Renta, gestionar empleados, pró-labore y, en los planes contratados, enviar el mes a revisión del contador. El uso diario es offline por defecto.',
        ),
        SiteFaqItem(
          question: '¿ContabilGest es una app oficial del gobierno?',
          body:
              'No. Es un producto privado de Perfect Gest Dev (CNPJ 66.889.409/0001-19). No estamos afiliados ni respaldados por la Receita Federal, eSocial, FGTS Digital o prefecturas. La fuente oficial de obligaciones y guías es siempre el portal del gobierno.',
        ),
        SiteFaqItem(
          question: '¿Cuáles son las fuentes oficiales?',
          body: 'Use siempre los portales del gobierno para obligaciones y guías:',
          links: kContabilgestOfficialSourceLinks,
        ),
        SiteFaqItem(
          question: '¿Necesito internet?',
          body:
              '- Registrar, cerrar el mes y generar PDF: no\n'
              '- Suscribirse, restaurar compra, enviar al contador, certificado A1, Asistente IA: sí\n'
              '- Abrir portales del gobierno (DAS, eSocial, DCTFWeb, FGTS Digital, prefectura): sí',
        ),
        SiteFaqItem(
          question: '¿La app sustituye a mi contador?',
          body:
              'No por completo. En los planes básicos usted opera solo y es responsable de revisar todo. En los planes Contabil+ / paquete anual, el contador revisa y firma según el alcance contratado — usted aún debe revisar PDF, recibos de sueldo y comunicaciones antes de usarlos.',
        ),
        SiteFaqItem(
          question: '¿La app envía declaraciones sola a los portales del gobierno?',
          body:
              'No. La app es un portal asistido: calcula, organiza plazos y abre el enlace del portal. Quien transmite en eSocial, DCTFWeb, FGTS Digital, DAS, etc. es usted (o el contador en el servicio contratado), nunca la app de forma automática.',
        ),
        SiteFaqItem(
          question: '¿Cómo emito NFS-e en el plan Básico?',
          body:
              'En el Básico, la app puede pedir el usuario y la contraseña del portal municipal. El pedido va a la cola y el Worker autentica con esa credencial. No es el certificado A1. Captcha/2FA en el portal pueden exigir que termine el acceso en el sitio de la prefectura.',
        ),
        SiteFaqItem(
          question: '¿Cómo emito NFS-e / NF-e con Contabil+ o paquete con contador?',
          body:
              'Continúa el flujo homologado: NFS-e con A1 del despacho + poder (CRC); NF-e con A1 del emisor en SEFAZ. El usuario/contraseña del portal del Básico no sustituye ese proceso.',
        ),
        SiteFaqItem(
          question: '¿La NF-e de venta acepta usuario/contraseña del portal?',
          body:
              'No. SEFAZ exige certificado A1 (firma y conexión). Usuario/contraseña de un sitio no autoriza NF-e.',
        ),
        SiteFaqItem(
          question: '¿La app mueve dinero de mi cuenta?',
          body: 'No. No accede al banco ni hace transferencias.',
        ),
        SiteFaqItem(
          question: '¿Puedo usarla sin suscribirme?',
          body:
              '- Modo demostración («Conocer la app»): puede navegar menús y pantallas para conocer ContabilGest.\n'
              '- Funciones de uso (registrar, guardar, cerrar mes, enviar al contador, etc.): exigen suscripción activa en Google Play.\n'
              '- Oferta solo certificado A1 (suelto): no incluye el uso completo del Libro de caja / app.\n\n'
              'Para utilizar la app, elija un plan en la pantalla de suscripción. Si ya compró: «Ya tengo cuenta» / Restaurar compra.',
        ),
        SiteFaqItem(
          question: 'Suscripciones (política Google Play)',
          body:
              '- Se necesita suscripción para utilizar ContabilGest (excepto oferta suelta «solo certificado», cuando esté indicada)\n'
              '- Cobro y renovación: gestionados por Google Play\n'
              '- Renovación automática hasta cancelar en Play → Pagos y suscripciones → Suscripciones\n'
              '- En planes Cuotas (contador / paquetes), hay compromiso de 12 meses; la cancelación o el cambio puede valer solo al final de ese compromiso, según Play\n'
              '- Desinstalar la app no cancela la suscripción\n'
              '- En la app: Más → Suscripción Google Play (planes) · Cancelar / gestionar cobro (abre el Centro de Suscripciones)\n'
              '- Reembolsos: política de Google Play\n'
              '- No hay período de prueba gratuito, salvo campaña expresa en Play Console\n'
              '- El precio oficial es el mostrado en Play en el checkout; las tablas de este FAQ son solo referencia\n'
              '- En la pantalla de planes, la app muestra términos de la oferta (precio, frecuencia, renovación, cancelación) y el flujo de upgrade Contabil+',
        ),
        SiteFaqItem(
          question: '¿Cómo restauro una compra?',
          body:
              'Más → Suscripción Google Play → Restaurar compra (o «Ya tengo cuenta» en la landing)',
        ),
        SiteFaqItem(
          question: '¿Puedo pasar de Esencial a Standard o Avanzado?',
          body:
              'Sí. Con Contabil+ activo: Más → Cambiar plan Contabil+ → Actualizar plan en la franja superior. Google Play cobra la diferencia proporcional (sustitución de suscripción). También puede usar el botón «Actualizar plan» / «Gestionar plan» en el paywall.',
        ),
        SiteFaqItem(
          question: '¿Puedo bajar de Avanzado a Standard o Esencial?',
          body:
              'No hay botón de «downgrade inmediato» en la app. Cancele la renovación automática en Google Play, use hasta el final del período ya pagado y, después, suscríbase al plan deseado en la app. Detalles: Más → Cambiar plan Contabil+ → «¿Necesita un plan inferior?»',
        ),
        SiteFaqItem(
          question: '¿Puedo agregar lanzamientos, nómina o IR después?',
          body:
              'Sí, si tiene Contabil+ (cualquier franja) o paquete anual con contador: Más → Complementar plan (nómina e IR). La Conferencia del Contador ya está incluida. Los planes Básico sin Contabil+ no son elegibles.',
        ),
        SiteFaqItem(
          question: '¿La app avisa antes de la renovación?',
          body:
              'Cuando Play informe la fecha del ciclo, la app puede avisar hasta 30 días antes (Inicio / Más). Sin fecha de Play, no hay cuenta inventada — consulte Play → Suscripciones.',
        ),
      ];
}
