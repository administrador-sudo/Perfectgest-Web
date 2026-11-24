# Evolucao — Web_perfectgest

## [2026-11-24] Rodapé da home

- O rodapé tem o link `/?flutter=1` para abrir o site em Flutter e a linha de direitos reservados de 2026.

## [2026-11-24] Selo do hero

- O selo CRC Ativo passa a ser Sistema Inteligente Ativo.

## [2026-11-24] Botão do ContabilGest no hero

- O segundo botão do hero abre o ContabilGest na Google Play.

## [2026-11-24] Portfólio na Play

- O rodapé aponta para a página de desenvolvedor na Google Play.

## [2026-11-24] Endereço e horário na home

- A visita presencial mostra Rua Pietro Fiorelli, 61, Rio Branco, Caxias do Sul - RS.
- O horário é agendado com o contador Marcos pelo telefone 54 99973-0205.

## [2026-11-24] Ícones do Agenda Barbeiro e da Rodada

- O card Agenda Barbeiro mostra o escudo com o poste de barbeiro.
- O card B2B Rodada Negócio mostra o escudo verde com o P.

## [2026-11-24] Novo ícone do Orçamentos e Gestão

- O card em destaque usa o escudo verde e azul no lugar do ícone anterior.

## [2026-11-24] Ícone do Orçamentos e Gestão

- O ícone do app fica à esquerda do nome Orçamentos e Gestão no card em destaque.

## [2026-11-24] Ícone do ContábilGest na home

- O ícone do app fica à esquerda do título da seção ContábilGest.

## [2026-11-24] Play da Rodada Negócio

- O card B2B Rodada Negócio abre `com.perfectgestdev.rodada_negocio` na Google Play. O marcador do link saiu.

## [2026-11-24] Título da home e bloco do brasão

- O título da home passa a ser “Contabilidade Presencial na Serra Gaúcha - RS, para prestadores de serviço.”
- O brasão e o nome ficam num bloco branco, e “Soluções para Profissionais” fica mais afastado.

## [2026-11-24] Home no aspecto de /contabilidade

- A landing usa o fundo cinza, o cartão branco e os botões dourados da página `/contabilidade`.
- O brasão do escritório passa a ser a versão com fundo branco. Políticas não foram alteradas.

## [2026-11-24] Marca do escritório na home e em /contabilidade

- O brasão do escritório e o nome PerfectGest, com Gest em verde `#4AA969`, entram na landing e no topo de `/contabilidade`.
- Políticas, Barber e o wordmark do restante do site ficam como estavam.

## [2026-11-24] Página /contabilidade alinhada à home

- Textos, selo, duas colunas e a confirmação da rota `/contabilidade` passam a falar de parceria em Caxias do Sul, ContábilGest e isenção do Orçamentos e Gestão.
- O envio para o gerenciador do escritório ficou igual: mesmos campos, mesmo `_openProposal` e mesmos serviços AWS/Firestore. A página do Escritorio001 não usa esse visual.

## [2026-11-24] Landing da home para prestadores de serviço

- A `/` deixa de mostrar a splash do Flutter e passa a ser a landing de Orçamentos e Gestão, com atendimento presencial em Caxias do Sul.
- Nas outras rotas o Flutter continua a abrir. Endereço, horário, Play da Rodada e portfólio ficam com marcador.

## [2026-11-23] Cartão do WhatsApp por loja

- Cada link `/Barber_Hairdresser/{loja}` leva o nome e o logo dessa loja (`/barber-logo/{loja}.png`). Sem logo, o cartão usa o ícone do Agenda Barbeiro (`/barber-app-logo.png`). O PNG único da loja piloto deixa de ser o cartão de todas.

## [2026-11-23] Versão da Play na página

- A faixa do agendar e o rodapé mostram V 1.0.32, o mesmo nome que sobe para a Play.

## [2026-11-23] Grade, terceiro horário e comprovante PIX

- Consulta do dia que falha mostra o erro e não abre a grade livre.
- O mesmo minuto aceita outro documento `slot_…_r`, `slot_…_r2` até `_r8` quando o anterior já está cancelado ou concluído.
- Comprovante PIX acima de cerca de 700 mil caracteres não entra na ficha; o horário grava e a tela avisa.

## [2026-11-23] Agendar com horário cancelado e telefone sem +55

- Causa do «A loja não pode receber este agendamento agora»: o minuto já tem documento cancelado ou concluído e o PATCH anónimo volta 403 (regras na nuvem de 11/11). A loja `barbearia_do_marcos` está active e com billing active.
- Se a regravação do mesmo documento for negada, o site cria `slot_…_r` no mesmo minuto. Horário marcado continua recusado.
- Telefone visível: DDD + número (`49 99730205`, `54 999730207`). Colar +55 tira o DDI.
- O erro na tela deixa de mostrar o prefixo `Bad state:`.

## [2026-11-22] Agendar em horário liberado

- Se o documento do minuto já existe e não está marcado, o 403 também segue para a regravação. A mensagem deixa de mostrar o JSON da nuvem.

## [2026-11-22] Cartão Fidelidade em R$ 38,33

- O cartão mostra R$ 38,33/mês, a renovação em 12 meses, o de/por R$ 59,70 e o selo 35,8% OFF. Saiu o texto Boleto CNPJ. O formulário avisa o programa de indicações.

## [2026-11-21] Cartão Básico Fidelizado

- Parcela de R$ 38,33/mês em negrito. À vista continua R$ 456,99. Selo 35,8% OFF e desconto de R$ 254,83 (de R$ 711,82).

## [2026-11-21] Sincronizar e reagendar

- O botão Sincronizar a Agenda lê o dia na hora e mostra «Agenda sincronizada».
- O horário antigo só é cancelado depois que o novo agendamento existe.

## [2026-11-21] Horário cancelado

- Se o documento do minuto existe e não está `scheduled`, o site regrava o novo cliente. Marcado continua recusado.

## [2026-11-21] Serviços ao vivo

- A cada 20 s a página relê preço, tempo e horários do profissional aberto.

## [2026-11-20] Grade e auxiliar

- Admin: botão Remover põe o profissional `active: false` e ajusta `staffSeatCount`.
- Página de agendamento recarrega os horários do dia a cada 20 s.

## [2026-11-20] Reagendar Barber — CSP

- `web/index.html` `connect-src` inclui `https://us-central1-perfectgest-barber.cloudfunctions.net`. Sem isso o browser bloqueia `rescheduleByPhone` (`Failed to fetch`).

## [2026-11-16] Nome do app de orçamentos

- Home: título do bloco `Orçamentos e Gestão`, hashtag `#OrcamentosEGestao`, legendas dos mockups.
- Títulos legais perfectgest-i (PT/EN/ES) usam o mesmo nome. URLs `/perfectgest-i-*` iguais.

## [2026-11-12] Soluções — card Agenda Barber no topo

- Bloco `Agenda Barber` acima do PerfectGest I em Soluções (App/Web).
- Play: `com.perfectgestdev.barber_hairdresser`; FAQ: `/barber-faq`.
- Assets: `barber_phone_agenda.png`, `barber_tablet_agenda.jpg`.

## [2026-11-12] Fotos do bloco ContabilGest

- Telemóvel: `contabil_phone_empresa.png` (1220×2712) e WebP.
- Tablet: `contabil_tablet_lancar.jpg` (1200×1920, retrato) e WebP. Moldura interna ajustada a essa proporção (174×278), sem virar paisagem.

## [2026-11-11] Regras do agendamento — pop no site

- Antes de Agendar: diálogo ~1/3 da altura, texto rolável («Li e aceito»).
- App deixa de mostrar o modal de regras no novo agendamento.

## [2026-11-11] Nomes visíveis dos apps

- App de orçamentos: nome visível `Orçamentos e Gestão` (`kProductPerfectGestIName`, Soluções, legendas, hashtag, títulos legais).
- App contábil: nome visível `ContabilGest` (vitrine, FAQ, funil, SEO e textos legais). Onde o texto citava a empresa, ficou Perfect Gest Dev.
- Marca do site, URLs, pacotes e Clínica III sem troca.

## [2026-11-11] Barber — versão no rodapé + sync na grade

- Rodapé Barber mostra `Versão` de `barber_site_version.dart` (espelho pubspec `1.0.0+1`).
- Botão «Sincronizar a Agenda» permanece junto a «Horários disponíveis».
- Branch: `cursor/agenda-realtime-sync-5533`.

## [2026-11-11] Agenda — sem poll; botão Sincronizar

- Removido `Timer.periodic` slots; grade só no load (pro/serviço/dia) + botão verde «Sincronizar a Agenda» (`Icons.sync`).
- `busyDay` continua `runQuery` do dia (custo ≈ D).
- Branch: `cursor/agenda-realtime-sync-5533`.

## [2026-11-11] Agenda custo — busyDay query do dia

- `barber_cloud.dart` `busyDay`: deixa de `_listCollection('appointments')`; `runQuery` `professionalId` + `startsAt` do dia (reads ≈ D).
- Listen JS adiado (não simples sem firebase_core); poll 2s + visibility mantidos.
- Branch: `cursor/agenda-realtime-sync-5533`.

## [2026-11-11] Agenda realtime — poll slots 2s + visibility

- `barber_hairdresser_page.dart`: `_slotsPoll` 20s → **2s**; `WidgetsBindingObserver` em `resumed` → `_reloadSlots`.
- Sem Firebase JS (site continua REST); app dayWatch fica no monorepo Barber.
- Branch: `cursor/agenda-realtime-sync-5533`.

## [2026-11-11] Render leads-api: ENOTFOUND do Postgres

- Warmup trata `getaddrinfo ENOTFOUND` no host `dpg-…-a`: tenta FQDN `*.oregon-postgres.render.com` e loga se a instância não existe (recriar BD + DATABASE_URL).

## [2026-11-10] Render leads-api: health sem esperar Postgres

- `/health` deixa de criar schema/pingar a BD (Failed ~15 min quando o Postgres free dorme). Warmup do schema após `listen`. `autoDeploy: false` no serviço API (push do site não redeploya a API).

## [2026-11-10] Agenda Barber — publicar políticas no pipeline static

- `spa-legal-paths.cjs` gera `barber-static-html` (como Contabil I / PerfectGest I)
- Publish: `scripts/publicar_politicas_agenda_barber.ps1` → `publish-web` → Auto-Deploy static (não Blueprint/leads-api)

## [2026-11-10] Agenda Barber — políticas Play + script publicar

- Slugs: `/barber-politica-privacidade`, `/barber-termos`, `/barber-exclusao-dados`, `/barber-faq`
- `scripts/barber-legal-data.cjs` + `barber-static-html.cjs` + `publicar_politicas_agenda_barber.ps1`
- `legal-routes.cjs` + `render.yaml` rewrites

## [2026-11-10] Barber — multi-loja path + Admin PerfectGest

- Rotas `/Barber_Hairdresser/{shopId}` e `/Barber_Admin/{shopId}`; legado exacto → `perfectgest_dev`.
- `BarberCloud.bindShop`; banner loja inactiva; `Barber_Shops_Admin` criar/listar/desactivar.
- Render wildcards `/*` + stub `Barber_Shops_Admin`; manifest scope `/Barber_Hairdresser/`.
- Publish: `scripts/publicar-multi-loja-barber-site.ps1` (branch `cursor/multi-loja-play-admin-5533`).

## [2026-11-09] Barber — WhatsApp OG + PWA manifest-barber

- `web/manifest-barber.json`: `start_url`/`scope` `/Barber_Hairdresser`; root `manifest.json` PerfectGest intacto.
- `spa-legal-paths.cjs`: so stubs Barber apontam `manifest-barber` + `og:image`/`twitter:image` = `https://perfectgestdev.com/barber-shop-logo.png`.
- `sync-barber-og-logo.cjs` + `web/barber-shop-logo.png` (logo shop Firestore → path estavel).
- `publicar-barber-paginas.ps1`: valida stub/manifest/logo; nota Manual Deploy se CDN antigo.
- Publish: `& "...\scripts\publicar-barber-paginas.ps1" -Branch cursor/share-whatsapp-pwa-51e0 -NoPause -Msg "share-whatsapp-pwa"`.

## [2026-11-09] Barber — foto produto data-URI na vitrine

- `_productThumb`: `data:image/` → `Image.memory` (antes só `Image.network` → sacola).
- Smoke: Firestore `imageUrl` data-URI + refresh → thumb; se `imageUrl` vazio → republicar no app com Foto.

## [2026-11-09] Barber — nome loja alto contraste

- Hero shop name: `#E8D9A8` 30px; Georgia + Times/serif + Inter/Arial (web não some).
- Avaliar: copy + nome opcional/`Anónimo` já em main (`cb2a189`).
- Manual Deploy Render após push (sem RENDER_DEPLOY_HOOK).

## [2026-11-09] Barber — Avaliar texto + nome opcional

- Copy: «Deixe sua opinião, ajude a melhorar nosso atendimento»; nome opcional → `Anónimo`.
- Rules app: `validReviewCreate` permite `authorName` vazio (size <= 80).
- Publish: `publicar-barber-paginas.ps1 -SkipCheckout` + Manual Deploy Render se etag antigo.

## [2026-11-09] Barber — mensagem pós-Avaliar

- SnackBar Avaliar: «Avaliação enviada, Obrigado pela sua participação, Agradecemos a sua Preferencia!»
- Publish: `publicar-barber-paginas.ps1 -SkipCheckout -NoPause -Msg "avaliar-obrigado"`.

## [2026-11-09] Barber — topo identidade logo+nome

- Hero: logo 176px (>144); nome da loja sempre visível Georgia/brass `#C9B87A` 28px (fallback serif).
- Preferência identidade: topo = logo + nome da barbearia.
- Publish: `publicar-barber-paginas.ps1 -SkipCheckout -NoPause -Msg "barber-topo-identidade"`.

## [2026-11-09] Barber — gate publish PIX markers no JS

- `BarberPixEmv.jsPublishMarker` + `pending_payment` no `book()` para o Select-String do PS1 (dart2js tinha removido os literais).
- Prova local: `main.dart.js` contém BarberPixEmv + pending_payment + stockQty + Produtos.
- Publish: `publicar-barber-paginas.ps1 -SkipCheckout -NoPause -Msg "agendar-pagar-loja-pix-gate"`.

## [2026-11-09] Barber — topo logo + nome vintage

- Hero: logo 144px; nome Georgia 22px cor brass/olive `#C9B87A` (identidade logo+nome).
- Publish: `publicar-barber-paginas.ps1 -SkipCheckout -NoPause -Msg "barber-topo-logo-nome"`.

## [2026-11-09] Barber — Agendar/pagar + loja detalhe

- Agendar: labels «Escolha o Barbeiro/Cabelereira» / «Seu nome»; chips PIX agora / Dinheiro na hora (sem gate `clientAllowsCash`).
- PIX: «Fazer o pagamento» → QR EMV + anexar; Agendar cinza até comprovante; book com `paymentMethod` + receipt; confirmação com opt-in WA/ICS.
- Dinheiro: Agendar activo; `pay_at_shop` + `paymentMethod=cash`.
- Loja: foto/Ver detalhes → modal Comprar agora / Voltar; checkout com mesmo PIX QR+comprovante / dinheiro (WA automático, sem opt-in ICS).
- Publish: `publicar-barber-paginas.ps1 -SkipCheckout -NoPause -Msg "agendar-pagar-loja"`.

## [2026-11-09] Barber — Avaliar + ver avaliações

- Form «Avaliar» (nome/nota/texto) → `submitReview` create `shops/.../reviews` `status:pending`.
- Link «ver avaliações» abre diálogo só `published`.
- Publish: `publicar-barber-paginas.ps1 -SkipCheckout -NoPause -Msg "avaliar-reviews-receipt"`.

## [2026-11-09] Barber — merge QR PIX + sync em main

- Integrado `cursor/qr-pix-agendamento-3933` + `cursor/sync-clientes-auditoria-ce1b` em `cursor/qr-pix-sync-main-a3c2`.
- `barber_cloud.dart`: PIX/`clientAllowsCash`/`paymentStatus`/`attachAppointmentReceipt` **e** `slot_*` / busy só `scheduled`.
- Gate publish: live exige também `BarberPixEmv` ou `pending_payment` (além stockQty/Produtos).

## [2026-11-09] Barber — QR PIX após agendar

- `BarberPro` + PIX/telefone; `clientAllowsCash(phone)`; `book()` grava `amountDue`/`paymentStatus`/`pixTxid`.
- Pós-Confirmar: QR EMV (`BarberPixEmv` + `qr_flutter`) ou «Pagamento na barbearia»; anexar comprovante → wa.me do barbeiro (pro phone, senão shop).
- Publish: `publicar-barber-paginas.ps1 -NoPause -Msg "qr-pix-agendamento"`.

## [2026-11-09] Barber — WhatsApp + .ics + dedupe produto órfão

- Após Confirmar horário: abre wa.me (loja ou telefone do cliente) com resumo; botão Adicionar ao calendário (.ics UID/DTSTART/DTEND/SUMMARY) + Reabrir WhatsApp.
- `listProducts`: dedupe por `localId` preferindo docs `prod_*`.
- Publish: `publicar-barber-paginas.ps1 -NoPause -Msg "wa-ics-orphan-product"`.

## [2026-11-09] Barber — sync anti-race book + busy completed

- `book()`: doc id estável `slot_{pro}_{startsAtUtcMs}` + HTTP 409 → «Horário acabou de ser ocupado».
- `busyDay`: só `status == scheduled` (completed/cancelled não bloqueiam slot).

## [2026-11-09] Barber — destravar deploy Render (loja+logo)

- Diagnostico: `origin/main` tip ainda sem `stockQty` no `build/web/main.dart.js` (blob 11:23); loja local/`checkout-loja-pix` ja tinha marcadores — push para `origin/main` nao tinha chegado.
- `publish-web.cjs`: prova stockQty+Produtos apos force-add; push mesmo sem commit novo; `RENDER_DEPLOY_HOOK` (POST) opcional; mensagem Manual Deploy se hook ausente.
- `publicar-barber-paginas.ps1`: confirma `origin/main` apos push; poll live ~5 min ate etag != 87d77e51 e stockQty+Produtos; timeout = exit 1 + Manual Deploy.

## [2026-11-09] Barber — handoff publish loja+logo live

- Working tree em `cursor/checkout-loja-pix-a6bc` (HEAD `cc040dc`, pushed). Fonte OK: `listProducts`, `_buildProductsVitrine` acima de Agendar, `isUsableLogoUrl`/`data:image`.
- Live ainda `main.dart.js` 11:23 UTC sem stockQty/Produtos — Marcos: `atualizar-barber-spa.ps1 -SkipCheckout -NoPause -Msg "loja-logo-live"` (default Branch do script = spa-rewrite; nao omitir `-SkipCheckout`).

## [2026-11-09] Barber — checkout PIX/dinheiro

- Comprar na vitrine → qty → checkout: PIX (entrega/retirada + comprovante) ou dinheiro (só retirada).
- `createOrder` em `shops/{id}/orders` + wa.me com resumo; shop lê `pixKey`/`whatsappPhone`/`pickupAddress`.

## [2026-11-09] Barber — vitrine produtos + logo no agendar

- Restaurado `listProducts` (`products`, `active != false`, `stockQty > 0`) + `_buildProductsVitrine()` acima de Agendar.
- Logo do shop: rejeita `logoUrl` igual à página de agendar; aceita https de imagem ou data URI; topo = logo + nome.

## [2026-11-09] Barber Admin — Auth UX

- `/Barber_Admin`: erros PT curtos; trim/lowercase; aviso typo gamil; convidar só com sessão; claim adminUid se vazio; signIn dono vs signUp convidado explícitos.

## [2026-11-08] Barber — multi-pro + admin

- IDs profissionais/serviços em string (cloud); rota `/Barber_Admin` para convidar emails (senha padrão).

## [2026-11-08] Barber — grade passo 30 min

- `SlotEngine.stepMinutes` padrão 30 (site alinhado ao app).

## [2026-11-08] Barber — busyDay hora local + recheck

- Timestamps com `toLocal()` na grade; `book` recusa overlap; poll ~20s enquanto agenda.

## [2026-11-08] Barber — site só livres + Voltar

- Grade pública: só `available`; mensagem sem horários; botão Voltar ao início (hero).

## [2026-11-08] Barber — slots alocados + nome

- `allocateMinutes` (blocos 30); grade com ocupados cinza + tarja do primeiro nome.

## [2026-11-08] Barber — REST sem plugin Firebase

- Screenshot: `PlatformException channel-error … FirebaseCoreHostApi.initializeCore` no Web.
- Fix: `BarberCloud` via Firestore REST (`http`) + remoção `firebase_core`/`cloud_firestore` do site.

## [2026-11-08] Barber — CSP Firestore + endurecimento cloud

- Causa: CSP `connect-src` sem Firestore → catálogo/serviço mortos no site.
- Fix: `web/index.html` + erros `BarberCloud.lastError` + cast `_asInt` + UI sem serviços.

## [2026-11-08] Barber — fix compile web

- Restaurado `import site_public_urls.dart` (`kBarberHairdresserPath`) — build:web:sync quebrava.

## [2026-11-08] Barber — apresentação + rodapé

- Hero: nome/logo/promo do Firestore + CTA Agendar; rodapé brasão + PerfectGest Dev uma vez.

## [2026-11-08] Barber — sem seta Início para o site

- Removido botão voltar/Início em `/Barber_Hairdresser` (serviço isolado, sem link à home PerfectGest).

## [2026-11-08] Barber — contraste / fontes invisíveis

- Causa: `GoogleFonts` (Libre Baskerville / Source Sans 3) com `allowRuntimeFetching=false` → glifos vazios no web.
- Fix: Inter + JetBrains Mono dos assets; cores `_text`/`_muted`/`_surface` mais claras.

## [2026-11-07] SPA /Barber_Hairdresser — rewrite Render

- Causa do 404 em produção: rota Flutter existia, mas faltava slug em `siteSpaPages`, stub `Barber_Hairdresser.html` e rewrite Render.
- `scripts/legal-routes.cjs`, `render.yaml`, `docs/RENDER_SPA_REWRITE.md` + stub via `spa-legal-paths`. Sem publish neste passo.

## [2026-10-30] /orcamento V 1.2.9

- Pop: totais sem caixa preta; banner PerfectGestDev no rodapé, metade do tamanho.

## [2026-10-30] /orcamento V 1.2.8

- Pop Preencher o orçamento: tarja carvão com banner PerfectGestDev e frase dourada. PDF/folha/WhatsApp sem banner.

## [2026-10-30] /orcamento V 1.2.7

- Box e guarda-corpos: nascem com temperado 8 mm; diferença vs 4 mm incolor (imbutido) já no valor inicial, sem negativo.

## [2026-10-29] Home: ContabilGest no topo

- Frase «novo sistema fiscal»; apresentação do ContabilGest abaixo; pergunta da nota fiscal depois.
- Soluções (App/Web) só com PerfectGest na base + Web.

## [2026-10-29] /orcamento V 1.2.6

- Página começa em 1 - Aberturas disponíveis (título maior).
- Cadastro e aberturas juntos no pop Preencher o orçamento; botão Salvar orçamento.

## [2026-10-29] /orcamento V 1.2.5

- Tela de entrada: quadro prata com título e Senha em carvão (letras visíveis).

## [2026-10-29] /orcamento V 1.2.4

- Tela de entrada: rótulo Senha sem corte (estilo próprio, padding).

## [2026-10-29] /orcamento V 1.2.3

- Botão PDF WhatsApp passou a Mensagem WhatsApp.
- Texto do WhatsApp com cliente, itens, valores e comissão.
- Registros enviam o mês aberto (01–31) e meses fechados por botão.

## [2026-10-29] /orcamento V 1.2.2

- Ver folha alinhada ao PDF; Comissão abaixo do Total (folha e PDF).

## [2026-10-29] /orcamento V 1.2.1

- Box e 3 guarda-corpos: vidro temperado 8 mm incolor pré-selecionado.
- Abrir/editar: id volta na rota, persiste na sessão; PUT 404 recria; falha avisa.

## [2026-10-29] /orcamento V 1.2.0

- Sessão HMAC (vendedor 112026 / adm 061972), Bearer 12 h.
- Preços R$/m² padrão no código; API só sobrepõe se > 0; sem PUT ao abrir.
- Orçamentos em documento completo no servidor; Abrir/editar; Salvar/folha/PDF WhatsApp no mesmo id.
