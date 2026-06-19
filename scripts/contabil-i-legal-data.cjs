/** PerfectGest-Contabil I — documentos legais no domínio perfectgestdev.com
 * Gerado por scripts/contabil-i-sync-legal-from-md.cjs — não editar manualmente.
 * Fonte PT: apps/Contabilidade_Clientes/mobile/docs/politicas/*.md */
const PRODUCT = "PerfectGest-Contabil I";
const PACKAGE_ID = "br.perfectgestcontabil.dev";
const FANTASY = "Perfect Gest Dev";
const LEGAL_NAME = "PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA";
const CNPJ = "66.889.409/0001-19";
const EMAIL = "suporte@perfectgestdev.com";
const ADDRESS = "Caxias do Sul — RS — Brasil";

const header = {
  pt: "PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA\nNome fantasia: Perfect Gest Dev · CNPJ 66.889.409/0001-19\nCaxias do Sul — RS — Brasil · suporte@perfectgestdev.com\nApp Android: PerfectGest-Contabil I · pacote br.perfectgestcontabil.dev\n\nPapéis no tratamento (LGPD)\n• Controlador dos dados contábeis e da empresa: o titular da ME/MEI ou o profissional que utiliza o software.\n• Operador do software: Perfect Gest Dev (PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA) — desenvolve e mantém a ferramenta; não decide sobre o conteúdo inserido pelo utilizador.\n• Direitos do titular: aceder, corrigir, exportar e eliminar no próprio app, ou contactar suporte@perfectgestdev.com.",
  en: "PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA\nTrade name: Perfect Gest Dev · CNPJ 66.889.409/0001-19\nCaxias do Sul — RS — Brasil · suporte@perfectgestdev.com\nAndroid app: PerfectGest-Contabil I · package br.perfectgestcontabil.dev\n\nRoles in processing (LGPD)\n• Controller of accounting and business data: the ME/MEI owner or professional using the software.\n• Software operator: Perfect Gest Dev (PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA) — develops and maintains the tool; does not decide on user-entered content.\n• Data subject rights: access, correct, export, and delete in the app, or contact suporte@perfectgestdev.com.",
  es: "PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA\nNombre comercial: Perfect Gest Dev · CNPJ 66.889.409/0001-19\nCaxias do Sul — RS — Brasil · suporte@perfectgestdev.com\nApp Android: PerfectGest-Contabil I · paquete br.perfectgestcontabil.dev\n\nRoles en el tratamiento (LGPD)\n• Controlador de los datos contables y de la empresa: el titular de la ME/MEI o el profesional que utiliza el software.\n• Operador del software: Perfect Gest Dev (PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA) — desarrolla y mantiene la herramienta; no decide sobre el contenido introducido por el usuario.\n• Derechos del titular: acceder, corregir, exportar y eliminar en la app, o contactar suporte@perfectgestdev.com.",
};

const lastUpdated = {
  pt: 'Última atualização: 19/06/2026',
  en: 'Last updated: 19 June 2026',
  es: 'Última actualización: 19/06/2026',
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
    { heading: "1. Quem somos", body: "Esta política descreve como o aplicativo PerfectGest-Contabil I (“App”), desenvolvido pela PerfectGest, trata informações quando você o utiliza em seu dispositivo Android.\n\n- Nome do app: PerfectGest-Contabil I\n- Pacote Android: br.perfectgestcontabil.dev\n- Contacto para privacidade: suporte@perfectgestdev.com\n- Política pública: https://perfectgestdev.com/contabil-i-politica-privacidade" },
    { heading: "2. Princípio fundamental: dados no seu dispositivo", body: "O App foi concebido para contabilidade operacional offline-first. Por defeito:\n\n- Lançamentos, obrigações fiscais, fechos de mês e dados da empresa ficam no seu dispositivo (armazenamento local).\n- Não enviamos os seus dados contábeis para servidores da PerfectGest automaticamente.\n- Não utilizamos rastreamento publicitário nem analytics de conteúdo contábil.\n\nQualquer saída local ocorre quando você toca em “Gerar e partilhar PDF”, “Exportar backup” ou “Importar backup”.\n\nExcepção (com consentimento): envio do mês para conferência contábil, validação de subscrição Google Play, bónus certificado A1 e dados necessários ao serviço de abertura de empresa — ver secção 5." },
    { heading: "3. Dados que o App pode tratar", body: "3.1 Dados que você insere\n\nTipo · Exemplos · Onde ficam\nDados da empresa · Razão social, CNPJ/CPF, CNAE, contactos · Dispositivo (local)\nDados financeiros · Lançamentos, valores, categorias, saldos · Dispositivo (local)\nObrigações fiscais · Marcações de cumprimento, observações · Dispositivo (local)\nComprovantes · Nome do ficheiro anexado (opcional) · Dispositivo (local)\nPreferências · Tema, aceites de privacidade e nuvem · Dispositivo (local)\n\n3.2 Dados que o App não recolhe automaticamente\n\n- Localização GPS\n- Lista de contactos do telefone\n- Identificadores para publicidade\n- Histórico de navegação fora do App" },
    { heading: "4. Como usamos os dados", body: "Usamos os dados para:\n\n- Registrar e exibir livro caixa e lançamentos\n- Acompanhar obrigações fiscais e fechos de mês\n- Gerar PDF e backup quando solicitado\n- Validar subscrição e prestar serviços contratados (abertura de empresa, conferência CRC, bónus A1) — com consentimento\n\nBase legal (LGPD): execução de contrato e funcionalidades solicitadas; consentimento para envio à nuvem e serviços contábeis adicionais." },
    { heading: "5. Partilha com terceiros", body: "O App não vende dados contábeis.\n\n5.1 Ações locais (sempre por sua iniciativa)\n\nAção · O que acontece\nPartilhar PDF · Enviado ao app que você escolher\nExportar backup JSON · Partilhado por você\nAbrir portal fiscal · Browser externo — política dos sites governamentais\n\n5.2 Serviços na nuvem (Firebase/Google) — consentimento\n\nActivados apenas com aceite explícito:\n\nFinalidade · Dados tratados · Operador\nValidar subscrição (Google Play) · Token de compra, ID produto · Google Firebase\nEnvio para conferência CRC · Pacote mensal: empresa, movimentos, conciliação, PDF · Google Firebase (Firestore/Storage)\nAbertura de empresa · Dados cadastrais e documentos necessários ao processo · PerfectGest / parceiros\nBónus certificado A1 · Estado bónus, código promocional · Firebase + Quality Cert\nSessão técnica · Identificador anónimo Firebase · Google Firebase\n\nPode revogar consentimento de nuvem em Privacidade e segurança. O livro caixa local continua; conferência, bónus A1 e validação na nuvem ficam indisponíveis até novo aceite.\n\n5.3 Serviço de abertura de empresa — prazo e taxas\n\nQuando contratado (planos Contabil+ ou Anual):\n\n- Taxas oficiais (Junta Comercial, prefeitura, Receita, etc.) não estão incluídas — pagas pelo cliente aos órgãos competentes.\n- O processo de abertura pode demorar até 14 (catorze) dias, após documentação completa, referindo-se às etapas administrativas: solicitação na Junta Comercial, aprovações, registos na prefeitura e demais trâmites legais — sujeito a prazos de terceiros e exigências documentais.\n\nDetalhes contratuais: Termos de Uso, secção 5." },
    { heading: "6. Segurança", body: "- Dados locais no espaço privado da aplicação.\n- Nuvem (Firebase) só após consentimento; regras de acesso restritas à equipa autorizada.\n- Recomendamos bloqueio de ecrã e backup seguro." },
    { heading: "7. Retenção e eliminação", body: "No dispositivo: até “Eliminar todos os dados” ou desinstalar.\n\nNa nuvem (envios conferência): retidos pelo tempo necessário à prestação do serviço e obrigações legais/contábeis; solicite informações via suporte@perfectgestdev.com." },
    { heading: "8. Os seus direitos (LGPD)", body: "Aceder, corrigir, exportar, eliminar (local), revogar consentimento e opor-se a tratamentos ilícitos.\n\nContacto: suporte@perfectgestdev.com" },
    { heading: "9. Crianças", body: "Destinado a adultos e empreendedores (ME, MEI). Não se destina a menores de 18 anos." },
    { heading: "10. Alterações", body: "Atualizações refletidas nesta data e, quando relevante, na Google Play." },
    { heading: "11. Google Play", body: "Complementa a Política de Dados do Utilizador da Google Play. Formulário “Segurança dos dados” na Play Console resume estas informações." }
  ],
  en: [
    { heading: "1. Who we are", body: "This policy describes how the PerfectGest-Contabil I app (“App”), developed by PerfectGest, handles information when you use it on your Android device.\n\nApp name: PerfectGest-Contabil I\nAndroid package: br.perfectgestcontabil.dev\nPrivacy contact: suporte@perfectgestdev.com\nPublic policy: https://perfectgestdev.com/contabil-i-politica-privacidade" },
    { heading: "2. Core principle: data on your device", body: "The App is designed for offline-first operational accounting. By default:\n\n• Entries, tax obligations, month-end closing and company data stay on your device (local storage).\n• We do not automatically send your accounting data to PerfectGest servers.\n• We do not use ad tracking or accounting-content analytics.\n\nLocal export only when you tap “Generate and share PDF”, “Export backup” or “Import backup”.\n\nException (with consent): sending the month for accounting review, Google Play subscription validation, A1 certificate bonus, and data needed for company opening services — see section 5." },
    { heading: "3. Data the App may process", body: "3.1 Data you enter\n• Company data: legal name, tax ID, CNAE, contacts — on device\n• Financial data: entries, amounts, categories, balances — on device\n• Tax obligations: compliance marks, notes — on device\n• Receipts: attached file name (optional) — on device\n• Preferences: theme, privacy and cloud consent — on device\n\n3.2 Not collected automatically\nGPS location, phone contacts, ad identifiers, browsing history outside the App." },
    { heading: "4. How we use data", body: "We use data to: operate the cash book and entries; track tax obligations and month-end closing; generate PDF and backup when requested; validate subscriptions and deliver contracted services (company opening, CRC review, A1 bonus) — with consent.\n\nLegal basis (LGPD): contract performance and features you request; consent for cloud upload and additional accounting services." },
    { heading: "5. Sharing with third parties", body: "We do not sell accounting data.\n\n5.1 Local actions (your initiative only)\n• Share PDF — sent to the app you choose\n• Export/import JSON backup — shared by you\n• Open tax portals — external browser; government site policies apply\n\n5.2 Cloud services (Firebase/Google) — with consent\nEnabled only with explicit acceptance:\n• Validate Google Play subscription — purchase token, product ID\n• CRC review — monthly package: company, entries, reconciliation, PDF\n• Company opening — registration data and documents for the process\n• A1 certificate bonus — bonus status, promo code\n• Technical session — anonymous Firebase identifier\n\nYou may revoke cloud consent in Privacy & security. Local cash book continues; review, A1 bonus and cloud validation require new consent.\n\n5.3 Company opening — timeline and fees\nWhen contracted (Contabil+ or Annual plans):\n• Official fees (Commercial Registry, city hall, tax authority, etc.) are not included — paid by the client to the competent bodies.\n• The opening process may take up to 14 (fourteen) days after complete documentation, referring to administrative steps: Commercial Registry request, approvals, city hall registration and other legal procedures — subject to third-party deadlines.\n\nContract details: Terms of Use, section 5." },
    { heading: "6. Security", body: "Local data in the app private space. Cloud (Firebase) only after consent; restricted access for authorized team. We recommend screen lock and secure backups." },
    { heading: "7. Retention and deletion", body: "On device: until “Delete all data” or uninstall.\n\nIn the cloud (review submissions): retained as long as needed for the service and legal/accounting obligations; contact suporte@perfectgestdev.com." },
    { heading: "8. Your rights (LGPD)", body: "Access, correct, export, delete (locally), revoke consent and object to unlawful processing.\n\nContact: suporte@perfectgestdev.com" },
    { heading: "9. Children", body: "Intended for adults and entrepreneurs (ME, MEI). Not intended for under-18s." },
    { heading: "10. Changes", body: "Updates reflected on this date and, when relevant, on Google Play." },
    { heading: "11. Google Play", body: "Complements Google Play User Data Policy. The Play Console “Data safety” form summarizes this information." }
  ],
  es: [
    { heading: "1. Quiénes somos", body: "Esta política describe cómo la app PerfectGest-Contabil I (“App”), desarrollada por PerfectGest, trata la información cuando la utiliza en su dispositivo Android.\n\nNombre: PerfectGest-Contabil I\nPaquete Android: br.perfectgestcontabil.dev\nContacto privacidad: suporte@perfectgestdev.com\nPolítica pública: https://perfectgestdev.com/contabil-i-politica-privacidade" },
    { heading: "2. Principio fundamental: datos en su dispositivo", body: "La App está diseñada para contabilidad operacional offline-first. Por defecto:\n\n• Movimientos, obligaciones fiscales, cierres de mes y datos de la empresa permanecen en el dispositivo.\n• No enviamos automáticamente sus datos contables a servidores PerfectGest.\n• No utilizamos rastreo publicitario ni analytics del contenido contable.\n\nExcepción (con consentimiento): envío del mes para revisión contable, validación de suscripción Google Play, bono certificado A1 y datos para apertura de empresa — ver sección 5." },
    { heading: "3. Datos que la App puede tratar", body: "3.1 Datos que usted introduce\n• Empresa, datos financieros, obligaciones fiscales, comprobantes (nombre de archivo), preferencias — en el dispositivo\n\n3.2 No recogidos automáticamente\nUbicación GPS, lista de contactos, identificadores publicitarios, historial de navegación." },
    { heading: "4. Cómo usamos los datos", body: "Para operar el libro de caja, obligaciones, cierres, PDF y backup; validar suscripción y prestar servicios contratados (apertura de empresa, revisión CRC, bono A1) — con consentimiento. Base legal LGPD: ejecución de contrato y consentimiento para la nube." },
    { heading: "5. Compartir con terceros", body: "No vendemos datos contables.\n\n5.1 Acciones locales (solo por su iniciativa)\n• Compartir PDF, exportar/importar backup JSON, abrir portales fiscales en el navegador\n\n5.2 Servicios en la nube (Firebase/Google) — con consentimiento\n• Validar suscripción Google Play · Envío para revisión CRC · Apertura de empresa · Bono A1 · Sesión técnica Firebase\n\nPuede revocar el consentimiento de nube en Privacidad y seguridad.\n\n5.3 Apertura de empresa — plazo y tasas\n• Tasas oficiales no incluidas — pagadas por el cliente.\n• El proceso puede demorar hasta 14 (catorce) días tras documentación completa (Junta Comercial, aprobaciones, prefectura, etc.)." },
    { heading: "6. Seguridad", body: "Datos locales en espacio privado de la app. Nube solo con consentimiento. Recomendamos bloqueo de pantalla y backup seguro." },
    { heading: "7. Retención y eliminación", body: "En el dispositivo: hasta «Eliminar todos los datos» o desinstalar. En la nube: según servicio y obligaciones legales; contacte suporte@perfectgestdev.com." },
    { heading: "8. Sus derechos (LGPD)", body: "Acceso, corrección, exportación, eliminación local, revocación de consentimiento. Contacto: suporte@perfectgestdev.com" },
    { heading: "9. Menores", body: "Destinado a adultos y emprendedores (ME, MEI). No dirigido a menores de 18 años." },
    { heading: "10. Cambios", body: "Actualizaciones reflejadas en esta fecha y, cuando corresponda, en Google Play." },
    { heading: "11. Google Play", body: "Complementa la Política de Datos de Usuario de Google Play." }
  ],
};

const terms = {
  pt: [
    { heading: "1. Aceitação", body: "Ao instalar, abrir ou utilizar o aplicativo PerfectGest-Contabil I (“App”), você concorda com estes Termos de Uso e com a Política de Privacidade.\n\nSe não concordar, não utilize o App e desinstale-o do seu dispositivo." },
    { heading: "2. O que é o App", body: "O PerfectGest-Contabil I é uma ferramenta de apoio contábil operacional para microempresas e MEI, incluindo:\n\n- Livro caixa e lançamentos\n- Obrigações fiscais com lembretes de vencimento\n- Fecho do mês e conciliação\n- Exportação de relatórios PDF e backup local\n- Subscrições opcionais via Google Play (planos Mensal, Contabil+ e Anual)" },
    { heading: "3. O que o App não é", body: "- Não é um banco, instituição financeira ou meio de pagamento.\n- Não processa transferências, PIX, cartões ou movimentação bancária real.\n- Não substitui, por si só, um contador, escritório contábil certificado ou assessoria jurídica/tributária.\n- Não garante conformidade fiscal automática perante a Receita Federal, municípios ou outros órgãos — a responsabilidade pelos lançamentos e declarações é do titular da empresa e dos profissionais que a assessoram." },
    { heading: "4. Planos e subscrições (Google Play)", body: "O App é gratuito para instalar. O acesso completo requer subscrição gerida pela Google Play:\n\nPlano · Referência · Inclui\nMensal · R$ 14,90/mês · Gerenciador para organizar seu negócio (livro caixa, obrigações, fecho)\nContabil+ · R$ 59,90/mês · App + serviço de abertura de empresa + conferência mensal CRC\nAnual · R$ 718,90/ano · App + abertura de empresa + conferência CRC + certificado digital CNPJ A1 (bónus)\n\n- Pagamento, renovação e cancelamento seguem as regras da Google Play.\n- Preços na loja prevalecem sobre valores de referência acima.\n- IDs de produto: contabil_i_mensal, contabil_i_contabil_plus, contabil_i_anual." },
    { heading: "5. Serviço de abertura de empresa", body: "Os planos Contabil+ e Anual podem incluir serviço de abertura de empresa (constituição/registo empresarial), prestado pela PerfectGest ou parceiros, mediante contrato ou aceite específico quando aplicável.\n\n5.1 O que não está incluído\n\n- Taxas, emolumentos, custas e tributos cobrados por Junta Comercial, prefeitura, Receita Federal, cartório ou outros órgãos públicos — são de responsabilidade do cliente e pagos directamente aos entes competentes.\n\n5.2 Prazo do processo\n\nO serviço de abertura de empresa pode demorar até 14 (catorze) dias, contados a partir da entrega de toda a documentação exigida e do pagamento das taxas oficiais pelo titular.\n\nEste prazo refere-se ao processo administrativo de abertura, incluindo, conforme o caso:\n\n- Solicitação e protocolo junto à Junta Comercial (ou órgão equivalente);\n- Análises, exigências e aprovações dos órgãos competentes;\n- Registos e alvarás junto à prefeitura e demais entidades;\n- Demais etapas legais necessárias à regularização da empresa.\n\nNão inclui atrasos causados por documentação incompleta, pendências do cliente, indisponibilidade de sistemas públicos ou força maior." },
    { heading: "6. Conferência contábil (Contabil+ e Anual)", body: "Com plano Contabil+ ou Anual, o cliente pode enviar o mês fechado à PerfectGest para conferência contábil (2.ª onda), mediante consentimento explícito para tratamento na nuvem (Firebase).\n\n- A PerfectGest analisa o pacote enviado e responde na app (em análise, pendências, conferido).\n- Informes legais e obrigações perante o Fisco podem exigir contrato de prestação de serviços contábeis separado e profissional com CRC.\n- O envio não substitui a entrega de declarações nos portais oficiais, salvo acordo expresso em contrato de serviço." },
    { heading: "7. Certificado digital A1 (plano Anual)", body: "O plano Anual pode incluir bónus promocional de certificado e-CNPJ A1 via parceiro certificadora (Quality Cert), entregue na app após confirmação do pagamento. A emissão do certificado segue o processo de validação de identidade da certificadora, independente da PerfectGest." },
    { heading: "8. Uso permitido", body: "Você pode utilizar o App para:\n\n- Registar movimentos financeiros da sua atividade empresarial\n- Organizar obrigações e fechos mensais\n- Exportar dados para arquivo pessoal ou entrega a contador\n- Subscrever planos e, quando elegível, solicitar abertura de empresa e envio para conferência\n\nÉ proibido:\n\n- Utilizar o App para fins ilegais ou fraudulentos\n- Tentar contornar limitações técnicas ou aceder a dados de terceiros sem autorização\n- Redistribuir ou revender o App sem autorização da PerfectGest" },
    { heading: "9. Dados e responsabilidade", body: "- Os dados inseridos são de sua responsabilidade quanto à exatidão e legalidade.\n- O armazenamento principal é local no dispositivo; perda, roubo ou dano do aparelho pode implicar perda de dados se não houver backup.\n- Recomendamos exportar backups periodicamente (menu Relatórios e backup).\n- Envios à nuvem (conferência, validação de compra, bónus A1) ocorrem só com consentimento.\n- Consulte a Política de Privacidade e Exclusão de Dados." },
    { heading: "10. Ligações externas", body: "O App pode abrir sites oficiais (Receita Federal, portais MEI, ISS municipal, Quality Cert, Google Play, etc.) no seu browser. A PerfectGest não controla o conteúdo nem as políticas desses sites." },
    { heading: "11. Disponibilidade e atualizações", body: "- O App é fornecido “como está”, sem garantia de disponibilidade ininterrupta.\n- Podemos lançar atualizações pela Google Play para correções, melhorias ou adequação legal.\n- Funcionalidades podem evoluir entre versões; consulte as notas de versão na loja." },
    { heading: "12. Propriedade intelectual", body: "O App, marca PerfectGest, logótipos e código são propriedade da PerfectGest ou dos seus licenciadores. Estes Termos não concedem direitos de propriedade sobre o software." },
    { heading: "13. Limitação de responsabilidade", body: "Na máxima extensão permitida pela lei aplicável:\n\n- A PerfectGest não se responsabiliza por multas, penalidades fiscais, erros de lançamento ou decisões tomadas com base exclusiva no App.\n- Não se responsabiliza por danos indiretos, lucros cessantes ou perda de dados decorrente de uso incorreto, falta de backup ou falha do dispositivo.\n- Não garante prazo inferior a 14 dias para conclusão da abertura de empresa quando dependente de terceiros (Junta Comercial, prefeitura, etc.).\n\nO App é uma auxiliar de registo; decisões tributárias e contábeis devem ser validadas por profissional habilitado quando necessário." },
    { heading: "14. Rescisão", body: "Você pode cancelar subscrições na Google Play e deixar de usar o App a qualquer momento, eliminando os dados (ver Exclusão de Dados) e desinstalando-o." },
    { heading: "15. Lei aplicável", body: "Estes Termos regem-se pelas leis da República Federativa do Brasil, incluindo o Código de Defesa do Consumidor e a LGPD, quando aplicáveis.\n\nForo: comarca do domicílio do consumidor, nos termos do CDC, salvo disposição legal em contrário." },
    { heading: "16. Contacto", body: "PerfectGest\nE-mail: suporte@perfectgestdev.com" }
  ],
  en: [
    { heading: "1. Acceptance", body: "By installing, opening or using PerfectGest-Contabil I (“App”), you agree to these Terms of Use and the Privacy Policy. If you disagree, do not use the App and uninstall it." },
    { heading: "2. What the App is", body: "Operational accounting support tool for micro-businesses and MEI: cash book, tax obligations, month-end closing, reconciliation, PDF export, local backup, and optional Google Play subscriptions (Monthly, Contabil+ and Annual)." },
    { heading: "3. What the App is not", body: "Not a bank, financial institution or payment method. Does not process transfers, PIX, cards or real bank movements. Does not replace a certified accountant or guarantee automatic tax compliance. You remain responsible for entries and filings." },
    { heading: "4. Plans and subscriptions (Google Play)", body: "Free to install; full access requires Google Play subscription.\n\nMonthly · R$ 14.90/month — Business organizer (cash book, obligations, closing)\nContabil+ · R$ 59.90/month — App + company opening + monthly CRC review\nAnnual · R$ 718.90/year — App + company opening + CRC review + CNPJ A1 certificate bonus\n\nPayment, renewal and cancellation follow Google Play rules. Store prices prevail. Product IDs: contabil_i_mensal, contabil_i_contabil_plus, contabil_i_anual." },
    { heading: "5. Company opening service", body: "Contabil+ and Annual plans may include company opening (incorporation/registration) by PerfectGest or partners, when applicable.\n\n5.1 Not included\nOfficial fees (Commercial Registry, city hall, tax authority, notary, etc.) — client responsibility, paid directly to competent bodies.\n\n5.2 Process timeline\nOpening may take up to 14 (fourteen) days after complete documentation and payment of official fees by the holder. This refers to the administrative process: Commercial Registry, approvals, city hall registration and other legal steps. Does not include delays from incomplete documents, client pending items, public system outages or force majeure." },
    { heading: "6. Accounting review (Contabil+ and Annual)", body: "With Contabil+ or Annual, you may send the closed month to PerfectGest for accounting review, with explicit consent for cloud processing (Firebase). PerfectGest responds in the app (under review, pending items, reviewed). Official tax filings may require a separate accounting services contract with a CRC professional." },
    { heading: "7. A1 digital certificate (Annual plan)", body: "Annual plan may include promotional e-CNPJ A1 certificate via partner certifier (Quality Cert), delivered in the app after payment confirmation. Issuance follows the certifier identity validation process." },
    { heading: "8. Permitted use", body: "Record business movements, organize obligations, export data, subscribe to plans and request opening/review when eligible. Prohibited: illegal or fraudulent use, bypassing technical limits, unauthorized redistribution." },
    { heading: "9. Data and responsibility", body: "You are responsible for accuracy of entered data. Main storage is local; device loss may mean data loss without backup. Export backups periodically. Cloud uploads only with consent. See Privacy Policy and Data Deletion." },
    { heading: "10. External links", body: "The App may open official sites (tax authority, MEI portals, municipal ISS, Quality Cert, Google Play) in your browser. PerfectGest does not control third-party content or policies." },
    { heading: "11. Availability and updates", body: "Provided “as is” without uninterrupted availability guarantee. Updates via Google Play for fixes, improvements or legal compliance." },
    { heading: "12. Intellectual property", body: "App, PerfectGest brand, logos and code are property of PerfectGest or licensors. These Terms do not grant ownership rights over the software." },
    { heading: "13. Limitation of liability", body: "To the maximum extent permitted by law, PerfectGest is not liable for tax fines, filing errors or decisions based solely on the App; not liable for indirect damages or data loss from misuse or lack of backup; does not guarantee opening in less than 14 days when dependent on third parties. The App is a recording assistant; validate tax and accounting decisions with qualified professionals when needed." },
    { heading: "14. Termination", body: "You may cancel subscriptions on Google Play and stop using the App at any time, deleting data (see Data Deletion) and uninstalling." },
    { heading: "15. Governing law", body: "These Terms are governed by the laws of Brazil, including the Consumer Code and LGPD when applicable. Venue: consumer domicile under the CDC, unless otherwise required by law." },
    { heading: "16. Contact", body: "PerfectGest — suporte@perfectgestdev.com" }
  ],
  es: [
    { heading: "1. Aceptación", body: "Al instalar, abrir o utilizar PerfectGest-Contabil I (“App”), acepta estos Términos de Uso y la Política de Privacidad. Si no está de acuerdo, no utilice la App y desinstálela." },
    { heading: "2. Qué es la App", body: "Herramienta de apoyo contable operacional para ME y MEI: libro de caja, obligaciones fiscales, cierre de mes, conciliación, PDF, backup local y suscripciones opcionales Google Play (Mensual, Contabil+ y Anual)." },
    { heading: "3. Qué no es la App", body: "No es banco ni medio de pago. No procesa transferencias, PIX ni tarjetas. No sustituye contador certificado ni garantiza conformidad fiscal automática." },
    { heading: "4. Planes y suscripciones (Google Play)", body: "Instalación gratuita; acceso completo requiere suscripción Google Play.\n\nMensual · R$ 14,90/mes · Contabil+ · R$ 59,90/mes · Anual · R$ 718,90/año\n\nIncluyen gerenciador, apertura de empresa (Contabil+/Anual), revisión CRC y certificado A1 (Anual). Precios de la tienda prevalecen. IDs: contabil_i_mensal, contabil_i_contabil_plus, contabil_i_anual." },
    { heading: "5. Servicio de apertura de empresa", body: "Planes Contabil+ y Anual pueden incluir apertura de empresa por PerfectGest o socios.\n\n5.1 No incluido: tasas oficiales (Junta Comercial, prefectura, etc.) — responsabilidad del cliente.\n\n5.2 Plazo: hasta 14 (catorce) días tras documentación completa y pago de tasas — proceso administrativo (Junta Comercial, aprobaciones, prefectura). No incluye retrasos por documentación incompleta o sistemas públicos." },
    { heading: "6. Revisión contable (Contabil+ / Anual)", body: "Puede enviar el mes cerrado a PerfectGest para revisión, con consentimiento explícito para la nube (Firebase). Respuesta en la app. Declaraciones oficiales pueden requerir contrato contable separado con profesional CRC." },
    { heading: "7. Certificado A1 (plan Anual)", body: "Bono promocional e-CNPJ A1 vía Quality Cert, entregado en la app tras confirmación de pago." },
    { heading: "8. Uso permitido", body: "Registrar movimientos, organizar obligaciones, exportar datos, suscribir planes y solicitar apertura/revisión cuando corresponda. Prohibido uso ilegal o redistribución no autorizada." },
    { heading: "9. Datos y responsabilidad", body: "Usted es responsable de la exactitud de los datos. Almacenamiento principal local; exporte backups periódicamente. Envíos a la nube solo con consentimiento." },
    { heading: "10. Enlaces externos", body: "La App puede abrir sitios oficiales en el navegador. PerfectGest no controla contenido de terceros." },
    { heading: "11. Disponibilidad y actualizaciones", body: "Proporcionada “tal cual”. Actualizaciones vía Google Play." },
    { heading: "12. Propiedad intelectual", body: "App, marca PerfectGest y código son propiedad de PerfectGest o licenciantes." },
    { heading: "13. Limitación de responsabilidad", body: "PerfectGest no responde por multas fiscales, errores de registro o pérdida de datos por falta de backup; no garantiza apertura en menos de 14 días cuando depende de terceros. Valide con profesional habilitado cuando sea necesario." },
    { heading: "14. Rescisión", body: "Puede cancelar suscripciones en Google Play y dejar de usar la App en cualquier momento." },
    { heading: "15. Ley aplicable", body: "Leyes de Brasil (LGPD y CDC cuando corresponda). Foro: domicilio del consumidor." },
    { heading: "16. Contacto", body: "PerfectGest — suporte@perfectgestdev.com" }
  ],
};

const deletion = {
  pt: [
    { heading: "1. Objetivo", body: "Este documento explica como eliminar permanentemente os dados tratados pelo PerfectGest-Contabil I, em conformidade com a LGPD e as políticas da Google Play.\n\nURL pública: https://perfectgestdev.com/contabil-i-exclusao-dados" },
    { heading: "2. O que pode ser eliminado no dispositivo", body: "A função “Eliminar todos os dados” apaga irreversivelmente do aparelho:\n\nCategoria · Conteúdo apagado\nLivro caixa · Movimentos, valores, descrições, categorias\nContabilidade · Lançamentos de partida dobrada\nObrigações · Marcações e observações\nFecho do mês · Conciliações e saldos de extrato\nEmpresa · Perfil (CNPJ, razão social, contactos)\nConfiguração · Categorias, meios de pagamento, contas\nPreferências · Aceites de privacidade, tema, consentimentos locais" },
    { heading: "3. Dados na nuvem (conferência, subscrição, A1)", body: "Se utilizou envio para conferência, bónus A1 ou serviços na nuvem:\n\n- Cópias podem existir no Firebase (Google Cloud) pelo tempo necessário ao serviço e obrigações legais.\n- Eliminar dados no app não apaga automaticamente todos os registos na nuvem.\n- Para pedir eliminação na nuvem: suporte@perfectgestdev.com (indique CNPJ, mês enviado e e-mail da conta Google Play se aplicável)." },
    { heading: "4. O que não é eliminado automaticamente", body: "Item · Motivo\nPDFs/backups exportados · Ficaram em apps externos — apague manualmente\nRegistos de compra Google Play · Geridos pela Google\nProcesso de abertura de empresa já iniciado · Pode haver obrigação legal de retenção documental\nDados em sites governamentais · Fora do controlo do App" },
    { heading: "5. Como eliminar no App", body: "1. Menu → “Eliminar todos os dados”\n2. Marque “Li e compreendo…”\n3. Digite ELIMINAR\n4. Confirme “Eliminar permanentemente”\n\nApós a operação: novo aceite de privacidade na próxima abertura; sem recuperação local." },
    { heading: "6. Desinstalação", body: "Desinstalar o App remove dados locais. Recomendado antes de vender o telemóvel: Eliminar todos os dados + desinstalar." },
    { heading: "7. Backups exportados", body: "Ficheiros .json exportados são sua responsabilidade — apague onde os guardou." },
    { heading: "8. Prazos", body: "Âmbito · Prazo\nEliminação no dispositivo · Imediata após confirmação\nPedido eliminação na nuvem · Resposta em até 15 dias (LGPD), execução conforme análise\nAbertura de empresa em curso · Documentos podem ser retidos pelo prazo legal aplicável" },
    { heading: "9. Contacto", body: "suporte@perfectgestdev.com" }
  ],
  en: [
    { heading: "1. Purpose", body: "This document explains how to permanently delete data processed by PerfectGest-Contabil I, in compliance with LGPD and Google Play policies.\n\nPublic URL: https://perfectgestdev.com/contabil-i-exclusao-dados" },
    { heading: "2. What can be deleted on the device", body: "“Delete all data” irreversibly removes from the device:\n\nCash book · Accounting entries · Obligations · Month-end closing · Company profile · Configuration · Preferences (including privacy and cloud consent)." },
    { heading: "3. Cloud data (review, subscription, A1)", body: "If you used review submission, A1 bonus or cloud services:\n\n• Copies may exist on Firebase (Google Cloud) as long as needed for the service and legal obligations.\n• Deleting data in the app does not automatically delete all cloud records.\n• To request cloud deletion: suporte@perfectgestdev.com (include tax ID, month sent and Google Play email if applicable)." },
    { heading: "4. Not deleted automatically", body: "Exported PDFs/backups · Google Play purchase records · Company opening process already started (legal retention may apply) · Data on government websites." },
    { heading: "5. How to delete in the App", body: "1. Menu → “Delete all data”\n2. Check “I have read and understand…”\n3. Type DELETE (ELIMINAR in Portuguese UI)\n4. Confirm “Delete permanently”\n\nAfter: new privacy acceptance on next launch; no local recovery." },
    { heading: "6. Uninstall", body: "Uninstalling removes local data. Before selling the phone: Delete all data + uninstall." },
    { heading: "7. Exported backups", body: "Exported .json files are your responsibility — delete where stored." },
    { heading: "8. Timelines", body: "On device: immediate after confirmation.\nCloud deletion request: response within 15 days (LGPD), execution per review.\nOngoing company opening: documents may be retained per applicable legal period." },
    { heading: "9. Contact", body: "suporte@perfectgestdev.com" }
  ],
  es: [
    { heading: "1. Objetivo", body: "Este documento explica cómo eliminar permanentemente los datos tratados por PerfectGest-Contabil I, conforme LGPD y Google Play.\n\nURL pública: https://perfectgestdev.com/contabil-i-exclusao-dados" },
    { heading: "2. Qué se puede eliminar en el dispositivo", body: "«Eliminar todos los datos» borra irreversiblemente: libro de caja, contabilidad, obligaciones, cierre de mes, empresa, configuración y preferencias." },
    { heading: "3. Datos en la nube", body: "Si utilizó envío para revisión, bono A1 o servicios en la nube: copias pueden existir en Firebase. Eliminar en la app no borra automáticamente la nube. Solicite eliminación: suporte@perfectgestdev.com." },
    { heading: "4. No eliminado automáticamente", body: "PDFs/backups exportados · Registros Google Play · Apertura de empresa en curso · Datos en sitios gubernamentales." },
    { heading: "5. Cómo eliminar en la App", body: "Menú → «Eliminar todos los datos» → marcar confirmación → escribir ELIMINAR → confirmar. Irreversible." },
    { heading: "6. Desinstalación", body: "Desinstalar elimina datos locales. Recomendado: eliminar datos en la app antes de vender el teléfono." },
    { heading: "7. Backups exportados", body: "Archivos .json exportados son su responsabilidad." },
    { heading: "8. Plazos", body: "Dispositivo: inmediato. Nube: respuesta en hasta 15 días (LGPD). Apertura en curso: retención legal posible." },
    { heading: "9. Contacto", body: "suporte@perfectgestdev.com" }
  ],
};

const faq = {
  pt: [
    { heading: "O que é o PerfectGest-Contabil I?", body: "É um app de livro caixa e obrigações fiscais para ME e MEI, com subscrições via Google Play e serviços opcionais de conferência contábil e abertura de empresa." },
    { heading: "Preciso de internet para usar?", body: "- Dia a dia (lançamentos, fecho): não — funciona offline.\n- Subscrição, envio para conferência, bónus A1: sim — requer internet e consentimento de nuvem.\n- Portais fiscais e Play Store: internet quando você abre links externos." },
    { heading: "O app substitui meu contador?", body: "Não. É ferramenta de registo e apoio. Planos Contabil+ e Anual incluem serviços PerfectGest (conferência e, conforme plano, abertura de empresa), mas declarações oficiais e pareceres podem exigir contrato contábil com profissional CRC." },
    { heading: "O app movimenta dinheiro ou conecta ao banco?", body: "Não. Lançamentos manuais; saldo de extrato informado no fecho do mês." },
    { heading: "Planos e preços (Google Play)", body: "Plano · Preço ref. · O que inclui\nMensal · R$ 14,90/mês · Gerenciador para organizar seu negócio\nContabil+ · R$ 59,90/mês · App + abertura de empresa + conferência mensal CRC\nAnual · R$ 718,90/ano · App + abertura de empresa + conferência + certificado A1\n\n- Instalação gratuita; subscrição obrigatória para uso completo.\n- Pagamento e cancelamento na Google Play.\n- Valor cobrado na loja prevalece sobre referências acima." },
    { heading: "O que significa “abertura de empresa” nos planos Contabil+ e Anual?", body: "Serviço de apoio à constituição/registo da sua empresa (ME, MEI ou forma aplicável), conduzido pela PerfectGest ou parceiros, após contratação do plano e entrega de documentos." },
    { heading: "As taxas da Junta Comercial e prefeitura estão incluídas?", body: "Não. Taxas, emolumentos e custas pagos à Junta Comercial, prefeitura, Receita Federal, cartório e outros órgãos são por conta do cliente, pagos directamente aos entes competentes." },
    { heading: "Quanto tempo demora a abertura?", body: "O serviço de abertura de empresa pode demorar até 14 (catorze) dias, contados após entrega da documentação completa e pagamento das taxas oficiais pelo cliente.\n\nEste prazo refere-se ao processo administrativo, incluindo:\n\n- Solicitação e tramitação na Junta Comercial;\n- Aprovações e exigências dos órgãos;\n- Registos e alvarás na prefeitura;\n- Demais etapas legais necessárias.\n\nAtrasos por documentação incompleta, pendências do cliente ou indisponibilidade de sistemas públicos não entram nesse prazo de forma garantida." },
    { heading: "Como envio o mês para a PerfectGest?", body: "1. Feche o mês na aba Fecho.\n2. Aceite consentimento de envio contábil.\n3. Toque “Enviar mês para conferência”.\n4. Acompanhe o status na app (em análise, pendências, conferido)." },
    { heading: "Quanto tempo demora a conferência?", body: "Meta operacional: resposta em até 5 dias úteis após envio completo (sujeito a volume e pendências). Prazo distinto do processo de abertura de empresa (até 14 dias)." },
    { heading: "Certificado A1 (plano Anual)", body: "Inclui bónus promocional e-CNPJ A1 via Quality Cert, entregue na app após pagamento confirmado. Emissão do certificado segue validação de identidade da certificadora." },
    { heading: "Meus dados vão para a nuvem?", body: "Só com seu consentimento — para conferência CRC, validação de compra ou bónus A1. Livro caixa permanece local por defeito." },
    { heading: "O app tem anúncios?", body: "Não." },
    { heading: "Preciso de login?", body: "Não há conta com e-mail/senha. Subscrição vincula-se à conta Google Play do dispositivo. Firebase usa identificador anónimo para serviços na nuvem." },
    { heading: "Como faço backup?", body: "Menu → Relatórios e backup → Exportar backup (.json)." },
    { heading: "Como apago tudo?", body: "Menu → Eliminar todos os dados. Ver Exclusão de Dados." },
    { heading: "URLs públicas (Play Store)", body: "Documento · URL\nPolítica de privacidade · https://perfectgestdev.com/contabil-i-politica-privacidade\nTermos de uso · https://perfectgestdev.com/contabil-i-termos\nExclusão de dados · https://perfectgestdev.com/contabil-i-exclusao-dados\nFAQ · https://perfectgestdev.com/contabil-i-faq" },
    { heading: "O que são “obrigações” no app?", body: "Checklist PGDAS, DAS, ISS, etc., com links para portais oficiais." },
    { heading: "Posso gerar PDF do livro caixa?", body: "Sim — Relatórios e backup → Gerar e partilhar PDF." },
    { heading: "Pacote Android", body: "br.perfectgestcontabil.dev" },
    { heading: "Por que “recursos financeiros” na Play?", body: "Classificação correta para apps que tratam dados financeiros/contábeis — não somos banco." },
    { heading: "Perdi o telefone. Recupero os dados?", body: "Só com backup JSON exportado. Sem recuperação remota dos dados locais." },
    { heading: "Como contacto o suporte?", body: "suporte@perfectgestdev.com" },
    { heading: "Documentos relacionados", body: "Documento · Link\nPolítica de Privacidade · politica-privacidade.md\nTermos de Uso · termos-de-uso.md\nExclusão de Dados · exclusao-de-dados.md" }
  ],
  en: [
    { heading: "What is PerfectGest-Contabil I?", body: "Cash book and tax obligations app for ME and MEI, with Google Play subscriptions and optional accounting review and company opening services." },
    { heading: "Do I need internet?", body: "Daily use (entries, closing): no — works offline. Subscription, review submission, A1 bonus: yes — requires internet and cloud consent. Tax portals and Play Store: internet when opening external links." },
    { heading: "Does the app replace my accountant?", body: "No. It is a recording and support tool. Contabil+ and Annual include PerfectGest services (review and, per plan, company opening), but official filings may require a CRC accounting contract." },
    { heading: "Does the app move money or connect to the bank?", body: "No. Manual entries; bank statement balance entered at month-end closing." },
    { heading: "Plans and prices (Google Play)", body: "Monthly R$ 14.90/month · Contabil+ R$ 59.90/month · Annual R$ 718.90/year. Free install; subscription required for full access. Payment and cancellation on Google Play. Store price prevails." },
    { heading: "What does “company opening” mean in Contabil+ and Annual?", body: "Support service for incorporation/registration of your company (ME, MEI or applicable form), by PerfectGest or partners after plan subscription and document submission." },
    { heading: "Are Commercial Registry and city hall fees included?", body: "No. Fees and charges paid to Commercial Registry, city hall, tax authority, notary and other bodies are the client’s responsibility, paid directly to competent entities." },
    { heading: "How long does opening take?", body: "Up to 14 (fourteen) days after complete documentation and payment of official fees by the client. Refers to the administrative process: Commercial Registry, approvals, city hall registration and other legal steps. Delays from incomplete documents or public systems are not guaranteed within this period." },
    { heading: "How do I send the month for review?", body: "1. Close the month in the Closing tab. 2. Accept accounting submission consent. 3. Tap “Send month for review”. 4. Track status in the app." },
    { heading: "How long does review take?", body: "Operational target: response within 5 business days after complete submission (subject to volume and pending items). Different from company opening (up to 14 days)." },
    { heading: "A1 certificate (Annual plan)", body: "Promotional e-CNPJ A1 bonus via Quality Cert, delivered in the app after confirmed payment. Issuance follows certifier identity validation." },
    { heading: "Do my data go to the cloud?", body: "Only with your consent — for CRC review, purchase validation or A1 bonus. Cash book stays local by default." },
    { heading: "Does the app have ads?", body: "No." },
    { heading: "Do I need login?", body: "No email/password account. Subscription linked to device Google Play account. Firebase uses anonymous identifier for cloud services." },
    { heading: "How do I backup?", body: "Menu → Reports and backup → Export backup (.json)." },
    { heading: "How do I delete everything?", body: "Menu → Delete all data. See Data Deletion page." },
    { heading: "What are “obligations” in the app?", body: "Checklist for PGDAS, DAS, ISS, etc., with links to official portals." },
    { heading: "Can I generate cash book PDF?", body: "Yes — Reports and backup → Generate and share PDF." },
    { heading: "Android package", body: "br.perfectgestcontabil.dev" },
    { heading: "Why “financial features” on Play?", body: "Correct classification for apps handling financial/accounting data — we are not a bank." },
    { heading: "I lost my phone. Can I recover data?", body: "Only with exported JSON backup. No remote recovery of local data." },
    { heading: "How do I contact support?", body: "suporte@perfectgestdev.com" }
  ],
  es: [
    { heading: "¿Qué es PerfectGest-Contabil I?", body: "App de libro de caja y obligaciones fiscales para ME y MEI, con suscripciones Google Play y servicios opcionales de revisión contable y apertura de empresa." },
    { heading: "¿Necesito internet?", body: "Uso diario: no — funciona offline. Suscripción, envío para revisión, bono A1: sí — requiere internet y consentimiento de nube." },
    { heading: "¿La app sustituye a mi contador?", body: "No. Herramienta de registro y apoyo. Planes Contabil+ y Anual incluyen servicios PerfectGest, pero declaraciones oficiales pueden requerir contrato contable CRC." },
    { heading: "¿Mueve dinero o conecta al banco?", body: "No. Movimientos manuales; saldo de extracto informado en el cierre del mes." },
    { heading: "Planes y precios (Google Play)", body: "Mensual R$ 14,90/mes · Contabil+ R$ 59,90/mes · Anual R$ 718,90/año. Instalación gratuita; suscripción obligatoria para uso completo." },
    { heading: "¿Qué significa “apertura de empresa”?", body: "Apoyo a constitución/registro de su empresa, por PerfectGest o socios tras contratar el plan y entregar documentos." },
    { heading: "¿Están incluidas las tasas de Junta Comercial y prefectura?", body: "No. Tasas pagadas a Junta Comercial, prefectura, Receita Federal, etc. son por cuenta del cliente." },
    { heading: "¿Cuánto demora la apertura?", body: "Hasta 14 (catorce) días tras documentación completa y pago de tasas oficiales. Proceso administrativo: Junta Comercial, aprobaciones, prefectura. Retrasos por documentación incompleta no garantizados en ese plazo." },
    { heading: "¿Cómo envío el mes para revisión?", body: "Cierre el mes → acepte consentimiento → toque «Enviar mes para revisión» → siga el estado en la app." },
    { heading: "¿Cuánto demora la revisión?", body: "Meta operacional: hasta 5 días hábiles tras envío completo. Plazo distinto de apertura de empresa (hasta 14 días)." },
    { heading: "Certificado A1 (plan Anual)", body: "Bono e-CNPJ A1 vía Quality Cert, entregado en la app tras pago confirmado." },
    { heading: "¿Mis datos van a la nube?", body: "Solo con su consentimiento — revisión CRC, validación de compra o bono A1. Libro de caja local por defecto." },
    { heading: "¿Tiene anuncios?", body: "No." },
    { heading: "¿Necesito login?", body: "No hay cuenta e-mail/contraseña. Suscripción vinculada a Google Play del dispositivo." },
    { heading: "¿Cómo hago backup?", body: "Menú → Informes y backup → Exportar backup (.json)." },
    { heading: "¿Cómo borro todo?", body: "Menú → Eliminar todos los datos. Ver página Eliminación de Datos." },
    { heading: "¿Qué son las “obligaciones”?", body: "Checklist PGDAS, DAS, ISS, etc., con enlaces a portales oficiales." },
    { heading: "¿Puedo generar PDF del libro de caja?", body: "Sí — Informes y backup → Generar y compartir PDF." },
    { heading: "Paquete Android", body: "br.perfectgestcontabil.dev" },
    { heading: "¿Por qué “recursos financieros” en Play?", body: "Clasificación correcta para apps con datos financieros/contables — no somos banco." },
    { heading: "Perdí el teléfono. ¿Recupero los datos?", body: "Solo con backup JSON exportado. Sin recuperación remota de datos locales." },
    { heading: "¿Cómo contacto soporte?", body: "suporte@perfectgestdev.com" }
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
