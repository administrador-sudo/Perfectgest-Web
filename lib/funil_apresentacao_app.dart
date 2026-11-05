import 'contabilidade_funil_page.dart';
import 'site_public_urls.dart';

const FunilImgMap kFunilApresentacaoImagens = FunilImgMap(
  welcome: '$kFunilImgDir/esc001_15.png',
  accountant: '$kFunilImgDir/esc001_01.png',
  mei: '$kFunilImgDir/esc001_12.png',
  phoneNfe: '$kFunilImgDir/esc001_03.png',
  tabletNfe: '$kFunilImgDir/esc001_09.png',
  home: '$kFunilImgDir/esc001_02.png',
  close: '$kFunilImgDir/esc001_04.png',
  duties: '$kFunilImgDir/esc001_05.png',
  menu: '$kFunilImgDir/esc001_06.png',
  invoices: '$kFunilImgDir/esc001_08.png',
  qualityCert: FunilImg.qualityCert,
  extras: <FunilImgExtra>[
    FunilImgExtra(asset: '$kFunilImgDir/esc001_17.png', captionId: 'orientacao'),
    FunilImgExtra(asset: '$kFunilImgDir/esc001_07.png', captionId: 'menu2'),
    FunilImgExtra(asset: '$kFunilImgDir/esc001_10.png', captionId: 'ir'),
    FunilImgExtra(asset: '$kFunilImgDir/esc001_11.png', captionId: 'documentos'),
    FunilImgExtra(asset: '$kFunilImgDir/esc001_14.png', captionId: 'backup'),
    FunilImgExtra(asset: '$kFunilImgDir/esc001_16.jpeg', captionId: 'indicacao'),
  ],
);

const Map<String, String> kFunilApresentacaoLegendasPt = <String, String>{
  'welcome': 'Seu escritório na palma da mão',
  'accountant': 'Um toque e você está com o contador',
  'mei': 'Seus dados, só no seu aparelho',
  'menu': 'Tudo o que o negócio pede, num menu',
  'phoneNfe': 'Lançar fica fácil, de verdade',
  'tabletNfe': 'NF-e no controle, sem surpresa',
  'home': 'O mês inteiro, num checklist',
  'close': 'Fechar o mês com clareza',
  'duties': 'Nenhuma obrigação esquecida',
  'invoices': 'NFS-e alinhada ao portal',
  'orientacao': 'Assinatura ativa. Vamos começar.',
  'menu2': 'Folha, IR e LGPD no mesmo lugar',
  'ir': 'Imposto de renda sem susto',
  'documentos': 'Canal seguro com o escritório',
  'backup': 'Seu livro, guardado do seu jeito',
  'indicacao': 'Indique e proteja o seu preço',
};

const Map<String, String> kFunilApresentacaoLegendasEn = <String, String>{
  'welcome': 'Your office in the palm of your hand',
  'accountant': 'One tap and you are with your accountant',
  'mei': 'Your data, only on your device',
  'menu': 'Everything the business needs, in one menu',
  'phoneNfe': 'Posting becomes easy, for real',
  'tabletNfe': 'Goods invoices under control, no surprises',
  'home': 'The whole month, in one checklist',
  'close': 'Close the month with clarity',
  'duties': 'No duty left behind',
  'invoices': 'Service invoices aligned with the portal',
  'orientacao': 'Subscription is on. Let us begin.',
  'menu2': 'Payroll, income tax and LGPD in one place',
  'ir': 'Income tax without the scare',
  'documentos': 'A secure channel with the office',
  'backup': 'Your books, kept your way',
  'indicacao': 'Refer friends and protect your price',
};

const Map<String, String> kFunilApresentacaoLegendasEs = <String, String>{
  'welcome': 'Su despacho en la palma de la mano',
  'accountant': 'Un toque y esta con su contador',
  'mei': 'Sus datos, solo en su aparato',
  'menu': 'Todo lo que el negocio pide, en un menu',
  'phoneNfe': 'Registrar queda facil, de verdad',
  'tabletNfe': 'NF-e bajo control, sin sorpresas',
  'home': 'El mes entero, en un checklist',
  'close': 'Cerrar el mes con claridad',
  'duties': 'Ninguna obligacion olvidada',
  'invoices': 'NFS-e alineada al portal',
  'orientacao': 'Suscripcion activa. Vamos a empezar.',
  'menu2': 'Nomina, IR y LGPD en el mismo lugar',
  'ir': 'Impuesto a la renta sin susto',
  'documentos': 'Canal seguro con el despacho',
  'backup': 'Su libro, guardado a su manera',
  'indicacao': 'Indique y proteja su precio',
};

const Map<String, String> kFunilApresentacaoTextosPt = <String, String>{
  'welcome':
      'Comece agora e sinta o ciclo fiscal inteligente trabalhando por você, no seu ritmo.',
  'accountant':
      'Escolha o escritório na nuvem Amazon e caminhe junto com quem cuida da sua empresa.',
  'mei':
      'Sigilo de verdade: o livro fica com você até decidir partilhar com o escritório.',
  'menu':
      'IA, notas, contas e conferência: o comando do mês cabe no seu bolso.',
  'phoneNfe':
      'A IA pergunta receita ou despesa e guia a partida dobrada sem complicar.',
  'tabletNfe':
      'Venda e compra na mesma tela, para você ver o movimento antes do fisco.',
  'home':
      'Marque o que falta, fale com o associado e feche o mês com tranquilidade.',
  'close':
      'Livro caixa, saldos e conferência: o retrato da empresa, pronto para o contador.',
  'duties':
      'SERPRO, DEFIS, eSocial e DAS no prazo, com o app a lembrar por você.',
  'invoices': 'Emita, receba e sincronize serviços sem sair do aplicativo.',
  'orientacao':
      'Preencha Razão Social e CNPJ, fale com o escritório e escolha o plano de honorários. Você já está no caminho.',
  'menu2':
      'Do pró-labore aos documentos do escritório, o avançado do app acompanha o crescimento.',
  'ir':
      'Resumo, deduções e Carnê-Leão visíveis: você chega na entrega preparado.',
  'documentos':
      'Baixe, anexe e envie o A1 com a tranquilidade de um canal só seu.',
  'backup':
      'Drive semanal ou JSON no celular: a cópia de segurança é sua, não da nuvem alheia.',
  'indicacao':
      'Traga amigos para o escritório e mantenha a condição especial na renovação.',
};

const Map<String, String> kFunilApresentacaoTextosEn = <String, String>{
  'welcome':
      'Start now and feel the intelligent tax cycle working for you, at your pace.',
  'accountant':
      'Choose the Amazon-cloud office and walk with the people who look after your company.',
  'mei':
      'Real privacy: the books stay with you until you choose to share them with the office.',
  'menu':
      'AI, invoices, accounts and review: the month\'s command fits in your pocket.',
  'phoneNfe':
      'The AI asks income or expense and guides double-entry without the fuss.',
  'tabletNfe':
      'Sales and purchases on the same screen, so you see the movement before the tax office does.',
  'home':
      'Tick what is left, talk to your associate, and close the month with peace of mind.',
  'close':
      'Cash book, balances and review: a picture of the company, ready for the accountant.',
  'duties':
      'SERPRO, DEFIS, eSocial and DAS on time, with the app reminding you.',
  'invoices': 'Issue, receive and sync services without leaving the app.',
  'orientacao':
      'Fill in legal name and CNPJ, talk to the office and pick the fee plan. You are already on the way.',
  'menu2': 'From drawings to office files, the advanced app grows with you.',
  'ir': 'Summary, deductions and Carne-Leao in view: you arrive prepared.',
  'documentos':
      'Download, attach and send the A1 with the calm of a channel that is only yours.',
  'backup':
      'Weekly Drive or JSON on the phone: the backup is yours, not someone else\'s cloud.',
  'indicacao':
      'Bring friends to the office and keep the special rate at renewal.',
};

const Map<String, String> kFunilApresentacaoTextosEs = <String, String>{
  'welcome':
      'Empiece ahora y sienta el ciclo fiscal inteligente trabajando por usted, a su ritmo.',
  'accountant':
      'Elija el despacho en la nube Amazon y camine junto a quien cuida su empresa.',
  'mei':
      'Sigilo de verdad: el libro queda con usted hasta decidir compartirlo con el despacho.',
  'menu':
      'IA, notas, cuentas y conferencia: el comando del mes cabe en su bolsillo.',
  'phoneNfe':
      'La IA pregunta ingreso o gasto y guia la partida doble sin complicar.',
  'tabletNfe':
      'Venta y compra en la misma pantalla, para ver el movimiento antes que el fisco.',
  'home':
      'Marque lo que falta, hable con el asociado y cierre el mes con tranquilidad.',
  'close':
      'Libro caja, saldos y conferencia: el retrato de la empresa, listo para el contador.',
  'duties':
      'SERPRO, DEFIS, eSocial y DAS a tiempo, con la app recordandole.',
  'invoices':
      'Emita, reciba y sincronice servicios sin salir de la aplicacion.',
  'orientacao':
      'Complete Razon Social y CNPJ, hable con el despacho y elija el plan de honorarios. Ya esta en el camino.',
  'menu2':
      'Del pro-labore a los documentos del despacho, lo avanzado de la app acompana el crecimiento.',
  'ir':
      'Resumen, deducciones y Carne-Leao a la vista: llega a la entrega preparado.',
  'documentos':
      'Descargue, adjunte y envie el A1 con la tranquilidad de un canal solo suyo.',
  'backup':
      'Drive semanal o JSON en el celular: la copia de seguridad es suya, no de una nube ajena.',
  'indicacao':
      'Traiga amigos al despacho y mantenga la condicion especial en la renovacion.',
};

const FunilEscritorioPerfil kFunilPerfectGestApresentacao = FunilEscritorioPerfil(
  id: 'perfectgest',
  rota: kContabilidadePath,
  imagens: kFunilApresentacaoImagens,
  enviaCadastroNuvem: true,
  legendasPt: kFunilApresentacaoLegendasPt,
  legendasEn: kFunilApresentacaoLegendasEn,
  legendasEs: kFunilApresentacaoLegendasEs,
  textosPt: kFunilApresentacaoTextosPt,
  textosEn: kFunilApresentacaoTextosEn,
  textosEs: kFunilApresentacaoTextosEs,
);
