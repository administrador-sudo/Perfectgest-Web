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
    { heading: "Introdução", body: "Última atualização: 7 de julho de 2026\nResponsável: Marcos Leandro dos Santos · suporte@perfectgestdev.com" },
    { heading: "Seus dados ficam no seu celular", body: "O PerfectGest I foi feito para funcionar sem internet no dia a dia. Por padrão:\n\n- Clientes, orçamentos, caixa, ordens de serviço e dados da empresa ficam só no seu celular\n- O app não envia esses dados para os nossos servidores automaticamente\n- O app não tem anúncios e não rastreia o que você registra" },
    { heading: "O que o app guarda", body: "Dados que você preenche (ficam no celular)\n\n| O que é | Exemplos |\n|---------|----------|\n| Clientes | Nome, contato, histórico |\n| Orçamentos | Itens, valores, estado |\n| Caixa | Entradas, saídas, categorias |\n| Ordens de serviço | Descrição, valores |\n| Dados da empresa | Nome, CNPJ, logo, contatos |\n| Preferências | Tema, configurações do app |\n\nO que o app não coleta\n\n- Sua localização (GPS)\n- Contatos do telefone\n- Histórico de navegação\n- Qualquer dado para anúncios" },
    { heading: "Quando seus dados saem do celular", body: "Os dados só saem do aparelho quando você mesmo decide compartilhar:\n\n| Ação | O que é enviado |\n|------|-----------------|\n| Compartilhar PDF (orçamento, caixa, relatório) | O PDF gerado naquele momento |\n| Compartilhar cartão de visita (PNG ou vCard) | Só dados profissionais da empresa — nunca clientes ou financeiro |\n| Exportar backup | Arquivo com seus dados (guarde em local seguro) |\n\nRecomendamos backup com senha (disponível no Plano Pro) para maior segurança." },
    { heading: "Uso gratuito e Plano Pro", body: "Uso gratuito (freemium): você pode criar 1 cliente, 1 orçamento e 1 lançamento de caixa sem assinar nenhum plano. Esses limites são permanentes — sem prazo para vencer.\n\nPlano Pro: uso ilimitado + backup com senha + cartão de visita completo. Assinatura mensal ou anual via Google Play." },
    { heading: "Cartão de visita digital", body: "O cartão usa os dados da aba Empresa (nome, logo, contatos profissionais). Esses dados ficam no celular.\n\n- Sem Plano Pro: pode compartilhar a imagem do cartão; edição avançada fica pausada\n- Com Plano Pro: edita, gera vCard, QR Code e preview interativo — tudo dentro do app\n\nClientes, orçamentos e caixa nunca entram no cartão." },
    { heading: "Serviços do Google usados pelo app", body: "| Serviço | Para quê | O que é enviado |\n|---------|----------|-----------------|\n| Google Play Billing | Gerenciar assinatura | Dados da compra (pela Google) |\n| Firebase Analytics | Medir uso do app | Eventos genéricos (sem nomes ou valores financeiros) |\n| Firebase Remote Config | Configurações do app | Nenhum dado pessoal |\n| Cloud Firestore | Controle do limite freemium por aparelho | ID anônimo do aparelho — sem clientes, orçamentos ou caixa |\n\nO Firebase Analytics registra apenas eventos genéricos de navegação — não envia nomes de clientes, valores de caixa nem conteúdo de orçamentos." },
    { heading: "Notificações", body: "Apenas lembretes locais no celular para obrigações fiscais. Nada é enviado para servidores externos." },
    { heading: "Por quanto tempo guardamos seus dados", body: "- No celular: até você usar \"Eliminar todos os dados\" ou desinstalar o app\n- Firebase (técnico): solicite exclusão por e-mail em até 15 dias úteis" },
    { heading: "Seus direitos", body: "Você pode a qualquer momento:\n- Ver e editar seus dados diretamente no app\n- Exportar seus dados (backup)\n- Apagar tudo do celular: Configurações → Dados no dispositivo → Eliminar todos os dados\n- Pedir exclusão de dados técnicos (Firebase) por e-mail: suporte@perfectgestdev.com" },
    { heading: "Crianças", body: "O app é destinado a adultos (18 anos ou mais) e empreendedores." },
    { heading: "Atualizações desta política", body: "Quando houver mudanças relevantes, avisamos no app. A versão mais recente está sempre no link abaixo." },
    { heading: "Links", body: "- Política de privacidade\n- FAQ\n- Exclusão de dados\n- Termos e Condições" }
  ],
  en: [
    { heading: "Introduction", body: "Last updated: 7 July 2026\nDeveloper: Marcos Leandro dos Santos · suporte@perfectgestdev.com" },
    { heading: "Your data stays on your phone", body: "PerfectGest I is built to work offline every day. By default:\n\n- Clients, estimates, cash, service orders, and company data stay only on your device\n- The app does not send this data to our servers automatically\n- The app has no ads and does not track what you register" },
    { heading: "What the app stores", body: "Data you enter (stays on your device)\n\n| Type | Examples |\n|------|----------|\n| Clients | Name, contact, history |\n| Estimates | Items, amounts, status |\n| Cash | Income, expenses, categories |\n| Service orders | Description, values |\n| Company data | Name, tax ID, logo, contacts |\n| Preferences | Theme, app settings |\n\nWhat the app does not collect\n\n- Your location (GPS)\n- Phone contacts\n- Browsing history\n- Any advertising data" },
    { heading: "When data leaves your device", body: "Data only leaves your phone when you decide to share:\n\n| Action | What is sent |\n|--------|-------------|\n| Share a PDF (estimate, cash, report) | The PDF generated at that moment |\n| Share business card (PNG or vCard) | Professional details only — never clients or financials |\n| Export backup | A file with your data (store it securely) |\n\nWe recommend using a password-protected backup (Pro Plan) for extra security." },
    { heading: "Free use and Pro Plan", body: "Free use (freemium): create 1 client, 1 estimate, and 1 cash entry without subscribing. These limits are permanent — they don't expire.\n\nPro Plan: unlimited use + password-protected backup + full business card. Monthly or annual via Google Play." },
    { heading: "Digital business card", body: "The card uses data from the Company tab (name, logo, professional contacts). This data stays on your device.\n\n- Without Pro Plan: share the card image; advanced editing is paused\n- With Pro Plan: edit anytime, generate vCard, QR Code, and interactive preview — all within the app\n\nClient data, estimates, and cash entries never appear on the card." },
    { heading: "Google services used", body: "| Service | Purpose | What is sent |\n|---------|---------|-------------|\n| Google Play Billing | Manage subscription | Purchase data (handled by Google) |\n| Firebase Analytics | Measure app usage | Generic events (no names or financial values) |\n| Firebase Remote Config | App configuration | No personal data |\n| Cloud Firestore | Freemium limit control per device | Anonymous device ID — no clients, estimates, or cash |\n\nFirebase Analytics only records generic navigation events — no client names, financial values, or estimate content." },
    { heading: "Notifications", body: "Local reminders only for fiscal obligations. Nothing is sent to external servers." },
    { heading: "How long we keep data", body: "- On your device: until you delete all data or uninstall the app\n- Firebase (technical): request deletion by email within 15 business days" },
    { heading: "Your rights", body: "At any time you can:\n- View and edit your data in the app\n- Export your data (backup)\n- Delete everything: Settings → Data on this device → Delete all data\n- Request deletion of technical data (Firebase): suporte@perfectgestdev.com" },
    { heading: "Children", body: "The app is for adults (18+) and entrepreneurs only." },
    { heading: "Updates to this policy", body: "Significant changes will be communicated in the app. The latest version is always at the link below." },
    { heading: "Links", body: "- Privacy policy\n- FAQ\n- Data deletion\n- Terms and Conditions" }
  ],
  es: [
    { heading: "Introducción", body: "Última actualización: 7 de julio de 2026\nDesarrollador: Marcos Leandro dos Santos · suporte@perfectgestdev.com" },
    { heading: "Sus datos permanecen en su teléfono", body: "PerfectGest I está diseñado para funcionar sin internet en el día a día. De forma predeterminada:\n\n- Clientes, presupuestos, caja, órdenes de servicio y datos de la empresa quedan solo en su dispositivo\n- La app no envía estos datos a nuestros servidores automáticamente\n- La app no tiene anuncios y no rastrea lo que usted registra" },
    { heading: "Qué guarda la app", body: "Datos que usted introduce (quedan en el dispositivo)\n\n| Tipo | Ejemplos |\n|------|----------|\n| Clientes | Nombre, contacto, historial |\n| Presupuestos | Ítems, valores, estado |\n| Caja | Ingresos, gastos, categorías |\n| Órdenes de servicio | Descripción, valores |\n| Datos de la empresa | Nombre, ID fiscal, logo, contactos |\n| Preferencias | Tema, configuración de la app |\n\nQué no recopila la app\n\n- Su ubicación (GPS)\n- Contactos del teléfono\n- Historial de navegación\n- Ningún dato publicitario" },
    { heading: "Cuándo los datos salen de su dispositivo", body: "Los datos solo salen de su teléfono cuando usted decide compartir:\n\n| Acción | Qué se envía |\n|--------|-------------|\n| Compartir un PDF (presupuesto, caja, informe) | El PDF generado en ese momento |\n| Compartir tarjeta de visita (PNG o vCard) | Solo datos profesionales — nunca clientes ni finanzas |\n| Exportar backup | Archivo con sus datos (guárdelo en lugar seguro) |\n\nRecomendamos usar backup con contraseña (Plan Pro) para mayor seguridad." },
    { heading: "Uso gratuito y Plan Pro", body: "Uso gratuito (freemium): cree 1 cliente, 1 presupuesto y 1 movimiento de caja sin suscripción. Estos límites son permanentes — no tienen fecha de vencimiento.\n\nPlan Pro: uso ilimitado + backup con contraseña + tarjeta de visita completa. Suscripción mensual o anual en Google Play." },
    { heading: "Tarjeta de visita digital", body: "La tarjeta usa datos de la pestaña Empresa (nombre, logo, contactos profesionales). Estos datos quedan en el dispositivo.\n\n- Sin Plan Pro: comparta la imagen de la tarjeta; la edición avanzada queda pausada\n- Con Plan Pro: edite cuando quiera, genere vCard, QR y vista previa interactiva — todo en la app\n\nLos datos de clientes, presupuestos y caja nunca aparecen en la tarjeta." },
    { heading: "Servicios de Google utilizados", body: "| Servicio | Para qué | Qué se envía |\n|---------|---------|-------------|\n| Google Play Billing | Gestionar suscripción | Datos de compra (gestionados por Google) |\n| Firebase Analytics | Medir uso de la app | Eventos genéricos (sin nombres ni valores financieros) |\n| Firebase Remote Config | Configuración de la app | Ningún dato personal |\n| Cloud Firestore | Control del límite gratuito por dispositivo | ID anónimo del dispositivo — sin clientes, presupuestos ni caja |\n\nFirebase Analytics solo registra eventos genéricos de navegación — sin nombres de clientes, valores financieros ni contenido de presupuestos." },
    { heading: "Notificaciones", body: "Solo recordatorios locales para obligaciones fiscales. Nada se envía a servidores externos." },
    { heading: "Por cuánto tiempo guardamos sus datos", body: "- En el dispositivo: hasta que elimine todos los datos o desinstale la app\n- Firebase (técnico): solicite la eliminación por email en un plazo de 15 días hábiles" },
    { heading: "Sus derechos", body: "En cualquier momento puede:\n- Ver y editar sus datos en la app\n- Exportar sus datos (backup)\n- Eliminar todo: Ajustes → Datos en el dispositivo → Eliminar todos los datos\n- Solicitar eliminación de datos técnicos (Firebase): suporte@perfectgestdev.com" },
    { heading: "Menores de edad", body: "La app es para adultos (18 años o más) y emprendedores." },
    { heading: "Actualizaciones de esta política", body: "Los cambios relevantes se comunicarán en la app. La versión más reciente siempre está en el enlace de abajo." },
    { heading: "Enlaces", body: "- Política de privacidad\n- FAQ\n- Eliminación de datos\n- Términos y Condiciones" }
  ],
};

const terms = {
  pt: [
    { heading: "Introdução", body: "Última atualização: 7 de julho de 2026" },
    { heading: "O que é o app", body: "O PerfectGest I é um aplicativo de gestão para autônomos e pequenas empresas. Você gerencia clientes, orçamentos, caixa, ordens de serviço, lembretes fiscais e cartão de visita digital — tudo guardado no seu celular.\n\nOs dados de clientes e financeiros não são enviados automaticamente para servidores. Só saem do aparelho por ação sua (compartilhar PDF, backup exportado ou cartão de visita).\n\nResponsável pelo app: Marcos Leandro dos Santos · suporte@perfectgestdev.com" },
    { heading: "Quem pode usar", body: "Pessoas com 18 anos ou mais." },
    { heading: "Uso gratuito e Plano Pro", body: "Uso gratuito (freemium): sem assinar nada, você pode criar 1 cliente, 1 orçamento e 1 lançamento de caixa. Esses limites são permanentes — não têm prazo de vencimento.\n\nPlano Pro: uso ilimitado (clientes, orçamentos, caixa, PDFs), backup com senha e cartão de visita com edição completa. Assinatura mensal ou anual via Google Play.\n\nA assinatura renova automaticamente até você cancelar na Play Store → Pagamentos e subscrições → Subscrições." },
    { heading: "Cancelamento e reembolso", body: "O cancelamento é feito na Google Play. Reembolsos seguem a política da Google Play Store. Quando aplicável no Brasil (CDC), você tem 7 dias corridos para arrependimento." },
    { heading: "Lembretes fiscais", body: "São informativos. Não substituem um contador ou assessor fiscal. A responsabilidade pelas obrigações fiscais é sempre do usuário." },
    { heading: "Limitação de responsabilidade", body: "O app é uma ferramenta de apoio. Não substitui assessoria profissional (contábil, jurídica, financeira). As decisões de negócio são de sua responsabilidade." },
    { heading: "Propriedade intelectual", body: "Você recebe uma licença de uso, não exclusiva e não transferível. É proibido copiar, modificar ou fazer engenharia reversa do app." },
    { heading: "Alterações nestes termos", body: "A versão vigente está sempre publicada no link abaixo. Mudanças relevantes serão comunicadas no app." },
    { heading: "Foro", body: "Leis do Brasil. Foro: Caxias do Sul — RS, respeitados os direitos do consumidor." },
    { heading: "Contato", body: "suporte@perfectgestdev.com" },
    { heading: "Links", body: "- Política de privacidade\n- FAQ\n- Exclusão de dados\n- Termos e Condições" }
  ],
  en: [
    { heading: "Introduction", body: "Last updated: 7 July 2026" },
    { heading: "What is the app", body: "PerfectGest I is a business management app for freelancers and small businesses. Manage clients, estimates, cash, service orders, fiscal reminders, and a digital business card — all stored on your device.\n\nClient and financial data are not sent automatically to servers. They only leave your device if you choose to share a PDF, exported backup, or business card.\n\nDeveloper: Marcos Leandro dos Santos · suporte@perfectgestdev.com" },
    { heading: "Who can use it", body: "Users 18 years or older." },
    { heading: "Free use and Pro Plan", body: "Free use (freemium): without subscribing, you can create 1 client, 1 estimate, and 1 cash entry. These limits are permanent — they do not expire.\n\nPro Plan: unlimited use (clients, estimates, cash, PDFs), password-protected backup, and full business card features. Monthly or annual subscription via Google Play.\n\nSubscriptions renew automatically until you cancel in Google Play → Payments & subscriptions → Subscriptions." },
    { heading: "Cancellation and refunds", body: "Cancel via Google Play. Refunds follow Google Play Store policy. In Brazil, a 7-day right of withdrawal applies when applicable (Consumer Protection Code)." },
    { heading: "Fiscal reminders", body: "Informational only. They do not replace a qualified accountant. The user is responsible for all fiscal obligations." },
    { heading: "Limitation of liability", body: "The app is a support tool. It does not replace professional advice (accounting, legal, financial). Business decisions are the user's responsibility." },
    { heading: "Intellectual property", body: "You receive a non-exclusive, non-transferable license to use the app. Reverse engineering and unauthorized copying are prohibited." },
    { heading: "Changes to these terms", body: "The current version is always published at the link below. Significant changes will be communicated in the app." },
    { heading: "Governing law", body: "Laws of Brazil. Jurisdiction: Caxias do Sul — RS, without prejudice to consumer rights." },
    { heading: "Contact", body: "suporte@perfectgestdev.com" },
    { heading: "Links", body: "- Privacy policy\n- FAQ\n- Data deletion\n- Terms and Conditions" }
  ],
  es: [
    { heading: "Introducción", body: "Última actualización: 7 de julio de 2026" },
    { heading: "¿Qué es la app?", body: "PerfectGest I es una app de gestión para autónomos y pequeñas empresas. Gestione clientes, presupuestos, caja, órdenes de servicio, recordatorios fiscales y tarjeta de visita digital — todo guardado en su dispositivo.\n\nLos datos de clientes y financieros no se envían automáticamente a servidores. Solo salen del dispositivo si usted elige compartir un PDF, backup exportado o tarjeta de visita.\n\nDesarrollador: Marcos Leandro dos Santos · suporte@perfectgestdev.com" },
    { heading: "¿Quién puede usar la app?", body: "Personas mayores de 18 años." },
    { heading: "Uso gratuito y Plan Pro", body: "Uso gratuito (freemium): sin suscripción, puede crear 1 cliente, 1 presupuesto y 1 movimiento de caja. Estos límites son permanentes — no tienen fecha de vencimiento.\n\nPlan Pro: uso ilimitado (clientes, presupuestos, caja, PDFs), backup con contraseña y tarjeta de visita completa. Suscripción mensual o anual en Google Play.\n\nLa suscripción se renueva automáticamente hasta que la cancele en Google Play → Pagos y suscripciones → Suscripciones." },
    { heading: "Cancelación y reembolsos", body: "Cancele en Google Play. Los reembolsos siguen la política de Google Play Store." },
    { heading: "Recordatorios fiscales", body: "Son informativos. No reemplazan a un asesor contable. El usuario es responsable de todas sus obligaciones fiscales." },
    { heading: "Limitación de responsabilidad", body: "La app es una herramienta de apoyo. No reemplaza asesoramiento profesional (contable, legal, financiero). Las decisiones de negocio son responsabilidad del usuario." },
    { heading: "Propiedad intelectual", body: "Usted recibe una licencia de uso no exclusiva e intransferible. Está prohibido copiar, modificar o realizar ingeniería inversa de la app." },
    { heading: "Cambios en estos términos", body: "La versión vigente siempre está publicada en el enlace de abajo. Los cambios relevantes se comunicarán en la app." },
    { heading: "Ley aplicable y jurisdicción", body: "Leyes de Brasil. Jurisdicción: Caxias do Sul — RS, sin perjuicio de los derechos del consumidor." },
    { heading: "Contacto", body: "suporte@perfectgestdev.com" },
    { heading: "Enlaces", body: "- Política de privacidad\n- FAQ\n- Eliminación de datos\n- Términos y Condiciones" }
  ],
};

const deletion = {
  pt: [
    { heading: "Introdução", body: "Última atualização: 7 de julho de 2026\nO PerfectGest I guarda seus dados só no celular. Você tem controle total." },
    { heading: "O que pode ser apagado pelo app", body: "Ao eliminar os dados, tudo isso é removido do seu celular:\n\n- Lista de clientes e histórico\n- Orçamentos, valores e itens\n- Lançamentos de caixa (entradas e saídas)\n- Ordens de serviço\n- Dados da empresa (nome, logo, contatos)\n- Cartão de visita digital salvo no app\n- Lembretes fiscais configurados\n- Preferências e configurações" },
    { heading: "Como apagar tudo no app", body: "Configurações → Dados no dispositivo → Eliminar todos os dados neste aparelho\n\nTambém é possível pelo Android: Configurações do celular → Apps → PerfectGest I → Armazenamento → Limpar dados.\n\nDesinstalar o app também remove os dados locais.\n\nAtenção: sem backup exportado, não é possível recuperar os dados. O app não mantém cópias nos nossos servidores." },
    { heading: "O que não é apagado automaticamente", body: "- PDFs que você exportou para outros apps\n- Backups que você enviou por WhatsApp, e-mail ou guardou em nuvem pessoal — apague manualmente nesses locais\n- Registro da compra na Google Play" },
    { heading: "Dados técnicos (Firebase)", body: "O app usa Firebase para controlar o limite gratuito por aparelho (ID anônimo — sem seus dados de clientes ou financeiro). Para pedir a exclusão desses dados técnicos:\n\nE-mail: suporte@perfectgestdev.com\nAssunto: Solicitação de Exclusão de Dados Técnicos\nPrazo: até 15 dias úteis" },
    { heading: "Prazos", body: "| Ação | Prazo |\n|------|-------|\n| Apagar do celular | Imediato |\n| Exclusão de dados técnicos Firebase | Até 15 dias úteis |" },
    { heading: "Links", body: "- Política de privacidade\n- FAQ\n- Exclusão de dados\n- Termos e Condições" }
  ],
  en: [
    { heading: "Introduction", body: "Last updated: 7 July 2026\nPerfectGest I stores your data only on your device. You have full control." },
    { heading: "What can be deleted from the app", body: "Deleting data removes everything from your phone:\n\n- Client list and history\n- Estimates, amounts, and items\n- Cash entries (income and expenses)\n- Service orders\n- Company data (name, logo, contacts)\n- Digital business card saved in the app\n- Fiscal reminders\n- Preferences and settings" },
    { heading: "How to delete everything in the app", body: "Settings → Data on this device → Delete all data on this device\n\nYou can also use Android settings: Phone Settings → Apps → PerfectGest I → Storage → Clear data.\n\nUninstalling the app also removes all local data.\n\nWarning: without an exported backup, data cannot be recovered. We do not keep copies on our servers." },
    { heading: "What is NOT automatically deleted", body: "- PDFs you exported to other apps\n- Backups you sent via WhatsApp, email, or personal cloud — delete them manually in those locations\n- Your purchase record on Google Play" },
    { heading: "Technical data (Firebase)", body: "The app uses Firebase to control the free usage limit per device (anonymous ID — no client or financial data). To request deletion of this technical data:\n\nEmail: suporte@perfectgestdev.com\nSubject: Technical Data Deletion Request\nResponse time: up to 15 business days" },
    { heading: "Timelines", body: "| Action | Timeline |\n|--------|----------|\n| Delete from device | Immediate |\n| Firebase technical data deletion | Up to 15 business days |" },
    { heading: "Links", body: "- Privacy policy\n- FAQ\n- Data deletion\n- Terms and Conditions" }
  ],
  es: [
    { heading: "Introducción", body: "Última actualización: 7 de julio de 2026\nPerfectGest I guarda sus datos solo en su dispositivo. Usted tiene el control total." },
    { heading: "Qué puede eliminarse desde la app", body: "Al eliminar los datos, todo esto se borra de su teléfono:\n\n- Lista de clientes e historial\n- Presupuestos, valores e ítems\n- Movimientos de caja (ingresos y gastos)\n- Órdenes de servicio\n- Datos de la empresa (nombre, logo, contactos)\n- Tarjeta de visita digital guardada en la app\n- Recordatorios fiscales configurados\n- Preferencias y configuración" },
    { heading: "Cómo eliminar todo en la app", body: "Ajustes → Datos en el dispositivo → Eliminar todos los datos en este dispositivo\n\nTambién puede usar los ajustes de Android: Configuración del teléfono → Aplicaciones → PerfectGest I → Almacenamiento → Borrar datos.\n\nDesinstalar la app también elimina todos los datos locales.\n\nAtención: sin un backup exportado, los datos no se pueden recuperar. No guardamos copias en nuestros servidores." },
    { heading: "Qué NO se elimina automáticamente", body: "- PDFs que exportó a otras apps\n- Backups enviados por WhatsApp, email o guardados en nube personal — elimínelos manualmente en esos lugares\n- El registro de compra en Google Play" },
    { heading: "Datos técnicos (Firebase)", body: "La app usa Firebase para controlar el límite gratuito por dispositivo (ID anónimo — sin datos de clientes ni financieros). Para solicitar la eliminación de estos datos técnicos:\n\nEmail: suporte@perfectgestdev.com\nAsunto: Solicitud de Eliminación de Datos Técnicos\nPlazo de respuesta: hasta 15 días hábiles" },
    { heading: "Plazos", body: "| Acción | Plazo |\n|--------|-------|\n| Eliminar del dispositivo | Inmediato |\n| Eliminación de datos técnicos Firebase | Hasta 15 días hábiles |" },
    { heading: "Enlaces", body: "- Política de privacidad\n- FAQ\n- Eliminación de datos\n- Términos y Condiciones" }
  ],
};

const faq = {
  pt: [
    { heading: "Introdução", body: "Última atualização: 7 de julho de 2026" },
    { heading: "O que é o PerfectGest I?", body: "Um app de gestão no celular para autônomos e pequenas empresas. Clientes, orçamentos, caixa, ordens de serviço e lembretes fiscais — tudo guardado só no seu celular, sem conta na nuvem." },
    { heading: "Preciso de internet para usar?", body: "No dia a dia, não precisa. O app funciona offline. Só precisam de internet:\n- Assinar ou restaurar um plano (Google Play)\n- Verificar atualizações do app" },
    { heading: "Posso usar de graça?", body: "Sim! Sem assinar nada, você pode criar:\n- 1 cliente\n- 1 orçamento (com PDF)\n- 1 lançamento de caixa (com PDF)\n\nEsses limites são permanentes — sem prazo para vencer. Para usar sem limites, assine o Plano Pro em Configurações → Assinatura Google Play." },
    { heading: "O que é o Plano Pro?", body: "Com o Plano Pro (mensal ou anual na Google Play) você tem:\n- Clientes, orçamentos e lançamentos ilimitados\n- PDFs ilimitados\n- Backup com proteção por senha\n- Cartão de visita digital com edição, vCard, QR e preview interativo" },
    { heading: "Como compro ou gerencio minha assinatura?", body: "Configurações → Assinatura Google Play\n\nPara cancelar: Google Play → Pagamentos e subscrições → Subscrições." },
    { heading: "O que é o cartão de visita digital?", body: "Na aba Empresa você configura seus dados profissionais (nome, contatos, logo, slogan). O app gera um cartão digital que você pode compartilhar como imagem (PNG) ou vCard.\n\n- Sem Plano Pro: pode criar o primeiro cartão e compartilhar a imagem; edição e funções avançadas ficam pausadas.\n- Com Plano Pro: edita quando quiser, gera QR Code, exporta vCard e compartilha.\n\nDados de clientes e financeiros nunca entram no cartão — ficam só no seu celular." },
    { heading: "Meus dados de clientes e financeiros estão seguros?", body: "Sim. Tudo fica guardado localmente no seu celular. Só saem do aparelho se você escolher compartilhar:\n- Um PDF de orçamento, caixa ou relatório\n- A imagem ou vCard do cartão de visita (só dados profissionais)\n- Um arquivo de backup que você mesmo exportou\n\nRecomendamos usar backup com senha (Plano Pro) para maior segurança." },
    { heading: "O que são os lembretes fiscais?", body: "Alertas no celular para obrigações como DAS, declarações e outros vencimentos de MEI, autônomos e ME. São informativos — não substituem um contador." },
    { heading: "O que são os \"Últimos lançamentos\" na tela inicial?", body: "Atalhos rápidos para o último cliente, orçamento, ordem de serviço e lançamento de caixa que você registrou." },
    { heading: "O app manda notificações?", body: "Apenas lembretes locais para obrigações fiscais. Nada é enviado para servidores externos." },
    { heading: "O app tem anúncios?", body: "Não." },
    { heading: "Em quais idiomas está disponível?", body: "Português (Brasil), Inglês e Espanhol." },
    { heading: "Como apago todos os dados do celular?", body: "Configurações → Dados no dispositivo → Eliminar todos os dados neste aparelho\n\nPDFs e backups que você já exportou para outros apps ou serviços não são apagados por esse botão — exclua-os manualmente onde os guardou." },
    { heading: "Como entro em contato ou dou sugestões?", body: "Aba Empresa → Dê sua contribuição ou e-mail: suporte@perfectgestdev.com" },
    { heading: "Links", body: "- Política de privacidade\n- FAQ\n- Exclusão de dados\n- Termos e Condições" }
  ],
  en: [
    { heading: "Introdução", body: "Last updated: 7 July 2026" },
    { heading: "What is PerfectGest I?", body: "A mobile business management app for freelancers and small businesses. Manage clients, estimates, cash, service orders, and fiscal reminders — all stored locally on your phone, no cloud account required." },
    { heading: "Does it work offline?", body: "Yes. Daily use (clients, estimates, cash) works offline. Internet is only needed to subscribe or restore a plan via Google Play." },
    { heading: "Can I use it for free?", body: "Yes! Without subscribing, you can create:\n- 1 client\n- 1 estimate (with PDF)\n- 1 cash entry (with PDF)\n\nThese limits are permanent — they don't expire. For unlimited use, subscribe to the Pro Plan in Settings → Google Play subscription." },
    { heading: "What is the Pro Plan?", body: "With Pro Plan (monthly or annual on Google Play) you get:\n- Unlimited clients, estimates, and cash entries\n- Unlimited PDFs\n- Password-protected backup\n- Full digital business card (edit, vCard, QR, interactive preview)" },
    { heading: "Where do I manage my subscription?", body: "Settings → Google Play subscription\n\nTo cancel: Google Play → Payments & subscriptions → Subscriptions." },
    { heading: "What is the digital business card?", body: "In the Company tab, set up your professional details (name, contacts, logo, tagline). The app generates a digital card you can share as an image (PNG) or vCard.\n\n- Without Pro Plan: create your first card and share the image; editing and advanced features are paused.\n- With Pro Plan: edit anytime, generate QR Code, export vCard, interactive preview — all inside the app.\n\nClient and financial data never appear on the card — they stay only on your phone." },
    { heading: "Are my client and financial data protected?", body: "Yes. Everything is stored locally. Data only leaves your device when you choose to share:\n- A PDF (estimate, cash report, etc.)\n- A business card image or vCard (professional details only — never clients or financials)\n- An exported backup file\n\nWe recommend using a password-protected backup (Pro Plan) for extra security." },
    { heading: "What are fiscal reminders?", body: "On-device alerts for MEI, freelancer, and ME obligations. Informational only — they don't replace an accountant." },
    { heading: "Does the app send notifications?", body: "Only local reminders for fiscal obligations. Nothing is sent to external servers." },
    { heading: "Does the app have ads?", body: "No." },
    { heading: "What languages are supported?", body: "Portuguese (Brazil), English, and Spanish." },
    { heading: "How do I delete all my data?", body: "Settings → Data on this device → Delete all data on this device\n\nPDFs and backups you already exported to other apps are not deleted by this — remove them manually where you saved them." },
    { heading: "How do I contact support or send feedback?", body: "Company tab → Share your feedback, or email: suporte@perfectgestdev.com" },
    { heading: "Links", body: "- Privacy policy\n- FAQ\n- Data deletion\n- Terms and Conditions" }
  ],
  es: [
    { heading: "Introdução", body: "Última actualización: 7 de julio de 2026" },
    { heading: "¿Qué es PerfectGest I?", body: "Una app de gestión empresarial para autónomos y pequeñas empresas. Gestione clientes, presupuestos, caja, órdenes de servicio y recordatorios fiscales — todo guardado solo en su teléfono, sin cuenta en la nube." },
    { heading: "¿Funciona sin internet?", body: "Sí. El uso diario (clientes, presupuestos, caja) funciona sin conexión. Solo necesita internet para suscribirse o restaurar un plan en Google Play." },
    { heading: "¿Puedo usarlo gratis?", body: "¡Sí! Sin suscripción, puede crear:\n- 1 cliente\n- 1 presupuesto (con PDF)\n- 1 movimiento de caja (con PDF)\n\nEstos límites son permanentes — no tienen fecha de vencimiento. Para uso ilimitado, suscríbase al Plan Pro en Ajustes → Suscripción de Google Play." },
    { heading: "¿Qué es el Plan Pro?", body: "Con el Plan Pro (mensual o anual en Google Play) tiene:\n- Clientes, presupuestos y movimientos de caja ilimitados\n- PDFs ilimitados\n- Backup con contraseña\n- Tarjeta de visita digital completa (edición, vCard, QR, vista previa interactiva)" },
    { heading: "¿Dónde gestiono mi suscripción?", body: "Ajustes → Suscripción de Google Play\n\nPara cancelar: Google Play → Pagos y suscripciones → Suscripciones." },
    { heading: "¿Qué es la tarjeta de visita digital?", body: "En la pestaña Empresa, configure sus datos profesionales (nombre, contactos, logo, eslogan). La app genera una tarjeta digital que puede compartir como imagen (PNG) o vCard.\n\n- Sin Plan Pro: cree su primera tarjeta y comparta la imagen; la edición y funciones avanzadas quedan pausadas.\n- Con Plan Pro: edite cuando quiera, genere QR, exporte vCard y vista previa interactiva — todo en la app.\n\nLos datos de clientes y financieros nunca aparecen en la tarjeta — quedan solo en su teléfono." },
    { heading: "¿Están protegidos mis datos de clientes y financieros?", body: "Sí. Todo se guarda localmente. Los datos solo salen del dispositivo cuando usted elige compartir:\n- Un PDF (presupuesto, caja, informe)\n- La imagen o vCard de la tarjeta (solo datos profesionales — nunca clientes ni finanzas)\n- Un archivo de backup exportado\n\nRecomendamos usar backup con contraseña (Plan Pro) para mayor seguridad." },
    { heading: "¿Qué son los recordatorios fiscales?", body: "Alertas locales para obligaciones fiscales de autónomos y pequeñas empresas. Son informativos — no reemplazan a un asesor contable." },
    { heading: "¿La app envía notificaciones?", body: "Solo recordatorios locales para obligaciones fiscales. Nada se envía a servidores externos." },
    { heading: "¿La app tiene anuncios?", body: "No." },
    { heading: "¿En qué idiomas está disponible?", body: "Portugués (Brasil), Inglés y Español." },
    { heading: "¿Cómo elimino todos mis datos?", body: "Ajustes → Datos en el dispositivo → Eliminar todos los datos en este dispositivo\n\nLos PDFs y backups ya exportados a otras apps no se eliminan con esto — elimínelos manualmente donde los guardó." },
    { heading: "¿Cómo contacto el soporte o envío sugerencias?", body: "Pestaña Empresa → Dé su contribución, o por email: suporte@perfectgestdev.com" },
    { heading: "Enlaces", body: "- Política de privacidad\n- FAQ\n- Eliminación de datos\n- Términos y Condiciones" }
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
