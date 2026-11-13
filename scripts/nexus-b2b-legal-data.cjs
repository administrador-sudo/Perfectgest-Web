/**
 * Textos legais NEXUS-B2B (Play) — PT/EN/ES.
 * Package: com.perfectgestdev.rodada_negocio
 * Regenerar HTML: node scripts/nexus-b2b-static-html.cjs
 */
'use strict';

const PRODUCT = 'NEXUS-B2B';
const PACKAGE = 'com.perfectgestdev.rodada_negocio';
const ORIGIN = 'https://perfectgestdev.com';
const CONTACT =
  'suporte@perfectgestdev.com · WhatsApp +55 (51) 98904-5442';
const UPDATED = '13 de novembro de 2026';
const COMPANY =
  'PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA (CNPJ 66.889.409/0001-19)';

const pageSlugs = {
  privacy: 'nexus-b2b-politica-privacidade',
  terms: 'nexus-b2b-termos',
  deletion: 'nexus-b2b-exclusao-dados',
  faq: 'nexus-b2b-faq',
};

const header = {
  pt:
    `Última atualização: ${UPDATED}\n\n` +
    `Produto: ${PRODUCT}\n` +
    `Package Android: ${PACKAGE}\n` +
    `Desenvolvedor: ${COMPANY}\n` +
    `Contato: ${CONTACT}\n` +
    `Site: ${ORIGIN}`,
  en:
    `Last updated: November 13, 2026\n\n` +
    `Product: ${PRODUCT}\n` +
    `Android package: ${PACKAGE}\n` +
    `Developer: ${COMPANY}\n` +
    `Contact: ${CONTACT}\n` +
    `Website: ${ORIGIN}`,
  es:
    `Última actualización: 13 de noviembre de 2026\n\n` +
    `Producto: ${PRODUCT}\n` +
    `Paquete Android: ${PACKAGE}\n` +
    `Desarrollador: ${COMPANY}\n` +
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
        `Esta política descreve o ${PRODUCT}, app Android de rodada de negócio no próprio aparelho.\n\n` +
        'Não cobre os outros apps da PerfectGest.',
    },
    {
      heading: '2. O que o app faz',
      body:
        'O operador fotografa o cartão e o folder, lê o QR, grava o áudio da apresentação e guarda o lead na grade. O PDF leva o cartão, o nome ou a empresa e a marca Me interessa. A página Material carrega PDF, imagem, DOCX e PowerPoint, fotografa e escaneia documento. Imagem e PDF abrem em tela limpa.\n\n' +
        'O app é gratuito. Não cria conta, não mostra anúncio e não tem compra. Não exige internet. Não há transcrição da fala: o lead guarda e reproduz o áudio.',
    },
    {
      heading: '3. Dados no aparelho',
      body:
        'Ficam no aparelho: fotos do cartão e do folder, texto lido do cartão em alfabeto latino, dados do QR, áudio da apresentação, leads da grade, o PDF pedido pelo operador, o material (PDF, imagem, DOCX, PowerPoint, foto e documento escaneado) e o QR da empresa com os campos do formulário (nome, empresa, CNPJ, cargo, celular, e-mail, site e nota).\n\n' +
        'A PerfectGest não recebe essa rodada num servidor seu. A leitura do cartão ocorre no aparelho.',
    },
    {
      heading: '4. Permissões',
      body:
        'A câmera serve para a foto do cartão, a foto do folder, a leitura do QR, fotografar e escanear documento. O microfone serve para o áudio da apresentação. O operador escolhe quando gravar.',
    },
    {
      heading: '5. Quando algo sai do aparelho',
      body:
        'O PDF, o áudio, a imagem do QR e cada arquivo de Material só saem se o operador pedir a partilha do Android, por exemplo um rascunho do WhatsApp. Um arquivo recebido por essa partilha entra na lista Material. O site e o e-mail de suporte só abrem se o operador tocar nesses contatos.\n\n' +
        'Não vendemos dados pessoais. Não há anúncio no app.',
    },
    {
      heading: '6. Exclusão',
      body:
        `Apagar um lead remove esse lead e os arquivos locais ligados a ele. Apagar um arquivo de Material pede aviso e só remove esse arquivo. Apagar tudo deste aparelho limpa a rodada, os leads, as fotos, os áudios e o material. O QR da empresa e o formulário desse QR permanecem. Desinstalar o app remove o que ainda estiver no aparelho.\n\n` +
        `Passo a passo: ${ORIGIN}/${pageSlugs.deletion}`,
    },
    {
      heading: '7. Contato',
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
        `This policy covers ${PRODUCT} only, the Android app for an offline business round on the device. It does not cover other PerfectGest apps.`,
    },
    {
      heading: '2. What the app does',
      body:
        'The operator photographs a card and a folder, reads a QR code, records the presentation audio, and saves the lead. The PDF includes the card, the name or the company, and the Me interessa mark. The Material page loads PDF, image, DOCX, and PowerPoint files, and takes a photo or a document scan. Images and PDFs open on a clean screen.\n\n' +
        'The app is free. There is no account, no advertising, and no in-app purchase. Internet is not required. There is no speech transcription: the lead stores and plays the audio.',
    },
    {
      heading: '3. Data on the device',
      body:
        'Photos, Latin-script card text, QR data, presentation audio, leads, a PDF the operator asks for, Material files, and the company QR form stay on the device. PerfectGest does not receive that round or those files on its own server. Card reading runs on the device.',
    },
    {
      heading: '4. Permissions and sharing',
      body:
        'The camera is used for the card photo, the folder photo, QR reading, photos, and document scans. The microphone is used for the presentation audio.\n\n' +
        'A PDF, an audio file, the QR image, or a Material file leaves the device only when the operator uses the Android share sheet. A file received that way is saved in the Material list. We do not sell personal data. There are no ads in the app.',
    },
    {
      heading: '5. Deletion',
      body:
        `Deleting a lead removes that lead and its local files. Deleting one Material file asks for confirmation and removes only that file. Erase everything on this device clears the round, leads, photos, audio, and Material. The company QR form remains. Uninstalling the app removes what is still on the device.\n\n` +
        `${ORIGIN}/${pageSlugs.deletion}`,
    },
    {
      heading: '6. Contact',
      body:
        `${CONTACT}\n${ORIGIN}/${pageSlugs.privacy}`,
    },
  ],
  es: [
    {
      heading: '1. Alcance',
      body:
        `Esta política cubre solo ${PRODUCT}, la app Android de ronda de negocios en el propio aparato. No cubre las demás apps de PerfectGest.`,
    },
    {
      heading: '2. Qué hace la app',
      body:
        'El operador fotografía la tarjeta y el folleto, lee el QR, graba el audio de la presentación y guarda el lead. El PDF lleva la tarjeta, el nombre o la empresa y la marca Me interessa. La página Material carga PDF, imagen, DOCX y PowerPoint, fotografía y escanea documento. La imagen y el PDF se abren en una pantalla limpia.\n\n' +
        'La app es gratuita. No crea cuenta, no muestra anuncios y no tiene compra. No exige internet. No hay transcripción: el lead guarda y reproduce el audio.',
    },
    {
      heading: '3. Datos en el aparato',
      body:
        'Fotos, texto de la tarjeta en alfabeto latino, datos del QR, audio, leads, el PDF que pide el operador, el material y el formulario del QR de la empresa quedan en el aparato. PerfectGest no recibe esa ronda ni ese material en un servidor propio. La lectura de la tarjeta ocurre en el aparato.',
    },
    {
      heading: '4. Permisos y salida',
      body:
        'La cámara sirve para la foto de la tarjeta, la foto del folleto, la lectura del QR, fotografiar y escanear documento. El micrófono sirve para el audio.\n\n' +
        'El PDF, el audio, la imagen del QR y cada archivo de Material salen solo si el operador comparte desde Android. Un archivo recibido por esa vía entra en la lista Material. No vendemos datos personales. No hay anuncios.',
    },
    {
      heading: '5. Eliminación',
      body:
        `Borrar un lead quita ese lead y sus archivos locales. Borrar un archivo de Material pide aviso y quita solo ese archivo. Borrar todo en este aparato limpia la ronda, los leads, las fotos, los audios y el material. El formulario del QR de la empresa permanece. Desinstalar la app quita lo que aún esté en el aparato.\n\n` +
        `${ORIGIN}/${pageSlugs.deletion}`,
    },
    {
      heading: '6. Contacto',
      body: `${CONTACT}\n${ORIGIN}/${pageSlugs.privacy}`,
    },
  ],
};

const terms = {
  pt: [
    {
      heading: '1. Objeto',
      body:
        `${PRODUCT} é um aplicativo gratuito para a rodada de negócio no próprio aparelho: foto do cartão, foto do folder, leitura de QR, áudio da apresentação, lista de leads, PDF com a marca Me interessa e a página Material (PDF, imagem, DOCX, PowerPoint, foto, documento escaneado, tela limpa e partilha do Android).`,
    },
    {
      heading: '2. Sem conta, sem anúncio e sem compra',
      body:
        'Não há cadastro, não há anúncio e não há compra dentro do app. Não exige internet. Não há transcrição da fala. O acesso não depende de assinatura nem de pagamento.',
    },
    {
      heading: '3. Quem responde pela rodada',
      body:
        'O operador responde pelos contatos, fotos, áudios e arquivos de Material que grava no aparelho. A PerfectGest fornece a ferramenta e não recebe essa rodada nem esse material num servidor seu. A leitura do cartão e do QR depende da imagem e do código.',
    },
    {
      heading: '4. Uso aceitável',
      body:
        'É proibido usar o app para fim ilícito. A câmera e o microfone servem à captura da apresentação, não a vigilância escondida.',
    },
    {
      heading: '5. Alterações e foro',
      body:
        `Estes termos podem ser atualizados em ${ORIGIN}/${pageSlugs.terms}. Foro: Comarca de Caxias do Sul — RS, ressalvados os direitos do consumidor.\n\n${CONTACT}`,
    },
  ],
  en: [
    {
      heading: '1. Service',
      body:
        `${PRODUCT} is a free Android app for an offline business round on the device: card photo, folder photo, QR reading, presentation audio, a lead grid, a PDF with the Me interessa mark, and a Material page for PDF, image, DOCX, PowerPoint, a photo, a document scan, a clean screen, and Android sharing.`,
    },
    {
      heading: '2. No account, ads, or purchase',
      body:
        'There is no sign-in, no advertising, and no in-app purchase. Internet is not required. There is no speech transcription. Use does not depend on a subscription or a payment.',
    },
    {
      heading: '3. Your responsibility',
      body:
        'You are responsible for the contacts, photos, audio, and Material files you store on the device. PerfectGest does not receive that round or those files on its own server. Card and QR reading depend on the image and the code.',
    },
    {
      heading: '4. Governing law',
      body:
        `Updates are published at ${ORIGIN}/${pageSlugs.terms}. Venue: Caxias do Sul, Rio Grande do Sul, Brazil, without limiting consumer rights.\n\n${CONTACT}`,
    },
  ],
  es: [
    {
      heading: '1. Servicio',
      body:
        `${PRODUCT} es una app Android gratuita para la ronda de negocios en el propio aparato: foto de la tarjeta, foto del folleto, lectura de QR, audio de la presentación, lista de leads, PDF con la marca Me interessa y la página Material (PDF, imagen, DOCX, PowerPoint, foto, documento escaneado, pantalla limpia y compartir de Android).`,
    },
    {
      heading: '2. Sin cuenta, anuncios ni compra',
      body:
        'No hay registro, no hay anuncios y no hay compra en la app. No exige internet. No hay transcripción. El uso no depende de una suscripción ni de un pago.',
    },
    {
      heading: '3. Responsabilidad',
      body:
        'El operador responde por los contactos, fotos, audios y archivos de Material que guarda en el aparato. PerfectGest no recibe esa ronda ni ese material en un servidor propio.',
    },
    {
      heading: '4. Foro',
      body:
        `Las actualizaciones se publican en ${ORIGIN}/${pageSlugs.terms}. Fuero: Caxias do Sul — RS, sin limitar los derechos del consumidor.\n\n${CONTACT}`,
    },
  ],
};

const deletion = {
  pt: [
    {
      heading: '1. Objetivo',
      body:
        `Como apagar os dados do ${PRODUCT}. Eles ficam no aparelho. A PerfectGest não tem conta do operador nem cópia da rodada num servidor.\n\nURL: ${ORIGIN}/${pageSlugs.deletion}`,
    },
    {
      heading: '2. No app',
      body:
        '1) Apagar um lead remove esse lead e os arquivos locais ligados a ele, como a foto e o áudio, quando existirem.\n' +
        '2) Apagar um arquivo de Material pede aviso. Só esse arquivo sai. Se cancelar, ele fica. Os outros arquivos e o QR da empresa não se apagam.\n' +
        '3) Apagar tudo deste aparelho limpa a rodada, os leads, as fotos, os áudios e o material. Se ainda houver leads e o PDF desta sessão não foi gerado, o app avisa antes. Se a lista de leads da rodada atual estiver vazia, a limpeza da rodada segue sem pedir PDF.\n' +
        '4) O QR da empresa e os dados do formulário (nome, empresa, CNPJ, cargo, celular, e-mail, site e nota) permanecem depois de Apagar tudo.\n' +
        '5) Desinstalar o app remove o que ainda estiver no armazenamento do app, inclusive o QR da empresa.',
    },
    {
      heading: '3. O que não volta para a PerfectGest',
      body:
        'Um PDF, um áudio, uma imagem de QR ou um arquivo de Material já compartilhados pelo operador ficam no destino que ele escolheu, por exemplo numa conversa do WhatsApp. Não há compra para cancelar.',
    },
    {
      heading: '4. Ajuda',
      body:
        `Se precisar de orientação: ${CONTACT}`,
    },
  ],
  en: [
    {
      heading: '1. Where the data is',
      body:
        `${PRODUCT} keeps the round on the device. PerfectGest has no operator account and no server copy of the round.\n\n${ORIGIN}/${pageSlugs.deletion}`,
    },
    {
      heading: '2. In the app',
      body:
        'Delete a lead to remove that lead and its local photo and audio, when they exist. Deleting one Material file asks first and removes only that file. Erase everything on this device clears the round, leads, photos, audio, and Material. The company QR form stays. Uninstalling the app removes what remains, including that QR.',
    },
    {
      heading: '3. Copies you already shared',
      body:
        'A PDF, audio file, QR image, or Material file you already shared stays at the destination you chose. There is no purchase to cancel.',
    },
    {
      heading: '4. Help',
      body: CONTACT,
    },
  ],
  es: [
    {
      heading: '1. Dónde están los datos',
      body:
        `${PRODUCT} guarda la ronda en el aparato. PerfectGest no tiene cuenta del operador ni una copia de la ronda en un servidor.\n\n${ORIGIN}/${pageSlugs.deletion}`,
    },
    {
      heading: '2. En la app',
      body:
        'Borrar un lead quita ese lead y su foto y audio locales, si existen. Borrar un archivo de Material pide aviso y quita solo ese archivo. Borrar todo en este aparato limpia la ronda, los leads, las fotos, los audios y el material. El formulario del QR de la empresa permanece. Desinstalar la app quita lo que quede, incluido ese QR.',
    },
    {
      heading: '3. Copias ya compartidas',
      body:
        'Un PDF, un audio, una imagen de QR o un archivo de Material ya compartidos quedan en el destino elegido. No hay compra que cancelar.',
    },
    {
      heading: '4. Ayuda',
      body: CONTACT,
    },
  ],
};

const faq = {
  pt: [
    {
      heading: 'O que é o NEXUS-B2B?',
      body:
        'É o app da rodada de negócio no próprio aparelho. O operador fotografa o cartão e o folder, lê o QR, grava o áudio da apresentação e gera um PDF com o cartão, o nome ou a empresa e a marca Me interessa. A página Material carrega PDF, imagem, DOCX e PowerPoint, fotografa e escaneia documento.',
    },
    {
      heading: 'Qual é o pacote Android?',
      body: PACKAGE,
    },
    {
      heading: 'Precisa de conta, anúncio ou compra?',
      body:
        'Não. O app é gratuito. Não pede conta, não mostra anúncio e não tem compra.',
    },
    {
      heading: 'A fala vira texto?',
      body:
        'Não. Não há transcrição. O lead guarda o áudio e pode reproduzi-lo.',
    },
    {
      heading: 'Para onde vão os dados?',
      body:
        'Ficam no aparelho. A PerfectGest não recebe a rodada nem o material num servidor seu. PDF, áudio, imagem do QR e cada arquivo de Material só saem se o operador partilhar. O app também pode receber um arquivo por essa partilha.',
    },
    {
      heading: 'O que a página Material faz?',
      body:
        'Carrega PDF, imagem, DOCX e PowerPoint. Fotografa e escaneia documento. Imagem e PDF abrem em tela limpa. Enviar e receber usam a partilha do Android. Apagar um arquivo pede aviso e não apaga os outros nem o QR da empresa. O material fica no aparelho até Apagar tudo.',
    },
    {
      heading: 'O que Apagar tudo remove?',
      body:
        'Remove a rodada, os leads, as fotos, os áudios e o material deste aparelho. Não remove o QR da empresa nem os dados do formulário desse QR. Desinstalar o app remove também esse restante.',
    },
    {
      heading: 'Estas páginas valem para outros apps?',
      body:
        'Não. Valem só para o NEXUS-B2B.',
    },
    {
      heading: 'Onde estão as políticas?',
      body:
        `${ORIGIN}/${pageSlugs.privacy}\n` +
        `${ORIGIN}/${pageSlugs.terms}\n` +
        `${ORIGIN}/${pageSlugs.deletion}\n` +
        `${ORIGIN}/${pageSlugs.faq}`,
    },
    {
      heading: 'Suporte',
      body: CONTACT,
    },
  ],
  en: [
    {
      heading: 'What is NEXUS-B2B?',
      body:
        'It is the on-device business-round app. The operator photographs a card and a folder, reads a QR code, records the presentation audio, and builds a PDF with the card, the name or the company, and the Me interessa mark. The Material page loads PDF, image, DOCX, and PowerPoint files, and takes a photo or a document scan.',
    },
    {
      heading: 'What is the Android package?',
      body: PACKAGE,
    },
    {
      heading: 'Is there an account, ads, or a purchase?',
      body:
        'No. The app is free. It does not ask for an account, show ads, or sell anything.',
    },
    {
      heading: 'Is speech transcribed?',
      body:
        'No. The lead stores the audio and can play it back.',
    },
    {
      heading: 'Where does the data go?',
      body:
        'It stays on the device. PerfectGest does not receive the round or the Material files on its own server. A PDF, audio file, QR image, or Material file leaves only if the operator shares it. The app can also receive a file through that share sheet.',
    },
    {
      heading: 'What does the Material page do?',
      body:
        'It loads PDF, image, DOCX, and PowerPoint files. It takes a photo and scans a document. Images and PDFs open on a clean screen. Sending and receiving use the Android share sheet. Deleting one file asks first and does not delete the others or the company QR. Material stays on the device until erase everything.',
    },
    {
      heading: 'What does erase everything remove?',
      body:
        'It removes the round, leads, photos, audio, and Material on this device. It does not remove the company QR form. Uninstalling the app removes that remainder too.',
    },
    {
      heading: 'Support',
      body: CONTACT,
    },
  ],
  es: [
    {
      heading: '¿Qué es NEXUS-B2B?',
      body:
        'Es la app de la ronda de negocios en el propio aparato. El operador fotografía la tarjeta y el folleto, lee el QR, graba el audio y genera un PDF con la tarjeta, el nombre o la empresa y la marca Me interessa. La página Material carga PDF, imagen, DOCX y PowerPoint, fotografía y escanea documento.',
    },
    {
      heading: '¿Cuál es el paquete Android?',
      body: PACKAGE,
    },
    {
      heading: '¿Hay cuenta, anuncios o compra?',
      body:
        'No. La app es gratuita. No pide cuenta, no muestra anuncios y no tiene compra.',
    },
    {
      heading: '¿La voz se convierte en texto?',
      body:
        'No. No hay transcripción. El lead guarda el audio y puede reproducirlo.',
    },
    {
      heading: '¿Adónde van los datos?',
      body:
        'Quedan en el aparato. PerfectGest no recibe la ronda ni el material en un servidor propio. El PDF, el audio, la imagen del QR y cada archivo de Material salen solo si el operador los comparte. La app también puede recibir un archivo por esa vía.',
    },
    {
      heading: '¿Qué hace la página Material?',
      body:
        'Carga PDF, imagen, DOCX y PowerPoint. Fotografía y escanea documento. La imagen y el PDF se abren en una pantalla limpia. Enviar y recibir usan el compartir de Android. Borrar un archivo pide aviso y no borra los demás ni el QR de la empresa. El material queda en el aparato hasta Borrar todo.',
    },
    {
      heading: '¿Qué borra Apagar tudo?',
      body:
        'Quita la ronda, los leads, las fotos, los audios y el material de este aparato. No quita el formulario del QR de la empresa. Desinstalar la app quita también ese resto.',
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
