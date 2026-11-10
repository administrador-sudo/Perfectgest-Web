/**
 * Textos legais Agenda Barber (Play) — PT/EN/ES.
 * Package: com.perfectgestdev.barber_hairdresser
 * Regenerar HTML: node scripts/barber-static-html.cjs
 */
'use strict';

const PRODUCT = 'Agenda Barber';
const PACKAGE = 'com.perfectgestdev.barber_hairdresser';
const ORIGIN = 'https://perfectgestdev.com';
const CONTACT =
  'suporte@perfectgestdev.com · WhatsApp +55 (51) 98904-5442';
const UPDATED = '10 de novembro de 2026';

const pageSlugs = {
  privacy: 'barber-politica-privacidade',
  terms: 'barber-termos',
  deletion: 'barber-exclusao-dados',
  faq: 'barber-faq',
};

const header = {
  pt:
    `Última atualização: ${UPDATED}\n\n` +
    `Produto: ${PRODUCT}\n` +
    `Package Android: ${PACKAGE}\n` +
    `Desenvolvedor: PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA (CNPJ 66.889.409/0001-19)\n` +
    `Contato: ${CONTACT}\n` +
    `Site: ${ORIGIN}`,
  en:
    `Last updated: November 10, 2026\n\n` +
    `Product: ${PRODUCT}\n` +
    `Android package: ${PACKAGE}\n` +
    `Developer: PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA\n` +
    `Contact: ${CONTACT}\n` +
    `Website: ${ORIGIN}`,
  es:
    `Última actualización: 10 de noviembre de 2026\n\n` +
    `Producto: ${PRODUCT}\n` +
    `Paquete Android: ${PACKAGE}\n` +
    `Desarrollador: PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA\n` +
    `Contacto: ${CONTACT}\n` +
    `Sitio: ${ORIGIN}`,
};

const labels = {
  pt: {
    privacy: 'Privacidade',
    terms: 'Termos',
    deletion: 'Exclusão de dados',
    faq: 'FAQ',
  },
  en: {
    privacy: 'Privacy',
    terms: 'Terms',
    deletion: 'Data deletion',
    faq: 'FAQ',
  },
  es: {
    privacy: 'Privacidad',
    terms: 'Términos',
    deletion: 'Eliminación de datos',
    faq: 'FAQ',
  },
};

const privacy = {
  pt: [
    {
      heading: '1. Escopo',
      body:
        `Esta política descreve como o app ${PRODUCT} trata dados quando você usa a agenda da barbearia/salão no Android e o site de agendamento associado (PerfectGest).\n\n` +
        `Não se aplica a outros apps PerfectGest (ContabilGest, PerfectGest I, Clínica III).`,
    },
    {
      heading: '2. Dados tratados',
      body:
        '2.1 Conta\n• E-mail e UID do Firebase Authentication (login do dono/profissional).\n\n' +
        '2.2 Operação da loja\n• Nome da loja, profissionais, serviços, clientes (nome/telefone), agenda, produtos, WhatsApp da loja, CNPJ/razão social MEI (quando informados).\n\n' +
        '2.3 Fotos/ficheiros\n• Logo, fotos de produtos e comprovantes (via galeria/câmara), quando o utilizador escolhe enviar.\n\n' +
        '2.4 Assinatura Google Play\n• Identificadores de compra / purchaseToken para validar a assinatura mensal (produto barber_pro_mensal). A PerfectGest não armazena dados de cartão.\n\n' +
        '2.5 Local\n• SQLite e SharedPreferences no aparelho para cache e preferências.',
    },
    {
      heading: '3. Finalidades',
      body:
        '• Operar a agenda e a vitrine/agendamento online da loja\n' +
        '• Sincronizar dados da loja (Firestore shops/{shopId})\n' +
        '• Validar assinatura Play e acesso ao app\n' +
        '• Suporte técnico quando solicitado\n' +
        '• Cumprir obrigações legais',
    },
    {
      heading: '4. Base legal (LGPD)',
      body:
        'Execução de contrato / interesse legítimo para operar o serviço solicitado; consentimento quando aplicável (ex.: envio de fotos); obrigação legal quando exigida.',
    },
    {
      heading: '5. Partilha',
      body:
        '• Google Firebase (Auth, Firestore) — infraestrutura\n' +
        '• Google Play Billing — pagamentos de assinatura\n' +
        '• WhatsApp (Meta) — apenas se o utilizador abrir links wa.me / partilhar\n' +
        'Não vendemos dados pessoais. Sem anúncios in-app.',
    },
    {
      heading: '6. Retenção e exclusão',
      body:
        `Pode pedir exclusão em ${ORIGIN}/${pageSlugs.deletion} ou por e-mail (${CONTACT}). Dados necessários a obrigações legais/fiscais podem ser retidos pelo prazo legal.`,
    },
    {
      heading: '7. Contacto',
      body:
        `${CONTACT}\n` +
        `${ORIGIN}/${pageSlugs.privacy}\n` +
        `${ORIGIN}/${pageSlugs.terms}\n` +
        `${ORIGIN}/${pageSlugs.deletion}\n` +
        `${ORIGIN}/${pageSlugs.faq}`,
    },
  ],
  en: [
    {
      heading: '1. Scope',
      body:
        `This policy describes how ${PRODUCT} handles data when you use the barbershop/salon schedule app on Android and the related booking site (PerfectGest).\n\n` +
        `It does not apply to other PerfectGest apps.`,
    },
    {
      heading: '2. Data we process',
      body:
        'Account (Firebase email/UID); shop operations (name, pros, clients, schedule, products, WhatsApp, optional MEI CNPJ); photos you choose to upload; Play subscription purchase identifiers; local SQLite/preferences. No card data stored by PerfectGest. No in-app ads.',
    },
    {
      heading: '3. Purposes',
      body:
        'Run the shop schedule and online booking; sync Firestore shops/{shopId}; verify Play subscription; support; legal compliance.',
    },
    {
      heading: '4. Sharing',
      body:
        'Google Firebase; Google Play Billing; WhatsApp only if you open wa.me/share. We do not sell personal data.',
    },
    {
      heading: '5. Deletion',
      body:
        `Request deletion at ${ORIGIN}/${pageSlugs.deletion} or ${CONTACT}.`,
    },
  ],
  es: [
    {
      heading: '1. Alcance',
      body:
        `Esta política describe cómo ${PRODUCT} trata datos en la app Android de agenda de barbería/salón y el sitio de reservas asociado (PerfectGest). No aplica a otras apps PerfectGest.`,
    },
    {
      heading: '2. Datos',
      body:
        'Cuenta Firebase; operación de la tienda; fotos que usted envía; identificadores de suscripción Play; almacenamiento local. Sin anuncios. PerfectGest no guarda datos de tarjeta.',
    },
    {
      heading: '3. Finalidades',
      body:
        'Operar agenda y reservas; sincronizar Firestore; validar suscripción Play; soporte; cumplimiento legal.',
    },
    {
      heading: '4. Eliminación',
      body:
        `Solicite eliminación en ${ORIGIN}/${pageSlugs.deletion} o ${CONTACT}.`,
    },
  ],
};

const terms = {
  pt: [
    {
      heading: '1. Objeto',
      body:
        `${PRODUCT} é um software de agenda e gestão operacional para barbearias/salões (MEI e similares), com site de agendamento por loja e assinatura Google Play.`,
    },
    {
      heading: '2. Conta e loja',
      body:
        'O dono/profissional é responsável pelos dados que introduz (clientes, preços, fotos, CNPJ). Cada loja opera em shops/{shopId} sem misturar carteiras.',
    },
    {
      heading: '3. Assinatura',
      body:
        'O acesso pleno pode depender da assinatura barber_pro_mensal na Google Play. Preços e cancelamento seguem as regras da Play. PerfectGest não processa o cartão.',
    },
    {
      heading: '4. Uso aceitável',
      body:
        'Proibido uso ilícito, engenharia reversa abusiva ou interferência nos serviços de outros associados.',
    },
    {
      heading: '5. Alterações e foro',
      body:
        `Podemos atualizar estes termos em ${ORIGIN}/${pageSlugs.terms}. Foro: Comarca de Caxias do Sul — RS, ressalvados direitos do CDC.\n\n${CONTACT}`,
    },
  ],
  en: [
    {
      heading: '1. Service',
      body:
        `${PRODUCT} provides scheduling/operations tools for barbershops/salons with per-shop booking pages and optional Google Play subscription barber_pro_mensal.`,
    },
    {
      heading: '2. Your responsibility',
      body:
        'You are responsible for data you enter. Subscription billing is handled by Google Play.',
    },
    {
      heading: '3. Governing law',
      body:
        `Updates at ${ORIGIN}/${pageSlugs.terms}. Contact: ${CONTACT}`,
    },
  ],
  es: [
    {
      heading: '1. Servicio',
      body:
        `${PRODUCT} ofrece agenda/operación para barberías/salones con páginas de reserva por tienda y suscripción Google Play barber_pro_mensal.`,
    },
    {
      heading: '2. Responsabilidad',
      body:
        'Usted es responsable de los datos que introduce. Los cobros de suscripción los gestiona Google Play.',
    },
    {
      heading: '3. Contacto',
      body: `${CONTACT}\n${ORIGIN}/${pageSlugs.terms}`,
    },
  ],
};

const deletion = {
  pt: [
    {
      heading: '1. Objetivo',
      body:
        `Como eliminar dados do ${PRODUCT}, alinhado à LGPD e às políticas Google Play.\n\nURL: ${ORIGIN}/${pageSlugs.deletion}`,
    },
    {
      heading: '2. No app',
      body:
        '1) Entre com a conta dono da loja.\n2) Remova ou desactive dados operacionais (clientes/produtos) conforme as opções disponíveis.\n3) Peça exclusão da conta/loja por e-mail se precisar apagar a loja na nuvem.',
    },
    {
      heading: '3. Pedido por e-mail',
      body:
        `Escreva para suporte@perfectgestdev.com com: e-mail da conta Firebase, shopId da loja e pedido explícito de exclusão.\nWhatsApp: +55 (51) 98904-5442\nPrazo típico de atendimento: até 15 dias úteis (salvo obrigação legal de retenção).`,
    },
    {
      heading: '4. Assinatura Play',
      body:
        'Cancelar a assinatura: Google Play → Assinaturas. Isso não apaga automaticamente os dados da loja — use os passos acima.',
    },
  ],
  en: [
    {
      heading: '1. How to delete',
      body:
        `Email suporte@perfectgestdev.com with Firebase account email, shopId, and deletion request. Cancel Play subscription separately in Google Play. URL: ${ORIGIN}/${pageSlugs.deletion}`,
    },
  ],
  es: [
    {
      heading: '1. Cómo eliminar',
      body:
        `Escriba a suporte@perfectgestdev.com con e-mail de la cuenta, shopId y pedido de eliminación. Cancele la suscripción en Google Play por separado. URL: ${ORIGIN}/${pageSlugs.deletion}`,
    },
  ],
};

const faq = {
  pt: [
    {
      heading: 'O que é o Agenda Barber?',
      body:
        'App Android de agenda para barbearia/salão, com site de agendamento por loja (PerfectGest) e assinatura opcional/obrigatória conforme a fase na Google Play.',
    },
    {
      heading: 'Qual o package?',
      body: PACKAGE,
    },
    {
      heading: 'Como cancelo a assinatura?',
      body:
        'Google Play → Assinaturas → Agenda Barber / barber_pro_mensal.',
    },
    {
      heading: 'Onde estão as políticas?',
      body:
        `${ORIGIN}/${pageSlugs.privacy}\n` +
        `${ORIGIN}/${pageSlugs.terms}\n` +
        `${ORIGIN}/${pageSlugs.deletion}`,
    },
    {
      heading: 'Suporte',
      body: CONTACT,
    },
  ],
  en: [
    {
      heading: 'What is Agenda Barber?',
      body:
        'Android scheduling app for barbershops/salons with per-shop booking pages and Google Play subscription product barber_pro_mensal.',
    },
    {
      heading: 'Support',
      body: CONTACT,
    },
  ],
  es: [
    {
      heading: '¿Qué es Agenda Barber?',
      body:
        'App Android de agenda para barberías/salones con páginas de reserva por tienda y suscripción Google Play barber_pro_mensal.',
    },
    {
      heading: 'Soporte',
      body: CONTACT,
    },
  ],
};

module.exports = {
  PRODUCT,
  PACKAGE,
  ORIGIN,
  CONTACT,
  header,
  labels,
  pageSlugs,
  pages: {
    privacy: {
      slug: pageSlugs.privacy,
      titles: {
        pt: `Política de Privacidade — ${PRODUCT}`,
        en: `Privacy Policy — ${PRODUCT}`,
        es: `Política de Privacidad — ${PRODUCT}`,
      },
      sections: privacy,
    },
    terms: {
      slug: pageSlugs.terms,
      titles: {
        pt: `Termos de Uso — ${PRODUCT}`,
        en: `Terms of Use — ${PRODUCT}`,
        es: `Términos de Uso — ${PRODUCT}`,
      },
      sections: terms,
    },
    deletion: {
      slug: pageSlugs.deletion,
      titles: {
        pt: `Exclusão de Dados — ${PRODUCT}`,
        en: `Data Deletion — ${PRODUCT}`,
        es: `Eliminación de Datos — ${PRODUCT}`,
      },
      sections: deletion,
    },
    faq: {
      slug: pageSlugs.faq,
      titles: {
        pt: `FAQ / Suporte — ${PRODUCT}`,
        en: `FAQ / Support — ${PRODUCT}`,
        es: `FAQ / Soporte — ${PRODUCT}`,
      },
      sections: faq,
    },
  },
};
