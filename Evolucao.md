# Evolucao — Web_perfectgest

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
