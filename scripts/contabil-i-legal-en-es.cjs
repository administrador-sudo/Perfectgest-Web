/** EN/ES — paralelo ao PT em mobile/docs/politicas (ContábilSigilo). */
module.exports = {
  privacy: {
    en: [
      {
        heading: '1. Who we are',
        body:
          'This policy describes how the PerfectGest ContábilSigilo app ("App"), developed by PerfectGest, handles information when you use it on your Android device.\n\n' +
          '- App name: PerfectGest ContábilSigilo\n' +
          '- Android package: br.perfectgestcontabil.dev\n' +
          '- Privacy contact: suporte@perfectgestdev.com\n' +
          '- Public policy: https://perfectgestdev.com/contabil-i-politica-privacidade',
      },
      {
        heading: '2. Core principle: data on your device',
        body:
          'The App is designed for 100% offline day-to-day operational accounting:\n\n' +
          '- Entries, tax obligations, month-end closing and company data stay on your device (local storage).\n' +
          '- We do not automatically send your accounting data to PerfectGest servers.\n' +
          '- We do not use ad tracking or accounting-content analytics.\n\n' +
          'Local export only when you tap "Generate and share PDF", "Export backup" or "Import backup".\n\n' +
          'Exception (with consent): sending the month for accounting review, Google Play subscription validation, A1 certificate bonus, and data needed for company opening services — see section 5.',
      },
      {
        heading: '3. Data the App may process',
        body:
          '3.1 Data you enter\n\n' +
          'Type · Examples · Where stored\n' +
          'Company data · Legal name, tax ID, CNAE, contacts · Device (local)\n' +
          'Operational profile · Activity type, estimated entries and invoices/month · Device (local)\n' +
          'Financial data · Entries, amounts, categories, balances · Device (local)\n' +
          'Issued invoices · Invoice number, customer, tax ID, amount, IRRF · Device (local)\n' +
          'Tax obligations · Compliance marks, notes · Device (local)\n' +
          'Receipts · Attached file name (optional) · Device (local)\n' +
          'Preferences · Theme, privacy and cloud consent · Device (local)\n' +
          'Gemini API key · Configured by user for AI · Device (local — SharedPreferences)\n\n' +
          '3.2 Not collected automatically\n\n' +
          '- GPS location\n' +
          '- Phone contact list\n' +
          '- Ad identifiers\n' +
          '- Browsing history outside the App',
      },
      {
        heading: '4. How we use data',
        body:
          'We use data to:\n\n' +
          '- Record and display the cash book and entries\n' +
          '- Track tax obligations and month-end closing\n' +
          '- Generate PDF and backup when requested\n' +
          '- Calculate income tax (IR/IRPF) and Carnê-Leão from entries\n' +
          '- Validate subscriptions and deliver contracted services (company opening, CRC review, A1 bonus) — with consent\n\n' +
          'Legal basis (LGPD): contract performance and features you request; consent for cloud upload and additional accounting services.',
      },
      {
        heading: '5. Sharing with third parties',
        body:
          'The App does not sell accounting data.\n\n' +
          '5.1 Local actions (your initiative only)\n\n' +
          'Action · What happens\n' +
          'Share PDF · Sent to the app you choose\n' +
          'Export JSON backup · Shared by you\n' +
          'Open tax portal · External browser — government site policies apply\n\n' +
          '5.2 Cloud services (Firebase/Google and Google Gemini) — with consent\n\n' +
          'Enabled only with explicit acceptance:\n\n' +
          'Purpose · Data processed · Operator\n' +
          'Validate subscription (Google Play) · Purchase token, product ID, subscription state · Google Play + Firebase\n' +
          'CRC review submission · Monthly package: company, entries, reconciliation, PDF · Google Firebase (Firestore/Storage)\n' +
          'Company opening · Registration data and documents for the process · PerfectGest / partners\n' +
          'A1 certificate registration · Form data (tax ID, contact, address) · Firebase (solicitacoes_a1) + PerfectGest\n' +
          'A1 certificate bonus · Bonus status, promo code · Firebase + Quality Cert\n' +
          'Technical session · Anonymous Firebase identifier · Google Firebase\n' +
          'PerfectGest AI Assistant / IR with AI · Text questions entered by user · Google Gemini API (user key)\n\n' +
          'Note on Gemini AI: the API key is configured and stored locally by the user in SharedPreferences. PerfectGest does not have access to the key or conversation history. Questions are sent directly from the device to Google servers, governed by Google privacy policy. Raw accounting data is not sent — only the user question text.\n\n' +
          'You may revoke cloud consent in Privacy & security. Local cash book continues; review, A1 bonus and cloud validation require new consent.\n\n' +
          '5.3 Storage and submission statement (onboarding acceptance)\n\n' +
          'The user acknowledges that accounting data is stored exclusively on the local device.\n\n' +
          'Sole paragraph: if the user subscribes to the Com Contador or Anual + A1 plan, they authorize sending reports as encrypted files to the PerfectGestDev system for strict analysis and approval by a Certified Accountant. PerfectGestDev is not responsible for permanent storage of those files; the user must keep the original backup on their device.\n\n' +
          'Technical implementation: the review package (JSON + PDF + receipts) is encrypted on the device with AES-256-CBC before transmission to Firebase Storage/Firestore. Only PerfectGestDev holds the decryption key, shared with the Certified Accountant responsible for analysis.\n\n' +
          '5.4 Company opening service — timeline and fees\n\n' +
          'When contracted (Com Contador or Anual + A1 plans):\n\n' +
          '- Official fees (Commercial Registry, city hall, tax authority, etc.) are not included — paid by the client to competent bodies.\n' +
          '- The opening process may take up to 14 (fourteen) days after complete documentation, referring to administrative steps: Commercial Registry request, approvals, city hall registration and other legal procedures — subject to third-party deadlines.\n\n' +
          'Contract details: Terms of Use, section 5.',
      },
      {
        heading: '6. Security',
        body:
          '- Local data in the app private space.\n' +
          '- Cloud (Firebase) only after consent; restricted access for authorized team.\n' +
          '- Gemini API key stored locally — never sent to PerfectGest servers.\n' +
          '- We recommend screen lock and secure backups.',
      },
      {
        heading: '7. Retention and deletion',
        body:
          'On device: until "Delete all data" or uninstall.\n\n' +
          'In the cloud (review submissions): retained as long as needed for the service and legal/accounting obligations; contact suporte@perfectgestdev.com.',
      },
      {
        heading: '8. Your rights (LGPD)',
        body:
          'Access, correct, export, delete (locally), revoke consent and object to unlawful processing.\n\n' +
          'Contact: suporte@perfectgestdev.com',
      },
      {
        heading: '9. Children',
        body: 'Intended for adults and entrepreneurs (ME, MEI). Not intended for under-18s.',
      },
      {
        heading: '10. Changes',
        body: 'Updates reflected on this date and, when relevant, on Google Play.',
      },
      {
        heading: '11. Google Play',
        body:
          'Complements Google Play User Data Policy. The Play Console "Data safety" form summarizes this information.',
      },
    ],
    es: [
      {
        heading: '1. Quiénes somos',
        body:
          'Esta política describe cómo la app PerfectGest ContábilSigilo ("App"), desarrollada por PerfectGest, trata la información cuando la utiliza en su dispositivo Android.\n\n' +
          '- Nombre: PerfectGest ContábilSigilo\n' +
          '- Paquete Android: br.perfectgestcontabil.dev\n' +
          '- Contacto privacidad: suporte@perfectgestdev.com\n' +
          '- Política pública: https://perfectgestdev.com/contabil-i-politica-privacidade',
      },
      {
        heading: '2. Principio fundamental: datos en su dispositivo',
        body:
          'La App está diseñada para contabilidad operacional 100% offline en el día a día:\n\n' +
          '- Movimientos, obligaciones fiscales, cierres de mes y datos de la empresa permanecen en el dispositivo (almacenamiento local).\n' +
          '- No enviamos automáticamente sus datos contables a servidores PerfectGest.\n' +
          '- No utilizamos rastreo publicitario ni analytics del contenido contable.\n\n' +
          'La exportación local ocurre cuando toca "Generar y compartir PDF", "Exportar backup" o "Importar backup".\n\n' +
          'Excepción (con consentimiento): envío del mes para revisión contable, validación de suscripción Google Play, bono certificado A1 y datos para apertura de empresa — ver sección 5.',
      },
      {
        heading: '3. Datos que la App puede tratar',
        body:
          '3.1 Datos que usted introduce\n\n' +
          'Tipo · Ejemplos · Dónde quedan\n' +
          'Datos de la empresa · Razón social, CNPJ/CPF, CNAE, contactos · Dispositivo (local)\n' +
          'Perfil operacional · Tipo de actividad, estimativa de movimientos y NF/mes · Dispositivo (local)\n' +
          'Datos financieros · Movimientos, valores, categorías, saldos · Dispositivo (local)\n' +
          'NF emitidas · Número NF, cliente, CNPJ/CPF, valor, IRRF · Dispositivo (local)\n' +
          'Obligaciones fiscales · Marcas de cumplimiento, observaciones · Dispositivo (local)\n' +
          'Comprobantes · Nombre del archivo adjunto (opcional) · Dispositivo (local)\n' +
          'Preferencias · Tema, aceptaciones de privacidad y nube · Dispositivo (local)\n' +
          'Clave API Gemini · Configurada por el usuario para IA · Dispositivo (local — SharedPreferences)\n\n' +
          '3.2 No recogidos automáticamente\n\n' +
          '- Ubicación GPS\n' +
          '- Lista de contactos del teléfono\n' +
          '- Identificadores publicitarios\n' +
          '- Historial de navegación fuera de la App',
      },
      {
        heading: '4. Cómo usamos los datos',
        body:
          'Usamos los datos para:\n\n' +
          '- Registrar y mostrar libro de caja y movimientos\n' +
          '- Seguir obligaciones fiscales y cierres de mes\n' +
          '- Generar PDF y backup cuando se solicite\n' +
          '- Calcular IR/IRPF y Carnê-Leão a partir de los movimientos\n' +
          '- Validar suscripción y prestar servicios contratados (apertura de empresa, revisión CRC, bono A1) — con consentimiento\n\n' +
          'Base legal (LGPD): ejecución de contrato y funcionalidades solicitadas; consentimiento para envío a la nube y servicios contables adicionales.',
      },
      {
        heading: '5. Compartir con terceros',
        body:
          'La App no vende datos contables.\n\n' +
          '5.1 Acciones locales (solo por su iniciativa)\n\n' +
          'Acción · Qué ocurre\n' +
          'Compartir PDF · Enviado a la app que usted elija\n' +
          'Exportar backup JSON · Compartido por usted\n' +
          'Abrir portal fiscal · Navegador externo — política de sitios gubernamentales\n\n' +
          '5.2 Servicios en la nube (Firebase/Google y Google Gemini) — consentimiento\n\n' +
          'Activados solo con aceptación explícita:\n\n' +
          'Finalidad · Datos tratados · Operador\n' +
          'Validar suscripción (Google Play) · Token de compra, ID producto · Google Firebase\n' +
          'Envío para revisión CRC · Paquete mensual: empresa, movimientos, conciliación, PDF · Google Firebase (Firestore/Storage)\n' +
          'Apertura de empresa · Datos registrales y documentos del proceso · PerfectGest / socios\n' +
          'Bono certificado A1 · Estado bono, código promocional · Firebase + Quality Cert\n' +
          'Sesión técnica · Identificador anónimo Firebase · Google Firebase\n' +
          'Asistente IA PerfectGest / IR con IA · Preguntas de texto del usuario · Google Gemini API (clave del usuario)\n\n' +
          'Nota sobre IA Gemini: la clave API se configura y almacena localmente por el usuario en SharedPreferences. PerfectGest no tiene acceso a la clave ni al historial de conversaciones. El envío de preguntas ocurre directamente del dispositivo a servidores Google, regido por la política de privacidad de Google. No se envían datos contables en bruto — solo el texto de la pregunta.\n\n' +
          'Puede revocar el consentimiento de nube en Privacidad y seguridad. El libro de caja local continúa; revisión, bono A1 y validación en la nube quedan indisponibles hasta nuevo consentimiento.\n\n' +
          '5.3 Declaración de almacenamiento y envío (aceptación en onboarding)\n\n' +
          'El usuario declara estar consciente de que sus datos contables se almacenan exclusivamente en su dispositivo local.\n\n' +
          'Párrafo único: si contrata el plan Com Contador o Anual + A1, autoriza el envío de informes en formato de archivo cifrado al sistema PerfectGestDev, con la finalidad estricta de análisis y aprobación por un Contador Certificado. PerfectGestDev se exime de responsabilidad por la guarda permanente de esos archivos; corresponde al usuario mantener el backup original en su dispositivo.\n\n' +
          'Implementación técnica: el paquete de revisión (JSON + PDF + comprobantes) se cifra en el dispositivo con AES-256-CBC antes de transmitirse a Firebase Storage/Firestore. Solo PerfectGestDev posee la clave de descifrado, compartida con el Contador Certificado responsable del análisis.\n\n' +
          '5.4 Servicio de apertura de empresa — plazo y tasas\n\n' +
          'Cuando se contrata (planes Com Contador o Anual + A1):\n\n' +
          '- Tasas oficiales (Junta Comercial, prefectura, Receita, etc.) no están incluidas — pagadas por el cliente a los órganos competentes.\n' +
          '- El proceso de apertura puede demorar hasta 14 (catorce) días, tras documentación completa, refiriéndose a etapas administrativas: solicitud en Junta Comercial, aprobaciones, registros en prefectura y demás trámites legales — sujeto a plazos de terceros.\n\n' +
          'Detalles contractuales: Términos de Uso, sección 5.',
      },
      {
        heading: '6. Seguridad',
        body:
          '- Datos locales en el espacio privado de la aplicación.\n' +
          '- Nube (Firebase) solo tras consentimiento; acceso restringido al equipo autorizado.\n' +
          '- Clave API Gemini almacenada localmente — nunca transmitida a servidores PerfectGest.\n' +
          '- Recomendamos bloqueo de pantalla y backup seguro.',
      },
      {
        heading: '7. Retención y eliminación',
        body:
          'En el dispositivo: hasta «Eliminar todos los datos» o desinstalar.\n\n' +
          'En la nube (envíos de revisión): retenidos el tiempo necesario para el servicio y obligaciones legales/contables; solicite información vía suporte@perfectgestdev.com.',
      },
      {
        heading: '8. Sus derechos (LGPD)',
        body:
          'Acceder, corregir, exportar, eliminar (local), revocar consentimiento y oponerse a tratamientos ilícitos.\n\n' +
          'Contacto: suporte@perfectgestdev.com',
      },
      {
        heading: '9. Menores',
        body: 'Destinado a adultos y emprendedores (ME, MEI). No dirigido a menores de 18 años.',
      },
      {
        heading: '10. Cambios',
        body: 'Actualizaciones reflejadas en esta fecha y, cuando corresponda, en Google Play.',
      },
      {
        heading: '11. Google Play',
        body:
          'Complementa la Política de Datos de Usuario de Google Play. El formulario "Seguridad de los datos" en Play Console resume esta información.',
      },
    ],
  },
  terms: {
    en: [
      { heading: '1. Acceptance', body: 'By installing, opening or using PerfectGest ContábilSigilo ("App"), you agree to these Terms of Use and the Privacy Policy.\n\nIf you disagree, do not use the App and uninstall it from your device.' },
      { heading: '2. What the App is', body: 'PerfectGest ContábilSigilo is an operational accounting support tool for micro-businesses and MEI, including:\n\n- Cash book and entries\n- Tax obligations with due-date reminders\n- Month-end closing and reconciliation\n- Issued invoice logging and integration with income tax calculation\n- IR with AI module (IRPF, Carnê-Leão, deductions and Gemini chat)\n- PerfectGest AI Assistant (questions about the app, IR and MEI/ME obligations)\n- PDF report export and local backup\n- Google Play subscriptions (Básico Mensal, Básico Anual, Com Contador and Anual + A1 plans)\n\nDay-to-day use (entries and closing) works offline on the device. Internet is required for subscription, cloud services (with consent), Gemini AI and external links.' },
      { heading: '3. What the App is not', body: '- Not a bank, financial institution or payment method.\n- Does not process transfers, PIX, cards or real bank movements.\n- Does not replace, on its own, a certified accountant, accounting firm or legal/tax advisory.\n- Does not guarantee automatic tax compliance with the tax authority, municipalities or other bodies — responsibility for entries and filings lies with the business owner and their advisors.' },
      { heading: '4. Plans and subscriptions (Google Play)', body: 'The App is free to install. Full access requires an active subscription managed by Google Play. The app validates payment with Google Play before enabling premium features; there is no development bypass in published releases.\n\n4.1 Plan table (reference prices)\n\nPlan · Product ID · Ref. price · Summary\nBasic Monthly · contabil_i_mensal · R$ 9.90/month · Cash book, IR, invoices, Carnê-Leão, payroll (no CRC)\nBasic Annual · contabil_i_basico_anual · R$ 99.90/year · Same as Basic Monthly; pay 10 months, use 12\nCom Contador (Essential / Standard / Advanced) · contabil_i_contabil_plus · R$ 69.90–119.90/month · Basic + CRC review + company opening\nAnual + A1 (3 tiers) · contabil_i_anual · R$ 838.80–1,438.80/year · Com Contador + e-CNPJ A1 certificate\nCom Contador Annual 12× Essential · contador_anual_parcelado_essencial_f · 12× R$ 69.90 · Annual accounting + A1\nCom Contador Annual 12× Standard · contador_anual_parcelado_standard_f · 12× R$ 89.90 · Standard tier + A1\nCom Contador Annual 12× Advanced · contador_anual_parcelado_avancado_f · 12× R$ 119.90 · Advanced tier + A1\n\nPayment, renewal and cancellation follow Google Play rules. Store prices prevail over reference values above.' },
      { heading: '5. Company opening service', body: 'Com Contador and Anual + A1 plans may include company opening (incorporation/registration) by PerfectGest or partners, subject to specific contract or acceptance when applicable.\n\n5.1 Not included\n\n- Fees, charges and taxes levied by Commercial Registry, city hall, tax authority, notary or other public bodies — client responsibility, paid directly to competent entities.\n\n5.2 Process timeline\n\nCompany opening may take up to 14 (fourteen) days from delivery of all required documentation and payment of official fees by the holder.\n\nThis refers to the administrative opening process, including as applicable:\n\n- Filing with the Commercial Registry (or equivalent body);\n- Reviews, requirements and approvals by competent bodies;\n- Registrations and permits with city hall and other entities;\n- Other legal steps required for business regularization.\n\nDoes not include delays from incomplete documentation, client pending items, public system outages or force majeure.' },
      { heading: '6. Accounting review (Com Contador and Anual + A1)', body: 'With Com Contador or Anual + A1, the client may send the closed month to PerfectGest for accounting review, with explicit consent for cloud processing (Firebase). The package is encrypted on the device (AES-256-CBC) before submission.\n\n- PerfectGest analyzes the submitted package and responds in the app (under review, pending items, reviewed).\n- Official tax filings may require a separate accounting services contract with a CRC professional.\n- Submission does not replace filing on official portals unless expressly agreed in a service contract.' },
      { heading: '7. A1 digital certificate (Anual + A1 / Com Contador Annual)', body: 'Plans Anual + A1 (contabil_i_anual) and Com Contador Annual 12× (contador_anual_parcelado_*) include a promotional e-CNPJ A1 certificate via partner certifier (Quality Cert).\n\n- Eligibility requires active subscription validated on Google Play.\n- After confirmed payment, the user may register data in the app (internal form) and receive Quality code/link when assigned by Firebase.\n- Certificate issuance follows certifier identity validation, independent of PerfectGest.\n\nBasic and Com Contador monthly plans do not include A1.' },
      { heading: '8. IR with AI and AI Assistant', body: '- IR with AI: IRPF calculation, Carnê-Leão, deductions and Gemini AI chat — available on all paid plans. The Gemini API key is configured and stored locally by the user; PerfectGest does not access the key or history.\n- PerfectGest AI Assistant: general chat about app features, IR and obligations — same local key rules and direct send to Google API.\n- AI responses are informational; tax and accounting validation should be done by a qualified professional when needed.' },
      { heading: '9. Permitted use', body: 'You may use the App to:\n\n- Record financial movements of your business activity\n- Organize obligations and monthly closings\n- Export data for personal archive or delivery to an accountant\n- Subscribe to plans and, when eligible, request company opening and review submission\n\nProhibited:\n\n- Illegal or fraudulent use\n- Bypassing technical limits or accessing third-party data without authorization\n- Redistributing or reselling the App without PerfectGest authorization' },
      { heading: '10. Data and responsibility', body: '- You are responsible for accuracy and legality of entered data.\n- Main storage is local on the device; device loss, theft or damage may mean data loss without backup.\n- We recommend exporting backups periodically (Reports and backup menu).\n- Cloud uploads (review, purchase validation, A1 bonus) occur only with consent.\n- See Privacy Policy and Data Deletion.' },
      { heading: '11. External links', body: 'The App may open official sites (tax authority, MEI portals, municipal ISS, Google AI Studio, Quality Cert, Google Play, etc.) in your browser. PerfectGest does not control content or policies of those sites.' },
      { heading: '12. Availability and updates', body: '- The App is provided "as is" without uninterrupted availability guarantee.\n- We may release updates via Google Play for fixes, improvements or legal compliance.\n- Features may evolve between versions; see release notes in the store.' },
      { heading: '13. Intellectual property', body: 'The App, PerfectGest brand, logos and code are property of PerfectGest or its licensors. These Terms do not grant ownership rights over the software.' },
      { heading: '14. Limitation of liability', body: 'To the maximum extent permitted by applicable law:\n\n- PerfectGest is not liable for fines, tax penalties, entry errors or decisions based solely on the App or AI responses.\n- Not liable for indirect damages, lost profits or data loss from misuse, lack of backup or device failure.\n- Does not guarantee opening in less than 14 days when dependent on third parties (Commercial Registry, city hall, etc.).\n\nThe App is a recording assistant; validate tax and accounting decisions with qualified professionals when needed.' },
      { heading: '15. Termination', body: 'You may cancel subscriptions on Google Play and stop using the App at any time, deleting data (see Data Deletion) and uninstalling.' },
      { heading: '16. Governing law', body: 'These Terms are governed by the laws of Brazil, including the Consumer Code and LGPD when applicable.\n\nVenue: consumer domicile under the CDC, unless otherwise required by law.' },
      { heading: '17. Contact', body: 'PerfectGest\nE-mail: suporte@perfectgestdev.com' },
    ],
    es: [
      { heading: '1. Aceptación', body: 'Al instalar, abrir o utilizar PerfectGest ContábilSigilo ("App"), acepta estos Términos de Uso y la Política de Privacidad.\n\nSi no está de acuerdo, no utilice la App y desinstálela de su dispositivo.' },
      { heading: '2. Qué es la App', body: 'PerfectGest ContábilSigilo es una herramienta de apoyo contable operacional para microempresas y MEI, incluyendo:\n\n- Libro de caja y movimientos\n- Obligaciones fiscales con recordatorios de vencimiento\n- Cierre de mes y conciliación\n- Registro de NF emitidas e integración con cálculo de IR\n- Módulo IR con IA (IRPF, Carnê-Leão, deducciones y chat Gemini)\n- Asistente IA PerfectGest (dudas sobre la app, IR y obligaciones MEI/ME)\n- Exportación de informes PDF y backup local\n- Suscripciones Google Play (planes Básico Mensual, Básico Anual, Com Contador y Anual + A1)\n\nEl día a día (movimientos y cierre) funciona offline en el dispositivo. Internet es necesaria para suscripción, servicios en la nube (con consentimiento), IA Gemini y enlaces externos.' },
      { heading: '3. Qué no es la App', body: '- No es banco, institución financiera ni medio de pago.\n- No procesa transferencias, PIX, tarjetas ni movimientos bancarios reales.\n- No sustituye, por sí sola, contador certificado, despacho contable ni asesoría jurídica/tributaria.\n- No garantiza conformidad fiscal automática ante la Receita Federal, municipios u otros órganos — la responsabilidad por movimientos y declaraciones es del titular y de los profesionales que lo asesoran.' },
      { heading: '4. Planes y suscripciones (Google Play)', body: 'La App es gratuita para instalar. El acceso completo requiere suscripción activa gestionada por Google Play. La app valida el pago en Google Play antes de activar funciones premium; no hay bypass de desarrollo en versiones publicadas.\n\n4.1 Tabla de planes (precios de referencia)\n\nPlan · ID producto · Precio ref. · Resumen\nBásico Mensual · contabil_i_mensal · R$ 9,90/mes · Libro de caja, IR, NF, carnê-leão, nómina (sin CRC)\nBásico Anual · contabil_i_basico_anual · R$ 99,90/año · Igual al mensual; pague 10 meses, use 12\nCom Contador (Essencial / Standard / Avanzado) · contabil_i_contabil_plus · R$ 69,90–119,90/mes · Básico + revisión CRC + apertura de empresa\nAnual + A1 (3 faixas) · contabil_i_anual · R$ 838,80–1.438,80/año · Com Contador + certificado e-CNPJ A1\nCom Contador Anual 12× Essencial · contador_anual_parcelado_essencial_f · 12× R$ 69,90 · Anual contable + A1\nCom Contador Anual 12× Standard · contador_anual_parcelado_standard_f · 12× R$ 89,90 · Faixa Standard + A1\nCom Contador Anual 12× Avanzado · contador_anual_parcelado_avancado_f · 12× R$ 119,90 · Faixa Avanzado + A1\n\nPago, renovación y cancelación siguen las reglas de Google Play. Los precios en la tienda prevalecen sobre los valores de referencia.' },
      { heading: '5. Servicio de apertura de empresa', body: 'Los planes Com Contador y Anual + A1 pueden incluir servicio de apertura de empresa (constitución/registro), prestado por PerfectGest o socios, mediante contrato o aceptación específica cuando corresponda.\n\n5.1 No incluido\n\n- Tasas, emolumentos y tributos cobrados por Junta Comercial, prefectura, Receita Federal, notaría u otros órganos públicos — responsabilidad del cliente, pagados directamente a los entes competentes.\n\n5.2 Plazo del proceso\n\nEl servicio de apertura puede demorar hasta 14 (catorce) días, contados desde la entrega de toda la documentación exigida y el pago de tasas oficiales por el titular.\n\nEste plazo refiere al proceso administrativo de apertura, incluyendo según el caso:\n\n- Solicitud y protocolo en Junta Comercial (u órgano equivalente);\n- Análisis, exigencias y aprobaciones de los órganos competentes;\n- Registros y alvarás en prefectura y demás entidades;\n- Demás etapas legales necesarias para la regularización.\n\nNo incluye retrasos por documentación incompleta, pendencias del cliente, indisponibilidad de sistemas públicos o fuerza mayor.' },
      { heading: '6. Revisión contable (Com Contador y Anual + A1)', body: 'Con plan Com Contador o Anual + A1, el cliente puede enviar el mes cerrado a PerfectGest para revisión contable, con consentimiento explícito para tratamiento en la nube (Firebase). El paquete se cifra en el dispositivo (AES-256-CBC) antes del envío.\n\n- PerfectGest analiza el paquete enviado y responde en la app (en análisis, pendencias, revisado).\n- Informes legales y obligaciones ante el Fisco pueden exigir contrato de prestación de servicios contables separado con profesional CRC.\n- El envío no sustituye la entrega de declaraciones en portales oficiales, salvo acuerdo expreso en contrato de servicio.' },
      { heading: '7. Certificado digital A1 (Anual + A1 / Com Contador Anual)', body: 'Los planes Anual + A1 (contabil_i_anual) y Com Contador Anual 12× (contador_anual_parcelado_*) incluyen bono promocional de certificado e-CNPJ A1 vía certificadora socia (Quality Cert).\n\n- Elegibilidad exige suscripción activa validada en Google Play.\n- Tras pago confirmado, el usuario puede registrar datos en la app (formulario interno) y recibir código/enlace Quality cuando Firebase lo asigne.\n- La emisión sigue validación de identidad de la certificadora, independiente de PerfectGest.\n\nPlanes Básico y Com Contador mensual no incluyen A1.' },
      { heading: '8. IR con IA y Asistente IA', body: '- IR con IA: cálculo IRPF, Carnê-Leão, deducciones y chat con IA Gemini — disponible en todos los planes de pago. La clave API Gemini se configura y guarda localmente por el usuario; PerfectGest no accede a la clave ni al historial.\n- Asistente IA PerfectGest: chat general sobre funcionalidades de la app, IR y obligaciones — mismas reglas de clave local y envío directo a la API Google.\n- Las respuestas de la IA son informativas; la validación fiscal y contable debe hacerse con profesional habilitado cuando sea necesario.' },
      { heading: '9. Uso permitido', body: 'Puede utilizar la App para:\n\n- Registrar movimientos financieros de su actividad empresarial\n- Organizar obligaciones y cierres mensuales\n- Exportar datos para archivo personal o entrega a contador\n- Suscribir planes y, cuando corresponda, solicitar apertura de empresa y envío para revisión\n\nProhibido:\n\n- Uso ilegal o fraudulento\n- Intentar eludir limitaciones técnicas o acceder a datos de terceros sin autorización\n- Redistribuir o revender la App sin autorización de PerfectGest' },
      { heading: '10. Datos y responsabilidad', body: '- Los datos introducidos son de su responsabilidad en cuanto a exactitud y legalidad.\n- El almacenamiento principal es local en el dispositivo; pérdida, robo o daño del aparato puede implicar pérdida de datos sin backup.\n- Recomendamos exportar backups periódicamente (menú Informes y backup).\n- Envíos a la nube (revisión, validación de compra, bono A1) solo con consentimiento.\n- Consulte Política de Privacidad y Eliminación de Datos.' },
      { heading: '11. Enlaces externos', body: 'La App puede abrir sitios oficiales (Receita Federal, portales MEI, ISS municipal, Google AI Studio, Quality Cert, Google Play, etc.) en su navegador. PerfectGest no controla el contenido ni las políticas de esos sitios.' },
      { heading: '12. Disponibilidad y actualizaciones', body: '- La App se proporciona "tal cual", sin garantía de disponibilidad ininterrumpida.\n- Podemos lanzar actualizaciones vía Google Play para correcciones, mejoras o adecuación legal.\n- Las funcionalidades pueden evolucionar entre versiones; consulte las notas de versión en la tienda.' },
      { heading: '13. Propiedad intelectual', body: 'La App, marca PerfectGest, logotipos y código son propiedad de PerfectGest o sus licenciantes. Estos Términos no conceden derechos de propiedad sobre el software.' },
      { heading: '14. Limitación de responsabilidad', body: 'En la máxima extensión permitida por la ley aplicable:\n\n- PerfectGest no se responsabiliza por multas, sanciones fiscales, errores de registro o decisiones basadas exclusivamente en la App o en respuestas de la IA.\n- No se responsabiliza por daños indirectos, lucro cesante o pérdida de datos por uso incorrecto, falta de backup o fallo del dispositivo.\n- No garantiza plazo inferior a 14 días para conclusión de apertura de empresa cuando depende de terceros (Junta Comercial, prefectura, etc.).\n\nLa App es un auxiliar de registro; valide decisiones tributarias y contables con profesional habilitado cuando sea necesario.' },
      { heading: '15. Rescisión', body: 'Puede cancelar suscripciones en Google Play y dejar de usar la App en cualquier momento, eliminando los datos (ver Eliminación de Datos) y desinstalándola.' },
      { heading: '16. Ley aplicable', body: 'Estos Términos se rigen por las leyes de la República Federativa del Brasil, incluyendo el Código de Defensa del Consumidor y la LGPD cuando corresponda.\n\nForo: comarca del domicilio del consumidor, conforme al CDC, salvo disposición legal en contrario.' },
      { heading: '17. Contacto', body: 'PerfectGest\nE-mail: suporte@perfectgestdev.com' },
    ],
  },
  deletion: {
    en: [
      { heading: '1. Purpose', body: 'This document explains how to permanently delete data processed by PerfectGest ContábilSigilo, in compliance with LGPD and Google Play policies.\n\nPublic URL: https://perfectgestdev.com/contabil-i-exclusao-dados' },
      { heading: '2. What can be deleted on the device', body: 'The "Delete all data" function irreversibly removes from the device:\n\nCategory · Deleted content\nCash book · Movements, amounts, descriptions, categories\nAccounting · Double-entry postings\nObligations · Marks and notes\nMonth-end closing · Reconciliations and statement balances\nCompany · Profile (tax ID, legal name, contacts)\nConfiguration · Categories, payment methods, accounts\nPreferences · Privacy acceptance, theme, local consents' },
      { heading: '3. Cloud data (review, subscription, A1)', body: 'If you used review submission, A1 registration (solicitacoes_a1), A1 bonus or cloud services:\n\n- Copies may exist on Firebase (Google Cloud) as long as needed for the service and legal obligations.\n- Deleting data in the app does not automatically delete all cloud records.\n- To request cloud deletion: suporte@perfectgestdev.com (include tax ID, month sent and Google Play account email if applicable).' },
      { heading: '4. Not deleted automatically', body: 'Item · Reason\nExported PDFs/backups · Stored in external apps — delete manually\nGoogle Play purchase records · Managed by Google\nCompany opening process already started · Legal document retention may apply\nData on government websites · Outside App control' },
      { heading: '5. How to delete in the App', body: '1. Menu → "Delete all data"\n2. Check "I have read and understand…"\n3. Type ELIMINAR\n4. Confirm "Delete permanently"\n\nAfter: new privacy acceptance on next launch; no local recovery.' },
      { heading: '6. Uninstall', body: 'Uninstalling removes local data. Recommended before selling the phone: Delete all data + uninstall.' },
      { heading: '7. Exported backups', body: 'Exported .json files are your responsibility — delete where stored.' },
      { heading: '8. Timelines', body: 'Scope · Timeline\nDeletion on device · Immediate after confirmation\nCloud deletion request · Response within 15 days (LGPD), execution per review\nOngoing company opening · Documents may be retained per applicable legal period' },
      { heading: '9. Contact', body: 'suporte@perfectgestdev.com' },
    ],
    es: [
      { heading: '1. Objetivo', body: 'Este documento explica cómo eliminar permanentemente los datos tratados por PerfectGest ContábilSigilo, conforme LGPD y Google Play.\n\nURL pública: https://perfectgestdev.com/contabil-i-exclusao-dados' },
      { heading: '2. Qué se puede eliminar en el dispositivo', body: 'La función «Eliminar todos los datos» borra irreversiblemente del dispositivo:\n\nCategoría · Contenido borrado\nLibro de caja · Movimientos, valores, descripciones, categorías\nContabilidad · Asientos de partida doble\nObligaciones · Marcas y observaciones\nCierre de mes · Conciliaciones y saldos de extracto\nEmpresa · Perfil (CNPJ, razón social, contactos)\nConfiguración · Categorías, medios de pago, cuentas\nPreferencias · Aceptaciones de privacidad, tema, consentimientos locales' },
      { heading: '3. Datos en la nube (revisión, suscripción, A1)', body: 'Si utilizó envío para revisión, registro certificado A1 (solicitacoes_a1), bono A1 o servicios en la nube:\n\n- Copias pueden existir en Firebase (Google Cloud) el tiempo necesario al servicio y obligaciones legales.\n- Eliminar datos en la app no borra automáticamente todos los registros en la nube.\n- Para solicitar eliminación en la nube: suporte@perfectgestdev.com (indique CNPJ, mes enviado y e-mail de la cuenta Google Play si corresponde).' },
      { heading: '4. No eliminado automáticamente', body: 'Ítem · Motivo\nPDFs/backups exportados · Quedaron en apps externas — borre manualmente\nRegistros de compra Google Play · Gestionados por Google\nProceso de apertura de empresa ya iniciado · Puede haber obligación legal de retención documental\nDatos en sitios gubernamentales · Fuera del control de la App' },
      { heading: '5. Cómo eliminar en la App', body: '1. Menú → «Eliminar todos los datos»\n2. Marque «He leído y comprendo…»\n3. Escriba ELIMINAR\n4. Confirme «Eliminar permanentemente»\n\nTras la operación: nueva aceptación de privacidad en el próximo inicio; sin recuperación local.' },
      { heading: '6. Desinstalación', body: 'Desinstalar la App elimina datos locales. Recomendado antes de vender el teléfono: Eliminar todos los datos + desinstalar.' },
      { heading: '7. Backups exportados', body: 'Los archivos .json exportados son su responsabilidad — borre donde los guardó.' },
      { heading: '8. Plazos', body: 'Ámbito · Plazo\nEliminación en el dispositivo · Inmediata tras confirmación\nSolicitud eliminación en la nube · Respuesta en hasta 15 días (LGPD), ejecución según análisis\nApertura de empresa en curso · Documentos pueden retenerse por plazo legal aplicable' },
      { heading: '9. Contacto', body: 'suporte@perfectgestdev.com' },
    ],
  },
  faq: {
    en: [
      { heading: 'What is PerfectGest ContábilSigilo?', body: 'Cash book and tax obligations app for ME and MEI, with IR with AI module, PerfectGest AI Assistant, Google Play subscriptions and optional accounting review and company opening services.' },
      { heading: 'Do I need internet?', body: '- Day to day (entries, closing): no — works offline.\n- PerfectGest AI Assistant / IR with AI: yes — uses Gemini API (key configured by user).\n- Subscription, review submission, A1 bonus: yes — requires internet and cloud consent.\n- Tax portals and Play Store: internet when you open external links.' },
      { heading: 'Does the app replace my accountant?', body: 'No. It is a recording and support tool. Com Contador and Anual + A1 plans include PerfectGest services (review and, per plan, company opening), but official filings and opinions may require an accounting contract with a CRC professional.' },
      { heading: 'Does the app move money or connect to the bank?', body: 'No. Manual entries; bank statement balance entered at month-end closing.' },
      {
        heading: 'Plans and prices (Google Play)',
        body:
          'Reference prices — the store price on your phone prevails.\n\n' +
          '<table class="compare-table"><thead><tr><th>Plan</th><th>Reference price</th></tr></thead><tbody>' +
          '<tr><td>Basic Monthly</td><td>R$ 9.90/month</td></tr>' +
          '<tr><td>Basic Annual</td><td>R$ 99.90/year</td></tr>' +
          '<tr><td>Com Contador (Essential / Standard / Advanced)</td><td>R$ 69.90–119.90/month</td></tr>' +
          '<tr><td>Annual accounting with digital certificate</td><td>R$ 838.80–1,438.80/year</td></tr>' +
          '<tr><td>Com Contador Annual in 12 installments</td><td>12× R$ 69.90–119.90</td></tr>' +
          '</tbody></table>\n\n' +
          'Free install; subscription required for full access. Payment and cancellation on Google Play.',
      },
      {
        heading: 'What is the difference between plans?',
        body:
          '<table class="compare-table"><thead><tr><th>Included</th><th>Basic (monthly or annual)</th><th>Com Contador (monthly)</th><th>Annual accounting (with certificate)</th></tr></thead><tbody>' +
          '<tr><td>Cash book, income tax, payroll and monthly summary</td><td>Yes</td><td>Yes</td><td>Yes</td></tr>' +
          '<tr><td>Send closed month for accountant review</td><td>No</td><td>Yes</td><td>Yes</td></tr>' +
          '<tr><td>Company opening (ME)</td><td>No</td><td>Yes</td><td>Yes</td></tr>' +
          '<tr><td>Company digital certificate (e-CNPJ)</td><td>No</td><td>No</td><td>Yes</td></tr>' +
          '</tbody></table>\n\n' +
          'In short: Basic = app only; Com Contador = + accountant review and opening; Annual = paid once per year + digital certificate.',
      },
      { heading: 'How do Com Contador and Anual + A1 tiers work?', body: '1. In company setup, indicate activity type and estimated volume (entries and invoices/month).\n2. The app recommends Essential, Standard or Advanced.\n3. Exact price appears in Google Play checkout.\n4. After closed months, tier may be recalculated from real usage data.\n5. If your operation grows, the app indicates upgrade — price change is made only on Play, never by direct billing.\n\nSee Terms of Use §6.2.' },
      { heading: 'What is "IR with AI"?', body: 'Integrated Personal Income Tax module:\n- Automatic IRPF calculation with progressive table\n- Monthly Carnê-Leão from entries\n- Deductions: cash book, health, education, dependents, pension\n- Gemini AI chat for IR and deduction questions\n- FAQ with the 9 most frequent questions' },
      { heading: 'What is the "PerfectGest AI Assistant"?', body: 'General chat in the side menu, answering about:\n- How to use any app feature\n- IR, Carnê-Leão, tax audit questions\n- MEI/ME obligations (DAS, PGDAS, DASN, NFSe)\n- Plans and available features' },
      { heading: 'How do I configure the AI key?', body: '1. Visit aistudio.google.com/apikey to create a free key.\n2. In the app, go to IR → AI button or PerfectGest AI Assistant → Configure.\n3. Paste the key — stored only on your device.' },
      { heading: 'What does "company opening" mean in Com Contador and Anual + A1 plans?', body: 'Support service for incorporation/registration of your company (ME, MEI or applicable form), by PerfectGest or partners after plan subscription and document submission.' },
      { heading: 'Are Commercial Registry and city hall fees included?', body: 'No. Fees and charges paid to Commercial Registry, city hall, tax authority, notary and other bodies are the client\'s responsibility, paid directly to competent entities.' },
      { heading: 'How long does opening take?', body: 'Company opening may take up to 14 (fourteen) days after complete documentation and payment of official fees by the client.\n\nDelays from incomplete documentation, client pending items or public system outages are not guaranteed within this period.' },
      { heading: 'How do I send the month to PerfectGest?', body: '1. Close the month in the Closing tab.\n2. Accept accounting submission consent.\n3. Tap "Send month for review".\n4. Track status in the app (under review, pending items, reviewed).' },
      { heading: 'How long does review take?', body: 'Operational target: response within 5 business days after complete submission (subject to volume and pending items). Different from company opening (up to 14 days).' },
      { heading: 'A1 certificate (Anual + A1 / Com Contador Annual)', body: 'Promotional e-CNPJ A1 via Quality Cert on plans contabil_i_anual and contador_anual_parcelado_*.\n\n1. Active subscription validated on Play\n2. Menu Certificado A1 → Register certificate data\n3. Promo code / Quality link when assigned by Firebase\n\nBasic and Com Contador monthly plans do not include A1.' },
      { heading: 'Do my data go to the cloud?', body: 'Only with your consent — for CRC review, purchase validation or A1 bonus. Cash book stays local, 100% offline day to day. Gemini API key stays only on your device.' },
      { heading: 'Does the app have ads?', body: 'No.' },
      { heading: 'Do I need login?', body: 'No email/password account. Subscription linked to device Google Play account. Firebase uses anonymous identifier for cloud services.' },
      { heading: 'How do I backup?', body: 'Menu → Reports and backup → Export backup (.json).' },
      { heading: 'How do I delete everything?', body: 'Menu → Delete all data. See Data Deletion page.' },
      { heading: 'Public URLs (Play Store)', body: 'Document · URL\nPrivacy policy · https://perfectgestdev.com/contabil-i-politica-privacidade\nTerms of use · https://perfectgestdev.com/contabil-i-termos\nData deletion · https://perfectgestdev.com/contabil-i-exclusao-dados\nFAQ · https://perfectgestdev.com/contabil-i-faq' },
      { heading: 'What are "obligations" in the app?', body: 'Checklist for PGDAS, DAS, ISS, DASN-SIMEI, etc., with links to official portals.' },
      { heading: 'Can I generate cash book PDF?', body: 'Yes — Reports and backup → Generate and share PDF.' },
      { heading: 'How do I log issued invoices?', body: 'In the Entries tab → Issued invoices — enter customer, tax ID, amount and IRRF withheld. Data enters IR calculation automatically.' },
      { heading: 'Android package', body: 'br.perfectgestcontabil.dev' },
      { heading: 'Why "financial features" on Play?', body: 'Correct classification for apps handling financial/accounting data — we are not a bank.' },
      { heading: 'I lost my phone. Can I recover data?', body: 'Only with exported JSON backup. No remote recovery of local data.' },
      { heading: 'How do I contact support?', body: 'suporte@perfectgestdev.com' },
      { heading: 'Related documents', body: 'Document · Link\nPrivacy Policy · politica-privacidade.md\nTerms of Use · termos-de-uso.md\nData Deletion · exclusao-de-dados.md' },
    ],
    es: [
      { heading: '¿Qué es PerfectGest ContábilSigilo?', body: 'App de libro de caja y obligaciones fiscales para ME y MEI, con módulo IR con IA, Asistente IA PerfectGest, suscripciones Google Play y servicios opcionales de revisión contable y apertura de empresa.' },
      { heading: '¿Necesito internet?', body: '- Día a día (movimientos, cierre): no — funciona offline.\n- Asistente IA PerfectGest / IR con IA: sí — usa API Gemini (clave configurada por el usuario).\n- Suscripción, envío para revisión, bono A1: sí — requiere internet y consentimiento de nube.\n- Portales fiscales y Play Store: internet al abrir enlaces externos.' },
      { heading: '¿La app sustituye a mi contador?', body: 'No. Es herramienta de registro y apoyo. Planes Com Contador y Anual + A1 incluyen servicios PerfectGest (revisión y, según plan, apertura de empresa), pero declaraciones oficiales y dictámenes pueden exigir contrato contable con profesional CRC.' },
      { heading: '¿Mueve dinero o conecta al banco?', body: 'No. Movimientos manuales; saldo de extracto informado en el cierre del mes.' },
      {
        heading: 'Planes y precios (Google Play)',
        body:
          'Precios de referencia — prevalece la tienda en su teléfono.\n\n' +
          '<table class="compare-table"><thead><tr><th>Plan</th><th>Precio ref.</th></tr></thead><tbody>' +
          '<tr><td>Básico Mensual</td><td>R$ 9,90/mes</td></tr>' +
          '<tr><td>Básico Anual</td><td>R$ 99,90/año</td></tr>' +
          '<tr><td>Com Contador (Essencial / Standard / Avanzado)</td><td>R$ 69,90–119,90/mes</td></tr>' +
          '<tr><td>Anual contable con certificado digital</td><td>R$ 838,80–1.438,80/año</td></tr>' +
          '<tr><td>Com Contador Anual en 12 cuotas</td><td>12× R$ 69,90–119,90</td></tr>' +
          '</tbody></table>\n\n' +
          'Instalación gratuita; suscripción obligatoria. Pago y cancelación en Google Play.',
      },
      {
        heading: '¿Cuál es la diferencia entre los planes?',
        body:
          '<table class="compare-table"><thead><tr><th>Incluido</th><th>Básico (mensual o anual)</th><th>Com Contador (mensual)</th><th>Anual contable (con certificado)</th></tr></thead><tbody>' +
          '<tr><td>Libro de caja, IR, nómina y resumen del mes</td><td>Sí</td><td>Sí</td><td>Sí</td></tr>' +
          '<tr><td>Envío del mes para revisión del contador</td><td>No</td><td>Sí</td><td>Sí</td></tr>' +
          '<tr><td>Apertura de empresa (ME)</td><td>No</td><td>Sí</td><td>Sí</td></tr>' +
          '<tr><td>Certificado digital de la empresa (e-CNPJ)</td><td>No</td><td>No</td><td>Sí</td></tr>' +
          '</tbody></table>\n\n' +
          'Resumen: Básico = solo app; Com Contador = + revisión y apertura; Anual = pago anual + certificado digital.',
      },
      { heading: '¿Cómo funcionan las faixas Com Contador y Anual + A1?', body: '1. En el registro de la empresa, indique tipo de actividad y volumen estimado (movimientos y NF/mes).\n2. La app recomienda Essencial, Standard o Avanzado.\n3. El precio exacto aparece en Google Play.\n4. Tras meses cerrados, la faixa puede recalcularse con datos reales.\n5. Si la operación crece, la app indica upgrade — el cambio de precio se hace solo en Play.\n\nVer Términos de Uso §6.2.' },
      { heading: '¿Qué es el "IR con IA"?', body: 'Módulo de Impuesto sobre la Renta Persona Física integrado:\n- Cálculo automático IRPF con tabla progresiva\n- Carnê-Leão mensual generado a partir de los movimientos\n- Deducciones: libro de caja, salud, educación, dependientes, previsión\n- Chat de dudas con IA Gemini sobre IR y deducciones\n- FAQ con las 9 preguntas más frecuentes' },
      { heading: '¿Qué es el "Asistente IA PerfectGest"?', body: 'Chat general accesible por el menú lateral, que responde sobre:\n- Cómo usar cualquier funcionalidad de la app\n- Dudas sobre IR, Carnê-Leão, malha fina\n- Obligaciones MEI/ME (DAS, PGDAS, DASN, NFSe)\n- Planes y funcionalidades disponibles' },
      { heading: '¿Cómo configuro la clave de la IA?', body: '1. Acceda a aistudio.google.com/apikey para crear una clave gratuita.\n2. En la app, vaya a IR → botón IA o Asistente IA PerfectGest → Configurar.\n3. Pegue la clave — queda guardada solo en su dispositivo.' },
      { heading: '¿Qué significa "apertura de empresa" en planes Com Contador y Anual + A1?', body: 'Servicio de apoyo a constitución/registro de su empresa (ME, MEI o forma aplicable), por PerfectGest o socios tras contratar el plan y entregar documentos.' },
      { heading: '¿Están incluidas las tasas de Junta Comercial y prefectura?', body: 'No. Tasas, emolumentos y costas pagadas a Junta Comercial, prefectura, Receita Federal, notaría y otros órganos son por cuenta del cliente, pagados directamente a los entes competentes.' },
      { heading: '¿Cuánto demora la apertura?', body: 'El servicio de apertura puede demorar hasta 14 (catorce) días, contados tras entrega de documentación completa y pago de tasas oficiales por el cliente.\n\nRetrasos por documentación incompleta, pendencias del cliente o indisponibilidad de sistemas públicos no están garantizados en ese plazo.' },
      { heading: '¿Cómo envío el mes a PerfectGest?', body: '1. Cierre el mes en la pestaña Cierre.\n2. Acepte consentimiento de envío contable.\n3. Toque «Enviar mes para revisión».\n4. Siga el estado en la app (en análisis, pendencias, revisado).' },
      { heading: '¿Cuánto demora la revisión?', body: 'Meta operacional: respuesta en hasta 5 días hábiles tras envío completo (sujeto a volumen y pendencias). Plazo distinto de apertura de empresa (hasta 14 días).' },
      { heading: 'Certificado A1 (Anual + A1 / Com Contador Anual)', body: 'Bono e-CNPJ A1 vía Quality Cert en planes contabil_i_anual y contador_anual_parcelado_*.\n\n1. Suscripción activa validada en Play\n2. Menú Certificado A1 → Registrar datos\n3. Código/enlace Quality cuando Firebase lo asigne\n\nPlanes Básico y Com Contador mensual no incluyen A1.' },
      { heading: '¿Mis datos van a la nube?', body: 'Solo con su consentimiento — para revisión CRC, validación de compra o bono A1. Libro de caja permanece local, 100% offline en el día a día. La clave API Gemini queda solo en el dispositivo.' },
      { heading: '¿Tiene anuncios?', body: 'No.' },
      { heading: '¿Necesito login?', body: 'No hay cuenta con e-mail/contraseña. Suscripción vinculada a la cuenta Google Play del dispositivo. Firebase usa identificador anónimo para servicios en la nube.' },
      { heading: '¿Cómo hago backup?', body: 'Menú → Informes y backup → Exportar backup (.json).' },
      { heading: '¿Cómo borro todo?', body: 'Menú → Eliminar todos los datos. Ver página Eliminación de Datos.' },
      { heading: 'URLs públicas (Play Store)', body: 'Documento · URL\nPolítica de privacidad · https://perfectgestdev.com/contabil-i-politica-privacidade\nTérminos de uso · https://perfectgestdev.com/contabil-i-termos\nEliminación de datos · https://perfectgestdev.com/contabil-i-exclusao-dados\nFAQ · https://perfectgestdev.com/contabil-i-faq' },
      { heading: '¿Qué son las "obligaciones" en la app?', body: 'Checklist PGDAS, DAS, ISS, DASN-SIMEI, etc., con enlaces a portales oficiales.' },
      { heading: '¿Puedo generar PDF del libro de caja?', body: 'Sí — Informes y backup → Generar y compartir PDF.' },
      { heading: '¿Cómo registro NF emitidas?', body: 'En la pestaña Lanzar → NF Emitidas — informe cliente, CNPJ/CPF, valor e IRRF retenido. Los datos entran en el cálculo del IR automáticamente.' },
      { heading: 'Paquete Android', body: 'br.perfectgestcontabil.dev' },
      { heading: '¿Por qué "recursos financieros" en Play?', body: 'Clasificación correcta para apps con datos financieros/contables — no somos banco.' },
      { heading: 'Perdí el teléfono. ¿Recupero los datos?', body: 'Solo con backup JSON exportado. Sin recuperación remota de datos locales.' },
      { heading: '¿Cómo contacto soporte?', body: 'suporte@perfectgestdev.com' },
      { heading: 'Documentos relacionados', body: 'Documento · Enlace\nPolítica de Privacidad · politica-privacidade.md\nTérminos de Uso · termos-de-uso.md\nEliminación de Datos · exclusao-de-dados.md' },
    ],
  },
};
