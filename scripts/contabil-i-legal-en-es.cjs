/** EN/ES — paralelo ao PT em mobile/docs/politicas (Contabil I). */
module.exports = {
  privacy: {
    en: [
      {
        heading: '1. Who we are',
        body:
          'This policy describes how the PerfectGest-Contabil I app (“App”), developed by PerfectGest, handles information when you use it on your Android device.\n\n' +
          'App name: PerfectGest-Contabil I\n' +
          'Android package: br.perfectgestcontabil.dev\n' +
          'Privacy contact: suporte@perfectgestdev.com\n' +
          'Public policy: https://perfectgestdev.com/contabil-i-politica-privacidade',
      },
      {
        heading: '2. Core principle: data on your device',
        body:
          'The App is designed for offline-first operational accounting. By default:\n\n' +
          '• Entries, tax obligations, month-end closing and company data stay on your device (local storage).\n' +
          '• We do not automatically send your accounting data to PerfectGest servers.\n' +
          '• We do not use ad tracking or accounting-content analytics.\n\n' +
          'Local export only when you tap “Generate and share PDF”, “Export backup” or “Import backup”.\n\n' +
          'Exception (with consent): sending the month for accounting review, Google Play subscription validation, A1 certificate bonus, and data needed for company opening services — see section 5.',
      },
      {
        heading: '3. Data the App may process',
        body:
          '3.1 Data you enter\n' +
          '• Company data: legal name, tax ID, CNAE, contacts — on device\n' +
          '• Financial data: entries, amounts, categories, balances — on device\n' +
          '• Tax obligations: compliance marks, notes — on device\n' +
          '• Receipts: attached file name (optional) — on device\n' +
          '• Preferences: theme, privacy and cloud consent — on device\n\n' +
          '3.2 Not collected automatically\n' +
          'GPS location, phone contacts, ad identifiers, browsing history outside the App.',
      },
      {
        heading: '4. How we use data',
        body:
          'We use data to: operate the cash book and entries; track tax obligations and month-end closing; generate PDF and backup when requested; validate subscriptions and deliver contracted services (company opening, CRC review, A1 bonus) — with consent.\n\n' +
          'Legal basis (LGPD): contract performance and features you request; consent for cloud upload and additional accounting services.',
      },
      {
        heading: '5. Sharing with third parties',
        body:
          'We do not sell accounting data.\n\n' +
          '5.1 Local actions (your initiative only)\n' +
          '• Share PDF — sent to the app you choose\n' +
          '• Export/import JSON backup — shared by you\n' +
          '• Open tax portals — external browser; government site policies apply\n\n' +
          '5.2 Cloud services (Firebase/Google) — with consent\n' +
          'Enabled only with explicit acceptance:\n' +
          '• Validate Google Play subscription — purchase token, product ID\n' +
          '• CRC review — monthly package: company, entries, reconciliation, PDF\n' +
          '• Company opening — registration data and documents for the process\n' +
          '• A1 certificate bonus — bonus status, promo code\n' +
          '• Technical session — anonymous Firebase identifier\n\n' +
          'You may revoke cloud consent in Privacy & security. Local cash book continues; review, A1 bonus and cloud validation require new consent.\n\n' +
          '5.3 Company opening — timeline and fees\n' +
          'When contracted (Contabil+ or Annual plans):\n' +
          '• Official fees (Commercial Registry, city hall, tax authority, etc.) are not included — paid by the client to the competent bodies.\n' +
          '• The opening process may take up to 14 (fourteen) days after complete documentation, referring to administrative steps: Commercial Registry request, approvals, city hall registration and other legal procedures — subject to third-party deadlines.\n\n' +
          'Contract details: Terms of Use, section 5.',
      },
      {
        heading: '6. Security',
        body:
          'Local data in the app private space. Cloud (Firebase) only after consent; restricted access for authorized team. We recommend screen lock and secure backups.',
      },
      {
        heading: '7. Retention and deletion',
        body:
          'On device: until “Delete all data” or uninstall.\n\n' +
          'In the cloud (review submissions): retained as long as needed for the service and legal/accounting obligations; contact suporte@perfectgestdev.com.',
      },
      {
        heading: '8. Your rights (LGPD)',
        body:
          'Access, correct, export, delete (locally), revoke consent and object to unlawful processing.\n\nContact: suporte@perfectgestdev.com',
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
          'Complements Google Play User Data Policy. The Play Console “Data safety” form summarizes this information.',
      },
    ],
    es: [
      {
        heading: '1. Quiénes somos',
        body:
          'Esta política describe cómo la app PerfectGest-Contabil I (“App”), desarrollada por PerfectGest, trata la información cuando la utiliza en su dispositivo Android.\n\n' +
          'Nombre: PerfectGest-Contabil I\n' +
          'Paquete Android: br.perfectgestcontabil.dev\n' +
          'Contacto privacidad: suporte@perfectgestdev.com\n' +
          'Política pública: https://perfectgestdev.com/contabil-i-politica-privacidade',
      },
      {
        heading: '2. Principio fundamental: datos en su dispositivo',
        body:
          'La App está diseñada para contabilidad operacional offline-first. Por defecto:\n\n' +
          '• Movimientos, obligaciones fiscales, cierres de mes y datos de la empresa permanecen en el dispositivo.\n' +
          '• No enviamos automáticamente sus datos contables a servidores PerfectGest.\n' +
          '• No utilizamos rastreo publicitario ni analytics del contenido contable.\n\n' +
          'Excepción (con consentimiento): envío del mes para revisión contable, validación de suscripción Google Play, bono certificado A1 y datos para apertura de empresa — ver sección 5.',
      },
      {
        heading: '3. Datos que la App puede tratar',
        body:
          '3.1 Datos que usted introduce\n' +
          '• Empresa, datos financieros, obligaciones fiscales, comprobantes (nombre de archivo), preferencias — en el dispositivo\n\n' +
          '3.2 No recogidos automáticamente\n' +
          'Ubicación GPS, lista de contactos, identificadores publicitarios, historial de navegación.',
      },
      {
        heading: '4. Cómo usamos los datos',
        body:
          'Para operar el libro de caja, obligaciones, cierres, PDF y backup; validar suscripción y prestar servicios contratados (apertura de empresa, revisión CRC, bono A1) — con consentimiento. Base legal LGPD: ejecución de contrato y consentimiento para la nube.',
      },
      {
        heading: '5. Compartir con terceros',
        body:
          'No vendemos datos contables.\n\n' +
          '5.1 Acciones locales (solo por su iniciativa)\n' +
          '• Compartir PDF, exportar/importar backup JSON, abrir portales fiscales en el navegador\n\n' +
          '5.2 Servicios en la nube (Firebase/Google) — con consentimiento\n' +
          '• Validar suscripción Google Play · Envío para revisión CRC · Apertura de empresa · Bono A1 · Sesión técnica Firebase\n\n' +
          'Puede revocar el consentimiento de nube en Privacidad y seguridad.\n\n' +
          '5.3 Apertura de empresa — plazo y tasas\n' +
          '• Tasas oficiales no incluidas — pagadas por el cliente.\n' +
          '• El proceso puede demorar hasta 14 (catorce) días tras documentación completa (Junta Comercial, aprobaciones, prefectura, etc.).',
      },
      {
        heading: '6. Seguridad',
        body: 'Datos locales en espacio privado de la app. Nube solo con consentimiento. Recomendamos bloqueo de pantalla y backup seguro.',
      },
      {
        heading: '7. Retención y eliminación',
        body: 'En el dispositivo: hasta «Eliminar todos los datos» o desinstalar. En la nube: según servicio y obligaciones legales; contacte suporte@perfectgestdev.com.',
      },
      {
        heading: '8. Sus derechos (LGPD)',
        body: 'Acceso, corrección, exportación, eliminación local, revocación de consentimiento. Contacto: suporte@perfectgestdev.com',
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
        body: 'Complementa la Política de Datos de Usuario de Google Play.',
      },
    ],
  },
  terms: {
    en: [
      { heading: '1. Acceptance', body: 'By installing, opening or using PerfectGest-Contabil I (“App”), you agree to these Terms of Use and the Privacy Policy. If you disagree, do not use the App and uninstall it.' },
      { heading: '2. What the App is', body: 'Operational accounting support tool for micro-businesses and MEI: cash book, tax obligations, month-end closing, reconciliation, PDF export, local backup, and optional Google Play subscriptions (Monthly, Contabil+ and Annual).' },
      { heading: '3. What the App is not', body: 'Not a bank, financial institution or payment method. Does not process transfers, PIX, cards or real bank movements. Does not replace a certified accountant or guarantee automatic tax compliance. You remain responsible for entries and filings.' },
      { heading: '4. Plans and subscriptions (Google Play)', body: 'Free to install; full access requires Google Play subscription.\n\nMonthly · R$ 14.90/month — Business organizer (cash book, obligations, closing)\nContabil+ · R$ 59.90/month — App + company opening + monthly CRC review\nAnnual · R$ 718.90/year — App + company opening + CRC review + CNPJ A1 certificate bonus\n\nPayment, renewal and cancellation follow Google Play rules. Store prices prevail. Product IDs: contabil_i_mensal, contabil_i_contabil_plus, contabil_i_anual.' },
      { heading: '5. Company opening service', body: 'Contabil+ and Annual plans may include company opening (incorporation/registration) by PerfectGest or partners, when applicable.\n\n5.1 Not included\nOfficial fees (Commercial Registry, city hall, tax authority, notary, etc.) — client responsibility, paid directly to competent bodies.\n\n5.2 Process timeline\nOpening may take up to 14 (fourteen) days after complete documentation and payment of official fees by the holder. This refers to the administrative process: Commercial Registry, approvals, city hall registration and other legal steps. Does not include delays from incomplete documents, client pending items, public system outages or force majeure.' },
      { heading: '6. Accounting review (Contabil+ and Annual)', body: 'With Contabil+ or Annual, you may send the closed month to PerfectGest for accounting review, with explicit consent for cloud processing (Firebase). PerfectGest responds in the app (under review, pending items, reviewed). Official tax filings may require a separate accounting services contract with a CRC professional.' },
      { heading: '7. A1 digital certificate (Annual plan)', body: 'Annual plan may include promotional e-CNPJ A1 certificate via partner certifier (Quality Cert), delivered in the app after payment confirmation. Issuance follows the certifier identity validation process.' },
      { heading: '8. Permitted use', body: 'Record business movements, organize obligations, export data, subscribe to plans and request opening/review when eligible. Prohibited: illegal or fraudulent use, bypassing technical limits, unauthorized redistribution.' },
      { heading: '9. Data and responsibility', body: 'You are responsible for accuracy of entered data. Main storage is local; device loss may mean data loss without backup. Export backups periodically. Cloud uploads only with consent. See Privacy Policy and Data Deletion.' },
      { heading: '10. External links', body: 'The App may open official sites (tax authority, MEI portals, municipal ISS, Quality Cert, Google Play) in your browser. PerfectGest does not control third-party content or policies.' },
      { heading: '11. Availability and updates', body: 'Provided “as is” without uninterrupted availability guarantee. Updates via Google Play for fixes, improvements or legal compliance.' },
      { heading: '12. Intellectual property', body: 'App, PerfectGest brand, logos and code are property of PerfectGest or licensors. These Terms do not grant ownership rights over the software.' },
      { heading: '13. Limitation of liability', body: 'To the maximum extent permitted by law, PerfectGest is not liable for tax fines, filing errors or decisions based solely on the App; not liable for indirect damages or data loss from misuse or lack of backup; does not guarantee opening in less than 14 days when dependent on third parties. The App is a recording assistant; validate tax and accounting decisions with qualified professionals when needed.' },
      { heading: '14. Termination', body: 'You may cancel subscriptions on Google Play and stop using the App at any time, deleting data (see Data Deletion) and uninstalling.' },
      { heading: '15. Governing law', body: 'These Terms are governed by the laws of Brazil, including the Consumer Code and LGPD when applicable. Venue: consumer domicile under the CDC, unless otherwise required by law.' },
      { heading: '16. Contact', body: 'PerfectGest — suporte@perfectgestdev.com' },
    ],
    es: [
      { heading: '1. Aceptación', body: 'Al instalar, abrir o utilizar PerfectGest-Contabil I (“App”), acepta estos Términos de Uso y la Política de Privacidad. Si no está de acuerdo, no utilice la App y desinstálela.' },
      { heading: '2. Qué es la App', body: 'Herramienta de apoyo contable operacional para ME y MEI: libro de caja, obligaciones fiscales, cierre de mes, conciliación, PDF, backup local y suscripciones opcionales Google Play (Mensual, Contabil+ y Anual).' },
      { heading: '3. Qué no es la App', body: 'No es banco ni medio de pago. No procesa transferencias, PIX ni tarjetas. No sustituye contador certificado ni garantiza conformidad fiscal automática.' },
      { heading: '4. Planes y suscripciones (Google Play)', body: 'Instalación gratuita; acceso completo requiere suscripción Google Play.\n\nMensual · R$ 14,90/mes · Contabil+ · R$ 59,90/mes · Anual · R$ 718,90/año\n\nIncluyen gerenciador, apertura de empresa (Contabil+/Anual), revisión CRC y certificado A1 (Anual). Precios de la tienda prevalecen. IDs: contabil_i_mensal, contabil_i_contabil_plus, contabil_i_anual.' },
      { heading: '5. Servicio de apertura de empresa', body: 'Planes Contabil+ y Anual pueden incluir apertura de empresa por PerfectGest o socios.\n\n5.1 No incluido: tasas oficiales (Junta Comercial, prefectura, etc.) — responsabilidad del cliente.\n\n5.2 Plazo: hasta 14 (catorce) días tras documentación completa y pago de tasas — proceso administrativo (Junta Comercial, aprobaciones, prefectura). No incluye retrasos por documentación incompleta o sistemas públicos.' },
      { heading: '6. Revisión contable (Contabil+ / Anual)', body: 'Puede enviar el mes cerrado a PerfectGest para revisión, con consentimiento explícito para la nube (Firebase). Respuesta en la app. Declaraciones oficiales pueden requerir contrato contable separado con profesional CRC.' },
      { heading: '7. Certificado A1 (plan Anual)', body: 'Bono promocional e-CNPJ A1 vía Quality Cert, entregado en la app tras confirmación de pago.' },
      { heading: '8. Uso permitido', body: 'Registrar movimientos, organizar obligaciones, exportar datos, suscribir planes y solicitar apertura/revisión cuando corresponda. Prohibido uso ilegal o redistribución no autorizada.' },
      { heading: '9. Datos y responsabilidad', body: 'Usted es responsable de la exactitud de los datos. Almacenamiento principal local; exporte backups periódicamente. Envíos a la nube solo con consentimiento.' },
      { heading: '10. Enlaces externos', body: 'La App puede abrir sitios oficiales en el navegador. PerfectGest no controla contenido de terceros.' },
      { heading: '11. Disponibilidad y actualizaciones', body: 'Proporcionada “tal cual”. Actualizaciones vía Google Play.' },
      { heading: '12. Propiedad intelectual', body: 'App, marca PerfectGest y código son propiedad de PerfectGest o licenciantes.' },
      { heading: '13. Limitación de responsabilidad', body: 'PerfectGest no responde por multas fiscales, errores de registro o pérdida de datos por falta de backup; no garantiza apertura en menos de 14 días cuando depende de terceros. Valide con profesional habilitado cuando sea necesario.' },
      { heading: '14. Rescisión', body: 'Puede cancelar suscripciones en Google Play y dejar de usar la App en cualquier momento.' },
      { heading: '15. Ley aplicable', body: 'Leyes de Brasil (LGPD y CDC cuando corresponda). Foro: domicilio del consumidor.' },
      { heading: '16. Contacto', body: 'PerfectGest — suporte@perfectgestdev.com' },
    ],
  },
  deletion: {
    en: [
      { heading: '1. Purpose', body: 'This document explains how to permanently delete data processed by PerfectGest-Contabil I, in compliance with LGPD and Google Play policies.\n\nPublic URL: https://perfectgestdev.com/contabil-i-exclusao-dados' },
      { heading: '2. What can be deleted on the device', body: '“Delete all data” irreversibly removes from the device:\n\nCash book · Accounting entries · Obligations · Month-end closing · Company profile · Configuration · Preferences (including privacy and cloud consent).' },
      { heading: '3. Cloud data (review, subscription, A1)', body: 'If you used review submission, A1 bonus or cloud services:\n\n• Copies may exist on Firebase (Google Cloud) as long as needed for the service and legal obligations.\n• Deleting data in the app does not automatically delete all cloud records.\n• To request cloud deletion: suporte@perfectgestdev.com (include tax ID, month sent and Google Play email if applicable).' },
      { heading: '4. Not deleted automatically', body: 'Exported PDFs/backups · Google Play purchase records · Company opening process already started (legal retention may apply) · Data on government websites.' },
      { heading: '5. How to delete in the App', body: '1. Menu → “Delete all data”\n2. Check “I have read and understand…”\n3. Type DELETE (ELIMINAR in Portuguese UI)\n4. Confirm “Delete permanently”\n\nAfter: new privacy acceptance on next launch; no local recovery.' },
      { heading: '6. Uninstall', body: 'Uninstalling removes local data. Before selling the phone: Delete all data + uninstall.' },
      { heading: '7. Exported backups', body: 'Exported .json files are your responsibility — delete where stored.' },
      { heading: '8. Timelines', body: 'On device: immediate after confirmation.\nCloud deletion request: response within 15 days (LGPD), execution per review.\nOngoing company opening: documents may be retained per applicable legal period.' },
      { heading: '9. Contact', body: 'suporte@perfectgestdev.com' },
    ],
    es: [
      { heading: '1. Objetivo', body: 'Este documento explica cómo eliminar permanentemente los datos tratados por PerfectGest-Contabil I, conforme LGPD y Google Play.\n\nURL pública: https://perfectgestdev.com/contabil-i-exclusao-dados' },
      { heading: '2. Qué se puede eliminar en el dispositivo', body: '«Eliminar todos los datos» borra irreversiblemente: libro de caja, contabilidad, obligaciones, cierre de mes, empresa, configuración y preferencias.' },
      { heading: '3. Datos en la nube', body: 'Si utilizó envío para revisión, bono A1 o servicios en la nube: copias pueden existir en Firebase. Eliminar en la app no borra automáticamente la nube. Solicite eliminación: suporte@perfectgestdev.com.' },
      { heading: '4. No eliminado automáticamente', body: 'PDFs/backups exportados · Registros Google Play · Apertura de empresa en curso · Datos en sitios gubernamentales.' },
      { heading: '5. Cómo eliminar en la App', body: 'Menú → «Eliminar todos los datos» → marcar confirmación → escribir ELIMINAR → confirmar. Irreversible.' },
      { heading: '6. Desinstalación', body: 'Desinstalar elimina datos locales. Recomendado: eliminar datos en la app antes de vender el teléfono.' },
      { heading: '7. Backups exportados', body: 'Archivos .json exportados son su responsabilidad.' },
      { heading: '8. Plazos', body: 'Dispositivo: inmediato. Nube: respuesta en hasta 15 días (LGPD). Apertura en curso: retención legal posible.' },
      { heading: '9. Contacto', body: 'suporte@perfectgestdev.com' },
    ],
  },
  faq: {
    en: [
      { heading: 'What is PerfectGest-Contabil I?', body: 'Cash book and tax obligations app for ME and MEI, with Google Play subscriptions and optional accounting review and company opening services.' },
      { heading: 'Do I need internet?', body: 'Daily use (entries, closing): no — works offline. Subscription, review submission, A1 bonus: yes — requires internet and cloud consent. Tax portals and Play Store: internet when opening external links.' },
      { heading: 'Does the app replace my accountant?', body: 'No. It is a recording and support tool. Contabil+ and Annual include PerfectGest services (review and, per plan, company opening), but official filings may require a CRC accounting contract.' },
      { heading: 'Does the app move money or connect to the bank?', body: 'No. Manual entries; bank statement balance entered at month-end closing.' },
      { heading: 'Plans and prices (Google Play)', body: 'Monthly R$ 14.90/month · Contabil+ R$ 59.90/month · Annual R$ 718.90/year. Free install; subscription required for full access. Payment and cancellation on Google Play. Store price prevails.' },
      { heading: 'What does “company opening” mean in Contabil+ and Annual?', body: 'Support service for incorporation/registration of your company (ME, MEI or applicable form), by PerfectGest or partners after plan subscription and document submission.' },
      { heading: 'Are Commercial Registry and city hall fees included?', body: 'No. Fees and charges paid to Commercial Registry, city hall, tax authority, notary and other bodies are the client’s responsibility, paid directly to competent entities.' },
      { heading: 'How long does opening take?', body: 'Up to 14 (fourteen) days after complete documentation and payment of official fees by the client. Refers to the administrative process: Commercial Registry, approvals, city hall registration and other legal steps. Delays from incomplete documents or public systems are not guaranteed within this period.' },
      { heading: 'How do I send the month for review?', body: '1. Close the month in the Closing tab. 2. Accept accounting submission consent. 3. Tap “Send month for review”. 4. Track status in the app.' },
      { heading: 'How long does review take?', body: 'Operational target: response within 5 business days after complete submission (subject to volume and pending items). Different from company opening (up to 14 days).' },
      { heading: 'A1 certificate (Annual plan)', body: 'Promotional e-CNPJ A1 bonus via Quality Cert, delivered in the app after confirmed payment. Issuance follows certifier identity validation.' },
      { heading: 'Do my data go to the cloud?', body: 'Only with your consent — for CRC review, purchase validation or A1 bonus. Cash book stays local by default.' },
      { heading: 'Does the app have ads?', body: 'No.' },
      { heading: 'Do I need login?', body: 'No email/password account. Subscription linked to device Google Play account. Firebase uses anonymous identifier for cloud services.' },
      { heading: 'How do I backup?', body: 'Menu → Reports and backup → Export backup (.json).' },
      { heading: 'How do I delete everything?', body: 'Menu → Delete all data. See Data Deletion page.' },
      { heading: 'What are “obligations” in the app?', body: 'Checklist for PGDAS, DAS, ISS, etc., with links to official portals.' },
      { heading: 'Can I generate cash book PDF?', body: 'Yes — Reports and backup → Generate and share PDF.' },
      { heading: 'Android package', body: 'br.perfectgestcontabil.dev' },
      { heading: 'Why “financial features” on Play?', body: 'Correct classification for apps handling financial/accounting data — we are not a bank.' },
      { heading: 'I lost my phone. Can I recover data?', body: 'Only with exported JSON backup. No remote recovery of local data.' },
      { heading: 'How do I contact support?', body: 'suporte@perfectgestdev.com' },
    ],
    es: [
      { heading: '¿Qué es PerfectGest-Contabil I?', body: 'App de libro de caja y obligaciones fiscales para ME y MEI, con suscripciones Google Play y servicios opcionales de revisión contable y apertura de empresa.' },
      { heading: '¿Necesito internet?', body: 'Uso diario: no — funciona offline. Suscripción, envío para revisión, bono A1: sí — requiere internet y consentimiento de nube.' },
      { heading: '¿La app sustituye a mi contador?', body: 'No. Herramienta de registro y apoyo. Planes Contabil+ y Anual incluyen servicios PerfectGest, pero declaraciones oficiales pueden requerir contrato contable CRC.' },
      { heading: '¿Mueve dinero o conecta al banco?', body: 'No. Movimientos manuales; saldo de extracto informado en el cierre del mes.' },
      { heading: 'Planes y precios (Google Play)', body: 'Mensual R$ 14,90/mes · Contabil+ R$ 59,90/mes · Anual R$ 718,90/año. Instalación gratuita; suscripción obligatoria para uso completo.' },
      { heading: '¿Qué significa “apertura de empresa”?', body: 'Apoyo a constitución/registro de su empresa, por PerfectGest o socios tras contratar el plan y entregar documentos.' },
      { heading: '¿Están incluidas las tasas de Junta Comercial y prefectura?', body: 'No. Tasas pagadas a Junta Comercial, prefectura, Receita Federal, etc. son por cuenta del cliente.' },
      { heading: '¿Cuánto demora la apertura?', body: 'Hasta 14 (catorce) días tras documentación completa y pago de tasas oficiales. Proceso administrativo: Junta Comercial, aprobaciones, prefectura. Retrasos por documentación incompleta no garantizados en ese plazo.' },
      { heading: '¿Cómo envío el mes para revisión?', body: 'Cierre el mes → acepte consentimiento → toque «Enviar mes para revisión» → siga el estado en la app.' },
      { heading: '¿Cuánto demora la revisión?', body: 'Meta operacional: hasta 5 días hábiles tras envío completo. Plazo distinto de apertura de empresa (hasta 14 días).' },
      { heading: 'Certificado A1 (plan Anual)', body: 'Bono e-CNPJ A1 vía Quality Cert, entregado en la app tras pago confirmado.' },
      { heading: '¿Mis datos van a la nube?', body: 'Solo con su consentimiento — revisión CRC, validación de compra o bono A1. Libro de caja local por defecto.' },
      { heading: '¿Tiene anuncios?', body: 'No.' },
      { heading: '¿Necesito login?', body: 'No hay cuenta e-mail/contraseña. Suscripción vinculada a Google Play del dispositivo.' },
      { heading: '¿Cómo hago backup?', body: 'Menú → Informes y backup → Exportar backup (.json).' },
      { heading: '¿Cómo borro todo?', body: 'Menú → Eliminar todos los datos. Ver página Eliminación de Datos.' },
      { heading: '¿Qué son las “obligaciones”?', body: 'Checklist PGDAS, DAS, ISS, etc., con enlaces a portales oficiales.' },
      { heading: '¿Puedo generar PDF del libro de caja?', body: 'Sí — Informes y backup → Generar y compartir PDF.' },
      { heading: 'Paquete Android', body: 'br.perfectgestcontabil.dev' },
      { heading: '¿Por qué “recursos financieros” en Play?', body: 'Clasificación correcta para apps con datos financieros/contables — no somos banco.' },
      { heading: 'Perdí el teléfono. ¿Recupero los datos?', body: 'Solo con backup JSON exportado. Sin recuperación remota de datos locales.' },
      { heading: '¿Cómo contacto soporte?', body: 'suporte@perfectgestdev.com' },
    ],
  },
};
