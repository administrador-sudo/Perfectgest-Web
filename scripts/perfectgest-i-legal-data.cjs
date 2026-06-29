/** PerfectGest I — documentos legais no domínio.
 * Gerado por scripts/perfectgest-i-sync-legal-from-md.cjs a partir de
 * apps/PerfectGest-I/docs/google_sites/*.md — não editar manualmente. */
const PRODUCT = "PerfectGest I";
const FANTASY = "Perfect Gest Dev";
const LEGAL_NAME = "PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA";
const CNPJ = "66.889.409/0001-19";
const EMAIL = "suporte@perfectgestdev.com";
const ADDRESS = "Caxias do Sul — RS — Brasil";
const PUBLISHER = "Marcos Leandro dos Santos";

const header = {
  pt: "PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA\nNome fantasia: Perfect Gest Dev · CNPJ 66.889.409/0001-19\nCaxias do Sul — RS — Brasil\nResponsável editorial do produto: Marcos Leandro dos Santos\nSuporte: suporte@perfectgestdev.com",
  en: "PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA\nTrade name: Perfect Gest Dev · CNPJ 66.889.409/0001-19\nCaxias do Sul — RS — Brasil\nProduct publisher: Marcos Leandro dos Santos\nSupport: suporte@perfectgestdev.com",
  es: "PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA\nNombre comercial: Perfect Gest Dev · CNPJ 66.889.409/0001-19\nCaxias do Sul — RS — Brasil\nResponsable editorial del producto: Marcos Leandro dos Santos\nSoporte: suporte@perfectgestdev.com",
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
    { heading: "Introdução", body: "A PerfectGest I, sob responsabilidade de Marcos Leandro dos Santos, estabelece esta Política de Privacidade em conformidade com a Lei Geral de Proteção de Dados (LGPD - Lei 13.709/18) e as políticas para desenvolvedores da Google Play Store." },
    { heading: "Controlador de Dados e Contato", body: "O responsável pelo tratamento de dados é Marcos Leandro dos Santos. Para o exercício de direitos de acesso, retificação ou exclusão, entre em contato via e-mail: suporte@perfectgestdev.com." },
    { heading: "Armazenamento local e natureza dos dados", body: "O aplicativo opera em modelo local-first. Os dados de gestão comercial são armazenados exclusivamente no dispositivo do usuário via SQLite. A PerfectGest I não coleta, não acede e não transfere automaticamente esses dados para servidores próprios.\n\nDados de clientes e financeiros — protegidos no aparelho\n\nPermanecem no dispositivo e não saem da app por iniciativa do sistema:\n\n- Cadastro e histórico de clientes\n- Orçamentos, itens, valores e estados\n- Caixa — entradas, saídas, categorias e saldos\n- Ordens de serviço / produção e projetos\n- Contratos e documentos auxiliares de gestão\n- Qualquer valor, nome de cliente ou movimento financeiro registado na app\n\nNão enviamos estes dados para Firebase, Firestore, Analytics nem outros servidores por iniciativa da app. O Firebase Analytics regista apenas eventos genéricos de uso (ex.: navegação entre ecrãs), sem nomes de clientes, valores de caixa ou conteúdo de orçamentos.\n\nQuando os dados podem sair do aparelho (sempre por acção do utilizador)\n\nA saída ocorre somente se o utilizador decidir explicitamente:\n\n- Partilhar ou guardar PDF (orçamento, caixa, relatório, etc.) — o documento gerado naquele momento\n- Partilhar cartão de visita (PNG) — apenas dados profissionais da empresa (nome, contactos, redes, logótipo); nunca a lista de clientes nem dados financeiros\n- Partilhar ficheiro de contactos (vCard) ou mostrar QR com dados profissionais (Plano Pro — ver abaixo)\n- Criar e partilhar backup — ficheiro de backup (simples ou encriptado) que o utilizador escolhe enviar por WhatsApp, e-mail, Drive, etc.; contém a cópia local que exportou\n\nImportante: partilhar um backup é responsabilidade do utilizador quanto ao destino e à segurança do ficheiro. Recomendamos backups encriptados (Plano Pro) e destinatários de confiança.\n\nDados da empresa no cartão de visita\n\nOs contactos da aba Empresa (telefone, e-mail, WhatsApp, etc.) servem também o cartão de visita, mas não misturam nem expõem automaticamente os módulos Clientes, Orçamentos ou Caixa." },
    { heading: "Cartão de visita — armazenamento local e modo estático", body: "O cartão de visita digital (aba Empresa) utiliza os dados da empresa guardados no dispositivo. Ao concluir a criação do primeiro cartão, o aplicativo pode guardar uma cópia congelada (snapshot) local — imagem PNG e dados do layout — para exibição em modo estático quando não houver assinatura Plano Pro activa.\n\n- No dispositivo: snapshot, logótipo e ficheiros temporários de partilha permanecem no aparelho até limpar dados ou desinstalar.\n- Partilha PNG: mesmo em modo estático, pode partilhar a imagem do snapshot (ex.: WhatsApp, e-mail) por acção explícita; não enviamos essa imagem automaticamente a servidores PerfectGest.\n- Edição e funcionalidades avançadas (vCard, QR, preview interactivo com toques em contactos): requerem Plano Pro — sempre dentro da app; não há página web do cartão alojada pela PerfectGest." },
    { heading: "Cartão de visita interactivo na app (Plano Pro)", body: "Com Plano Pro, após o primeiro cartão, pode continuar a editar e usar funções avançadas no telemóvel:\n\n- Preview interactivo (toques abrem WhatsApp, telefone, e-mail, site ou mapa, conforme configurado)\n- Exportar vCard (.vcf) e gerar QR com dados de contacto\n- Partilhar PNG actualizado\n\nTudo permanece no dispositivo até partilhar ou mostrar o QR por acção explícita. Não publicamos nem alojamos o cartão num site PerfectGest; não enviamos o conteúdo do cartão para Firestore nem outros servidores por iniciativa da app.\n\nO que nunca entra no cartão: cadastro de clientes, orçamentos, lançamentos de caixa, valores financeiros, contratos ou backups." },
    { heading: "Modelo de acesso — período de teste e Plano Pro", body: "- Período de teste (7 dias): desde a primeira abertura da app, pode criar até 5 clientes, 5 orçamentos e 5 lançamentos de caixa, incluindo PDF, sem subscrição paga durante esse período.\n- Limites durante o teste: ao guardar o 4.º registo de cada tipo, a app informa que é o último daquele tipo no teste. O 6.º (ou acima dos limites) exige Plano Pro, mesmo dentro dos 7 dias.\n- Após 7 dias sem Plano Pro: a app continua utilizável para consultar e editar dados locais, mas não permite criar novos clientes, orçamentos ou lançamentos de caixa.\n- Plano Pro: uso ilimitado, restauro de backup encriptado e cartão de visita interactivo na app (edição após o primeiro cartão, vCard, QR, preview com toques), via assinatura mensal ou anual na Google Play.\n\nA data de início do teste é guardada de forma anónima por aparelho (serviço Firebase) para coerência do período — sem dados de clientes, orçamentos ou caixa." },
    { heading: "Coleta de dados e serviços de terceiros", body: "- Google Analytics (Firebase): eventos genéricos de uso; sem Crashlytics; sem nomes ou valores financeiros.\n- Firebase Remote Config: versões mínimas e flags de segurança.\n- Cloud Firestore: metadados anónimos do Plano Inicial — identificador de instalação por aparelho, início do período de teste, elegibilidade freemium e consumo do 1.º cartão (sem dados de clientes, orçamentos ou caixa).\n- Google Play Billing: subscrições." },
    { heading: "Notificações locais", body: "Lembretes fiscais processados no dispositivo; sem envio a servidores externos. Permissão POST_NOTIFICATIONS no Android 13+." },
    { heading: "Declarações de segurança", body: "- HTTPS/TLS em telemetria e metadados técnicos.\n- Sem venda de dados para publicidade.\n- Separação cartão vs. gestão: cartão = só informação profissional configurada; clientes e financeiro locais, excepto PDFs ou backups partilhados pelo utilizador." },
    { heading: "Retenção e exclusão", body: "- Dados comerciais locais e snapshot do cartão: eliminados ao limpar dados da app ou desinstalar.\n- Telemetria (Firebase): pedido por e-mail, até 15 dias úteis." },
    { heading: "Permissões de sistema", body: "Importar logótipos; guardar PDFs e backups; notificações locais (Android 13+)." },
    { heading: "Elegibilidade e foro", body: "Utilizadores maiores de 18 anos. Leis do Brasil; foro de Caxias do Sul/RS." }
  ],
  en: [
    { heading: "Introduction", body: "PerfectGest I, operated by Marcos Leandro dos Santos, provides this Privacy Policy in compliance with Brazil’s LGPD (Law 13.709/18) and Google Play developer policies." },
    { heading: "Data controller and contact", body: "Controller: Marcos Leandro dos Santos. Contact: suporte@perfectgestdev.com." },
    { heading: "Local storage", body: "The app is local-first. Business data is stored only on your device (SQLite). PerfectGest I does not automatically collect, access, or transfer that data to its own servers.\n\nClient and financial data — protected on the device\n\nThese stay on the device and do not leave the app unless you choose to:\n\n- Client records and history\n- Estimates, line items, amounts, and status\n- Cash flow — income, expenses, categories, balances\n- Work orders, projects, contracts, and management documents\n- Any client name, amount, or financial movement in the app\n\nWe do not send this data to Firebase, Firestore, Analytics, or other servers. Firebase Analytics logs generic usage events only — not client names, cash amounts, or estimate content.\n\nWhen data may leave the device (your explicit action only)\n\n- Share or save a PDF (estimate, cash report, etc.)\n- Share business card PNG — professional company contacts only; never your client list or financial data\n- Share vCard or show QR with professional contacts (Pro Plan — see below)\n- Share a backup file you exported (plain or encrypted) via WhatsApp, email, Drive, etc.\n\nImportant: sharing a backup is your responsibility regarding destination and security. We recommend encrypted backups (Pro Plan).\n\nBusiness card vs. management data\n\nThe Company tab feeds the digital business card with your business contact info only. It does not expose Clients, Estimates, or Cash modules." },
    { heading: "Business card — local storage and static mode", body: "After your first card is saved, a local snapshot (PNG + layout) may be shown in static mode without Pro. You may still share that snapshot PNG via the system share sheet. Advanced features (edit after freeze, vCard, QR, interactive preview with tappable contacts) require Pro Plan — inside the app only; PerfectGest does not host a public web page for your card." },
    { heading: "Interactive business card in the app (Pro Plan)", body: "With Pro Plan, after your first card you can keep editing and use advanced features on your phone:\n\n- Interactive preview (taps open WhatsApp, phone, email, website, or maps as configured)\n- Export vCard (.vcf) and generate QR with contact data\n- Share an updated PNG\n\nEverything stays on the device until you share or show the QR. We do not publish or host your card on a PerfectGest website or upload card content to Firestore.\n\nNever included in the card: clients, estimates, cash entries, financial amounts, contracts, or backups." },
    { heading: "Trial period and Pro Plan", body: "- Trial period (7 days): from the first time you open the app, you may create up to 5 clients, 5 estimates, and 5 cash entries, including PDF, with no paid subscription during that period.\n- Limits during the trial: when saving the 4th record of each type, the app warns it is the last of that type in the trial. A 6th record (or exceeding limits) requires Pro Plan, even within the 7 days.\n- After 7 days without Pro Plan: the app remains usable to view and edit local data, but you cannot create new clients, estimates, or cash entries.\n- Pro Plan: unlimited use, encrypted backup restore, and interactive business card in the app (edit after first card, vCard, QR, tappable preview), monthly or annual via Google Play.\n\nThe trial start date is stored anonymously per device (Firebase service) for period consistency — not client, estimate, or cash data." },
    { heading: "Third-party services", body: "Firebase Analytics (generic events, no Crashlytics), Remote Config, Firestore (minimal anonymous device metadata for the Initial Plan — installation identifier, trial start timestamp, freemium eligibility, and first business-card save — not clients, estimates, or cash data), Google Play Billing. No in-app ads." },
    { heading: "Local notifications", body: "Fiscal reminders on-device only; no external server transfer. POST_NOTIFICATIONS on Android 13+." },
    { heading: "Security", body: "HTTPS/TLS for telemetry; no sale of data for ads; business card contains only professional info you configure." },
    { heading: "Retention and deletion", body: "Local business data and card snapshot: removed when you clear app data or uninstall. Telemetry (Firebase): email request, up to 15 business days." },
    { heading: "Permissions", body: "Import logos; save PDFs and backups; local notifications." },
    { heading: "Eligibility and law", body: "Users 18+. Laws of Brazil; venue Caxias do Sul/RS." }
  ],
  es: [
    { heading: "Introducción", body: "PerfectGest I, bajo responsabilidad de Marcos Leandro dos Santos, establece esta Política de Privacidad conforme a la LGPD de Brasil (Ley 13.709/18) y las políticas de Google Play." },
    { heading: "Responsable y contacto", body: "Responsable: Marcos Leandro dos Santos. Contacto: suporte@perfectgestdev.com." },
    { heading: "Almacenamiento local", body: "La app es local-first. Los datos de gestión se guardan solo en el dispositivo (SQLite). PerfectGest I no recoge, accede ni transfiere automáticamente esos datos a servidores propios.\n\nDatos de clientes y financieros — protegidos en el dispositivo\n\nPermanecen en el dispositivo y no salen de la app por iniciativa del sistema:\n\n- Registro e historial de clientes\n- Presupuestos, ítems, importes y estados\n- Caja — ingresos, gastos, categorías y saldos\n- Órdenes de servicio, proyectos, contratos y documentos de gestión\n- Cualquier nombre de cliente, importe o movimiento financiero\n\nNo enviamos estos datos a Firebase, Firestore, Analytics u otros servidores. Firebase Analytics registra solo eventos genéricos de uso, sin nombres de clientes ni importes de caja.\n\nCuándo pueden salir del dispositivo (solo por su acción)\n\n- Compartir o guardar PDF (presupuesto, informe de caja, etc.)\n- Compartir tarjeta de visita (PNG) — solo datos profesionales; nunca lista de clientes ni datos financieros\n- Compartir vCard o mostrar QR con contactos profesionales (Plan Pro — ver abajo)\n- Compartir archivo de backup que exportó (simple o cifrado)\n\nImportante: compartir un backup es responsabilidad del usuario sobre destino y seguridad. Recomendamos copias cifradas (Plan Pro).\n\nTarjeta de visita vs. gestión interna\n\nLa pestaña Empresa alimenta la tarjeta con contactos profesionales; no expone Clientes, Presupuestos ni Caja." },
    { heading: "Tarjeta de visita — modo estático", body: "Tras guardar la primera tarjeta, puede mostrarse una copia congelada local sin Pro. Puede seguir compartiendo el PNG por la hoja de compartir del sistema. Funciones avanzadas (editar tras congelar, vCard, QR, vista previa interactiva con toques) requieren Plan Pro — solo en la app; PerfectGest no aloja una página web pública de su tarjeta." },
    { heading: "Tarjeta interactiva en la app (Plan Pro)", body: "Con Plan Pro, tras la primera tarjeta puede seguir editando y usar funciones avanzadas en el teléfono:\n\n- Vista previa interactiva (toques abren WhatsApp, teléfono, correo, web o mapa)\n- Exportar vCard (.vcf) y generar QR con datos de contacto\n- Compartir PNG actualizado\n\nTodo permanece en el dispositivo hasta que comparta o muestre el QR. No publicamos ni alojamos la tarjeta en un sitio PerfectGest ni enviamos su contenido a Firestore.\n\nNunca incluidos en la tarjeta: clientes, presupuestos, caja, importes financieros, contratos ni backups." },
    { heading: "Período de prueba y Plan Pro", body: "- Período de prueba (7 días): desde la primera apertura de la app, puede crear hasta 5 clientes, 5 presupuestos y 5 movimientos de caja, con PDF, sin suscripción de pago durante ese período.\n- Límites durante la prueba: al guardar el 4.º registro de cada tipo, la app avisa que es el último de ese tipo en la prueba. El 6.º registro (o por encima de los límites) requiere Plan Pro, incluso dentro de los 7 días.\n- Tras 7 días sin Plan Pro: la app sigue siendo utilizable para consultar y editar datos locales, pero no permite crear nuevos clientes, presupuestos ni movimientos de caja.\n- Plan Pro: uso ilimitado, restauración de backup cifrado y tarjeta interactiva en la app (editar tras la primera tarjeta, vCard, QR, vista previa con toques), mensual o anual vía Google Play.\n\nLa fecha de inicio de la prueba se guarda de forma anónima por dispositivo (servicio Firebase) para coherencia del período — sin datos de clientes, presupuestos ni caja." },
    { heading: "Servicios de terceros", body: "Firebase Analytics (eventos genéricos, sin Crashlytics), Remote Config, Firestore (metadatos anónimos mínimos del Plan Inicial por dispositivo: identificador de instalación, inicio del período de prueba, elegibilidad freemium y primer guardado de tarjeta — sin clientes, presupuestos ni caja), Google Play Billing. Sin publicidad en la app." },
    { heading: "Notificaciones locales", body: "Recordatorios fiscales solo en el dispositivo. Permiso POST_NOTIFICATIONS en Android 13+." },
    { heading: "Seguridad y retención", body: "HTTPS/TLS; no venta de datos para anuncios. Datos locales y snapshot de tarjeta: se eliminan al borrar datos o desinstalar. Telemetría (Firebase): solicitud por correo, hasta 15 días hábiles." },
    { heading: "Permisos, elegibilidad y foro", body: "Logotipos, PDFs, backups, notificaciones. Usuarios mayores de 18 años. Leyes de Brasil; fuero Caxias do Sul/RS." }
  ],
};

const terms = {
  pt: [
    { heading: "1. Objeto", body: "Estes Termos regem a app PerfectGest I, para gestão empresarial (clientes, orçamentos, caixa, ordem de serviço, lembretes fiscais, cartão de visita digital), com dados principalmente no dispositivo.\n\nDados de clientes e financeiros permanecem no aparelho e não são transmitidos automaticamente. Podem sair somente por acção do utilizador (partilha de PDF, backup exportado, cartão de visita PNG/vCard/QR). Ver Política de Privacidade.\n\nEditor: Marcos Leandro dos Santos." },
    { heading: "2. Elegibilidade", body: "Utilizadores maiores de 18 anos." },
    { heading: "3. Plano Inicial, período de teste e assinaturas", body: "- Período de teste: 7 dias a contar da primeira abertura da app no aparelho (data registada de forma anónima para evitar reinício indevido do teste).\n- Durante o teste: até 5 clientes, 5 orçamentos e 5 lançamentos de caixa, incluindo PDF. Ao guardar o 4.º registo de cada tipo, a app avisa que falta apenas 1. O 6.º registo (ou acima dos limites) exige Plano Pro, mesmo antes de terminarem os 7 dias.\n- Após 7 dias sem Plano Pro: não é possível criar novos clientes, orçamentos ou lançamentos de caixa; pode consultar e editar os dados já guardados no aparelho.\n- Plano Pro: uso ilimitado, restauro de backup encriptado e cartão de visita interactivo na app — assinatura mensal ou anual via Google Play (preço e condições na loja).\n- Renovação automática até cancelar na Play Store: Pagamentos e subscrições → Subscrições." },
    { heading: "4. Cancelamento", body: "Google Play Store → Pagamentos e subscrições → Subscrições." },
    { heading: "5. Direito de arrependimento (Brasil — CDC)", body: "7 dias corridos quando aplicável, sem prejuízo das regras Google Play. Reembolsos via canais Google." },
    { heading: "6. Lembretes fiscais", body: "Meramente informativos; não substituem contabilista. Responsabilidade do utilizador." },
    { heading: "7. Limitação de responsabilidade", body: "Ferramenta de apoio; não substitui assessoria profissional. Decisões de negócio são do utilizador." },
    { heading: "8. Propriedade intelectual", body: "Licença revogável, não exclusiva. Proibida engenharia inversa ilícita." },
    { heading: "9. Alterações", body: "Versão vigente publicada no URL abaixo." },
    { heading: "10. Lei e foro", body: "Leis do Brasil; foro Caxias do Sul/RS, sem prejuízo do consumidor." },
    { heading: "11. Contacto", body: "suporte@perfectgestdev.com" }
  ],
  en: [
    { heading: "1. Purpose", body: "These Terms govern PerfectGest I (customers, budgets, cash, work orders, fiscal reminders, digital business card), with data primarily on your device.\n\nClient and financial data stay on the device and are not transmitted automatically. They may leave only through your actions (share PDF, exported backup, business card PNG/vCard/QR). See Privacy Policy.\n\nPublisher: Marcos Leandro dos Santos." },
    { heading: "2. Eligibility", body: "Users aged 18 or over." },
    { heading: "3. Initial Plan, trial period, and subscriptions", body: "- Trial period: 7 days from the first time you open the app on the device (anonymous timestamp stored to prevent improper trial resets).\n- During the trial: up to 5 clients, 5 estimates, and 5 cash entries, including PDF. When saving the 4th record of each type, the app warns that only 1 remains. A 6th record (or exceeding limits) requires Pro Plan, even before the 7 days end.\n- After 7 days without Pro Plan: you cannot create new clients, estimates, or cash entries; you may view and edit data already stored on the device.\n- Pro Plan: unlimited use, encrypted backup restore, and interactive business card in the app — monthly or annual subscription via Google Play (price and terms in the store).\n- Auto-renewal until cancelled in the Play Store: Payments & subscriptions → Subscriptions." },
    { heading: "4. Cancellation", body: "Google Play Store → Payments & subscriptions." },
    { heading: "5. Statutory rights (Brazil)", body: "Consumer Code may apply (7-day withdrawal where applicable). Refunds via Google." },
    { heading: "6. Fiscal reminders", body: "Informational only; not tax advice." },
    { heading: "7. Limitation of liability", body: "Management tool; user responsible for business decisions." },
    { heading: "8. Intellectual property", body: "Revocable license; no unlawful reverse engineering." },
    { heading: "9. Changes", body: "Current version at URL below." },
    { heading: "10. Governing law", body: "Brazil; venue Caxias do Sul/RS." },
    { heading: "11. Contact", body: "suporte@perfectgestdev.com" }
  ],
  es: [
    { heading: "1. Objeto", body: "Estos Términos regulan PerfectGest I (clientes, presupuestos, caja, órdenes de servicio, recordatorios fiscales, tarjeta de visita digital), con datos principalmente en el dispositivo.\n\nDatos de clientes y financieros permanecen en el dispositivo y no se transmiten automáticamente. Solo pueden salir por acción explícita (compartir PDF, backup exportado, PNG/vCard/QR de la tarjeta). Véase Política de Privacidad.\n\nEditor: Marcos Leandro dos Santos." },
    { heading: "2. Elegibilidad", body: "Usuarios mayores de 18 años." },
    { heading: "3. Plan Inicial, período de prueba y suscripciones", body: "- Período de prueba: 7 días desde la primera apertura de la app en el dispositivo (marca de tiempo anónima para evitar reinicios indebidos de la prueba).\n- Durante la prueba: hasta 5 clientes, 5 presupuestos y 5 movimientos de caja, con PDF. Al guardar el 4.º registro de cada tipo, la app avisa que solo queda 1. El 6.º registro (o por encima de los límites) requiere Plan Pro, incluso antes de que terminen los 7 días.\n- Tras 7 días sin Plan Pro: no puede crear nuevos clientes, presupuestos ni movimientos de caja; puede consultar y editar los datos ya guardados en el dispositivo.\n- Plan Pro: uso ilimitado, restauración de backup cifrado y tarjeta de visita interactiva en la app — suscripción mensual o anual vía Google Play (precio y condiciones en la tienda).\n- Renovación automática hasta cancelar en Play Store: Pagos y suscripciones → Suscripciones." },
    { heading: "4. Cancelación", body: "Google Play Store → Pagos y suscripciones." },
    { heading: "5. Desistimiento (Brasil — CDC)", body: "7 días naturales cuando corresponda. Reembolsos vía Google." },
    { heading: "6. Recordatorios fiscales", body: "Informativos; no asesoramiento fiscal." },
    { heading: "7. Limitación de responsabilidad", body: "Herramienta de gestión; responsabilidad del usuario." },
    { heading: "8. Propiedad intelectual", body: "Licencia revocable; sin ingeniería inversa ilícita." },
    { heading: "9. Cambios", body: "Versión publicada en URL abajo." },
    { heading: "10. Ley y fuero", body: "Brasil; Caxias do Sul/RS." },
    { heading: "11. Contacto", body: "suporte@perfectgestdev.com" }
  ],
};

const deletion = {
  pt: [
    { heading: "Introdução", body: "O PerfectGest I oferece controlo claro dos dados, em conformidade com a Google Play e a LGPD. A app é local-first." },
    { heading: "Resumo", body: "Dados de clientes e financeiros não são enviados automaticamente para servidores PerfectGest. Só podem sair do telemóvel se partilhar PDFs, partilhar ficheiros de backup que exportou, partilhar PNG/vCard do cartão de visita ou mostrar um QR com contactos profissionais." },
    { heading: "1. Dados de gestão (local)", body: "Armazenados em SQLite no dispositivo: clientes, orçamentos, caixa, ordens de serviço, dados da empresa, cópia do cartão de visita, lembretes fiscais.\n\nComo eliminar\n\n- Na app: Configurações → Dados no dispositivo → Eliminar todos os dados neste aparelho\n- Android: Definições → Apps → PerfectGest I → Armazenamento → Limpar dados\n- Desinstalar a app\n\nAviso: sem cópia externa, não há recuperação — não guardamos cópias nos nossos servidores.\n\nBackups partilhados: elimine manualmente no WhatsApp, e-mail ou nuvem onde os guardou." },
    { heading: "2. Firebase / telemetria", body: "Metadados anónimos de instalação e métricas de uso para elegibilidade do Plano Inicial. Não alojamos conteúdo do cartão de visita em servidores.\n\nE-mail: suporte@perfectgestdev.com — Assunto: Solicitação de Exclusão de Dados Técnicos" },
    { heading: "3. Notificações locais", body: "Canceladas ao desinstalar ou ao apagar os dados na app." },
    { heading: "4. Prazos", body: "Dados locais: imediato. Telemetria Firebase: até 15 dias úteis após pedido por e-mail." }
  ],
  en: [
    { heading: "Introduction", body: "PerfectGest I provides clear data control under Google Play and LGPD. The app is local-first." },
    { heading: "Summary", body: "Client and financial data are not sent automatically to PerfectGest servers. They may leave your phone only if you share PDFs, share backup files you exported, share business card PNG/vCard, or show a QR with professional contacts." },
    { heading: "1. Business data (local)", body: "Stored in SQLite on your device: clients, estimates, cash, work orders, company data, business card snapshot, fiscal reminders.\n\nHow to delete\n\n- In app: Settings → Data on this device → Delete all data on this device\n- Android: Settings → Apps → PerfectGest I → Storage → Clear data\n- Uninstall the app\n\nWarning: without an external backup, data cannot be recovered — we do not keep copies on our servers.\n\nShared backups: delete manually from WhatsApp, email, or cloud where you stored them." },
    { heading: "2. Firebase telemetry", body: "Anonymous install metadata and usage metrics for Initial Plan eligibility. We do not host business card content on servers.\n\nEmail: suporte@perfectgestdev.com — Subject: Technical Data Deletion Request" },
    { heading: "3. Local notifications", body: "Cancelled on uninstall or data wipe." },
    { heading: "4. Timelines", body: "Local data: immediate. Firebase telemetry: up to 15 business days after email request." }
  ],
  es: [
    { heading: "Introducción", body: "PerfectGest I ofrece control claro de datos según Google Play y LGPD. La app es local-first." },
    { heading: "Resumen", body: "Datos de clientes y financieros no se envían automáticamente a servidores PerfectGest. Solo pueden salir del teléfono si usted comparte PDFs, comparte backups exportados, comparte PNG/vCard de la tarjeta o muestra un QR con contactos profesionales." },
    { heading: "1. Datos de gestión (local)", body: "En SQLite en el dispositivo: clientes, presupuestos, caja, órdenes, empresa, snapshot de tarjeta, recordatorios fiscales.\n\nCómo eliminar\n\n- En la app: Ajustes → Datos en el dispositivo → Eliminar todos los datos\n- Android: Ajustes → Apps → PerfectGest I → Almacenamiento → Borrar datos\n- Desinstalar\n\nAviso: sin copia externa, no hay recuperación — no guardamos copias en servidores propios.\n\nBackups compartidos: elimínelos manualmente donde los guardó." },
    { heading: "2. Firebase / telemetría", body: "Metadatos anónimos de instalación. No alojamos contenido de tarjeta en servidores.\n\nCorreo: suporte@perfectgestdev.com — Asunto: Solicitud de Eliminación de Datos Técnicos" },
    { heading: "3. Notificaciones locales", body: "Se cancelan al desinstalar o borrar datos." },
    { heading: "4. Plazos", body: "Datos locales: inmediato. Telemetría Firebase: hasta 15 días hábiles." }
  ],
};

const faq = {
  pt: [
    { heading: "O que é o PerfectGest I?", body: "Aplicação de gestão no telemóvel, com dados guardados localmente (SQLite). Não há «conta na nuvem» PerfectGest para clientes, orçamentos ou caixa." },
    { heading: "A app funciona sem internet?", body: "Sim, o uso diário é offline-first. Serviços Google opcionais (Analytics, Remote Config, Firestore mínimo para o Plano Inicial) podem usar rede quando activos." },
    { heading: "Como funciona o período de teste?", body: "7 dias desde a primeira abertura. Durante esse tempo: até 5 clientes, 5 orçamentos e 5 lançamentos de caixa (com PDF), sem subscrição paga. Ao guardar o 4.º de cada tipo, a app avisa que falta 1. O 6.º ou o fim dos 7 dias sem Plano Pro impede novos registos; pode continuar a consultar e editar o que já está no telemóvel. Subscrição: Configurações → Assinatura Google Play." },
    { heading: "Como funciona o Plano Inicial?", body: "É o conjunto de limites 5+5+5 aplicado durante os 7 dias de teste (ver acima). Fora do teste ou acima dos limites, é necessário o Plano Pro (mensal ou anual na Google Play)." },
    { heading: "Onde compro ou gerencio a subscrição?", body: "Configurações → Assinatura Google Play. Pagamentos pelo Google. Cancelamento: Play Store → Pagamentos e subscrições → Subscrições." },
    { heading: "O que é o cartão de visita digital?", body: "Na aba Empresa edita os dados profissionais da empresa (não inclui clientes nem caixa). O cartão mostra logótipo, nome, slogan, CNPJ, nome do profissional e contactos com rótulos no rodapé (até 2 por linha). Temas: branco, cinza ou preto.\n\nPartilhar cartão de visita gera PNG e abre a folha de partilha (WhatsApp, e-mail, etc.). Após o primeiro cartão, sem Plano Pro o cartão fica em modo estático (pode partilhar o PNG do snapshot); com Pro, edita e usa funções avançadas só na app (vCard, QR, preview interactivo) — sem página web alojada pela PerfectGest.\n\nClientes e dados financeiros ficam protegidos: só no telemóvel; não entram no cartão nem são enviados automaticamente para servidores." },
    { heading: "Os meus dados de clientes e financeiros estão protegidos?", body: "Sim. Clientes, orçamentos, caixa e valores ficam na base local. A app não envia esses dados para servidores.\n\nSó saem do telemóvel se você decidir:\n\n- Partilhar um PDF\n- Partilhar o cartão de visita (PNG, vCard ou QR — contactos profissionais)\n- Partilhar um backup exportado em Configurações (recomendamos backup encriptado no Plano Pro)" },
    { heading: "O que são os lembretes fiscais?", body: "Obrigações pré-configuradas (MEI, Autônomo, ME) com alarmes no dispositivo. Meramente informativos — não substituem contabilista." },
    { heading: "O que é o calendário semanal?", body: "Na aba Empresa, calendário da semana com indicadores de vencimentos fiscais." },
    { heading: "O que são os «Últimos lançamentos»?", body: "Atalhos na página inicial para o último cliente, orçamento, ordem de serviço e lançamento de caixa." },
    { heading: "A app envia notificações?", body: "Apenas notificações locais para lembretes fiscais. Sem envio a servidores externos." },
    { heading: "Onde está a política de privacidade?", body: "Configurações → Ajuda e suporte — links para Política, Exclusão de dados e Termos. E-mail: suporte@perfectgestdev.com." },
    { heading: "Como apago todos os dados neste aparelho?", body: "Configurações → Dados no dispositivo → Eliminar todos os dados neste aparelho. Não apaga PDFs ou backups já exportados. Para dados técnicos Google: página de exclusão de dados." },
    { heading: "A app tem anúncios?", body: "Não." },
    { heading: "Há Firebase Crashlytics?", body: "Não. Analytics regista eventos genéricos; não envia crash reports automáticos." },
    { heading: "Em que idiomas está a app?", body: "Português (Brasil), inglês (EUA), espanhol (Espanha)." },
    { heading: "Como posso dar sugestões?", body: "Aba Empresa → Dê sua contribuição → e-mail suporte@perfectgestdev.com." }
  ],
  en: [
    { heading: "What is PerfectGest I?", body: "A mobile business management app. Data is stored locally (SQLite). No PerfectGest cloud account for clients, estimates, or cash." },
    { heading: "Does it work offline?", body: "Offline-first for daily use. Optional Google services may need a network when active." },
    { heading: "How does the trial period work?", body: "7 days from first open. During that time: up to 5 clients, 5 estimates, and 5 cash entries (including PDF) with no paid subscription. When saving the 4th of each type, the app warns that 1 remains. A 6th record or the end of 7 days without Pro Plan blocks new records; you can still view and edit existing data on the device. Subscribe in Settings → Google Play subscription." },
    { heading: "How does the Initial Plan work?", body: "The 5+5+5 limits apply during the 7-day trial (see above). After the trial or above limits, Pro Plan is required (monthly or annual on Google Play)." },
    { heading: "Where do I manage the subscription?", body: "Settings → Google Play subscription. Cancel via Play Store → Payments & subscriptions." },
    { heading: "What is the digital business card?", body: "In Company, edit professional business details only (not clients or cash). Share card generates a PNG via the system share sheet. After your first card, without Pro Plan the card is static (you can still share the snapshot PNG); with Pro, edit and use advanced features in the app only (vCard, QR, interactive preview) — no PerfectGest-hosted web page.\n\nClients and financial data stay protected on the device and are not sent to servers automatically." },
    { heading: "Are my client and financial data protected?", body: "Yes. Stored locally. They leave the device only if you share a PDF, card PNG/vCard/QR, or an exported backup file (encrypted backup recommended on Pro)." },
    { heading: "What are fiscal reminders?", body: "On-device alerts for MEI, Freelancer, ME obligations. Informational only." },
    { heading: "Weekly calendar, Latest entries, notifications, ads, Crashlytics, languages?", body: "Weekly fiscal calendar in Company; home shortcuts to recent records; local notifications only; no ads; no Crashlytics; PT / EN / ES." },
    { heading: "Privacy, deletion, suggestions?", body: "Settings → Help and support for legal links. Wipe device: Settings → Data on this device → Delete all data. Feedback: Company tab → email suporte@perfectgestdev.com." }
  ],
  es: [
    { heading: "¿Qué es PerfectGest I?", body: "App de gestión móvil con datos en el dispositivo (SQLite). Sin «cuenta en la nube» para clientes, presupuestos o caja." },
    { heading: "¿Funciona sin internet?", body: "Uso diario offline-first. Servicios Google opcionales pueden usar red." },
    { heading: "¿Cómo funciona el período de prueba?", body: "7 días desde la primera apertura. Durante ese tiempo: hasta 5 clientes, 5 presupuestos y 5 movimientos de caja (con PDF), sin suscripción de pago. Al guardar el 4.º de cada tipo, la app avisa que queda 1. El 6.º registro o el fin de los 7 días sin Plan Pro impide nuevos registros; puede seguir consultando y editando lo ya guardado. Suscripción: Ajustes → Suscripción de Google Play." },
    { heading: "¿Cómo funciona el Plan Inicial?", body: "Son los límites 5+5+5 aplicados durante los 7 días de prueba (véase arriba). Fuera de la prueba o por encima de los límites, se requiere Plan Pro (mensual o anual en Google Play)." },
    { heading: "¿Dónde gestiono la suscripción?", body: "Ajustes → Suscripción de Google Play. Cancelar en Play Store." },
    { heading: "¿Qué es la tarjeta de visita digital?", body: "En Empresa, edita datos profesionales (no clientes ni caja). Compartir tarjeta genera PNG en la hoja de compartir. Tras la primera tarjeta, sin Plan Pro queda en modo estático (puede compartir el PNG); con Pro, edita y usa funciones avanzadas solo en la app (vCard, QR, vista previa interactiva) — sin página web alojada por PerfectGest.\n\nClientes y datos financieros protegidos en el teléfono; no se envían automáticamente a servidores." },
    { heading: "¿Están protegidos mis datos de clientes y financieros?", body: "Sí. Solo salen si usted comparte PDF, PNG/vCard/QR de la tarjeta o backup exportado (cifrado recomendado en Pro)." },
    { heading: "Recordatorios fiscales, calendario, notificaciones, anuncios, idiomas?", body: "Recordatorios locales informativos; calendario semanal; sin anuncios; sin Crashlytics; PT / EN / ES." },
    { heading: "Privacidad, borrado, sugerencias?", body: "Ajustes → Ayuda y soporte. Borrar todo: Datos en el dispositivo → Eliminar todos los datos. Sugerencias: pestaña Empresa → suporte@perfectgestdev.com." }
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
