/** PerfectGest I — documentos legais no domínio (paralelo a lib/l10n/perfectgest_i_legal_texts.dart).
 * Canónico na app: Google Sites (ver lib/app_legal_urls.dart). */
const PRODUCT = 'PerfectGest I';
const FANTASY = 'Perfect Gest Dev';
const LEGAL_NAME = 'PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA';
const CNPJ = '66.889.409/0001-19';
const EMAIL = 'sac.perfectgest@gmail.com';
const EMAIL_INST = 'suporte@perfectgestdev.com';
const ADDRESS = 'Caxias do Sul — RS — Brasil';
const PUBLISHER = 'Marcos Leandro dos Santos';

const header = {
  pt:
    `${LEGAL_NAME}\n` +
    `Nome fantasia: ${FANTASY} · CNPJ ${CNPJ}\n` +
    `${ADDRESS}\n` +
    `Responsável editorial do produto: ${PUBLISHER}\n` +
    `Contacto do produto: ${EMAIL} · Suporte institucional: ${EMAIL_INST}\n\n` +
    'Estas páginas no domínio perfectgestdev.com são uma cópia de referência para o futuro. ' +
    'A app PerfectGest I (Google Play) continua a apontar para o portal Google Sites até nova publicação.',
  en:
    `${LEGAL_NAME}\n` +
    `Trade name: ${FANTASY} · CNPJ ${CNPJ}\n` +
    `${ADDRESS}\n` +
    `Product publisher: ${PUBLISHER}\n` +
    `Product contact: ${EMAIL} · Institutional support: ${EMAIL_INST}\n\n` +
    'These pages on perfectgestdev.com are a reference copy for future use. ' +
    'The PerfectGest I app (Google Play) still links to the Google Sites portal until republished.',
  es:
    `${LEGAL_NAME}\n` +
    `Nombre comercial: ${FANTASY} · CNPJ ${CNPJ}\n` +
    `${ADDRESS}\n` +
    `Responsable editorial del producto: ${PUBLISHER}\n` +
    `Contacto del producto: ${EMAIL} · Soporte institucional: ${EMAIL_INST}\n\n` +
    'Estas páginas en perfectgestdev.com son una copia de referencia para el futuro. ' +
    'La app PerfectGest I (Google Play) sigue apuntando al portal Google Sites hasta nueva publicación.',
};

const lastUpdated = {
  pt: 'Última atualização: 16/06/2026',
  en: 'Last updated: 16 June 2026',
  es: 'Última actualización: 16/06/2026',
};

const labels = {
  pt: {
    privacy: 'Política de Privacidade',
    terms: 'Termos e Condições',
    deletion: 'Exclusão de Dados',
    faq: 'Perguntas frequentes',
  },
  en: {
    privacy: 'Privacy Policy',
    terms: 'Terms and Conditions',
    deletion: 'Data Deletion',
    faq: 'FAQ',
  },
  es: {
    privacy: 'Política de Privacidad',
    terms: 'Términos y Condiciones',
    deletion: 'Eliminación de Datos',
    faq: 'Preguntas frecuentes',
  },
};

const privacy = {
  pt: [
    { heading: '1. Controlador e contacto', body: `O ${PRODUCT} é operado por ${PUBLISHER}. Para direitos LGPD: ${EMAIL}.` },
    { heading: '2. Armazenamento local', body: 'Modelo local-first: clientes, orçamentos, caixa e ordens de serviço ficam em SQLite no dispositivo. Não enviamos esses dados automaticamente para servidores PerfectGest.' },
    { heading: '3. Quando os dados podem sair do aparelho', body: 'Somente por acção sua: partilhar PDF, backup exportado, cartão de visita (PNG/vCard/QR com contactos profissionais). Partilha de backup é sua responsabilidade.' },
    { heading: '4. Cartão de visita', body: 'Dados da aba Empresa alimentam o cartão digital. Clientes e financeiro não entram no cartão. Modo estático após 1.º cartão sem Pro; funções avançadas (edição, vCard, QR) com Plano Pro — tudo na app, sem página web PerfectGest.' },
    { heading: '5. Período de teste e Plano Pro', body: '7 dias desde a 1.ª abertura; limites 5+5+5 (clientes, orçamentos, caixa). PDF de orçamento nos 4 primeiros; bloqueado a partir do 5.º e após 7 dias sem Pro. Após o trial, consulta/edição mantém-se; criação exige Pro.' },
    { heading: '6. Serviços de terceiros', body: 'Firebase Analytics (eventos genéricos), Remote Config, Firestore (metadados anónimos de trial/freemium), Google Play Billing. Sem venda de dados para publicidade.' },
    { heading: '7. Retenção e exclusão', body: 'Dados locais: eliminar na app ou desinstalar. Telemetria: pedido por e-mail, até 15 dias úteis.' },
    { heading: '8. Foro', body: 'Leis do Brasil; foro Caxias do Sul/RS. Utilizadores maiores de 18 anos.' },
  ],
  en: [
    { heading: '1. Controller and contact', body: `${PRODUCT} is operated by ${PUBLISHER}. For LGPD rights: ${EMAIL}.` },
    { heading: '2. Local storage', body: 'Local-first: clients, estimates, cash and work orders stay in SQLite on the device. We do not automatically send this data to PerfectGest servers.' },
    { heading: '3. When data may leave the device', body: 'Only through your action: share PDF, exported backup, business card (PNG/vCard/QR with professional contacts). You are responsible for shared backups.' },
    { heading: '4. Business card', body: 'Company tab feeds the digital card. Clients and financial data are not on the card. Static mode after first card without Pro; advanced features with Pro Plan — in-app only.' },
    { heading: '5. Trial and Pro Plan', body: '7 days from first open; 5+5+5 limits. Budget PDF for the first 4 only; blocked from the 5th and after 7 days without Pro. After trial, view/edit remains; creation requires Pro.' },
    { heading: '6. Third-party services', body: 'Firebase Analytics (generic events), Remote Config, Firestore (anonymous trial metadata), Google Play Billing. No sale of data for advertising.' },
    { heading: '7. Retention and deletion', body: 'Local data: delete in app or uninstall. Telemetry: request by email, up to 15 business days.' },
    { heading: '8. Governing law', body: 'Laws of Brazil; venue Caxias do Sul/RS. Users aged 18 or over.' },
  ],
  es: [
    { heading: '1. Controlador y contacto', body: `${PRODUCT} es operado por ${PUBLISHER}. Para derechos LGPD: ${EMAIL}.` },
    { heading: '2. Almacenamiento local', body: 'Modelo local-first: clientes, presupuestos, caja y órdenes en SQLite en el dispositivo. No enviamos esos datos automáticamente a servidores PerfectGest.' },
    { heading: '3. Cuándo los datos pueden salir del teléfono', body: 'Solo por su acción: compartir PDF, copia de seguridad exportada, tarjeta de visita (PNG/vCard/QR). Usted es responsable de las copias compartidas.' },
    { heading: '4. Tarjeta de visita', body: 'La pestaña Empresa alimenta la tarjeta digital. Clientes y finanzas no entran en la tarjeta. Modo estático tras la 1.ª tarjeta sin Pro; funciones avanzadas con Plan Pro — solo en la app.' },
    { heading: '5. Prueba y Plan Pro', body: '7 días desde la primera apertura; límites 5+5+5. PDF de presupuesto en los 4 primeros; bloqueado desde el 5.º y tras 7 días sin Pro. Tras la prueba, consulta/edición se mantiene; creación requiere Pro.' },
    { heading: '6. Servicios de terceros', body: 'Firebase Analytics, Remote Config, Firestore (metadatos anónimos), Google Play Billing. Sin venta de datos para publicidad.' },
    { heading: '7. Retención y eliminación', body: 'Datos locales: eliminar en la app o desinstalar. Telemetría: solicitud por correo, hasta 15 días hábiles.' },
    { heading: '8. Ley aplicable', body: 'Leyes de Brasil; foro Caxias do Sul/RS. Usuarios mayores de 18 años.' },
  ],
};

const terms = {
  pt: [
    { heading: '1. Objeto', body: `Termos do ${PRODUCT} — gestão empresarial no telemóvel, dados principalmente no dispositivo.` },
    { heading: '2. Elegibilidade', body: 'Maiores de 18 anos.' },
    { heading: '3. Teste e subscrição', body: '7 dias de teste; 5 clientes, 5 orçamentos, 5 lançamentos. Aviso no 4.º; 6.º ou fim dos 7 dias sem Pro bloqueia novos registos. Plano Pro mensal/anual na Google Play.' },
    { heading: '4. Cancelamento', body: 'Google Play → Pagamentos e subscrições → Subscrições.' },
    { heading: '5. Lembretes fiscais', body: 'Informativos; não substituem contabilista.' },
    { heading: '6. Responsabilidade', body: 'Ferramenta de apoio; decisões de negócio são do utilizador.' },
    { heading: '7. Contacto', body: EMAIL },
  ],
  en: [
    { heading: '1. Purpose', body: `These Terms govern ${PRODUCT} — business management on your phone, data primarily on device.` },
    { heading: '2. Eligibility', body: 'Aged 18 or over.' },
    { heading: '3. Trial and subscription', body: '7-day trial; 5 clients, 5 estimates, 5 cash entries. Warning on 4th; 6th or end of 7 days without Pro blocks new records. Monthly/annual Pro via Google Play.' },
    { heading: '4. Cancellation', body: 'Google Play → Payments & subscriptions.' },
    { heading: '5. Fiscal reminders', body: 'Informational only; not tax advice.' },
    { heading: '6. Liability', body: 'Support tool; business decisions are yours.' },
    { heading: '7. Contact', body: EMAIL },
  ],
  es: [
    { heading: '1. Objeto', body: `Términos de ${PRODUCT} — gestión empresarial en el móvil, datos principalmente en el dispositivo.` },
    { heading: '2. Elegibilidad', body: 'Mayores de 18 años.' },
    { heading: '3. Prueba y suscripción', body: '7 días de prueba; 5 clientes, 5 presupuestos, 5 movimientos. Aviso en el 4.º; 6.º o fin de 7 días sin Pro bloquea nuevos registros. Plan Pro mensual/anual en Google Play.' },
    { heading: '4. Cancelación', body: 'Google Play → Pagos y suscripciones.' },
    { heading: '5. Recordatorios fiscales', body: 'Informativos; no sustituyen al contador.' },
    { heading: '6. Responsabilidad', body: 'Herramienta de apoyo; decisiones del usuario.' },
    { heading: '7. Contacto', body: EMAIL },
  ],
};

const deletion = {
  pt: [
    { heading: '1. Dados locais', body: 'Configurações → Dados no dispositivo → Eliminar todos os dados. Ou desinstalar a app. Irreversível sem backup externo.' },
    { heading: '2. Ficheiros exportados', body: 'PDFs e backups partilhados devem ser apagados manualmente onde os guardou (WhatsApp, e-mail, nuvem).' },
    { heading: '3. Firebase (metadados)', body: `E-mail ${EMAIL}, assunto «Solicitação de Exclusão de Dados Técnicos». Prazo: até 15 dias úteis.` },
    { heading: '4. Subscrições', body: 'Eliminar dados não cancela subscrição Google Play — gerir na loja.' },
  ],
  en: [
    { heading: '1. Local data', body: 'Settings → Device data → Delete all data. Or uninstall. Irreversible without external backup.' },
    { heading: '2. Exported files', body: 'Delete shared PDFs and backups manually where you stored them.' },
    { heading: '3. Firebase (metadata)', body: `Email ${EMAIL}, subject "Technical Data Deletion Request". Up to 15 business days.` },
    { heading: '4. Subscriptions', body: 'Deleting app data does not cancel Google Play subscription.' },
  ],
  es: [
    { heading: '1. Datos locales', body: 'Ajustes → Datos en el dispositivo → Eliminar todos los datos. O desinstalar. Irreversible sin copia externa.' },
    { heading: '2. Archivos exportados', body: 'Elimine manualmente PDFs y copias compartidas donde los guardó.' },
    { heading: '3. Firebase (metadatos)', body: `Correo ${EMAIL}, asunto «Solicitud de Eliminación de Datos Técnicos». Hasta 15 días hábiles.` },
    { heading: '4. Suscripciones', body: 'Eliminar datos no cancela la suscripción de Google Play.' },
  ],
};

const faq = {
  pt: [
    { heading: 'O que é o PerfectGest I?', body: 'Gestão no telemóvel com dados locais (SQLite). Sem conta na nuvem para clientes/orçamentos/caixa.' },
    { heading: 'Funciona offline?', body: 'Sim, uso diário offline-first. Serviços Google opcionais podem usar rede.' },
    { heading: 'Como funciona o teste de 7 dias?', body: '5+5+5 durante 7 dias. PDF de orçamento nos 4 primeiros; bloqueado do 5.º e após 7 dias sem Pro. Subscrição em Configurações → Assinatura Google Play.' },
    { heading: 'Cartão de visita', body: 'Aba Empresa — dados profissionais. Partilha PNG; Pro para vCard, QR e edição após 1.º cartão. Clientes e caixa não entram no cartão.' },
    { heading: 'Os dados estão protegidos?', body: 'Clientes e financeiro ficam no aparelho. Só saem se partilhar PDF, backup ou cartão.' },
    { heading: 'Como apagar tudo?', body: 'Configurações → Dados no dispositivo → Eliminar todos os dados.' },
    { heading: 'Tem anúncios?', body: 'Não.' },
    { heading: 'Idiomas', body: 'Português (BR), inglês (EUA), espanhol (ES).' },
  ],
  en: [
    { heading: 'What is PerfectGest I?', body: 'Mobile management with local data (SQLite). No PerfectGest cloud account for clients/estimates/cash.' },
    { heading: 'Works offline?', body: 'Yes, offline-first daily use. Optional Google services may use the network.' },
    { heading: 'How does the 7-day trial work?', body: '5+5+5 during 7 days. Budget PDF for first 4 only; blocked from 5th and after 7 days without Pro. Subscribe in Settings → Google Play subscription.' },
    { heading: 'Business card', body: 'Company tab — professional data. Share PNG; Pro for vCard, QR and edit after first card. Clients and cash are not on the card.' },
    { heading: 'Is my data protected?', body: 'Clients and financial data stay on device unless you share PDF, backup or card.' },
    { heading: 'How to delete everything?', body: 'Settings → Device data → Delete all data on this device.' },
    { heading: 'Ads?', body: 'No.' },
    { heading: 'Languages', body: 'Portuguese (BR), English (US), Spanish (ES).' },
  ],
  es: [
    { heading: '¿Qué es PerfectGest I?', body: 'Gestión en el móvil con datos locales (SQLite). Sin cuenta en la nube PerfectGest para clientes/presupuestos/caja.' },
    { heading: '¿Funciona sin internet?', body: 'Sí, uso diario offline-first. Servicios Google opcionales pueden usar red.' },
    { heading: '¿Cómo funciona la prueba de 7 días?', body: '5+5+5 durante 7 días. PDF de presupuesto en los 4 primeros; bloqueado desde el 5.º y tras 7 días sin Pro. Suscripción en Ajustes → Suscripción Google Play.' },
    { heading: 'Tarjeta de visita', body: 'Pestaña Empresa — datos profesionales. Compartir PNG; Pro para vCard, QR y edición tras la 1.ª tarjeta.' },
    { heading: '¿Están protegidos mis datos?', body: 'Clientes y finanzas en el teléfono. Solo salen si comparte PDF, copia o tarjeta.' },
    { heading: '¿Cómo borrar todo?', body: 'Ajustes → Datos en el dispositivo → Eliminar todos los datos.' },
    { heading: '¿Anuncios?', body: 'No.' },
    { heading: 'Idiomas', body: 'Portugués (BR), inglés (EE. UU.), español (ES).' },
  ],
};

const pageSlugs = {
  privacy: 'perfectgest-i-politica-privacidade',
  terms: 'perfectgest-i-termos',
  deletion: 'perfectgest-i-exclusao-dados',
  faq: 'perfectgest-i-faq',
};

module.exports = {
  header,
  lastUpdated,
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
        pt: `Termos e Condições — ${PRODUCT}`,
        en: `Terms and Conditions — ${PRODUCT}`,
        es: `Términos y Condiciones — ${PRODUCT}`,
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
        pt: `Perguntas frequentes — ${PRODUCT}`,
        en: `FAQ — ${PRODUCT}`,
        es: `Preguntas frecuentes — ${PRODUCT}`,
      },
      sections: faq,
    },
  },
};
