/** PerfectGest-Contabil I — documentos legais no domínio perfectgestdev.com */
const PRODUCT = 'PerfectGest-Contabil I';
const PACKAGE_ID = 'br.perfectgestcontabil.dev';
const FANTASY = 'Perfect Gest Dev';
const LEGAL_NAME = 'PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA';
const CNPJ = '66.889.409/0001-19';
const EMAIL = 'suporte@perfectgestdev.com';
const ADDRESS = 'Caxias do Sul — RS — Brasil';

const header = {
  pt:
    `${LEGAL_NAME}\n` +
    `Nome fantasia: ${FANTASY} · CNPJ ${CNPJ}\n` +
    `${ADDRESS} · ${EMAIL}\n` +
    `App Android: ${PRODUCT} · pacote ${PACKAGE_ID}\n\n` +
    'Papéis no tratamento (LGPD)\n' +
    '• Controlador dos dados contábeis e da empresa: o titular da ME/MEI ou o profissional que utiliza o software.\n' +
    `• Operador do software: ${FANTASY} (${LEGAL_NAME}) — desenvolve e mantém a ferramenta; não decide sobre o conteúdo inserido pelo utilizador.\n` +
    '• Direitos do titular: aceder, corrigir, exportar e eliminar no próprio app, ou contactar ' +
    EMAIL + '.',
  en:
    `${LEGAL_NAME}\n` +
    `Trade name: ${FANTASY} · CNPJ ${CNPJ}\n` +
    `${ADDRESS} · ${EMAIL}\n` +
    `Android app: ${PRODUCT} · package ${PACKAGE_ID}\n\n` +
    'Roles in processing (LGPD)\n' +
    '• Controller of accounting and business data: the ME/MEI owner or professional using the software.\n' +
    `• Software operator: ${FANTASY} (${LEGAL_NAME}) — develops and maintains the tool; does not decide on user-entered content.\n` +
    '• Data subject rights: access, correct, export, and delete in the app, or contact ' +
    EMAIL + '.',
  es:
    `${LEGAL_NAME}\n` +
    `Nombre comercial: ${FANTASY} · CNPJ ${CNPJ}\n` +
    `${ADDRESS} · ${EMAIL}\n` +
    `App Android: ${PRODUCT} · paquete ${PACKAGE_ID}\n\n` +
    'Roles en el tratamiento (LGPD)\n' +
    '• Controlador de los datos contables y de la empresa: el titular de la ME/MEI o el profesional que utiliza el software.\n' +
    `• Operador del software: ${FANTASY} (${LEGAL_NAME}) — desarrolla y mantiene la herramienta; no decide sobre el contenido introducido por el usuario.\n` +
    '• Derechos del titular: acceder, corregir, exportar y eliminar en la app, o contactar ' +
    EMAIL + '.',
};

const lastUpdated = {
  pt: 'Última atualização: 17/06/2026',
  en: 'Last updated: 17 June 2026',
  es: 'Última actualización: 17/06/2026',
};

const labels = {
  pt: {
    privacy: 'Política de Privacidade',
    terms: 'Termos de Uso',
    deletion: 'Exclusão de Dados',
    faq: 'Perguntas frequentes',
  },
  en: {
    privacy: 'Privacy Policy',
    terms: 'Terms of Use',
    deletion: 'Data Deletion',
    faq: 'FAQ',
  },
  es: {
    privacy: 'Política de Privacidad',
    terms: 'Términos de Uso',
    deletion: 'Eliminación de Datos',
    faq: 'Preguntas frecuentes',
  },
};

const privacy = {
  pt: [
    {
      heading: '1. Escopo',
      body: `${PRODUCT} é um aplicativo Android de livro caixa e obrigações fiscais para ME e MEI. Os dados ficam no dispositivo (SQLite e preferências locais). Não há conta na nuvem PerfectGest nem sincronização automática.`,
    },
    {
      heading: '2. Dados tratados',
      body:
        '2.1 Dados locais (por defeito)\n' +
        '• Dados da empresa: razão social, CNPJ/CPF, CNAE, contactos\n' +
        '• Livro caixa: lançamentos, valores, categorias, datas\n' +
        '• Obrigações fiscais: marcações e observações\n' +
        '• Fecho do mês e conciliações\n' +
        '• Nome de comprovante anexado (opcional)\n' +
        '• Preferências: tema, aceite de privacidade\n\n' +
        '2.2 Dados que podem sair do dispositivo (só com a sua ação)\n' +
        '• Partilhar PDF do livro caixa\n' +
        '• Exportar ou importar backup JSON\n' +
        '• Abrir portais governamentais no browser (Receita, MEI, ISS)\n' +
        '• Selecionar foto na galeria para comprovante — apenas o nome do ficheiro é guardado no lançamento\n\n' +
        '2.3 O que não recolhemos automaticamente\n' +
        'Localização GPS, lista de contactos, identificadores publicitários, analytics de conteúdo contábil ou histórico de navegação.',
    },
    {
      heading: '3. Finalidades e base legal (LGPD)',
      body:
        'Usamos os dados para operar o livro caixa, obrigações, fechos, relatórios PDF e backups quando solicitados. Base legal: execução de funcionalidades solicitadas pelo titular e legítimo interesse em fornecer ferramenta contábil local com transparência.',
    },
    {
      heading: '4. Partilha com terceiros',
      body:
        'Não vendemos nem partilhamos dados contábeis com terceiros por defeito. PDFs e backups partilhados ficam sob o controlo do destino que escolher (e-mail, WhatsApp, nuvem, etc.). Sites governamentais têm políticas próprias.',
    },
    {
      heading: '5. Segurança e permissões',
      body:
        'Dados no espaço privado da app no Android. Recomendamos bloqueio de ecrã e backups em local seguro.\n\nPermissões/comportamentos do sistema:\n' +
        '• Seletor de fotos (comprovante opcional)\n' +
        '• Seletor de ficheiros (importar backup JSON)\n' +
        '• Partilha de ficheiros (PDF/backup gerados pela app)\n' +
        '• Abrir links externos no browser\n\n' +
        'Não solicitamos permissão de câmara nem armazenamento amplo no manifesto de produção.',
    },
    {
      heading: '6. Retenção e eliminação',
      body:
        'Os dados permanecem até eliminar no menu «Eliminar todos os dados» ou desinstalar a app. Não mantemos cópia central nos nossos servidores. Ver página de Exclusão de Dados.',
    },
    {
      heading: '7. Direitos do titular',
      body:
        'Acesso e correção no app; exportação em PDF ou JSON; eliminação total no app; revogação desinstalando e apagando dados. Contacto: ' +
        EMAIL,
    },
    {
      heading: '8. Crianças e Google Play',
      body:
        'App destinado a adultos e empreendedores (18+). Sem anúncios. Esta política complementa o formulário Segurança dos dados na Google Play.',
    },
    {
      heading: '9. Contacto',
      body: EMAIL,
    },
  ],
  en: [
    {
      heading: '1. Scope',
      body: `${PRODUCT} is an Android cash book and tax obligations app for micro-businesses (ME/MEI). Data stays on the device (local SQLite and preferences). No PerfectGest cloud account or automatic sync.`,
    },
    {
      heading: '2. Data processed',
      body:
        '2.1 Local data (by default)\n' +
        '• Company profile: legal name, tax ID, contacts\n' +
        '• Cash book entries, amounts, categories\n' +
        '• Tax obligation tracking\n' +
        '• Month-end closing and reconciliation\n' +
        '• Receipt file name (optional)\n' +
        '• Preferences: theme, privacy consent\n\n' +
        '2.2 Data that may leave the device (your action only)\n' +
        '• Share cash book PDF\n' +
        '• Export/import JSON backup\n' +
        '• Open government portals in the browser\n' +
        '• Pick a gallery photo for a receipt — only the file name is stored\n\n' +
        '2.3 Not collected automatically\n' +
        'GPS location, contacts list, ad IDs, accounting-content analytics, or browsing history.',
    },
    {
      heading: '3. Purposes and legal basis (LGPD)',
      body: 'We use data to operate the cash book, obligations, closing, PDF reports, and backups when you request them. Legal basis: performance of features you request and legitimate interest in providing a transparent local accounting tool.',
    },
    {
      heading: '4. Third-party sharing',
      body: 'We do not sell or share accounting data with third parties by default. Shared PDFs/backups are under your chosen destination. Government sites have their own policies.',
    },
    {
      heading: '5. Security and permissions',
      body:
        'Data in the app private space on Android. We recommend screen lock and secure backups.\n\nSystem behaviors:\n' +
        '• Photo picker (optional receipt)\n' +
        '• File picker (import JSON backup)\n' +
        '• Share generated PDF/backup files\n' +
        '• Open external links in the browser\n\n' +
        'We do not request camera or broad storage permissions in the production manifest.',
    },
    {
      heading: '6. Retention and deletion',
      body: 'Data remains until you use Delete all data in the app menu or uninstall. We do not keep a central copy on our servers. See the Data Deletion page.',
    },
    {
      heading: '7. Data subject rights',
      body: 'Access and correct in the app; export PDF or JSON; full deletion in the app; revoke by uninstalling. Contact: ' + EMAIL,
    },
    {
      heading: '8. Children and Google Play',
      body: 'App for adults and entrepreneurs (18+). No ads. This policy complements the Google Play Data safety form.',
    },
    {
      heading: '9. Contact',
      body: EMAIL,
    },
  ],
  es: [
    {
      heading: '1. Alcance',
      body: `${PRODUCT} es una app Android de libro de caja y obligaciones fiscales para ME y MEI. Los datos permanecen en el dispositivo (SQLite y preferencias locales). Sin cuenta en la nube PerfectGest ni sincronización automática.`,
    },
    {
      heading: '2. Datos tratados',
      body:
        '2.1 Datos locales (por defecto)\n' +
        '• Empresa: razón social, CNPJ/CPF, contactos\n' +
        '• Libro de caja: movimientos, importes, categorías\n' +
        '• Obligaciones fiscales\n' +
        '• Cierre de mes y conciliación\n' +
        '• Nombre de comprobante (opcional)\n' +
        '• Preferencias: tema, consentimiento de privacidad\n\n' +
        '2.2 Datos que pueden salir del dispositivo (solo por su acción)\n' +
        '• Compartir PDF del libro de caja\n' +
        '• Exportar/importar backup JSON\n' +
        '• Abrir portales gubernamentales en el navegador\n' +
        '• Foto de galería para comprobante — solo se guarda el nombre del archivo\n\n' +
        '2.3 No recogidos automáticamente\n' +
        'Ubicación GPS, lista de contactos, identificadores publicitarios, analytics del contenido contable o historial de navegación.',
    },
    {
      heading: '3. Finalidades y base legal (LGPD)',
      body: 'Usamos los datos para operar el libro de caja, obligaciones, cierres, informes PDF y copias de seguridad cuando usted lo solicite.',
    },
    {
      heading: '4. Compartir con terceros',
      body: 'No vendemos ni compartimos datos contables con terceros por defecto. Los PDF y backups compartidos quedan bajo el destino que elija.',
    },
    {
      heading: '5. Seguridad y permisos',
      body: 'Datos en el espacio privado de la app. Selector de fotos, archivos, compartir PDF/backup y enlaces externos en el navegador. Sin permisos amplios de cámara o almacenamiento en producción.',
    },
    {
      heading: '6. Retención y eliminación',
      body: 'Los datos permanecen hasta eliminar en el menú o desinstalar. No guardamos copia central. Véase Eliminación de Datos.',
    },
    {
      heading: '7. Derechos del titular',
      body: 'Acceso, corrección, exportación y eliminación en la app. Contacto: ' + EMAIL,
    },
    {
      heading: '8. Menores y Google Play',
      body: 'App para adultos y emprendedores (18+). Sin anuncios.',
    },
    {
      heading: '9. Contacto',
      body: EMAIL,
    },
  ],
};

const terms = {
  pt: [
    {
      heading: '1. Aceitação',
      body: `Ao instalar ou utilizar o ${PRODUCT}, concorda com estes Termos e com a Política de Privacidade publicada neste site.`,
    },
    {
      heading: '2. O que é o App',
      body: 'Ferramenta de apoio contábil operacional: livro caixa, obrigações fiscais, fecho do mês, conciliação, PDF e backup local.',
    },
    {
      heading: '3. O que o App não é',
      body: 'Não é banco, instituição financeira nem meio de pagamento. Não processa PIX, cartões ou transferências. Não substitui contador certificado nem garante conformidade fiscal automática.',
    },
    {
      heading: '4. Uso permitido',
      body: 'Registar movimentos da sua atividade, organizar obrigações e exportar dados para arquivo ou contador. É proibido uso ilegal, fraude ou redistribuição não autorizada do software.',
    },
    {
      heading: '5. Dados e backups',
      body: 'Dados locais no dispositivo. Exporte backups periodicamente. Importar backup substitui todos os dados locais atuais — faça cópia antes.',
    },
    {
      heading: '6. Ligações externas',
      body: 'Portais governamentais abrem no browser; políticas de terceiros aplicam-se.',
    },
    {
      heading: '7. Limitação de responsabilidade',
      body: `${FANTASY} não se responsabiliza por multas fiscais, erros de lançamento ou decisões tomadas apenas com base no App. Ferramenta de registo; valide com profissional habilitado quando necessário.`,
    },
    {
      heading: '8. Propriedade intelectual e alterações',
      body: 'Software propriedade da Perfect Gest Dev. Podemos atualizar estes Termos; versão vigente neste URL.',
    },
    {
      heading: '9. Lei aplicável',
      body: 'Leis do Brasil (LGPD e CDC quando aplicável). Foro: comarca do consumidor, salvo disposição legal.',
    },
    {
      heading: '10. Contacto',
      body: EMAIL,
    },
  ],
  en: [
    { heading: '1. Acceptance', body: `By installing or using ${PRODUCT}, you agree to these Terms and the Privacy Policy on this site.` },
    { heading: '2. What the app is', body: 'Operational accounting support: cash book, tax obligations, month-end closing, reconciliation, PDF and local backup.' },
    { heading: '3. What the app is not', body: 'Not a bank, payment processor, or certified accountant substitute. Does not guarantee automatic tax compliance.' },
    { heading: '4. Permitted use', body: 'Record business movements, organize obligations, export data. Illegal use or unauthorized redistribution is prohibited.' },
    { heading: '5. Data and backups', body: 'Local data on device. Export backups regularly. Importing a backup replaces all current local data.' },
    { heading: '6. External links', body: 'Government portals open in the browser; third-party policies apply.' },
    { heading: '7. Limitation of liability', body: `${FANTASY} is not liable for tax penalties or errors from using the app alone. Validate with a qualified professional when needed.` },
    { heading: '8. IP and changes', body: 'Software owned by Perfect Gest Dev. We may update these Terms.' },
    { heading: '9. Governing law', body: 'Laws of Brazil (LGPD and Consumer Code where applicable).' },
    { heading: '10. Contact', body: EMAIL },
  ],
  es: [
    { heading: '1. Aceptación', body: `Al instalar o utilizar ${PRODUCT}, acepta estos Términos y la Política de Privacidad de este sitio.` },
    { heading: '2. Qué es la app', body: 'Apoyo contable operacional: libro de caja, obligaciones fiscales, cierre de mes, conciliación, PDF y backup local.' },
    { heading: '3. Qué no es', body: 'No es banco ni procesador de pagos. No sustituye contador certificado.' },
    { heading: '4. Uso permitido', body: 'Registrar movimientos, organizar obligaciones, exportar datos. Prohibido uso ilegal.' },
    { heading: '5. Datos y backups', body: 'Datos locales. Importar backup reemplaza todos los datos actuales.' },
    { heading: '6. Enlaces externos', body: 'Portales gubernamentales en el navegador.' },
    { heading: '7. Limitación de responsabilidad', body: `${FANTASY} no responde por multas ni errores de registro.` },
    { heading: '8. Propiedad intelectual', body: 'Software de Perfect Gest Dev.' },
    { heading: '9. Ley aplicable', body: 'Leyes de Brasil.' },
    { heading: '10. Contacto', body: EMAIL },
  ],
};

const deletion = {
  pt: [
    {
      heading: 'Introdução',
      body: `O ${PRODUCT} permite eliminar todos os dados locais, em conformidade com a LGPD e o formulário Segurança dos dados da Google Play.`,
    },
    {
      heading: '1. O que é apagado',
      body:
        'Livro caixa e lançamentos · Obrigações e marcações · Fechos e conciliações · Dados da empresa · Categorias e contas personalizadas · Preferências (incluindo aceite de privacidade).',
    },
    {
      heading: '2. O que não apaga automaticamente',
      body: 'PDFs ou backups JSON já exportados para e-mail, nuvem ou outras apps — apague manualmente nesses locais.',
    },
    {
      heading: '3. Como eliminar no App',
      body:
        'Menu lateral → Eliminar todos os dados → marcar confirmação → digitar ELIMINAR → confirmar diálogo final. Operação irreversível. Será solicitado novo aceite de privacidade.',
    },
    {
      heading: '4. Desinstalação',
      body: 'Desinstalar pela Google Play remove dados da app. Recomendamos eliminar dados no app antes de entregar o dispositivo a terceiros.',
    },
    {
      heading: '5. Prazo e contacto',
      body: 'Eliminação local: imediata. Não há retenção em servidores PerfectGest. Dúvidas: ' + EMAIL,
    },
  ],
  en: [
    { heading: 'Introduction', body: `${PRODUCT} lets you delete all local data under LGPD and Google Play Data safety requirements.` },
    { heading: '1. What is deleted', body: 'Cash book, obligations, month-end data, company profile, custom settings, and preferences.' },
    { heading: '2. Not deleted automatically', body: 'PDFs or JSON backups already shared to email, cloud, or other apps.' },
    { heading: '3. How to delete in the app', body: 'Drawer menu → Delete all data → check confirmation → type DELETE (ELIMINAR in PT UI) → confirm. Irreversible.' },
    { heading: '4. Uninstall', body: 'Uninstalling from Google Play removes app data. Delete in-app before handing over the device.' },
    { heading: '5. Timeline and contact', body: 'Local deletion: immediate. No PerfectGest server retention. Questions: ' + EMAIL },
  ],
  es: [
    { heading: 'Introducción', body: `${PRODUCT} permite eliminar todos los datos locales según LGPD y Google Play.` },
    { heading: '1. Qué se borra', body: 'Libro de caja, obligaciones, cierres, empresa, configuración y preferencias.' },
    { heading: '2. No se borra automáticamente', body: 'PDF o backups JSON ya compartidos externamente.' },
    { heading: '3. Cómo eliminar en la app', body: 'Menú → Eliminar todos los datos → confirmar → escribir ELIMINAR → confirmar.' },
    { heading: '4. Desinstalación', body: 'Desinstalar en Google Play elimina datos de la app.' },
    { heading: '5. Plazo y contacto', body: 'Inmediato en el dispositivo. Contacto: ' + EMAIL },
  ],
};

const faq = {
  pt: [
    { heading: 'O que é o PerfectGest-Contabil I?', body: 'App de livro caixa e obrigações fiscais para ME e MEI, offline após instalação.' },
    { heading: 'Preciso de internet?', body: 'Não no dia a dia. Internet para instalar/atualizar, abrir portais fiscais ou partilhar PDF/backup.' },
    { heading: 'Os dados vão para a nuvem?', body: 'Não automaticamente. Tudo fica no dispositivo até exportar ou partilhar.' },
    { heading: 'Tem anúncios ou login?', body: 'Não. Sem publicidade e sem conta de utilizador.' },
    { heading: 'Substitui o contador?', body: 'Não. Ferramenta de registo; valide declarações com profissional habilitado.' },
    { heading: 'Conecta ao banco?', body: 'Não. Lançamentos manuais; saldo de extrato informado no fecho do mês.' },
    { heading: 'Como faço backup?', body: 'Menu → Relatórios e backup → Exportar backup (.json).' },
    { heading: 'Como apago tudo?', body: 'Menu → Eliminar todos os dados. Ver página Exclusão de Dados.' },
    { heading: 'O comprovante fica guardado?', body: 'Apenas o nome do ficheiro escolhido na galeria; a imagem não é persistida na base de dados.' },
    { heading: 'Pacote Android e preço', body: `Pacote: ${PACKAGE_ID}. App gratuito na configuração atual.` },
    { heading: 'Público-alvo', body: 'Adultos e empreendedores (18+). Não dirigido a crianças.' },
    { heading: 'Suporte', body: EMAIL },
  ],
  en: [
    { heading: 'What is PerfectGest-Contabil I?', body: 'Cash book and tax obligations app for micro-businesses, offline after install.' },
    { heading: 'Internet required?', body: 'Not for daily use. Needed to install, open tax portals, or share exports.' },
    { heading: 'Cloud sync?', body: 'No automatic cloud upload. Data stays on device.' },
    { heading: 'Ads or login?', body: 'No ads. No user accounts.' },
    { heading: 'Replaces an accountant?', body: 'No. A recording tool only.' },
    { heading: 'Bank connection?', body: 'No. Manual entries only.' },
    { heading: 'Backup and delete?', body: 'Reports & backup menu. Delete all data in drawer menu.' },
    { heading: 'Receipt photos?', body: 'Only the file name is stored, not the image.' },
    { heading: 'Package and price', body: `Package: ${PACKAGE_ID}. Free in current release.` },
    { heading: 'Support', body: EMAIL },
  ],
  es: [
    { heading: '¿Qué es PerfectGest-Contabil I?', body: 'Libro de caja y obligaciones fiscales para ME y MEI, offline tras instalar.' },
    { heading: '¿Internet necesaria?', body: 'No en el uso diario.' },
    { heading: '¿Datos en la nube?', body: 'No automáticamente.' },
    { heading: '¿Anuncios o login?', body: 'No.' },
    { heading: '¿Sustituye al contador?', body: 'No.' },
    { heading: '¿Conexión bancaria?', body: 'No.' },
    { heading: 'Backup y borrado', body: 'Menú Informes y backup; Eliminar todos los datos.' },
    { heading: 'Comprobantes', body: 'Solo nombre de archivo, no la imagen.' },
    { heading: 'Paquete y precio', body: `Paquete: ${PACKAGE_ID}. Gratuito.` },
    { heading: 'Soporte', body: EMAIL },
  ],
};

const pageSlugs = {
  privacy: 'contabil-i-politica-privacidade',
  terms: 'contabil-i-termos',
  deletion: 'contabil-i-exclusao-dados',
  faq: 'contabil-i-faq',
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
        pt: `Perguntas frequentes — ${PRODUCT}`,
        en: `FAQ — ${PRODUCT}`,
        es: `Preguntas frecuentes — ${PRODUCT}`,
      },
      sections: faq,
    },
  },
};
