/** PerfectGest I — documentos legais no domínio.
 * Gerado por scripts/perfectgest-i-sync-legal-from-md.cjs a partir de
 * apps/PerfectGest-I/Politicas-Privacidade/*.md — não editar manualmente. */
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
    { heading: "Introdução", body: "Última atualização: Julho de 2026\nA PerfectGest I, sob responsabilidade de Marcos Leandro dos Santos, estabelece esta Política de Privacidade em conformidade com a Lei Geral de Proteção de Dados (LGPD - Lei 13.709/18) e as políticas para desenvolvedores da Google Play Store." },
    { heading: "Controlador de Dados e Contato", body: "O responsável pelo tratamento de dados é Marcos Leandro dos Santos. Para o exercício de direitos de acesso, retificação ou exclusão, entre em contato via e-mail: suporte@perfectgestdev.com." },
    { heading: "Armazenamento local e natureza dos dados", body: "O aplicativo opera em modelo local-first. Os dados de gestão comercial são armazenados exclusivamente no dispositivo do usuário via SQLite. A PerfectGest I não coleta, não acede e não transfere automaticamente esses dados para servidores próprios.\n\nDados de clientes e financeiros — protegidos no aparelho\n\nPermanecem no dispositivo e não saem da app por iniciativa do sistema:\n\n- Cadastro e histórico de clientes\n- Orçamentos, itens, valores e estados\n- Caixa — entradas, saídas, categorias e saldos\n- Ordens de serviço / produção e projetos\n- Contratos e documentos auxiliares de gestão\n- Qualquer valor, nome de cliente ou movimento financeiro registado na app\n\nNão enviamos estes dados para Firebase, Firestore, Analytics nem outros servidores por iniciativa da app. O Firebase Analytics regista apenas eventos genéricos de uso (ex.: navegação entre ecrãs), sem nomes de clientes, valores de caixa ou conteúdo de orçamentos.\n\nQuando os dados podem sair do aparelho (sempre por acção do utilizador)\n\nA saída ocorre somente se o utilizador decidir explicitamente:\n\n- Partilhar ou guardar PDF (orçamento, caixa, relatório, etc.) — o documento gerado naquele momento\n- Partilhar cartão de visita (PNG) — apenas dados profissionais da empresa (nome, contactos, redes, logótipo); nunca a lista de clientes nem dados financeiros\n- Partilhar ficheiro de contactos (vCard) ou mostrar QR com dados profissionais (Plano Pro — ver abaixo)\n- Criar e partilhar backup — ficheiro de backup (simples ou encriptado) que o utilizador escolhe enviar por WhatsApp, e-mail, Drive, etc.; contém a cópia local que exportou\n\nImportante: partilhar um backup é responsabilidade do utilizador quanto ao destino e à segurança do ficheiro. Recomendamos backups encriptados (Plano Pro) e destinatários de confiança.\n\nDados da empresa no cartão de visita\n\nOs contactos da aba Empresa (telefone, e-mail, WhatsApp, etc.) servem também o cartão de visita, mas não misturam nem expõem automaticamente os módulos Clientes, Orçamentos ou Caixa." },
    { heading: "Cartão de visita — armazenamento local e modo estático", body: "O cartão de visita digital (aba Empresa) utiliza os dados da empresa guardados no dispositivo. Ao concluir a criação do primeiro cartão, o aplicativo pode guardar uma cópia congelada (snapshot) local — imagem PNG e dados do layout — para exibição em modo estático quando não houver assinatura Plano Pro activa.\n\n- No dispositivo: snapshot, logótipo e ficheiros temporários de partilha permanecem no aparelho até limpar dados ou desinstalar.\n- Partilha PNG: mesmo em modo estático, pode partilhar a imagem do snapshot (ex.: WhatsApp, e-mail) por acção explícita; não enviamos essa imagem automaticamente a servidores PerfectGest.\n- Edição e funcionalidades avançadas (vCard, QR, preview interactivo com toques em contactos): requerem Plano Pro — sempre dentro da app; não há página web do cartão alojada pela PerfectGest." },
    { heading: "Cartão de visita interactivo na app (Plano Pro)", body: "Com Plano Pro, após o primeiro cartão, pode continuar a editar e usar funções avançadas no telemóvel:\n\n- Preview interactivo (toques abrem WhatsApp, telefone, e-mail, site ou mapa, conforme configurado)\n- Exportar vCard (.vcf) e gerar QR com dados de contacto\n- Partilhar PNG actualizado\n\nTudo permanece no dispositivo até partilhar ou mostrar o QR por acção explícita. Não publicamos nem alojamos o cartão num site PerfectGest; não enviamos o conteúdo do cartão para Firestore nem outros servidores por iniciativa da app.\n\nO que nunca entra no cartão: cadastro de clientes, orçamentos, lançamentos de caixa, valores financeiros, contratos ou backups." },
    { heading: "Modelo de acesso — exploração e Plano Pro", body: "- Após o download: pode explorar a app (navegar ecrãs e consultar a interface) sem assinatura.\n- Operações (criar clientes, orçamentos ou lançamentos de caixa; gerar PDFs de gestão; restauro de backup encriptado; e demais acções bloqueadas sem assinatura) exigem Plano Pro. Ao tentar uma operação sem Pro, a app apresenta um aviso com o plano (referência de preço R$ 9,90/mês; o valor cobrado é o da Google Play) e as opções Assinar ou Continuar a explorar recursos do Aplicativo.\n- Plano Pro: uso ilimitado, restauro de backup encriptado e cartão de visita interactivo na app (edição após o primeiro cartão, vCard, QR, preview com toques), via assinatura mensal ou anual na Google Play.\n- Logótipo da empresa: escolhido na aba Empresa, guardado apenas no dispositivo e usado nos cabeçalhos dos PDFs — não é enviado a servidores PerfectGest.\n\nMetadados anónimos por aparelho (serviço Firebase) podem registar instalação / elegibilidade de assinatura e consumo do 1.º cartão — sem dados de clientes, orçamentos ou caixa." },
    { heading: "Coleta de dados e serviços de terceiros", body: "- Google Analytics (Firebase): eventos genéricos de uso; sem Crashlytics; sem nomes ou valores financeiros.\n- Firebase Remote Config: versões mínimas e flags de segurança.\n- Cloud Firestore: metadados anónimos por aparelho — identificador de instalação, elegibilidade de assinatura / anti-abuso e consumo do 1.º cartão (sem dados de clientes, orçamentos ou caixa).\n- Google Play Billing: subscrições." },
    { heading: "Notificações locais", body: "Lembretes fiscais processados no dispositivo; sem envio a servidores externos. Permissão POST_NOTIFICATIONS no Android 13+." },
    { heading: "Declarações de segurança", body: "- HTTPS/TLS em telemetria e metadados técnicos.\n- Sem venda de dados para publicidade.\n- Separação cartão vs. gestão: cartão = só informação profissional configurada; clientes e financeiro locais, excepto PDFs ou backups partilhados pelo utilizador." },
    { heading: "Retenção e exclusão", body: "- Dados comerciais locais e snapshot do cartão: eliminados ao limpar dados da app ou desinstalar.\n- Telemetria (Firebase): pedido por e-mail, até 15 dias úteis." },
    { heading: "Permissões de sistema", body: "Importar logótipos; guardar PDFs e backups; notificações locais (Android 13+)." },
    { heading: "Elegibilidade e foro", body: "Utilizadores maiores de 18 anos. Leis do Brasil; foro de Caxias do Sul/RS." }
  ],
  en: [
    { heading: "Introduction", body: "Last updated: July 2026\nPerfectGest I, operated by Marcos Leandro dos Santos, provides this Privacy Policy in compliance with Brazil’s LGPD (Law 13.709/18) and Google Play developer policies." },
    { heading: "Data controller and contact", body: "Controller: Marcos Leandro dos Santos. Contact: suporte@perfectgestdev.com." },
    { heading: "Local storage", body: "The app is local-first. Business data is stored only on your device (SQLite). PerfectGest I does not automatically collect, access, or transfer that data to its own servers.\n\nClient and financial data — protected on the device\n\nThese stay on the device and do not leave the app unless you choose to:\n\n- Client records and history\n- Estimates, line items, amounts, and status\n- Cash flow — income, expenses, categories, balances\n- Work orders, projects, contracts, and management documents\n- Any client name, amount, or financial movement in the app\n\nWe do not send this data to Firebase, Firestore, Analytics, or other servers. Firebase Analytics logs generic usage events only — not client names, cash amounts, or estimate content.\n\nWhen data may leave the device (your explicit action only)\n\n- Share or save a PDF (estimate, cash report, etc.)\n- Share business card PNG — professional company contacts only; never your client list or financial data\n- Share vCard or show QR with professional contacts (Pro Plan — see below)\n- Share a backup file you exported (plain or encrypted) via WhatsApp, email, Drive, etc.\n\nImportant: sharing a backup is your responsibility regarding destination and security. We recommend encrypted backups (Pro Plan).\n\nBusiness card vs. management data\n\nThe Company tab feeds the digital business card with your business contact info only. It does not expose Clients, Estimates, or Cash modules." },
    { heading: "Business card — local storage and static mode", body: "After your first card is saved, a local snapshot (PNG + layout) may be shown in static mode without Pro. You may still share that snapshot PNG via the system share sheet. Advanced features (edit after freeze, vCard, QR, interactive preview with tappable contacts) require Pro Plan — inside the app only; PerfectGest does not host a public web page for your card." },
    { heading: "Interactive business card in the app (Pro Plan)", body: "With Pro Plan, after your first card you can keep editing and use advanced features on your phone:\n\n- Interactive preview (taps open WhatsApp, phone, email, website, or maps as configured)\n- Export vCard (.vcf) and generate QR with contact data\n- Share an updated PNG\n\nEverything stays on the device until you share or show the QR. We do not publish or host your card on a PerfectGest website or upload card content to Firestore.\n\nNever included in the card: clients, estimates, cash entries, financial amounts, contracts, or backups." },
    { heading: "Access model — explore and Pro Plan", body: "- After download: you may explore the app (browse screens and the interface) without a subscription.\n- Operations (creating clients, estimates, or cash entries; generating management PDFs; encrypted backup restore; and other actions gated without a subscription) require Pro Plan. If you try an operation without Pro, the app shows a notice with the plan (reference price R$ 9.90/month; the amount charged is the one on Google Play) and the options Subscribe or Continue exploring app features.\n- Pro Plan: unlimited use, encrypted backup restore, and interactive business card in the app (edit after first card, vCard, QR, tappable preview), monthly or annual via Google Play.\n- Company logo: chosen in the Company tab, stored only on the device, and used in PDF headers — not uploaded to PerfectGest servers.\n\nAnonymous per-device metadata (Firebase) may record installation / subscription eligibility and first-card use — not client, estimate, or cash data." },
    { heading: "Third-party services", body: "Firebase Analytics (generic events, no Crashlytics), Remote Config, Firestore (minimal anonymous device metadata — installation identifier, subscription eligibility / anti-abuse, and first business-card save — not clients, estimates, or cash data), Google Play Billing. No in-app ads." },
    { heading: "Local notifications", body: "Fiscal reminders on-device only; no external server transfer. POST_NOTIFICATIONS on Android 13+." },
    { heading: "Security", body: "HTTPS/TLS for telemetry; no sale of data for ads; business card contains only professional info you configure." },
    { heading: "Retention and deletion", body: "Local business data and card snapshot: removed when you clear app data or uninstall. Telemetry (Firebase): email request, up to 15 business days." },
    { heading: "Permissions", body: "Import logos; save PDFs and backups; local notifications." },
    { heading: "Eligibility and law", body: "Users 18+. Laws of Brazil; venue Caxias do Sul/RS." }
  ],
  es: [
    { heading: "Introducción", body: "Última actualización: Julio de 2026\nPerfectGest I, bajo responsabilidad de Marcos Leandro dos Santos, establece esta Política de Privacidad conforme a la LGPD de Brasil (Ley 13.709/18) y las políticas de Google Play." },
    { heading: "Responsable y contacto", body: "Responsable: Marcos Leandro dos Santos. Contacto: suporte@perfectgestdev.com." },
    { heading: "Almacenamiento local", body: "La app es local-first. Los datos de gestión se guardan solo en el dispositivo (SQLite). PerfectGest I no recoge, accede ni transfiere automáticamente esos datos a servidores propios.\n\nDatos de clientes y financieros — protegidos en el dispositivo\n\nPermanecen en el dispositivo y no salen de la app por iniciativa del sistema:\n\n- Registro e historial de clientes\n- Presupuestos, ítems, importes y estados\n- Caja — ingresos, gastos, categorías y saldos\n- Órdenes de servicio, proyectos, contratos y documentos de gestión\n- Cualquier nombre de cliente, importe o movimiento financiero\n\nNo enviamos estos datos a Firebase, Firestore, Analytics u otros servidores. Firebase Analytics registra solo eventos genéricos de uso, sin nombres de clientes ni importes de caja.\n\nCuándo pueden salir del dispositivo (solo por su acción)\n\n- Compartir o guardar PDF (presupuesto, informe de caja, etc.)\n- Compartir tarjeta de visita (PNG) — solo datos profesionales; nunca lista de clientes ni datos financieros\n- Compartir vCard o mostrar QR con contactos profesionales (Plan Pro — ver abajo)\n- Compartir archivo de backup que exportó (simple o cifrado)\n\nImportante: compartir un backup es responsabilidad del usuario sobre destino y seguridad. Recomendamos copias cifradas (Plan Pro).\n\nTarjeta de visita vs. gestión interna\n\nLa pestaña Empresa alimenta la tarjeta con contactos profesionales; no expone Clientes, Presupuestos ni Caja." },
    { heading: "Tarjeta de visita — modo estático", body: "Tras guardar la primera tarjeta, puede mostrarse una copia congelada local sin Pro. Puede seguir compartiendo el PNG por la hoja de compartir del sistema. Funciones avanzadas (editar tras congelar, vCard, QR, vista previa interactiva con toques) requieren Plan Pro — solo en la app; PerfectGest no aloja una página web pública de su tarjeta." },
    { heading: "Tarjeta interactiva en la app (Plan Pro)", body: "Con Plan Pro, tras la primera tarjeta puede seguir editando y usar funciones avanzadas en el teléfono:\n\n- Vista previa interactiva (toques abren WhatsApp, teléfono, correo, web o mapa)\n- Exportar vCard (.vcf) y generar QR con datos de contacto\n- Compartir PNG actualizado\n\nTodo permanece en el dispositivo hasta que comparta o muestre el QR. No publicamos ni alojamos la tarjeta en un sitio PerfectGest ni enviamos su contenido a Firestore.\n\nNunca incluidos en la tarjeta: clientes, presupuestos, caja, importes financieros, contratos ni backups." },
    { heading: "Modelo de acceso — exploración y Plan Pro", body: "- Tras la descarga: puede explorar la app (navegar pantallas e interfaz) sin suscripción.\n- Operaciones (crear clientes, presupuestos o movimientos de caja; generar PDF de gestión; restaurar backup cifrado; y demás acciones bloqueadas sin suscripción) requieren Plan Pro. Al intentar una operación sin Pro, la app muestra un aviso con el plan (precio de referencia R$ 9,90/mes; el importe cobrado es el de Google Play) y las opciones Suscribirse o Continuar explorando los recursos de la aplicación.\n- Plan Pro: uso ilimitado, restauración de backup cifrado y tarjeta interactiva en la app (editar tras la primera tarjeta, vCard, QR, vista previa con toques), mensual o anual vía Google Play.\n- Logotipo de la empresa: se elige en la pestaña Empresa, se guarda solo en el dispositivo y se usa en los encabezados de PDF — no se envía a servidores PerfectGest.\n\nMetadatos anónimos por dispositivo (Firebase) pueden registrar instalación / elegibilidad de suscripción y el primer uso de tarjeta — sin datos de clientes, presupuestos ni caja." },
    { heading: "Servicios de terceros", body: "Firebase Analytics (eventos genéricos, sin Crashlytics), Remote Config, Firestore (metadatos anónimos mínimos por dispositivo: identificador de instalación, elegibilidad de suscripción / antiabuso y primer guardado de tarjeta — sin clientes, presupuestos ni caja), Google Play Billing. Sin publicidad en la app." },
    { heading: "Notificaciones locales", body: "Recordatorios fiscales solo en el dispositivo. Permiso POST_NOTIFICATIONS en Android 13+." },
    { heading: "Seguridad y retención", body: "HTTPS/TLS; no venta de datos para anuncios. Datos locales y snapshot de tarjeta: se eliminan al borrar datos o desinstalar. Telemetría (Firebase): solicitud por correo, hasta 15 días hábiles." },
    { heading: "Permisos, elegibilidad y foro", body: "Logotipos, PDFs, backups, notificaciones. Usuarios mayores de 18 años. Leyes de Brasil; fuero Caxias do Sul/RS." }
  ],
};

const terms = {
  pt: [
    { heading: "Introdução", body: "Última atualização: Julho de 2026" },
    { heading: "1. Objeto", body: "Estes Termos regem a app PerfectGest I, para gestão empresarial (clientes, orçamentos, caixa, ordem de serviço, lembretes fiscais, cartão de visita digital), com dados principalmente no dispositivo.\n\nDados de clientes e financeiros permanecem no aparelho e não são transmitidos automaticamente. Podem sair somente por acção do utilizador (partilha de PDF, backup exportado, cartão de visita PNG/vCard/QR). Ver Política de Privacidade.\n\nEditor: Marcos Leandro dos Santos." },
    { heading: "2. Elegibilidade", body: "Utilizadores maiores de 18 anos." },
    { heading: "3. Exploração, Plano Pro e assinaturas", body: "- Após o download: pode explorar a app (navegar e consultar a interface) sem assinatura.\n- Operações (criar registos, gerar PDFs de gestão, restauro de backup encriptado e demais acções condicionadas) exigem Plano Pro. Sem assinatura, a app mostra um aviso com o plano (referência R$ 9,90/mês; preço oficial na Google Play) e as opções Assinar ou Continuar a explorar recursos do Aplicativo.\n- Plano Pro: uso ilimitado, restauro de backup encriptado e cartão de visita interactivo na app — assinatura mensal ou anual via Google Play (preço e condições na loja).\n- Renovação automática até cancelar na Play Store: Pagamentos e subscrições → Subscrições." },
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
    { heading: "Introduction", body: "Last updated: July 2026" },
    { heading: "1. Purpose", body: "These Terms govern PerfectGest I (customers, budgets, cash, work orders, fiscal reminders, digital business card), with data primarily on your device.\n\nClient and financial data stay on the device and are not transmitted automatically. They may leave only through your actions (share PDF, exported backup, business card PNG/vCard/QR). See Privacy Policy.\n\nPublisher: Marcos Leandro dos Santos." },
    { heading: "2. Eligibility", body: "Users aged 18 or over." },
    { heading: "3. Explore mode, Pro Plan, and subscriptions", body: "- After download: you may explore the app (browse and view the interface) without a subscription.\n- Operations (creating records, generating management PDFs, encrypted backup restore, and other gated actions) require Pro Plan. Without a subscription, the app shows a notice with the plan (reference R$ 9.90/month; official price on Google Play) and the options Subscribe or Continue exploring app features.\n- Pro Plan: unlimited use, encrypted backup restore, and interactive business card in the app — monthly or annual subscription via Google Play (price and terms in the store).\n- Auto-renewal until cancelled in the Play Store: Payments & subscriptions → Subscriptions." },
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
    { heading: "Introducción", body: "Última actualización: Julio de 2026" },
    { heading: "1. Objeto", body: "Estos Términos regulan PerfectGest I (clientes, presupuestos, caja, órdenes de servicio, recordatorios fiscales, tarjeta de visita digital), con datos principalmente en el dispositivo.\n\nDatos de clientes y financieros permanecen en el dispositivo y no se transmiten automáticamente. Solo pueden salir por acción explícita (compartir PDF, backup exportado, PNG/vCard/QR de la tarjeta). Véase Política de Privacidad.\n\nEditor: Marcos Leandro dos Santos." },
    { heading: "2. Elegibilidad", body: "Usuarios mayores de 18 años." },
    { heading: "3. Exploración, Plan Pro y suscripciones", body: "- Tras la descarga: puede explorar la app (navegar y consultar la interfaz) sin suscripción.\n- Operaciones (crear registros, generar PDF de gestión, restaurar backup cifrado y demás acciones condicionadas) requieren Plan Pro. Sin suscripción, la app muestra un aviso con el plan (referencia R$ 9,90/mes; precio oficial en Google Play) y las opciones Suscribirse o Continuar explorando los recursos de la aplicación.\n- Plan Pro: uso ilimitado, restauración de backup cifrado y tarjeta de visita interactiva en la app — suscripción mensual o anual vía Google Play (precio y condiciones en la tienda).\n- Renovación automática hasta cancelar en Play Store: Pagos y suscripciones → Suscripciones." },
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
    { heading: "Introdução", body: "Última atualização: Julho de 2026\nO PerfectGest I oferece controlo claro dos dados, em conformidade com a Google Play e a LGPD. A app é local-first." },
    { heading: "Resumo", body: "Dados de clientes e financeiros não são enviados automaticamente para servidores PerfectGest. Só podem sair do telemóvel se partilhar PDFs, partilhar ficheiros de backup que exportou, partilhar PNG/vCard do cartão de visita ou mostrar um QR com contactos profissionais." },
    { heading: "1. Dados de gestão (local)", body: "Armazenados em SQLite no dispositivo: clientes, orçamentos, caixa, ordens de serviço, dados da empresa (incluindo logótipo), cópia do cartão de visita, lembretes fiscais.\n\nComo eliminar\n\n- Na app: Configurações → Dados no dispositivo → Eliminar todos os dados neste aparelho\n- Android: Definições → Apps → PerfectGest I → Armazenamento → Limpar dados\n- Desinstalar a app\n\nAviso: sem cópia externa, não há recuperação — não guardamos cópias nos nossos servidores.\n\nBackups partilhados: elimine manualmente no WhatsApp, e-mail ou nuvem onde os guardou." },
    { heading: "2. Firebase / telemetria", body: "Metadados anónimos de instalação e métricas de uso (elegibilidade de assinatura / anti-abuso). Não alojamos conteúdo do cartão de visita nem o logótipo em servidores.\n\nE-mail: suporte@perfectgestdev.com — Assunto: Solicitação de Exclusão de Dados Técnicos" },
    { heading: "3. Notificações locais", body: "Canceladas ao desinstalar ou ao apagar os dados na app." },
    { heading: "4. Prazos", body: "Dados locais: imediato. Telemetria Firebase: até 15 dias úteis após pedido por e-mail." }
  ],
  en: [
    { heading: "Introduction", body: "Last updated: July 2026\nPerfectGest I provides clear data control under Google Play and LGPD. The app is local-first." },
    { heading: "Summary", body: "Client and financial data are not sent automatically to PerfectGest servers. They may leave your phone only if you share PDFs, share backup files you exported, share business card PNG/vCard, or show a QR with professional contacts." },
    { heading: "1. Business data (local)", body: "Stored in SQLite on your device: clients, estimates, cash, work orders, company data (including logo), business card snapshot, fiscal reminders.\n\nHow to delete\n\n- In app: Settings → Data on this device → Delete all data on this device\n- Android: Settings → Apps → PerfectGest I → Storage → Clear data\n- Uninstall the app\n\nWarning: without an external backup, data cannot be recovered — we do not keep copies on our servers.\n\nShared backups: delete manually from WhatsApp, email, or cloud where you stored them." },
    { heading: "2. Firebase telemetry", body: "Anonymous install metadata and usage metrics (subscription eligibility / anti-abuse). We do not host business card content or the company logo on servers.\n\nEmail: suporte@perfectgestdev.com — Subject: Technical Data Deletion Request" },
    { heading: "3. Local notifications", body: "Cancelled on uninstall or data wipe." },
    { heading: "4. Timelines", body: "Local data: immediate. Firebase telemetry: up to 15 business days after email request." }
  ],
  es: [
    { heading: "Introducción", body: "Última actualización: Julio de 2026\nPerfectGest I ofrece control claro de datos según Google Play y LGPD. La app es local-first." },
    { heading: "Resumen", body: "Datos de clientes y financieros no se envían automáticamente a servidores PerfectGest. Solo pueden salir del teléfono si usted comparte PDFs, comparte backups exportados, comparte PNG/vCard de la tarjeta o muestra un QR con contactos profesionales." },
    { heading: "1. Datos de gestión (local)", body: "En SQLite en el dispositivo: clientes, presupuestos, caja, órdenes, empresa (incluido logotipo), snapshot de tarjeta, recordatorios fiscales.\n\nCómo eliminar\n\n- En la app: Ajustes → Datos en el dispositivo → Eliminar todos los datos\n- Android: Ajustes → Apps → PerfectGest I → Almacenamiento → Borrar datos\n- Desinstalar\n\nAviso: sin copia externa, no hay recuperación — no guardamos copias en servidores propios.\n\nBackups compartidos: elimínelos manualmente donde los guardó." },
    { heading: "2. Firebase / telemetría", body: "Metadatos anónimos de instalación (elegibilidad de suscripción / antiabuso). No alojamos contenido de tarjeta ni el logotipo en servidores.\n\nCorreo: suporte@perfectgestdev.com — Asunto: Solicitud de Eliminación de Datos Técnicos" },
    { heading: "3. Notificaciones locales", body: "Se cancelan al desinstalar o borrar datos." },
    { heading: "4. Plazos", body: "Datos locales: inmediato. Telemetría Firebase: hasta 15 días hábiles." }
  ],
};

const faq = {
  pt: [
    { heading: "Introdução", body: "Última atualização: Julho de 2026" },
    { heading: "O que é o PerfectGest I?", body: "Aplicação de gestão no telemóvel, com dados guardados localmente (SQLite). Não há «conta na nuvem» PerfectGest para clientes, orçamentos ou caixa." },
    { heading: "A app funciona sem internet?", body: "Sim, o uso diário é offline-first. Serviços Google opcionais (Analytics, Remote Config, Firestore mínimo para elegibilidade de assinatura) podem usar rede quando activos." },
    { heading: "Posso usar a app sem assinatura?", body: "Sim, para explorar (navegar ecrãs e consultar a interface). Para operações (criar clientes, orçamentos ou caixa; gerar PDFs de gestão; restauro de backup encriptado; e demais acções condicionadas) é necessário o Plano Pro. Ao tentar uma operação sem assinatura, surge um aviso com o plano (referência R$ 9,90/mês; preço na Google Play) e os botões Assinar ou Continuar a explorar recursos do Aplicativo." },
    { heading: "Como funciona o Plano Pro?", body: "Assinatura mensal ou anual na Google Play: uso ilimitado, restauro de backup encriptado e cartão de visita interactivo. Gerir em Configurações → Assinatura Google Play." },
    { heading: "Onde compro ou gerencio a subscrição?", body: "Configurações → Assinatura Google Play. Pagamentos pelo Google. Cancelamento: Play Store → Pagamentos e subscrições → Subscrições." },
    { heading: "O que é o cartão de visita digital?", body: "Na aba Empresa edita os dados profissionais da empresa (não inclui clientes nem caixa). Pode escolher o logótipo (guardado no aparelho) para aparecer nos PDFs. O cartão mostra logótipo, nome, slogan, CNPJ, nome do profissional e contactos com rótulos no rodapé (até 2 por linha). Temas: branco, cinza ou preto.\n\nPartilhar cartão de visita gera PNG e abre a folha de partilha (WhatsApp, e-mail, etc.). Após o primeiro cartão, sem Plano Pro o cartão fica em modo estático (pode partilhar o PNG do snapshot); com Pro, edita e usa funções avançadas só na app (vCard, QR, preview interactivo) — sem página web alojada pela PerfectGest.\n\nClientes e dados financeiros ficam protegidos: só no telemóvel; não entram no cartão nem são enviados automaticamente para servidores." },
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
    { heading: "Introdução", body: "Last updated: July 2026" },
    { heading: "What is PerfectGest I?", body: "A mobile business management app. Data is stored locally (SQLite). No PerfectGest cloud account for clients, estimates, or cash." },
    { heading: "Does it work offline?", body: "Offline-first for daily use. Optional Google services may need a network when active." },
    { heading: "Can I use the app without a subscription?", body: "Yes, to explore (browse screens and the interface). Operations (creating clients, estimates, or cash entries; generating management PDFs; encrypted backup restore; and other gated actions) require Pro Plan. Trying an operation without a subscription shows a notice with the plan (reference R$ 9.90/month; price on Google Play) and Subscribe or Continue exploring app features." },
    { heading: "How does the Pro Plan work?", body: "Monthly or annual subscription on Google Play: unlimited use, encrypted backup restore, and interactive business card. Manage in Settings → Google Play subscription." },
    { heading: "Where do I manage the subscription?", body: "Settings → Google Play subscription. Cancel via Play Store → Payments & subscriptions." },
    { heading: "What is the digital business card?", body: "In Company, edit professional business details only (not clients or cash). Share card generates a PNG via the system share sheet. After your first card, without Pro Plan the card is static (you can still share the snapshot PNG); with Pro, edit and use advanced features in the app only (vCard, QR, interactive preview) — no PerfectGest-hosted web page.\n\nClients and financial data stay protected on the device and are not sent to servers automatically." },
    { heading: "Are my client and financial data protected?", body: "Yes. Stored locally. They leave the device only if you share a PDF, card PNG/vCard/QR, or an exported backup file (encrypted backup recommended on Pro)." },
    { heading: "What are fiscal reminders?", body: "On-device alerts for MEI, Freelancer, ME obligations. Informational only." },
    { heading: "Weekly calendar, Latest entries, notifications, ads, Crashlytics, languages?", body: "Weekly fiscal calendar in Company; home shortcuts to recent records; local notifications only; no ads; no Crashlytics; PT / EN / ES." },
    { heading: "Privacy, deletion, suggestions?", body: "Settings → Help and support for legal links. Wipe device: Settings → Data on this device → Delete all data. Feedback: Company tab → email suporte@perfectgestdev.com." }
  ],
  es: [
    { heading: "Introdução", body: "Última actualización: Julio de 2026" },
    { heading: "¿Qué es PerfectGest I?", body: "App de gestión móvil con datos en el dispositivo (SQLite). Sin «cuenta en la nube» para clientes, presupuestos o caja." },
    { heading: "¿Funciona sin internet?", body: "Uso diario offline-first. Servicios Google opcionales pueden usar red." },
    { heading: "¿Puedo usar la app sin suscripción?", body: "Sí, para explorar (navegar pantallas y consultar la interfaz). Las operaciones (crear clientes, presupuestos o caja; generar PDF de gestión; restaurar backup cifrado; y demás acciones condicionadas) requieren Plan Pro. Al intentar una operación sin suscripción aparece un aviso con el plan (referencia R$ 9,90/mes; precio en Google Play) y Suscribirse o Continuar explorando los recursos de la aplicación." },
    { heading: "¿Cómo funciona el Plan Pro?", body: "Suscripción mensual o anual en Google Play: uso ilimitado, restauración de backup cifrado y tarjeta interactiva. Gestión: Ajustes → Suscripción de Google Play." },
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
