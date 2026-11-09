# Evolucao — Web_perfectgest

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
