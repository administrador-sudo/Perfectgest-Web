/** Conteúdo estático Clinica III — fonte paralela a lib/l10n/clinica_iii_legal_texts.dart */
const PRODUCT = 'PerfectGest-Clinica III';
const FANTASY = 'Perfect Gest Dev';
const LEGAL_NAME = 'PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA';
const CNPJ = '66.889.409/0001-19';
const EMAIL = 'suporte@perfectgestdev.com';
const ADDRESS = 'Caxias do Sul — RS — Brasil';

const header = {
  pt:
    `${LEGAL_NAME}\n` +
    `Nome fantasia: ${FANTASY} · CNPJ ${CNPJ}\n` +
    `${ADDRESS} · ${EMAIL}\n\n` +
    'Papéis no tratamento (LGPD)\n' +
    '• Controlador dos dados clínicos dos pacientes: a clínica ou o profissional de saúde que utiliza o software ' +
    '(define finalidades e meios do tratamento no contexto da assistência).\n' +
    `• Operador do software: ${FANTASY} (${LEGAL_NAME}) — desenvolve e mantém a ferramenta; ` +
    'não decide sobre o conteúdo clínico inserido pela clínica.\n' +
    '• Direitos do titular (dados de saúde): dirigir-se primeiro à clínica (controlador). ' +
    `Suporte técnico do produto: ${EMAIL}.`,
  en:
    `${LEGAL_NAME}\n` +
    `Trade name: ${FANTASY} · CNPJ ${CNPJ}\n` +
    `${ADDRESS} · ${EMAIL}\n\n` +
    'Roles in processing (LGPD)\n' +
    '• Controller of patients\' clinical data: the clinic or health professional using the software ' +
    '(defines purposes and means of processing in the care context).\n' +
    `• Software operator: ${FANTASY} (${LEGAL_NAME}) — develops and maintains the tool; ` +
    'does not decide on clinical content entered by the clinic.\n' +
    '• Data subject rights (health data): contact the clinic first (controller). ' +
    `Product technical support: ${EMAIL}.`,
  es:
    `${LEGAL_NAME}\n` +
    `Nombre comercial: ${FANTASY} · CNPJ ${CNPJ}\n` +
    `${ADDRESS} · ${EMAIL}\n\n` +
    'Roles en el tratamiento (LGPD)\n' +
    '• Controlador de los datos clínicos de los pacientes: la clínica o el profesional de salud que utiliza el software ' +
    '(define finalidades y medios del tratamiento en el contexto de la asistencia).\n' +
    `• Operador del software: ${FANTASY} (${LEGAL_NAME}) — desarrolla y mantiene la herramienta; ` +
    'no decide sobre el contenido clínico introducido por la clínica.\n' +
    '• Derechos del titular (datos de salud): dirigirse primero a la clínica (controlador). ' +
    `Soporte técnico del producto: ${EMAIL}.`,
};

const lastUpdated = {
  pt: 'Última atualização: 16/06/2026',
  en: 'Last updated: 16 June 2026',
  es: 'Última actualización: 16/06/2026',
};

const labels = {
  pt: { privacy: 'Política de Privacidade', terms: 'Termos de Serviço', health: 'Dados de saúde e LGPD' },
  en: { privacy: 'Privacy Policy', terms: 'Terms of Service', health: 'Health data and LGPD' },
  es: { privacy: 'Política de Privacidad', terms: 'Términos de Servicio', health: 'Datos de salud y LGPD' },
};

const privacy = {
  pt: [
    { heading: '1. Escopo', body: `O ${PRODUCT} é um sistema de gestão clínica para Windows. O app armazena dados clínicos localmente no dispositivo (contentor MSIX). A clínica ou profissional que utiliza o software é responsável pela inserção e gestão dos dados.` },
    { heading: '2. Dados tratados', body: `O app trata dados inseridos pelo utilizador (ex.: pacientes, prontuário, agenda, equipa). Por padrão, não enviamos conteúdo clínico para a nuvem.\n\n2.1 Dados locais (por padrão)\n• Pacientes e prontuário (saúde) — SQLite local\n• Agenda e registos de operação — SQLite local\n• Sessão/conta local e perfis (ADMIN/DOUTOR/OPERADOR) — SQLite local\n\n2.2 Dados que podem sair do dispositivo (opcionais / por configuração)\n• Pagamentos de subscrição: Microsoft Store (Microsoft Corporation). A ${FANTASY} não armazena dados de cartão.\n• WhatsApp Cloud API: se configurado pela clínica, mensagens são enviadas à Meta (WhatsApp).\n• Firebase (opcional): licenças remotas e configurações técnicas (sem prontuário).\n• Relatório técnico de instabilidade (com consentimento): relatório anónimo, sem dados de paciente.` },
    { heading: '3. Finalidades', body: '• Operar as funcionalidades do app (gestão clínica e organizacional)\n• Suporte técnico quando solicitado\n• Cumprimento de obrigações legais/regulatórias' },
    { heading: '4. Base legal (LGPD)', body: 'O tratamento de dados de saúde ocorre no contexto da clínica (controlador). O software oferece mecanismos de segurança e auditoria para apoiar a conformidade.' },
    { heading: '5. Segurança', body: '• Auditoria de acesso: metadados (sem conteúdo clínico no log), retenção configurável\n• Backup encriptado (ZIP): AES-256 + manifesto HMAC\n• Encriptação da base de dados (opcional): SQLite + passphrase no Credential Locker do Windows' },
    { heading: '6. Retenção e eliminação', body: '• Dados no dispositivo enquanto o app estiver instalado\n• Desinstalação remove dados do contentor MSIX; backups exportados ficam sob responsabilidade da clínica' },
    { heading: '7. Direitos do titular', body: `• Acesso/correção via ficha do paciente\n• Relatório LGPD (ADMIN) em PDF/CSV\n• Portabilidade via backup encriptado\n• Pedidos adicionais: contactar a clínica (controlador) ou ${EMAIL} (suporte técnico)` },
    { heading: '8. Contato', body: EMAIL },
  ],
  en: [
    { heading: '1. Scope', body: `${PRODUCT} is a clinical management system for Windows. The app stores clinical data locally on the device (MSIX container). The clinic or health professional using the software is responsible for entering and managing data.` },
    { heading: '2. Data processed', body: `The app processes data entered by the user (e.g. patients, medical records, schedule, team). By default, we do not send clinical content to the cloud.\n\n2.1 Local data (by default)\n• Patients and medical records (health) — local SQLite\n• Schedule and operation logs — local SQLite\n• Local session/account and roles (ADMIN/DOCTOR/OPERATOR) — local SQLite\n\n2.2 Data that may leave the device (optional / by configuration)\n• Subscription payments: Microsoft Store (Microsoft Corporation). ${FANTASY} does not store card data.\n• WhatsApp Cloud API: if configured by the clinic, messages are sent to Meta (WhatsApp).\n• Firebase (optional): remote licenses and technical settings (no medical records).\n• Technical crash report (with consent): anonymous report with no patient data.` },
    { heading: '3. Purposes', body: '• Operate app features (clinical and organizational management)\n• Technical support when requested\n• Compliance with legal/regulatory obligations' },
    { heading: '4. Legal basis (LGPD)', body: 'Health data processing occurs in the clinic\'s context (controller). The software provides security and audit mechanisms to support compliance.' },
    { heading: '5. Security', body: '• Access audit: metadata (no clinical content in logs), configurable retention\n• Encrypted backup (ZIP): AES-256 + HMAC manifest\n• Database encryption (optional): SQLite + passphrase in Windows Credential Locker' },
    { heading: '6. Retention and deletion', body: '• Data remains on the device while the app is installed\n• Uninstalling removes data from the MSIX container; exported backups remain the clinic\'s responsibility' },
    { heading: '7. Data subject rights', body: `• Access/correction via patient record\n• LGPD report (ADMIN) in PDF/CSV\n• Portability via encrypted backup\n• Additional requests: contact the clinic (controller) or ${EMAIL} (technical support)` },
    { heading: '8. Contact', body: EMAIL },
  ],
  es: [
    { heading: '1. Alcance', body: `${PRODUCT} es un sistema de gestion clinica para Windows. La app almacena datos clinicos localmente en el dispositivo (contenedor MSIX). La clinica o profesional que utiliza el software es responsable de la insercion y gestion de los datos.` },
    { heading: '2. Datos tratados', body: `La app trata datos introducidos por el usuario (ej.: pacientes, historial clinico, agenda, equipo). Por defecto, no enviamos contenido clinico a la nube.\n\n2.1 Datos locales (por defecto)\n• Pacientes e historial clinico (salud) — SQLite local\n• Agenda y registros de operacion — SQLite local\n• Sesion/cuenta local y perfiles (ADMIN/MEDICO/OPERADOR) — SQLite local\n\n2.2 Datos que pueden salir del dispositivo (opcionales / por configuracion)\n• Pagos de suscripcion: Microsoft Store (Microsoft Corporation). ${FANTASY} no almacena datos de tarjeta.\n• WhatsApp Cloud API: si lo configura la clinica, los mensajes se envian a Meta (WhatsApp).\n• Firebase (opcional): licencias remotas y configuracion tecnica (sin historial clinico).\n• Informe tecnico de inestabilidad (con consentimiento): informe anonimo sin datos de pacientes.` },
    { heading: '3. Finalidades', body: '• Operar las funcionalidades de la app (gestion clinica y organizacional)\n• Soporte tecnico cuando se solicite\n• Cumplimiento de obligaciones legales/regulatorias' },
    { heading: '4. Base legal (LGPD)', body: 'El tratamiento de datos de salud ocurre en el contexto de la clinica (controlador). El software ofrece mecanismos de seguridad y auditoria para apoyar el cumplimiento.' },
    { heading: '5. Seguridad', body: '• Auditoria de acceso: metadatos (sin contenido clinico en el registro), retencion configurable\n• Copia de seguridad cifrada (ZIP): AES-256 + manifiesto HMAC\n• Cifrado de base de datos (opcional): SQLite + passphrase en Credential Locker de Windows' },
    { heading: '6. Retencion y eliminacion', body: '• Los datos permanecen en el dispositivo mientras la app este instalada\n• La desinstalacion elimina datos del contenedor MSIX; las copias exportadas son responsabilidad de la clinica' },
    { heading: '7. Derechos del titular', body: `• Acceso/correccion via ficha del paciente\n• Informe LGPD (ADMIN) en PDF/CSV\n• Portabilidad via copia cifrada\n• Solicitudes adicionales: contactar la clinica (controlador) o ${EMAIL} (soporte tecnico)` },
    { heading: '8. Contacto', body: EMAIL },
  ],
};

const terms = {
  pt: [
    { heading: '1. Aceitação', body: `Ao instalar ou utilizar o ${PRODUCT}, o utilizador concorda com estes Termos.` },
    { heading: '2. Escopo', body: 'O app é uma ferramenta de apoio à gestão clínica e organizacional. Não substitui, em hipótese alguma, julgamento profissional, diagnóstico ou tratamento médico.' },
    { heading: '3. Contas e responsabilidades', body: '• O utilizador é responsável por manter as credenciais (utilizador e senha) em segurança.\n• A clínica ou profissional que utiliza o software é responsável pelo conteúdo inserido e pelo uso adequado do sistema.' },
    { heading: '4. Uso aceitável', body: 'É proibido:\n• usar o app para fins ilegais;\n• tentar contornar mecanismos de segurança;\n• introduzir código malicioso;\n• copiar, distribuir ou explorar comercialmente o software fora dos limites da licença.' },
    { heading: '5. Dados e backups', body: '• Os dados clínicos são armazenados localmente no dispositivo.\n• Backups exportados manualmente devem ser guardados com segurança pela clínica.' },
    { heading: '6. Compras na aplicação (Microsoft Store)', body: `Subscrições, quando aplicável, são processadas pela Microsoft Store (Microsoft Corporation). Pagamentos e gestão de subscrição são feitos pela conta Microsoft do utilizador. A ${FANTASY} não processa nem armazena dados de cartão.` },
    { heading: '7. Limitação de responsabilidade', body: 'Empregamos esforços para manter o app funcional e seguro, mas não garantimos operação ininterrupta. O uso do app e as decisões clínicas tomadas com base nos dados inseridos são de responsabilidade da clínica ou do profissional de saúde.' },
    { heading: '8. Encerramento', body: 'Podemos suspender o acesso em caso de violação destes Termos ou por exigência legal.' },
    { heading: '9. Alterações', body: 'Podemos actualizar estes Termos. A continuação do uso após alterações significativas significa aceitação da versão actualizada.' },
    { heading: '10. Contato', body: EMAIL },
  ],
  en: [
    { heading: '1. Acceptance', body: `By installing or using ${PRODUCT}, you agree to these Terms.` },
    { heading: '2. Scope', body: 'The app is a tool to support clinical and organizational management. It does not replace professional judgment, diagnosis, or medical treatment under any circumstances.' },
    { heading: '3. Accounts and responsibilities', body: '• You are responsible for keeping credentials (username and password) secure.\n• The clinic or professional using the software is responsible for content entered and proper use of the system.' },
    { heading: '4. Acceptable use', body: 'The following is prohibited:\n• using the app for illegal purposes;\n• attempting to bypass security mechanisms;\n• introducing malicious code;\n• copying, distributing, or commercially exploiting the software beyond the license limits.' },
    { heading: '5. Data and backups', body: '• Clinical data is stored locally on the device.\n• Manually exported backups must be kept secure by the clinic.' },
    { heading: '6. In-app purchases (Microsoft Store)', body: `Subscriptions, when applicable, are processed by the Microsoft Store (Microsoft Corporation). Payments and subscription management are handled through the user's Microsoft account. ${FANTASY} does not process or store card data.` },
    { heading: '7. Limitation of liability', body: 'We make efforts to keep the app functional and secure but do not guarantee uninterrupted operation. Use of the app and clinical decisions based on entered data are the responsibility of the clinic or health professional.' },
    { heading: '8. Termination', body: 'We may suspend access in case of violation of these Terms or legal requirement.' },
    { heading: '9. Changes', body: 'We may update these Terms. Continued use after significant changes means acceptance of the updated version.' },
    { heading: '10. Contact', body: EMAIL },
  ],
  es: [
    { heading: '1. Aceptacion', body: `Al instalar o utilizar ${PRODUCT}, el usuario acepta estos Terminos.` },
    { heading: '2. Alcance', body: 'La app es una herramienta de apoyo a la gestion clinica y organizacional. No sustituye, bajo ninguna circunstancia, el juicio profesional, el diagnostico o el tratamiento medico.' },
    { heading: '3. Cuentas y responsabilidades', body: '• El usuario es responsable de mantener las credenciales (usuario y contrasena) seguras.\n• La clinica o profesional que utiliza el software es responsable del contenido introducido y del uso adecuado del sistema.' },
    { heading: '4. Uso aceptable', body: 'Esta prohibido:\n• usar la app con fines ilegales;\n• intentar eludir mecanismos de seguridad;\n• introducir codigo malicioso;\n• copiar, distribuir o explotar comercialmente el software fuera de los limites de la licencia.' },
    { heading: '5. Datos y copias de seguridad', body: '• Los datos clinicos se almacenan localmente en el dispositivo.\n• Las copias exportadas manualmente deben guardarse de forma segura por la clinica.' },
    { heading: '6. Compras en la aplicacion (Microsoft Store)', body: `Las suscripciones, cuando apliquen, se procesan en Microsoft Store (Microsoft Corporation). Los pagos y la gestion de suscripcion se realizan mediante la cuenta Microsoft del usuario. ${FANTASY} no procesa ni almacena datos de tarjeta.` },
    { heading: '7. Limitacion de responsabilidad', body: 'Hacemos esfuerzos para mantener la app funcional y segura, pero no garantizamos operacion ininterrumpida. El uso de la app y las decisiones clinicas basadas en los datos introducidos son responsabilidad de la clinica o del profesional de salud.' },
    { heading: '8. Terminacion', body: 'Podemos suspender el acceso en caso de violacion de estos Terminos o por exigencia legal.' },
    { heading: '9. Cambios', body: 'Podemos actualizar estos Terminos. El uso continuado tras cambios significativos implica aceptacion de la version actualizada.' },
    { heading: '10. Contacto', body: EMAIL },
  ],
};

const health = {
  pt: [
    { heading: '1. Natureza dos dados', body: `O ${PRODUCT} pode tratar dados pessoais sensíveis (dados de saúde) inseridos pela clínica ou profissional que utiliza o software (ex.: prontuário e histórico de consultas).` },
    { heading: '2. Papéis LGPD', body: `• Controlador: clínica ou profissional de saúde que utiliza o software (define finalidades e meios do tratamento).\n• Operador do software: ${FANTASY} (${LEGAL_NAME}).\n• Suboperadores (quando aplicável):\n  — Microsoft (pagamentos de subscrição via Microsoft Store)\n  — Meta/WhatsApp (mensagens, se configurado pela clínica)\n  — Firebase/Google (componentes técnicos, se activados)` },
    { heading: '3. Minimização e armazenamento', body: '• Dados clínicos permanecem no dispositivo (SQLite local).\n• Logs de auditoria guardam metadados (quem / quando / o quê), sem conteúdo clínico.' },
    { heading: '4. Direitos do titular (Art. 18 LGPD)', body: 'O app oferece suporte operacional para:\n• acesso e correção via ficha do paciente;\n• exportação de relatório LGPD (ADMIN) em PDF/CSV (quando disponível);\n• portabilidade via backup encriptado.\n\nPara exercer direitos sobre dados de saúde, contactar primeiro a clínica (controlador).' },
    { heading: '5. Segurança recomendada (boas práticas)', body: '• Activar BitLocker no Windows (recomendado);\n• Usar senhas fortes e perfis adequados (ADMIN / DOUTOR / OPERADOR);\n• Activar encriptação da base de dados no app (opcional);\n• Usar backup ZIP encriptado e guardar a senha em local seguro.' },
    { heading: '6. Contato', body: `Dúvidas técnicas sobre o produto: ${EMAIL}\nSolicitações LGPD sobre dados clínicos: contactar a clínica (controlador).` },
  ],
  en: [
    { heading: '1. Nature of data', body: `${PRODUCT} may process sensitive personal data (health data) entered by the clinic or professional using the software (e.g. medical records and visit history).` },
    { heading: '2. LGPD roles', body: `• Controller: clinic or health professional using the software (defines purposes and means of processing).\n• Software operator: ${FANTASY} (${LEGAL_NAME}).\n• Sub-processors (when applicable):\n  — Microsoft (subscription payments via Microsoft Store)\n  — Meta/WhatsApp (messages, if configured by the clinic)\n  — Firebase/Google (technical components, if enabled)` },
    { heading: '3. Minimization and storage', body: '• Clinical data remains on the device (local SQLite).\n• Audit logs store metadata (who / when / what), without clinical content.' },
    { heading: '4. Data subject rights (LGPD Art. 18)', body: 'The app provides operational support for:\n• access and correction via patient record;\n• LGPD report export (ADMIN) in PDF/CSV (when available);\n• portability via encrypted backup.\n\nTo exercise rights regarding health data, contact the clinic first (controller).' },
    { heading: '5. Recommended security (best practices)', body: '• Enable BitLocker on Windows (recommended);\n• Use strong passwords and appropriate roles (ADMIN / DOCTOR / OPERATOR);\n• Enable database encryption in the app (optional);\n• Use encrypted ZIP backup and store the password securely.' },
    { heading: '6. Contact', body: `Technical questions about the product: ${EMAIL}\nLGPD requests regarding clinical data: contact the clinic (controller).` },
  ],
  es: [
    { heading: '1. Naturaleza de los datos', body: `${PRODUCT} puede tratar datos personales sensibles (datos de salud) introducidos por la clinica o profesional que utiliza el software (ej.: historial clinico y consultas).` },
    { heading: '2. Roles LGPD', body: `• Controlador: clinica o profesional de salud que utiliza el software (define finalidades y medios del tratamiento).\n• Operador del software: ${FANTASY} (${LEGAL_NAME}).\n• Suboperadores (cuando aplique):\n  — Microsoft (pagos de suscripcion via Microsoft Store)\n  — Meta/WhatsApp (mensajes, si lo configura la clinica)\n  — Firebase/Google (componentes tecnicos, si estan activados)` },
    { heading: '3. Minimizacion y almacenamiento', body: '• Los datos clinicos permanecen en el dispositivo (SQLite local).\n• Los registros de auditoria guardan metadatos (quien / cuando / que), sin contenido clinico.' },
    { heading: '4. Derechos del titular (Art. 18 LGPD)', body: 'La app ofrece soporte operacional para:\n• acceso y correccion via ficha del paciente;\n• exportacion de informe LGPD (ADMIN) en PDF/CSV (cuando este disponible);\n• portabilidad via copia cifrada.\n\nPara ejercer derechos sobre datos de salud, contactar primero la clinica (controlador).' },
    { heading: '5. Seguridad recomendada (buenas practicas)', body: '• Activar BitLocker en Windows (recomendado);\n• Usar contrasenas fuertes y perfiles adecuados (ADMIN / MEDICO / OPERADOR);\n• Activar cifrado de base de datos en la app (opcional);\n• Usar copia ZIP cifrada y guardar la contrasena en lugar seguro.' },
    { heading: '6. Contacto', body: `Dudas tecnicas sobre el producto: ${EMAIL}\nSolicitudes LGPD sobre datos clinicos: contactar la clinica (controlador).` },
  ],
};

module.exports = {
  header,
  lastUpdated,
  labels,
  pages: {
    privacy: {
      slug: 'politica-privacidade-clinica-iii',
      titles: {
        pt: `Política de Privacidade — ${PRODUCT}`,
        en: `Privacy Policy — ${PRODUCT}`,
        es: `Política de Privacidad — ${PRODUCT}`,
      },
      sections: privacy,
    },
    terms: {
      slug: 'termos-clinica-iii',
      titles: {
        pt: `Termos de Serviço — ${PRODUCT}`,
        en: `Terms of Service — ${PRODUCT}`,
        es: `Términos de Servicio — ${PRODUCT}`,
      },
      sections: terms,
    },
    health: {
      slug: 'dados-saude-lgpd-clinica-iii',
      titles: {
        pt: `Dados de saúde e LGPD — ${PRODUCT}`,
        en: `Health data and LGPD — ${PRODUCT}`,
        es: `Datos de salud y LGPD — ${PRODUCT}`,
      },
      sections: health,
    },
  },
};
