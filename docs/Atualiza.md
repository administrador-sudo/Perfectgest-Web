# Atualiza - Evolucao Continua do Site PerfectGest (Web_perfectgest)

Este arquivo registra a evolucao tecnica do site para manter contexto entre IAs, evitar regressoes e garantir melhoria continua.

## Regras de uso (obrigatorio para proximas IAs)

- Ler este arquivo antes de propor alteracoes relevantes.
- Atualizar este arquivo ao final de qualquer tarefa tecnica.
- Nao apagar historico anterior; somente acrescentar novas entradas.
- Sempre registrar impacto, risco e validacao realizada.
- Em caso de mudanca de comportamento, registrar motivo e plano de rollback.

## Estado atual consolidado

- Projeto: `webs/Web_perfectgest/`
- Pacote: `perfectpro_web`
- Stack principal: Flutter Web + assets web + docs operacionais + scripts npm
- Escopo IA: somente esta pasta (até segunda ordem do operador)
- Objetivo de manutencao: evoluir sem regressao funcional (SEO, legal, Render)

## KPIs de qualidade (atualizacao continua)

Preencher esta secao ao final de cada entrega relevante. Quando nao houver dado, usar `N/A` e justificar no registro da entrega.

### KPIs tecnicos principais

- Taxa de regressao por entrega (%): `N/A`
- Bugs criticos apos deploy (quantidade): `N/A`
- Bugs totais por entrega (quantidade): `N/A`
- Tempo medio de build web release (min): `N/A`
- Cobertura de testes automatizados (%): `N/A`
- Fluxos criticos validados manualmente (%): `N/A`
- Lints/erros estaticos novos (quantidade): `N/A`

### KPIs por periodo (rolling 30 dias)

- Entregas realizadas: `N/A`
- Entregas sem regressao: `N/A`
- Taxa de sucesso sem hotfix (%): `N/A`
- Hotfixes necessarios (quantidade): `N/A`
- Tempo medio de resolucao de incidente (h): `N/A`

### Meta de referencia (inicial)

- Regressao por entrega <= `5%`
- Bugs criticos apos deploy = `0`
- Cobertura de testes >= `60%` (expandir gradualmente)
- Fluxos criticos validados >= `90%`
- Lints novos por entrega = `0`

### Observacoes de medicao

- Medir regressao como: funcionalidades quebradas apos mudanca / funcionalidades alteradas.
- Considerar "fluxos criticos": login, navegacao principal, carregamento da home e SEO base.
- Atualizar valores com data no bloco de "Registro de evolucao".

## Modelo de entrada (copiar e preencher)

```md
## [AAAA-MM-DD HH:mm] Titulo curto da entrega

### Contexto
- Pedido:
- Escopo:

### Arquivos alterados
- caminho/arquivo_1
- caminho/arquivo_2

### O que foi feito
- Item 1
- Item 2

### Risco de regressao
- Baixo/Medio/Alto:
- Pontos sensiveis:

### Validacao executada
- [ ] Analise estatica/lint
- [ ] Build local
- [ ] Teste manual do fluxo impactado
- [ ] Outros:

### Resultado
- Comportamento esperado apos a mudanca:
- Pendencias:

### Proximos passos recomendados
- Passo 1
- Passo 2
```

## Registro de evolucao

## [2026-05-06 08:08] Inicializacao do acompanhamento continuo

### Contexto
- Pedido: criar o arquivo descrito em `.cursorrules` e iniciar acompanhamento da evolucao do site.
- Escopo: base documental para continuidade entre IAs.

### Arquivos alterados
- docs/Atualiza.md

### O que foi feito
- Criado o arquivo de rastreabilidade tecnica do site.
- Definido modelo padrao de registro para futuras entregas.
- Incluidas regras operacionais para prevenir perda de contexto e regressao.

### Risco de regressao
- Baixo: alteracao apenas documental, sem impacto em runtime.
- Pontos sensiveis: disciplina de atualizacao do arquivo em cada tarefa tecnica.

### Validacao executada
- [x] Revisao manual da estrutura e clareza do documento
- [ ] Analise estatica/lint
- [ ] Build local
- [ ] Teste manual do fluxo impactado
- [x] Sem alteracao de codigo executavel

### Resultado
- Comportamento esperado apos a mudanca: proximas IAs conseguem entender historico, decisoes e riscos antes de alterar codigo.
- Pendencias: comecar a preencher este registro a cada nova entrega tecnica.

### Proximos passos recomendados
- Incluir uma nova entrada apos cada mudanca em codigo/infra/documentacao critica.
- Padronizar checklist minimo de validacao por tipo de alteracao.

## [2026-05-06 08:11] Verificacao funcional e correcao de build

### Contexto
- Pedido: verificar se o codigo estava funcional e corrigir se necessario.
- Escopo: restaurar pipeline de analise, teste e build web release.

### Arquivos alterados
- pubspec.yaml
- lib/elastic_service.dart
- docs/Atualiza.md

### O que foi feito
- Corrigidos caminhos de assets movidos para `imagens/` no `pubspec.yaml`.
- Removida referencia de asset inexistente `assets/logo_PerfectPro_leve_cropped.png`.
- Adicionada dependencia `http` e posteriormente fixada em `1.5.0` por crash do `dart2js` com `1.6.0` no SDK atual.
- Substituidos `print` por `debugPrint` em `ElasticService` para atender lints de producao.
- Reexecutados `flutter analyze`, `flutter test` e `flutter build web --release`.

### Risco de regressao
- Baixo: mudancas concentradas em configuracao de assets e logs de servico.
- Pontos sensiveis: ao atualizar Flutter/Dart, revalidar se fixacao do `http` ainda e necessaria.

### Validacao executada
- [x] Analise estatica/lint
- [x] Build local
- [x] Teste manual do fluxo impactado
- [x] Outros: `flutter test` passou com sucesso

### Resultado
- Comportamento esperado apos a mudanca: projeto volta a compilar e gerar build web release sem erro de asset.
- Pendencias: considerar upgrade de SDK para remover necessidade de pin de dependencia no futuro.

### Proximos passos recomendados
- Testar navegacao das paginas principais no build gerado em `build/web`.
- Planejar janela de atualizacao de Flutter/Dart e revalidar `http` em versao mais nova.

## [2026-05-06 09:07] Renomeacao publica do site para PerfectGest I

### Contexto
- Pedido: alterar o nome visivel ao publico para "PerfectGest I" em todo o site.
- Escopo: textos de interface, titulos/metatags SEO e manifesto web.

### Arquivos alterados
- web/index.html
- web/manifest.json
- lib/main.dart
- lib/seo_meta_web.dart
- lib/tecnologias_page.dart
- lib/politica_page.dart
- docs/Atualiza.md

### O que foi feito
- Atualizado nome exibido na interface publica da home, politica e textos de contato.
- Atualizados titulos e descricoes SEO (Open Graph e document title) para "PerfectGest I".
- Atualizado `web/manifest.json` (`name` e `short_name`) para refletir a nova marca no PWA.
- Atualizado `web/index.html` (title, og:title e apple-mobile-web-app-title).

### Risco de regressao
- Baixo: mudanca textual sem alteracao de fluxo funcional.
- Pontos sensiveis: manter consistencia da marca em novos textos futuros.

### Validacao executada
- [x] Analise estatica/lint
- [ ] Build local
- [ ] Teste manual do fluxo impactado
- [x] Outros: checagem de lints da IDE sem erros nos arquivos alterados

### Resultado
- Comportamento esperado apos a mudanca: nome publico do site exibido como "PerfectGest I" em UI e metadados principais.
- Pendencias: validar visualmente no browser os pontos de UI alterados.

### Proximos passos recomendados
- Regerar `build/web` e recarregar o navegador para confirmar titulo e manifesto atualizados.
- Revisar documentos externos/marketing para padronizar a nova marca quando aplicavel.

## [2026-05-07 07:58] Ajuste de ordem e tipografia no primeiro bloco

### Contexto
- Pedido: corrigir a ordem das frases no primeiro bloco da home e ajustar o nome principal.
- Escopo: secao Hero em `lib/main.dart`.

### Arquivos alterados
- lib/main.dart
- docs/Atualiza.md

### O que foi feito
- Alterado o texto principal do Hero de `PerfectGest I` para `PerfectGest`.
- Ajustado o tamanho da fonte de `PerfectGest` para o mesmo tamanho da frase `Inovacao em Flutter, Java e SDKs`.
- Reordenado o bloco para exibir `Inovacao em Flutter, Java e SDKs` imediatamente abaixo de `PerfectGest`.

### Risco de regressao
- Baixo: alteracao textual e de ordem visual no Hero, sem mudanca de fluxo.
- Pontos sensiveis: validar em mobile e desktop para garantir hierarquia visual esperada.

### Validacao executada
- [x] Revisao manual do trecho alterado
- [ ] Analise estatica/lint
- [ ] Build local
- [ ] Teste manual do fluxo impactado

### Resultado
- Comportamento esperado apos a mudanca: primeiro bloco da home exibe a ordem solicitada e nome sem sufixo `I`.
- Pendencias: validacao visual em navegador para confirmar percepcao de tamanho e espacos.

### Proximos passos recomendados
- Executar `flutter run -d chrome` e validar o Hero em breakpoints desktop/mobile.
- Se necessario, ajustar `fontWeight` para reforcar contraste mantendo o mesmo `fontSize`.

## [2026-05-07 08:00] Padronizacao visual de tipografia no Hero

### Contexto
- Pedido: igualar visualmente o tamanho do texto descritivo principal ao da frase iniciada por "Software house...".
- Escopo: ajuste tipografico no primeiro bloco da home.

### Arquivos alterados
- lib/main.dart
- docs/Atualiza.md

### O que foi feito
- Mantido o `fontSize` existente e padronizada a fonte do texto descritivo para `GoogleFonts.inter`, alinhando com a frase "Software house...".
- Aplicado o ajuste nos dois ramos visuais do Hero (com e sem `ShaderMask`), para consistencia em claro/escuro e com/sem animacao.

### Risco de regressao
- Baixo: alteracao apenas tipografica local no Hero.
- Pontos sensiveis: revisar legibilidade em telas compactas.

### Validacao executada
- [x] Revisao manual do trecho alterado
- [ ] Analise estatica/lint
- [ ] Build local
- [ ] Teste manual do fluxo impactado

### Resultado
- Comportamento esperado apos a mudanca: texto descritivo com proporcao visual equivalente ao bloco "Software house...", sem discrepancia de fonte.
- Pendencias: validar no navegador o resultado final em desktop e mobile.

### Proximos passos recomendados
- Executar `flutter run -d chrome` e validar o primeiro bloco em diferentes larguras.
- Se ainda houver percepcao de diferenca, ajustar apenas `fontWeight` mantendo o mesmo `fontSize`.

## [2026-05-07 08:16] Reversao da ultima alteracao tipografica no primeiro bloco

### Contexto
- Pedido: desfazer a ultima alteracao no 1o bloco e manter `PerfectGest` como esta.
- Escopo: texto descritivo principal do Hero em `lib/main.dart`.

### Arquivos alterados
- lib/main.dart
- docs/Atualiza.md

### O que foi feito
- Revertida a alteracao tipografica do texto "Criamos apps Flutter, sistemas web e integracoes Java/SDK...".
- Restaurado `TextStyle` original nesse texto (ramos com e sem `ShaderMask`).
- Mantido `PerfectGest` sem qualquer mudanca.

### Risco de regressao
- Baixo: reversao pontual de estilo visual.
- Pontos sensiveis: confirmar visual no navegador apos hot reload.

### Validacao executada
- [x] Revisao manual do trecho alterado
- [ ] Analise estatica/lint
- [ ] Build local
- [ ] Teste manual do fluxo impactado

### Resultado
- Comportamento esperado apos a mudanca: 1o bloco volta ao estado anterior da tipografia do texto descritivo, mantendo o titulo `PerfectGest`.
- Pendencias: validacao visual final no browser.

### Proximos passos recomendados
- Aplicar hot reload e verificar o Hero em desktop/mobile.

## [2026-05-07 08:44] Troca de imagens no bloco Solucoes (App/Web)

### Contexto
- Pedido: trocar as imagens internas do bloco `Solucoes (App/Web)` pelas novas da pasta `IMAGENS_APP/Screenshot`.
- Escopo: cards de mockup em `AnimatedSolutionsSectionContent`.

### Arquivos alterados
- lib/main.dart
- docs/Atualiza.md

### O que foi feito
- Atualizadas as duas referencias de `imageAsset` dos dispositivos para:
  - `IMAGENS_APP/Screenshot/PerfectGest (1).png`
  - `IMAGENS_APP/Screenshot/PerfectGest (2).png`
- Mantidas as configuracoes de dimensao/posicionamento e fallback para reduzir risco visual.

### Risco de regressao
- Baixo: alteracao apenas de caminho de assets.
- Pontos sensiveis: nomes com espacos e parenteses exigem correspondencia exata no asset.

### Validacao executada
- [x] Revisao manual dos caminhos no codigo
- [ ] Analise estatica/lint
- [ ] Build local
- [ ] Teste manual do fluxo impactado

### Resultado
- Comportamento esperado apos a mudanca: bloco `Solucoes (App/Web)` renderiza as novas imagens `PerfectGest (1)` e `PerfectGest (2)`.
- Pendencias: validar renderizacao no navegador com hot reload ou novo build web.

### Proximos passos recomendados
- Abrir o site localmente e confirmar crop/enquadramento dos dois mockups.
- Se houver corte indesejado, ajustar `imageLeft`, `imageTop`, `imageWidth` e `imageHeight`.

## [2026-05-07 09:04] Correcao de compilacao Web apos troca de assets

### Contexto
- Pedido: erro ao compilar `lib/main.dart` para Web e site sem atualizar no servidor.
- Escopo: manifesto de assets em `pubspec.yaml`.

### Arquivos alterados
- pubspec.yaml
- docs/Atualiza.md

### O que foi feito
- Corrigidas as referencias de assets antigas removidas da pasta `IMAGENS_APP/Screenshot`.
- Atualizado para os novos ficheiros:
  - `IMAGENS_APP/Screenshot/PerfectGest (1).png`
  - `IMAGENS_APP/Screenshot/PerfectGest (2).png`
- Mantida a entrada `IMAGENS_APP/` e ajustadas entradas explicitas para evitar falha de compilacao.

### Risco de regressao
- Baixo: alteracao apenas em declaracao de assets.
- Pontos sensiveis: nomes com espacos/parenteses exigem quote e caminho exato.

### Validacao executada
- [x] Reproducao do erro de compilacao
- [x] Revisao manual do `pubspec.yaml`
- [ ] Build local completo
- [ ] Teste manual do fluxo impactado

### Resultado
- Comportamento esperado apos a mudanca: compilacao web volta a funcionar sem erro de asset ausente.
- Pendencias: subir servidor limpo e validar visualmente o bloco `Solucoes (App/Web)`.

### Proximos passos recomendados
- Executar `flutter run -d web-server --web-hostname=0.0.0.0 --web-port=8100`.
- Fazer `Ctrl + F5` no navegador para invalidar cache.

## [2026-05-07 09:37] Equalizacao de tamanho visual no texto principal do Hero

### Contexto
- Pedido: deixar a frase "Criamos apps Flutter, sistemas web e integracoes Java/SDK..." com o mesmo tamanho da frase "Software house especializada...".
- Escopo: tipografia do bloco Hero em `lib/main.dart`.

### Arquivos alterados
- lib/main.dart
- docs/Atualiza.md

### O que foi feito
- Padronizada a frase "Criamos apps..." para o mesmo estilo base da frase "Software house...":
  - `GoogleFonts.inter`
  - `fontSize: heroSubtitleSize`
  - `height: 1.45`
- Aplicado nos dois caminhos de renderizacao (com `ShaderMask` e sem `ShaderMask`).

### Risco de regressao
- Baixo: ajuste local de tipografia sem impacto funcional.
- Pontos sensiveis: validacao visual em tela pequena e grande.

### Validacao executada
- [x] Revisao manual do trecho alterado
- [ ] Analise estatica/lint
- [ ] Build local
- [ ] Teste manual do fluxo impactado

### Resultado
- Comportamento esperado apos a mudanca: as duas frases ficam com o mesmo tamanho visual.
- Pendencias: confirmar no navegador com refresh forcado.

### Proximos passos recomendados
- Recarregar `http://localhost:8100` com `Ctrl + F5`.
- Se desejar mais destaque mantendo tamanho, ajustar apenas contraste/cor.

## [2026-05-07 10:07] Inclusao do GA4 com novo ID no site

### Contexto
- Pedido: incluir o snippet Google tag (`gtag.js`) nas paginas do site com ID `G-N4BVXV4HBC` e continuar a publicacao.
- Escopo: `web/index.html` (entrada base do Flutter Web).

### Arquivos alterados
- web/index.html
- docs/Atualiza.md

### O que foi feito
- Removida a injecao customizada anterior de GA baseada em localStorage/consentimento.
- Inserido snippet direto solicitado:
  - script async `gtag/js?id=G-N4BVXV4HBC`
  - `gtag('config', 'G-N4BVXV4HBC')`

### Risco de regressao
- Medio: mudanca no fluxo de medicao/cookies (de condicional para carregamento direto).
- Pontos sensiveis: revisar conformidade de consentimento conforme politica vigente.

### Validacao executada
- [x] Revisao manual do `index.html`
- [ ] Analise estatica/lint
- [ ] Build local
- [ ] Teste manual do fluxo impactado

### Resultado
- Comportamento esperado apos a mudanca: GA4 inicializa diretamente no carregamento da pagina com o novo Measurement ID.
- Pendencias: concluir publish e validar eventos no GA4 DebugView/Realtime.

### Proximos passos recomendados
- Executar publicacao e validar carregamento do `gtag/js` no browser.
- Confirmar recebimento de evento `page_view` no GA4.

## [2026-05-07 11:12] Reposicionamento do snippet GA4 para o head

### Contexto
- Pedido: corrigir posicao do codigo do Analytics para ficar antes de `</head>`.
- Escopo: `web/index.html`.

### Arquivos alterados
- web/index.html
- docs/Atualiza.md

### O que foi feito
- Movido o snippet GA4 (`gtag.js` + `gtag('config', 'G-N4BVXV4HBC')`) do `body` para o `head`.
- Posicionado imediatamente antes do fechamento `</head>`, conforme solicitado.

### Risco de regressao
- Baixo: ajuste de posicionamento de script sem mudanca de ID/config.
- Pontos sensiveis: validar disparo de `page_view` no GA4 apos deploy.

### Validacao executada
- [x] Revisao manual do `index.html`
- [ ] Analise estatica/lint
- [ ] Build local
- [ ] Teste manual do fluxo impactado

### Resultado
- Comportamento esperado apos a mudanca: Analytics carregado na fase correta do documento (`head`).
- Pendencias: publicar e validar eventos em Realtime/DebugView.

### Proximos passos recomendados
- Publicar novamente e fazer `Ctrl + F5` no browser.
- Confirmar o request para `googletagmanager.com/gtag/js?id=G-N4BVXV4HBC`.

## [2026-05-07 11:32] Correcao de pipeline para Render (build/web atualizado)

### Contexto
- Pedido: corrigir conflito de atualizacao no online, onde Render publica `build/web/index.html` e o fonte atual fica em `web/index.html`.
- Escopo: script de publicacao `scripts/publish-web.cjs`.

### Arquivos alterados
- scripts/publish-web.cjs
- docs/Atualiza.md

### O que foi feito
- Ajustado parser de `--msg` para aceitar mensagens com espacos sem quebrar o comando.
- Atualizado `git add` do script para incluir explicitamente artefatos de deploy:
  - `build/web`
  - `IMAGENS_APP/Screenshot`
- Mantidos tambem os ficheiros-fonte (`lib`, `web`, `pubspec*`, `.gitignore`, `docs/Atualiza.md`).

### Risco de regressao
- Baixo: ajuste de automacao de publicacao.
- Pontos sensiveis: confirmar se o fluxo de deploy no Render continua apontando para `build/web`.

### Validacao executada
- [x] Revisao manual do script alterado
- [ ] Execucao de publish completo
- [ ] Validacao online no Render
- [ ] Teste manual do fluxo impactado

### Resultado
- Comportamento esperado apos a mudanca: cada publicacao leva `build/web` atualizado para o remoto, eliminando divergencia entre `web/index.html` fonte e artefato servido no Render.
- Pendencias: executar publish e validar o online.

### Proximos passos recomendados
- Rodar `npm run publish-web -- --msg="fix: ajuste render build web"`.
- Aguardar deploy do Render e testar em janela anonima.

## [2026-05-07 11:32] Ajuste final no publish para incluir build ignorado

### Contexto
- Pedido: corrigir conflito de atualizacao no Render.
- Escopo: garantir staging de `build/web` mesmo com `build/` no `.gitignore`.

### Arquivos alterados
- scripts/publish-web.cjs
- docs/Atualiza.md

### O que foi feito
- Adicionado passo explicito no script:
  - `git add -A -f build/web`
- Mantido `git add -A` dos ficheiros-fonte para acompanhar o artefato compilado.

### Risco de regressao
- Baixo: ajuste de automacao de commit/deploy.
- Pontos sensiveis: aumento de diff no commit por incluir artefatos web.

### Validacao executada
- [x] Reproducao do erro de staging de build ignorado
- [x] Revisao manual do script
- [ ] Publicacao completa apos ajuste
- [ ] Validacao online no Render

### Resultado
- Comportamento esperado apos a mudanca: publicacao passa a incluir `build/web/index.html` atualizado no remoto.
- Pendencias: reexecutar publish e verificar o deploy do Render.

### Proximos passos recomendados
- Executar novamente `npm run publish-web -- --msg="fix: ajuste render build web"`.
- Testar no online com cache limpo.

## [2026-05-07 11:32] Correcao da ordem de staging no script de publish

### Contexto
- Pedido: resolver bloqueio final de publish por conflito com `.gitignore` em `build/`.
- Escopo: `scripts/publish-web.cjs`.

### Arquivos alterados
- scripts/publish-web.cjs
- docs/Atualiza.md

### O que foi feito
- Removido `build/web` do primeiro `git add -A` (sem `-f`) para evitar erro imediato.
- Mantido o passo dedicado `git add -A -f build/web` como unica etapa de staging dos artefatos ignorados.

### Risco de regressao
- Baixo: ajuste de ordem operacional no script.
- Pontos sensiveis: tempo alto de compilacao web durante publish.

### Validacao executada
- [x] Reproducao do erro
- [x] Ajuste no script
- [ ] Publish completo apos correcao
- [ ] Validacao no Render

### Resultado
- Comportamento esperado apos a mudanca: script deixa de falhar no staging e conclui commit/push com `build/web` atualizado.
- Pendencias: reexecutar publicacao.

### Proximos passos recomendados
- Rodar novamente o publish com mensagem curta sem caracteres especiais.
- Validar deploy no Render apos push.

## [2026-05-07 12:51] Pacote de otimizacao Core Web Vitals (LCP/SI)

### Contexto
- Pedido: aplicar pacote de otimizacao focado em LCP e Speed Index no `Web_app`.
- Escopo: `lib/main.dart` e `web/index.html`.

### Arquivos alterados
- lib/main.dart
- web/index.html
- docs/Atualiza.md

### O que foi feito
- Reduzido custo de runtime inicial na Web:
  - `allowRichMotion()` agora retorna `false` em ambiente web para evitar loops/efeitos pesados no primeiro paint.
- Implementado adiamento de secoes pesadas abaixo da dobra:
  - carregamento postergado de `Solucoes`, `Portfolio` e `Contato` por ~900ms apos first frame;
  - adicionado skeleton leve temporario para manter estabilidade visual.
- Adicionado loading shell HTML no `index.html`:
  - renderiza conteudo imediato antes do Flutter inicializar (melhora percepcao e favorece LCP/SI);
  - remocao automatica ao `flutter-first-frame`/deteccao do `flt-glass-pane`.

### Risco de regressao
- Medio: mudanca de comportamento visual (menos animacoes no web e carregamento progressivo de secoes).
- Pontos sensiveis: validar UX da transicao skeleton -> conteudo real.

### Validacao executada
- [x] Revisao manual dos pontos alterados
- [x] Lint sem erros nos ficheiros alterados
- [ ] Build web local completo
- [ ] Reavaliacao PSI/Lighthouse apos deploy

### Resultado
- Comportamento esperado apos a mudanca: menor custo de render inicial, melhora de Speed Index e maior consistencia de LCP no PSI/Lighthouse.
- Pendencias: publicar e comparar metricas antes/depois (Desktop e Mobile).

### Proximos passos recomendados
- Publicar novo build no Render.
- Rodar PageSpeed Insights 3x (desktop/mobile) e comparar mediana de LCP/SI.

## [2026-05-07 12:54] Sincronizacao offline/online no mesmo artefato (build/web)

### Contexto
- Pedido: garantir que servidor local atualize igual ao online, lendo as mudancas na mesma pasta com `F5`.
- Escopo: pipeline de build/publicacao e servidor local de preview.

### Arquivos alterados
- scripts/publish-web.cjs
- scripts/serve-build-web.cjs
- package.json
- docs/Atualiza.md

### O que foi feito
- Padronizado build de deploy com `--pwa-strategy=none` para reduzir cache agressivo de service worker.
- Criado servidor local dedicado ao artefato final `build/web`:
  - script `scripts/serve-build-web.cjs` (Express);
  - headers `no-store/no-cache` para refletir mudancas no `F5`.
- Adicionados scripts npm para fluxo espelhado ao online:
  - `build:web:sync`
  - `serve:web:sync`
  - `local:web:sync` (build + serve na mesma pasta `build/web`).

### Risco de regressao
- Baixo: alteracao em automacao/servidor local.
- Pontos sensiveis: confirmar que ambiente de deploy nao depende de service worker anterior.

### Validacao executada
- [x] Revisao manual dos scripts alterados
- [ ] Execucao local de `npm run local:web:sync`
- [ ] Validacao de refresh com `F5` no servidor local
- [ ] Novo deploy e validacao no Render

### Resultado
- Comportamento esperado apos a mudanca: offline e online passam a refletir o mesmo artefato (`build/web`) e o `F5` local recarrega as mudancas sem ficar preso em cache antigo.
- Pendencias: rodar o novo comando local e validar no browser.

### Proximos passos recomendados
- Executar `npm run local:web:sync`.
- Depois publicar e validar online em aba anonima.

## [2026-05-07 12:54] Correcao de compatibilidade do servidor local (Express 5)

### Contexto
- Pedido: manter sincronia offline/online com refresh simples.
- Escopo: servidor local `scripts/serve-build-web.cjs`.

### Arquivos alterados
- scripts/serve-build-web.cjs
- docs/Atualiza.md

### O que foi feito
- Corrigido fallback de rota SPA:
  - de `app.get('*', ...)` para `app.use(...)`
- Ajuste necessario por mudanca de parsing de rotas no Express 5.

### Risco de regressao
- Baixo: ajuste pontual de roteamento fallback.
- Pontos sensiveis: confirmar abertura direta de subrotas (SPA).

### Validacao executada
- [x] Reproducao do erro local no servidor
- [x] Correcao no script
- [ ] Subida final do servidor
- [ ] Teste manual com `F5`

### Resultado
- Comportamento esperado apos a mudanca: servidor local sobe corretamente e serve `build/web` com fallback SPA.
- Pendencias: iniciar servidor e validar no browser.

### Proximos passos recomendados
- Rodar `npm run serve:web:sync` apos build.
- Validar `F5` e navegacao de rotas.

## [2026-05-07 13:24] Remocao do mockup iPhone 15 Pro em Solucoes (App/Web)

### Contexto
- Pedido: retirar a tela com nome "iPhone 15 Pro" no bloco `Solucoes (App/Web)`.
- Escopo: composicao visual dos mockups em `lib/main.dart`.

### Arquivos alterados
- lib/main.dart
- docs/Atualiza.md

### O que foi feito
- Removido o segundo `DeviceFrame` com titulo `iPhone 15 Pro`.
- Mantido apenas o mockup `Android 14` no bloco de dispositivos.

### Risco de regressao
- Baixo: alteracao de layout sem impacto funcional.
- Pontos sensiveis: revisar espacamento visual com apenas um card.

### Validacao executada
- [x] Revisao manual do trecho alterado
- [ ] Analise estatica/lint
- [ ] Build local
- [ ] Teste manual do fluxo impactado

### Resultado
- Comportamento esperado apos a mudanca: bloco `Solucoes (App/Web)` exibe somente um mockup, sem card `iPhone 15 Pro`.
- Pendencias: validacao visual no navegador.

### Proximos passos recomendados
- Atualizar no browser com `F5`.
- Ajustar alinhamento do card, se desejar centralizar visualmente.

## [2026-05-07 13:26] Troca da imagem do mockup restante para PerfectGest (2)

### Contexto
- Pedido: trocar a imagem da tela restante no bloco `Solucoes (App/Web)` para `PerfectGest (2)`.
- Escopo: `DeviceFrame` unico em `lib/main.dart`.

### Arquivos alterados
- lib/main.dart
- docs/Atualiza.md

### O que foi feito
- Alterado `imageAsset` do mockup restante de:
  - `IMAGENS_APP/Screenshot/PerfectGest (1).png`
  para:
  - `IMAGENS_APP/Screenshot/PerfectGest (2).png`

### Risco de regressao
- Baixo: alteracao apenas de referencia de asset.
- Pontos sensiveis: verificar enquadramento/crop da nova imagem.

### Validacao executada
- [x] Revisao manual do caminho alterado
- [ ] Analise estatica/lint
- [ ] Build local
- [ ] Teste manual do fluxo impactado

### Resultado
- Comportamento esperado apos a mudanca: bloco `Solucoes (App/Web)` exibe a imagem `PerfectGest (2)` no unico mockup.
- Pendencias: validacao visual no navegador.

### Proximos passos recomendados
- Recarregar com `F5` em `http://localhost:8100`.

## [2026-05-07 13:31] Padronizacao global de nome para PerfectGest

### Contexto
- Pedido: alterar a palavra/nome `PerfectGest I` para `PerfectGest` em todos os textos do site.
- Escopo: UI, textos institucionais e metadados SEO/PWA.

### Arquivos alterados
- lib/main.dart
- lib/politica_page.dart
- lib/tecnologias_page.dart
- lib/seo_meta_web.dart
- web/index.html
- web/manifest.json
- docs/Atualiza.md

### O que foi feito
- Substituido `PerfectGest I` por `PerfectGest` em textos exibidos na interface.
- Atualizados titulos/descricoes SEO e Open Graph com o novo nome.
- Atualizados `title` HTML e nome/short_name do manifesto web.

### Risco de regressao
- Baixo: mudanca textual e de metadados, sem alteracao de logica.
- Pontos sensiveis: cache de navegador e manifesto podem exigir refresh forte.

### Validacao executada
- [x] Revisao manual dos arquivos alterados
- [x] Busca global em `lib/` e `web/` sem ocorrencias remanescentes de `PerfectGest I`
- [ ] Build local
- [ ] Teste manual no navegador

### Resultado
- Comportamento esperado apos a mudanca: nome `PerfectGest` padronizado em todo o site.
- Pendencias: validar no browser com `Ctrl + F5` (incluindo titulo da aba e textos institucionais).

### Proximos passos recomendados
- Rebuild local (`npm run build:web:sync`) e atualizar no `localhost`.
- Publicar no remoto para refletir online.

## [2026-05-07 14:37] Ajuste de TBT/CLS com carregamento progressivo por interacao

### Contexto
- Pedido: diagnostico de performance com foco em thread principal/TBT, tarefas longas e CLS.
- Escopo: estrategia de carregamento inicial da home em `lib/main.dart`.

### Arquivos alterados
- lib/main.dart
- docs/Atualiza.md

### O que foi feito
- Removido carregamento automatico temporizado das secoes pesadas apos 900ms.
- Alterado para carregar secoes pesadas somente por interacao real:
  - scroll (`offset > 48`) ou navegacao para ancora.
- Mantido placeholder inicial para as secoes, agora com alturas estimadas maiores para reduzir salto visual:
  - Solucoes: `500`
  - Portfolio: `340`
  - Contato: `320`
  - Footer de compliance: `250`
- Reutilizados `GlobalKey`s nas secoes placeholder para manter navegacao consistente antes da hidratacao completa.

### Risco de regressao
- Medio: alteracao de comportamento de carregamento progressivo.
- Pontos sensiveis: validar experiencia ao clicar no menu antes de scroll.

### Validacao executada
- [x] Revisao manual da logica e layout
- [ ] Build local
- [ ] Teste manual de navegacao por ancora
- [ ] Reavaliacao PSI/Lighthouse

### Resultado
- Comportamento esperado apos a mudanca: menos carga inicial na thread principal, menor TBT e menor CLS no primeiro carregamento.
- Pendencias: medir novamente no PSI (mobile) e comparar TBT/SI/CLS.

### Proximos passos recomendados
- Executar `npm run build:web:sync`.
- Testar menu e scroll no `localhost` e depois rodar PSI.

## [2026-05-07 15:51] Endurecimento de seguranca web (CSP/COOP/clickjacking)

### Contexto
- Pedido: tratar alertas de seguranca (CSP eficaz, COOP, clickjacking, riscos de XSS).
- Escopo: cabecalho HTML em `web/index.html`.

### Arquivos alterados
- web/index.html
- docs/Atualiza.md

### O que foi feito
- Adicionado `Cross-Origin-Opener-Policy` via meta:
  - `same-origin`
- Endurecida CSP existente com diretivas de mitigacao:
  - `object-src 'none'`
  - `frame-ancestors 'none'` (mitiga clickjacking de forma CSP)
  - `upgrade-insecure-requests`
- Mantidas diretivas necessarias para Flutter Web + GA4.

### Risco de regressao
- Baixo/Medio: politicas mais restritivas podem afetar embeds em `iframe` caso existam.
- Pontos sensiveis: se o site precisar ser embutido em outro dominio, ajustar `frame-ancestors`.

### Validacao executada
- [x] Revisao manual do `index.html`
- [ ] Build local
- [ ] Verificacao de console no browser apos deploy
- [ ] Re-scan de seguranca

### Resultado
- Comportamento esperado apos a mudanca: baseline de seguranca mais forte para XSS/clickjacking e isolamento de origem.
- Pendencias: configurar cabecalhos HTTP no Render para cobertura completa (X-Frame-Options/Trusted-Types em nivel de servidor).

### Proximos passos recomendados
- Rodar `npm run build:web:sync` e publicar.
- Validar novamente o diagnostico de seguranca.

## [2026-05-07 22:23] Criacao de subpaginas legais dedicadas

### Contexto
- Pedido: criar 2 subpaginas sem navegacao, com os titulos:
  - "Política de Privacidade PerfectGest I"
  - "Política de exclusão de Dados PerfectGest I"
- Escopo: novas paginas Flutter Web e documentos em `docs/`.

### Arquivos alterados
- lib/main.dart
- lib/legal_subpages.dart
- docs/Politica_Privacidade_PerfectGest_I.md
- docs/Politica_Exclusao_Dados_PerfectGest_I.md
- docs/Atualiza.md

### O que foi feito
- Criadas duas paginas Flutter Web dedicadas, sem entrada no menu principal:
  - `/politica-privacidade-perfectgest-i`
  - `/politica-exclusao-dados-perfectgest-i`
- Cada pagina:
  - exibe titulo correspondente;
  - contem texto introdutorio e referencia ao documento em `docs/`;
  - possui rodape com link clicavel para a propria URL (especialmente util no Web).
- Adicionados documentos markdown em `docs/` com estrutura inicial dos textos.
- Registradas rotas nomeadas no `MaterialApp` para permitir acesso direto via URL.

### Risco de regressao
- Baixo: novas rotas sem alteracao de fluxo principal.
- Pontos sensiveis: garantir que URLs sejam comunicadas corretamente nas configuracoes externas (Play Console, politicas, etc.).

### Validacao executada
- [x] Revisao manual dos arquivos novos/alterados
- [ ] Build web local completo
- [ ] Teste manual de acesso direto as rotas

### Resultado
- Comportamento esperado apos a mudanca: duas subpaginas legais acessiveis por URL, com rodape que repete o nome da pagina e fornece link para ela mesma.
- Pendencias: publicar novo build e validar no Render.

### Proximos passos recomendados
- Executar `npm run build:web:sync` e depois `npm run publish-web`.
- Expor as novas URLs nas politicas/console conforme necessidade.

## [2026-05-07 22:43] Isolamento total das subpaginas legais

### Contexto
- Pedido: nas subpaginas legais nao exibir quadro "Carregando experiencia web..." e remover navegacao para o restante do site.
- Escopo: `web/index.html` e `lib/legal_subpages.dart`.

### Arquivos alterados
- web/index.html
- lib/legal_subpages.dart
- docs/Atualiza.md

### O que foi feito
- Adicionado bypass do loading shell para rotas legais:
  - `/politica-privacidade-perfectgest-i`
  - `/politica-exclusao-dados-perfectgest-i`
- Removido `AppBar` das duas subpaginas para evitar elementos de navegacao.
- Mantido apenas o conteudo da pagina e o rodape com link para a propria URL (como solicitado).

### Risco de regressao
- Baixo: alteracao pontual de UX em rotas especificas.
- Pontos sensiveis: validar acesso direto por URL no localhost e no online.

### Validacao executada
- [x] Revisao manual dos trechos alterados
- [ ] Build local
- [ ] Teste manual das duas URLs

### Resultado
- Comportamento esperado apos a mudanca: paginas legais abrem diretas, sem loading shell e sem navegacao com o resto do site.
- Pendencias: rebuild/publicacao para refletir no servidor.

### Proximos passos recomendados
- Executar `npm run build:web:sync`.
- Testar as duas rotas no localhost.

## [2026-05-07 23:01] Conteudo juridico nas subpaginas e reforco visual no Hero

### Contexto
- Pedido: aplicar o conteudo atualizado dos arquivos de politica em formato juridico nas paginas dedicadas e reativar efeito visual de letras coloridas no primeiro bloco.
- Escopo: `lib/legal_subpages.dart` e `lib/main.dart`.

### Arquivos alterados
- lib/legal_subpages.dart
- lib/main.dart
- docs/Atualiza.md

### O que foi feito
- Substituido o texto resumido das duas subpaginas por estrutura juridica em secoes numeradas, baseada no conteudo de:
  - `docs/Politica_Privacidade_PerfectGest_I.md`
  - `docs/Politica_Exclusao_Dados_PerfectGest_I.md`
- Organizado o texto em blocos legais reutilizaveis (`_LegalSection`) para melhor leitura formal.
- Reforcado o efeito de letras coloridas no Hero principal com gradiente neon (ciano/magenta/verde) nas frases de destaque.

### Risco de regressao
- Baixo: alteracoes de conteudo e estilo visual.
- Pontos sensiveis: validar legibilidade em modo claro/escuro.

### Validacao executada
- [x] Revisao manual dos textos e estilos
- [ ] Build local
- [ ] Validacao visual no localhost

### Resultado
- Comportamento esperado apos a mudanca: subpaginas com texto juridico completo e bloco inicial da home com letras coloridas destacadas.
- Pendencias: rebuild/publicacao para refletir no servidor.

### Proximos passos recomendados
- Executar `npm run build:web:sync`.
- Validar no localhost e depois publicar no online.

## [2026-05-07 23:17] Reativacao de movimento no gradiente e sombra do Hero

### Contexto
- Pedido: reativar movimento colorido nas letras do primeiro bloco e sombra colorida animada abaixo do bloco principal.
- Escopo: secao Hero em `lib/main.dart`.

### Arquivos alterados
- lib/main.dart
- docs/Atualiza.md

### O que foi feito
- Reativado loop do `AnimationController` do Hero mesmo no modo de decoracao estatica.
- Reintroduzida rotacao animada do gradiente (`GradientRotation`) nas frases destacadas.
- Intensificada a sombra colorida do container com camada adicional e `offset` vertical animado para efeito de brilho em movimento na base do bloco.

### Risco de regressao
- Medio: aumento de efeitos visuais pode elevar custo de render em dispositivos fracos.
- Pontos sensiveis: monitorar TBT/SI no mobile apos deploy.

### Validacao executada
- [x] Revisao manual do trecho alterado
- [ ] Build local
- [ ] Validacao visual no localhost

### Resultado
- Comportamento esperado apos a mudanca: gradiente de letras com movimento perceptivel e sombra neon animada abaixo do Hero.
- Pendencias: rebuild e validacao no navegador.

### Proximos passos recomendados
- Rodar `npm run build:web:sync`.
- Fazer `Ctrl + F5` e validar em desktop/mobile.

## [2026-05-07 23:22] Correcao do link Parceiros tecnologicos na politica

### Contexto
- Pedido: no bloco "4. Google Analytics e serviços Google", o botão "Parceiros tecnológicos" deve abrir a página interna de parceiros tecnológicos, e não a URL do Google.
- Escopo: `lib/politica_page.dart`.

### Arquivos alterados
- lib/politica_page.dart
- docs/Atualiza.md

### O que foi feito
- Ajustado o item "Parceiros tecnológicos" para navegação interna via `Navigator` para `TecnologiasPage`.
- Mantidos os links externos de "Privacidade Google" e "Cookies Google".
- Evoluída a estrutura de links (`_PoliticaLink`) para suportar:
  - URL externa (`url`)
  - ação interna (`onTap`)

### Risco de regressao
- Baixo: ajuste pontual de ação de botão.
- Pontos sensiveis: validar no web e mobile o comportamento do botão.

### Validacao executada
- [x] Revisao manual da implementacao
- [ ] Build local
- [ ] Teste manual do bloco 4 na pagina de politica

### Resultado
- Comportamento esperado apos a mudanca: botão "Parceiros tecnológicos" abre a página interna correspondente.
- Pendencias: rebuild e validação no localhost.

### Proximos passos recomendados
- Executar `npm run build:web:sync`.
- Testar a navegação a partir da página de política.

## [2026-05-08 10:55] Fase 1 i18n: infraestrutura, autodeteccao e botao de idioma

### Contexto
- Pedido: implementar i18n via flutter_localizations + ficheiros .arb com suporte EN/ES e autodeteccao do idioma do browser, sem alterar textos visiveis ainda (Fase 1 do plano acordado).
- Escopo: pubspec, MaterialApp, controlador de idioma, persistencia em localStorage, selector no cabecalho, sincronia do `<html lang>`.

### Arquivos alterados
- pubspec.yaml (sem alteracao final; reverti `generate: true` para nao depender do codegen nesta fase)
- l10n.yaml (novo, comentado/desativado; documenta como reativar codegen na Fase 2)
- lib/l10n/app_pt.arb (novo)
- lib/l10n/app_en.arb (novo)
- lib/l10n/app_es.arb (novo)
- lib/l10n/app_localizations.dart (novo, escrito a mao para Fase 1)
- lib/locale_storage_stub.dart (novo)
- lib/locale_storage_web.dart (novo)
- lib/locale_controller.dart (novo)
- lib/seo_meta_stub.dart (added `applyDocumentLanguage`)
- lib/seo_meta_web.dart (added `applyDocumentLanguage`)
- lib/main.dart (`MaterialApp` com `localizationsDelegates`, `supportedLocales`, `locale`, `localeResolutionCallback`; selector `_LanguageMenuButton` no `SiteHeader`)
- docs/Atualiza.md

### O que foi feito
- Criada classe `AppLocalizations` (manual) com 5 chaves base para Fase 1 (`languageMenuTooltip`, `languageNamePortuguese`, `languageNameEnglish`, `languageNameSpanish`, `languageFollowSystem`).
- `MaterialApp` ligado ao i18n com 3 locais suportados: `pt`, `en`, `es`. `localeResolutionCallback` faz autodeteccao via `languageCode` do browser/sistema; fallback `pt`.
- Criado `LocaleController` (`ValueNotifier<Locale?>`); `null` => seguir sistema; escolha manual persistida em `localStorage` (chave `pp_locale`) na Web.
- Adicionado bot\u00e3o `_LanguageMenuButton` (icone `Icons.translate_rounded`) no `SiteHeader` (compact e desktop), com itens "Automatico (sistema)", PT, EN, ES; opcao ativa marcada com check.
- Sincronia do atributo `<html lang>` no DOM: atualiza tanto na resolucao automatica como em escolha manual.
- Textos visiveis do site permanecem em PT (Fase 1). A selecao de idioma ja afeta os textos do framework Material/Cupertino e a chave do AppLocalizations usada no proprio menu.

### Risco de regressao
- Baixo/Medio: alteracao no `MaterialApp` (passa a ter delegates/supportedLocales/locale). Sem alteracao de UI fora do header.
- Pontos sensiveis: confirmar que rotas legais e Navigator.push continuam a funcionar; confirmar que persistencia em `localStorage` nao interfere com banner de cookies.

### Validacao executada
- [x] Lint sem erros nos ficheiros alterados (ReadLints)
- [x] `flutter pub get`
- [x] `flutter analyze` (0 lints novos; 2 avisos pre-existentes: import `flutter_web_plugins` e `heroTitleSize` nao usado)
- [x] `flutter build web --release --pwa-strategy=none` (sucesso apos remover `l10n.yaml`)
- [ ] Teste manual no navegador com `Accept-Language` em `en` e `es`

### Correcao tardia (mesma entrega)
- Removido `l10n.yaml` (ficheiro de comentarios). Causava erro no build:
  - `Expected ...l10n.yaml to contain a map, instead was null`
  - O target `gen_localizations` e ativado pela mera presenca do YAML, nao precisa de `generate: true` no `pubspec.yaml`.
- Para reativar codegen na Fase 2, recriar `l10n.yaml` com chaves validas (`arb-dir`, `template-arb-file`, etc.) e adicionar `generate: true`.

### Resultado
- Comportamento esperado apos a mudanca:
  - Browser em PT => UI continua em PT (mesmo comportamento de hoje).
  - Browser em EN/ES => Material widgets em EN/ES; site continua em PT (textos hard-coded ate Fase 2 migrar para `AppLocalizations`).
  - Botao de idioma no cabecalho permite forcar PT/EN/ES ou voltar a "Automatico".
  - Atributo `<html lang>` reflete idioma ativo (a11y/SEO).
- Pendencias:
  - Rodar `flutter pub get` e `flutter analyze` para confirmar que nada quebrou.
  - Fase 2: migrar strings de `lib/main.dart` para chaves `.arb` (PT/EN/ES) usando `AppLocalizations.of(context)`.
  - Fase 4: localizar `seo_meta_*.dart` (titulos/descricoes/og:locale) por idioma e adicionar `<link rel="alternate" hreflang>` em `web/index.html`.

### Proximos passos recomendados
- Confirmar Fase 1 visualmente (botao no header e troca de idioma), depois iniciar Fase 2 (migracao incremental por seccao).
- Avaliar migrar para codegen oficial (`l10n.yaml` + `generate: true`) quando ultrapassarmos ~30 chaves traduzidas.

## [2026-05-08] Fase 3 parcial — paginas legais e tecnologias (i18n)

### Contexto
- Pedido: continuar entrega apos validacao; avancar i18n em conteudo extenso.
- Escopo: dependencia `flutter_web_plugins`; chave `navBack`; politica do site completa PT/EN/ES; pagina Tecnologias completa; titulos Play Store + data; correcao lint `depend_on_referenced_packages`.

### Arquivos alterados
- pubspec.yaml (`flutter_web_plugins` do SDK)
- lib/l10n/app_localizations.dart, lib/l10n/app_pt.arb, app_en.arb, app_es.arb (`navBack`)
- lib/l10n/site_policy_privacy_texts.dart (novo)
- lib/l10n/site_tecnologias_texts.dart (novo)
- lib/l10n/play_store_app_legal_texts.dart (novo)
- lib/politica_page.dart
- lib/tecnologias_page.dart
- lib/legal_subpages.dart
- docs/Atualiza.md

### O que foi feito
- Declarada dependencia direta `flutter_web_plugins` para eliminar aviso `depend_on_referenced_packages` em `main.dart`.
- Textos longos da politica do site movidos para `SitePolicyPrivacyTexts` (PT/EN/ES); `PoliticaPrivacidadePage` usa `AppLocalizations` para chrome (voltar, tema, links Google, copyright) e textos legais por locale.
- `TecnologiasPage`: hero, 15 cards tecnicos e rotulo "Conceito aplicado" via `SiteTecnologiasTexts`; AppBar e tooltips via `AppLocalizations`.
- `legal_subpages`: titulos das duas politicas PerfectGest I e linha "Ultima atualizacao" via `PlayStoreAppLegalTexts` (corpos das seccoes permanecem em PT).

### Risco de regressao
- Baixo/Medio: alteracao de textos legais em EN/ES (revisao humana recomendada).
- Pontos sensiveis: scroll inicial por `initialTopic` na pagina Tecnologias (chaves nos primeiros 4 cards mantidas).

### Validacao executada
- [x] `flutter pub get`
- [x] `dart analyze` nos ficheiros alterados (0 issues)
- [ ] `flutter build web --release` (nao executado nesta sessao por tempo)

### Pendencias
- Fase 4: SEO dinamico e hreflang.

## [2026-05-08] Fase 3 final — corpos das politicas Play Store i18n

### Contexto
- Pedido: continuar Fase 3.
- Escopo: migrar os textos das seccoes das duas politicas PerfectGest I (Play Store) para PT/EN/ES.

### Arquivos alterados
- lib/l10n/play_store_app_legal_texts.dart (estendido com `LegalSectionText` + listas PT/EN/ES)
- lib/legal_subpages.dart (renderiza secoes a partir das listas localizadas)
- docs/Atualiza.md

### O que foi feito
- Adicionada classe simples `LegalSectionText` (heading + body) e listas const por idioma para:
  - `privacyPolicySections` (7 secoes)
  - `dataDeletionPolicySections` (4 secoes)
- `legal_subpages.dart` agora itera as listas via `for (final s in lt.privacyPolicySections)` / `dataDeletionPolicySections`, removendo todo conteudo PT hard-coded.
- Titulos e linha "Ultima atualizacao" ja eram localizados desde a entrega anterior; agora todo o conteudo destas paginas e i18n.

### Risco de regressao
- Baixo: estrutura visual mantida, apenas fonte das strings mudou.
- Pontos sensiveis: textos juridicos EN/ES sao traducoes funcionais; revisao humana recomendada antes de publicacao oficial em outros mercados.

### Validacao executada
- [x] `dart analyze lib/legal_subpages.dart lib/l10n/play_store_app_legal_texts.dart` (No issues found!)
- [ ] Build web release / teste no browser pelos 3 idiomas (a fazer pelo utilizador).

### Resultado
- Fase 3 (paginas com texto extenso) concluida: `politica_page.dart`, `tecnologias_page.dart` e `legal_subpages.dart` totalmente i18n PT/EN/ES.
- Proximo: Fase 4 (SEO localizado + `link rel="alternate" hreflang"`).

## [2026-05-26] Rodape legal LTDA (Play Console / verificacao PJ)

### Contexto
- Pedido: expor identificacao da organizacao no site (home e Sobre) para alinhar com cadastro Google Play PJ.
- Escopo: widget reutilizavel + i18n PT/EN/ES; CNPJ oculto ate valor autorizado pelo operador.

### Arquivos alterados
- lib/company_legal.dart
- lib/company_legal_strip.dart
- lib/main.dart
- lib/l10n/app_pt.arb, app_en.arb, app_es.arb
- lib/l10n/app_localizations.dart
- docs/Atualiza.md

### O que foi feito
- Constantes publicas: razao social LTDA, morada Caxias do Sul, e-mail `administrador@perfectgestdev.com`, URLs FAQ e privacidade (Google Sites).
- `CompanyLegalStrip` no rodape da home (`_HomeComplianceFooter`) e em Sobre (`_SobreNosLegalFooter`).
- Chaves i18n: `footerCompanyLegalSemantics`, `footerCompanyCnpjLabel`, `footerCompanyContactLabel`, `footerCompanyEmailBtn`, `footerLinkAppFaq`, `footerLinkAppPrivacy`.

### Risco de regressao
- Baixo: adicao visual no rodape; links externos e mailto.
- Pontos sensiveis: CNPJ vazio (linha nao renderizada); deploy Render necessario para Play ver o site atualizado.

### Validacao executada
- [x] `flutter analyze` nos ficheiros alterados (0 issues)
- [ ] Build web release / deploy Render
- [ ] Teste manual home + Sobre nos 3 idiomas

### Pendencias
- Operador informar CNPJ para preencher `kCompanyCnpj` em `lib/company_legal.dart`.
- Deploy `npm run build:web:sync` (ou pipeline habitual) apos aprovacao.

## [2026-05-26] CNPJ e D-U-N-S no rodape legal

### Contexto
- Pedido: dados da organizacao (imagens Play / cadastro).
- Escopo: preencher identificadores fiscais no rodape.

### Arquivos alterados
- lib/company_legal.dart
- lib/company_legal_strip.dart
- lib/l10n/app_pt.arb, app_en.arb, app_es.arb
- lib/l10n/app_localizations.dart
- docs/Atualiza.md

### O que foi feito
- CNPJ: `66.889.409/0001-19`
- D-U-N-S: `582645270`
- Label i18n `footerCompanyDunsLabel` (PT/EN/ES).

### Validacao executada
- [x] `flutter analyze` (0 issues)
- [ ] Deploy Render

## [2026-05-27] Rodape legal compacto e largura alinhada

### Contexto
- Pedido: manter so o necessario (sem politicas do app); alinhar largura ao corpo; Sobre com rodape fixo compacto.

### Arquivos alterados
- lib/company_legal.dart, lib/company_legal_strip.dart, lib/site_layout.dart, lib/main.dart
- lib/l10n/app_pt.arb, app_en.arb, app_es.arb, app_localizations.dart
- docs/Atualiza.md

### O que foi feito
- Removidos links FAQ/privacidade do app e URLs Google Sites do rodape.
- LTDA: nome, morada, CNPJ · D-U-N-S · e-mail (linha compacta).
- Home: bloco com mesma margem/largura que `SectionCard` (padding 24, largura total).
- Sobre: rodape fixo alinhado a 720px do corpo, tipografia menor, menos padding.
- Separador visual entre dados da empresa e bloco «Privacidade de dados e cookies» (home).

### Validacao executada
- [x] `flutter analyze` (0 issues)
- [ ] Deploy Render

## [2026-05-27] Solucoes (App/Web) — vitrine marketing 2 phones + 2 tablets

### Contexto
- Pedido: alinhar secao Solucoes ao programa de marketing; +3 telas (1 celular, 2 tablet) no padrao `DeviceFrame`.

### Arquivos alterados
- lib/main.dart
- pubspec.yaml
- IMAGENS_APP/Screenshot/phone_03_inicio.png
- IMAGENS_APP/Screenshot/tablet_01_inicio.jpg
- IMAGENS_APP/Screenshot/tablet_02_orcamentos.jpg
- docs/Atualiza.md

### O que foi feito
- Vitrine com 4 mockups: inicio (phone), orcamentos (phone), inicio (tablet), orcamentos (tablet).
- Capturas da mesma base das artes Play Store (`LOGO/Telas` e `LOGO/Telas_tablet`).
- Moldura tablet `Android tablet` (228x308) distinta do celular `Android 14`.

### Validacao executada
- [x] `flutter analyze lib/main.dart` (0 issues)
- [ ] Validacao visual / deploy

## [2026-05-27] Solucoes — ampliar captura ao clique

### Contexto
- Pedido: ao clicar no mockup da vitrine, expandir imagem para ver detalhes.

### Arquivos alterados
- lib/solution_screenshot_preview.dart (novo)
- lib/main.dart (`DeviceFrame.previewCaption`, dialogo com `InteractiveViewer`)
- lib/l10n/app_pt.arb, app_en.arb, app_es.arb, app_localizations.dart
- docs/Atualiza.md

### O que foi feito
- Toque/clique no mockup abre dialogo com captura em tamanho grande e zoom.
- Icone de ampliar no canto; tooltip e textos PT/EN/ES.

### Validacao executada
- [x] `flutter analyze` (0 issues)
- [ ] Deploy / teste no browser

## [2026-05-27] Novo logotipo PerfectGest (tema claro / escuro)

### Contexto
- Pedido: substituir logo do site por icones fornecidos (claro e escuro).

### Arquivos alterados
- imagens/logo_perfectgest_light.png, logo_perfectgest_dark.png
- lib/site_brand_logo.dart, lib/main.dart (cabecalho)
- lib/l10n/*, pubspec.yaml, scripts/publish-web.cjs
- docs/Atualiza.md

### O que foi feito
- `SiteBrandLogo` escolhe asset conforme `Theme.of(context).brightness`.
- Cabecalho usa logo 40x40; fallback cruzado se asset falhar.

### Validacao executada
- [x] `flutter analyze` (0 issues)
- [ ] Deploy / alternar tema no browser

## [2026-05-27] Cabecalho — imagem PerfectGestDev no lugar do logo + nome

### Contexto
- Pedido: remover logo do site e texto `PerfectGest`, usando uma unica imagem clicavel com o mesmo link do nome.

### Arquivos alterados
- lib/main.dart
- imagens/brand_plate_perfectgestdev.png
- scripts/publish-web.cjs
- docs/Atualiza.md

### O que foi feito
- Cabeçalho agora usa apenas `imagens/brand_plate_perfectgestdev.png` como marca.
- Mantido o comportamento do clique (abre a URL do site) e semantica do link.

### Validacao executada
- [x] `flutter analyze lib/main.dart` (0 issues)
- [ ] Deploy / validacao visual no browser

## [2026-05-28] Google Site Verification (meta tag)

### Contexto
- Pedido: inserir tag HTML de verificação Google no `<head>` antes do `<body>`.

### Arquivos alterados
- web/index.html
- docs/Atualiza.md

### O que foi feito
- Adicionada `<meta name="google-site-verification" ...>` no `web/index.html`.

### Validacao executada
- [x] `flutter analyze` (0 issues)

## [2026-05-28] Politica de devolucao (Merchant Center)

### Contexto
- Pedido: criar pagina publica de politica de devolucao/reembolso para verificacao do Merchant Center.
- Observacao: o site e vitrine; vendas ocorrem fora do site (ex.: Google Play).

### Arquivos alterados
- lib/devolucao_page.dart
- lib/l10n/site_returns_policy_texts.dart
- lib/main.dart
- web/index.html
- docs/Atualiza.md

### O que foi feito
- Nova rota `/politica-devolucao` com texto PT/EN/ES e contacto de suporte.
- `web/index.html` inclui a rota na lista de paths legais que abrem sem loading shell.

### Validacao executada
- [x] `flutter analyze` (0 issues)

## [2026-05-28] 404 em rotas SPA no Render

### Contexto
- Operador: deploy OK no Render mas `/politica-devolucao` inacessivel (404).

### Diagnostico
- `curl -I .../politica-devolucao` → HTTP 404 do Render (nao e bug da rota Flutter).
- Home `/` funciona; faltam regras de rewrite no static site.

### Mitigacao
- `docs/RENDER_SPA_REWRITE.md`: regra obrigatoria no dashboard Render (`/*` → `/index.html`, Rewrite).
- `lib/devolucao_page.dart`: botao voltar com fallback para raiz quando nao ha historico (acesso direto por URL).

## [2026-05-28] Download ao abrir /politica-devolucao

### Causa
- Deploy anterior criou ficheiro **sem extensao** `politica-devolucao` no `build/web`; Render serviu com MIME errado → browser descarrega.

### Correcao
- `scripts/spa-legal-paths.cjs` passa a **remover** esses ficheiros apos o build (nao os cria).
- Manter rewrite Render `/*` -> `/index.html` (Rewrite) e novo `publish-web`.

### Arquivos alterados
- docs/RENDER_SPA_REWRITE.md
- lib/devolucao_page.dart
- docs/Atualiza.md

## [2026-05-31] Rodapé — remover CNPJ, D-U-N-S e e-mail

### Pedido
- Retirar do rodapé a linha `CNPJ · D-U-N-S · administrador@perfectgestdev.com`.

### O que ficou no rodapé
- Razão social LTDA + localização (Caxias do Sul — RS — Brasil).

### Arquivos alterados
- lib/company_legal_strip.dart
- lib/company_legal.dart
- lib/l10n/app_pt.arb, app_en.arb, app_es.arb
- lib/l10n/app_localizations.dart
- docs/Atualiza.md

### Validação
- [x] `flutter analyze` (0 issues)
- [ ] Build web + deploy Render para refletir no site publicado

## [2026-05-29] Política de devolução — identificação da empresa abaixo do copyright

### Pedido
- Colocar razão social, CNPJ, telefone e localização **abaixo** da linha de direitos reservados em `/politica-devolucao`.

### O que foi feito
- Novo widget `CompanyLegalPolicyFooter` com dados de `company_legal.dart`.
- Rótulos PT/EN/ES em `site_returns_policy_texts.dart` (`Contato com Empresa:` / `Company contact:` / `Contacto con la empresa:`).
- Rodapé da home (`CompanyLegalStrip`) inalterado — sem CNPJ.

### Arquivos alterados
- lib/company_legal.dart
- lib/company_legal_policy_footer.dart
- lib/devolucao_page.dart
- lib/l10n/site_returns_policy_texts.dart
- docs/Atualiza.md

### Validação
- [x] `flutter analyze` (0 issues)
- [ ] Build web + deploy Render

## [2026-05-29] Telefone — código internacional +55

### Pedido
- Acrescentar `+55` na frente do telefone no rodapé da política de devolução.

### Arquivos alterados
- lib/company_legal.dart (`kCompanyContactPhone` → `+55 51 989045442`)

## [2026-05-29] Política de devolução — ordem do rodapé

### Pedido
- Dados da empresa primeiro; frase de direitos reservados **abaixo**.

### Arquivos alterados
- lib/devolucao_page.dart
- docs/Atualiza.md

## [2026-05-29] Política de devolução — tamanho do nome PerfectGest

### Pedido
- «PerfectGest» no topo com o mesmo tamanho dos títulos das secções (15px / w800).

### Arquivos alterados
- lib/devolucao_page.dart
- docs/Atualiza.md

## [2026-05-29] Coerencia de marcas — Perfect Gest Dev / LTDA / PerfectGest I

### Pedido
- Site = nome fantasia **Perfect Gest Dev**; razao social **PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA**; **PerfectGest I** = produto (app Play Store).

### O que foi feito
- Constantes centralizadas em `company_legal.dart` (`kCompanyFantasyName`, `kProductPerfectGestIName`).
- Site, SEO, footer, hero, politicas do site e contacto passam a **Perfect Gest Dev**.
- Politicas Play Store e mockups de app mantem **PerfectGest I** como produto; controlador = fantasia + LTDA.
- Dominio unificado para `perfectgest-web-desenvolvedor-apps.onrender.com`.

### Arquivos alterados
- lib/company_legal.dart, lib/main.dart, lib/metallic_site_shell.dart, lib/metallic_preview_page.dart, lib/politica_page.dart
- lib/l10n/site_policy_privacy_texts.dart, site_returns_policy_texts.dart, play_store_app_legal_texts.dart, site_tecnologias_texts.dart
- lib/l10n/app_pt.arb, app_en.arb, app_es.arb, app_localizations.dart, lib/seo_meta_web.dart
- web/index.html, web/sitemap.xml, web/robots.txt, docs/Atualiza.md

### Validacao
- [x] `flutter analyze` (0 issues)

## [2026-06-08] Escopo IA — somente Web_perfectgest

### Pedido (operador Marcos)
- Até segunda ordem: **todas** as alterações de código/docs **somente** em `webs/Web_perfectgest/`.
- **Não** misturar com `apps/PerfectGest-I/`, `Clinica/`, `ClinicaGestAndroid/`, etc.

### Contexto lido
- `docs/Prompt_IA.md` — conduta (respostas curtas, PT+EN+ES, secção «Resumo»).
- `.cursorrules` — ler ficheiro antes de alterar; UI estática só com ordem; planeamento em `docs/Atualiza.md`.
- Pacote Flutter: `perfectpro_web` · deploy Render · docs legais espelham app PerfectGest I.

### Nota para IAs
- Entrada canónica: `docs/Prompt_IA.md` + «Estado actual consolidado» neste ficheiro.

### Arquivos alterados
- docs/Atualiza.md

### Validacao
- [x] Leitura Prompt_IA + .cursorrules
- [ ] N/A (sem build nesta entrega)

## [2026-06-08] Caminhos canónicos — Web_app → Web_perfectgest

### Pedido
- Corrigir apontamentos legados `webs/Web_app/` e `apps/novo_app/` nos docs de entrada IA.

### O que foi feito
- `docs/Prompt_IA.md` reescrito para site Flutter Web (`perfectpro_web`), escopo `Web_perfectgest`, app relacionado `PerfectGest-I`.
- «Estado actual consolidado» em `docs/Atualiza.md` actualizado.
- `docs/FICHA_TECNICA_SITE.md` — raiz e referências corrigidas.

### Arquivos alterados
- docs/Prompt_IA.md
- docs/Atualiza.md
- docs/FICHA_TECNICA_SITE.md
- docs/Checklist_critico.md

### Validacao
- [x] Grep sem `Web_app` nos três ficheiros de entrada (histórico antigo em Atualiza mantido)

## [2026-06-08] Pre-cadastro de leads — pagina publica + API

### Pedido
- Formulario simples (nome, e-mail, comentario opcional) com consentimento LGPD.
- URL publica para redes sociais e campanhas.
- Backend Node + PostgreSQL no Render (credenciais so no servidor).

### URL publica
- `https://perfectgest-web-desenvolvedor-apps.onrender.com/pre-cadastro`

### O que foi feito
- Rota Flutter `/pre-cadastro` com pagina deferred, SEO dedicado e item no header (desktop + menu compact).
- Chip «Pre-cadastro» na seccao Contato (mobile).
- `LeadCaptureService` POST para API configuravel via `--dart-define=LEADS_API_URL=...`.
- `scripts/leads-api-server.js` (Express + pg + CORS + rate limit + honeypot).
- `spa-legal-paths.cjs` gera `pre-cadastro.html`; sitemap e docs Render actualizados.

### Deploy pendente (operador)
- Render Static Site: regra Rewrite `/pre-cadastro` → `/pre-cadastro.html`.
- Render Web Service `perfectgest-leads-api`: `npm run server:leads`, env `DATABASE_URL` + `ALLOWED_ORIGINS`.
- Build web com URL da API quando o servico estiver no ar.

### Arquivos alterados
- lib/pre_cadastro_page.dart, lib/lead_capture_service.dart, lib/lead_api_config.dart, lib/site_public_urls.dart
- lib/site_deferred_pages.dart, lib/main.dart, lib/seo_meta_web.dart, lib/seo_meta_stub.dart
- lib/l10n/site_pre_cadastro_texts.dart, app_pt.arb, app_en.arb, app_es.arb, app_localizations.dart
- scripts/leads-api-server.js, scripts/spa-legal-paths.cjs, package.json, package-lock.json
- web/sitemap.xml, docs/RENDER_SPA_REWRITE.md, docs/Atualiza.md

### Validacao
- [x] `flutter analyze` (ficheiros do pre-cadastro)

## [2026-06-08] Conformidade Play Console + Microsoft Store

### Pedido
- Verificar alinhamento das politicas legais com Google Play Console e Microsoft Store.

### Auditoria (antes das correcoes)
- Politica do site sem URL publica dedicada.
- Pre-cadastro com consentimento apontando para politica da **app**, nao do site.
- Site sem mencao a dados de pre-cadastro nem LGPD explicita.
- App sem referencia a Microsoft Store.
- Sitemap incompleto; Checklist_critico desatualizado.

### Correcoes aplicadas
- Nova rota publica `/politica-privacidade-site` (PT/EN/ES, SEO, sitemap, spa-legal-paths).
- Textos do site: pre-cadastro, LGPD, links para politicas da app.
- Textos da app: Google Play **e** Microsoft Store (privacidade, billing, assinaturas).
- Consentimento do pre-cadastro → `/politica-privacidade-site`.
- `docs/Checklist_critico.md` — tabela URLs Play + Microsoft Partner Center.

### URLs para colar nas lojas
- App privacidade: `https://perfectgest-web-desenvolvedor-apps.onrender.com/politica-privacidade-perfectgest-i`
- App exclusao: `https://perfectgest-web-desenvolvedor-apps.onrender.com/politica-exclusao-dados-perfectgest-i`
- Site privacidade: `https://perfectgest-web-desenvolvedor-apps.onrender.com/politica-privacidade-site`

### Pendente (operador)
- Render rewrite `/politica-privacidade-site` → `.html`
- Play Console Data safety espelhar Firebase + pre-cadastro se aplicavel
- Partner Center: privacy URL + declaracao de recolha conforme capabilities MSIX

### Arquivos alterados
- lib/site_public_urls.dart, lib/site_deferred_pages.dart, lib/main.dart, lib/pre_cadastro_page.dart
- lib/l10n/site_policy_privacy_texts.dart, lib/l10n/play_store_app_legal_texts.dart
- web/sitemap.xml, web/index.html, scripts/spa-legal-paths.cjs
- docs/RENDER_SPA_REWRITE.md, docs/Checklist_critico.md, docs/Atualiza.md

### Validacao
- [x] `flutter analyze` (politicas + rotas)

## [2026-06-08] Pre-cadastro — Opção B (PostgreSQL Render)

### Pedido
- Receber cadastros apenas em base de dados persistente (sem e-mail automatico).

### O que foi feito
- `render.yaml`: Postgres `perfectgest-leads-db` + Web Service `perfectgest-leads-api` com `DATABASE_URL` ligado.
- API exige Postgres em producao (Render); ficheiro local so em dev.
- `scripts/export-leads.cjs` + `npm run export:leads` → CSV em `exports/`.
- Guia operador: `docs/RENDER_LEADS_POSTGRES.md` (PSQL, DBeaver, SQL de consulta e LGPD delete).

### Como consultar cadastros
```sql
SELECT id, nome, email, comentario, locale, created_at
FROM site_leads ORDER BY created_at DESC;
```

### Pendente (operador)
- Render → **New → Blueprint** (ou criar Postgres + Web Service manualmente).
- Validar `/health` com `"storage":"postgres"`.
- Testar envio em `/pre-cadastro`.

### Arquivos alterados
- render.yaml, scripts/leads-api-server.js, scripts/export-leads.cjs, exports/.gitignore
- package.json, lib/lead_api_config.dart, docs/RENDER_LEADS_POSTGRES.md, docs/Atualiza.md

### Validacao
- [x] API local com file fallback (dev)
- [ ] Postgres Render + formulario em producao (operador)

## [2026-06-08] Pre-cadastro — CSP bloqueava API (fix)

### Problema
- `/health` OK mas formulário falhava: CSP `connect-src` não incluía `perfectgest-leads-api.onrender.com`.

### Correcção
- `web/index.html`: `connect-src` + URL da API de leads.
- `publish-web` commit `6120371`.

### Validacao
- [x] POST API 201 com Postgres
- [x] CORS preflight OK

## [2026-06-08] Header compacto em mobile / janela estreita (Opcao 1)

### Pedido
- Menu superior visivel abaixo de 980px (telefone, PWA, PC com janela estreita).

### O que foi feito
- `SiteHeader` sempre visivel; modo compacto (<980px) com Home a esquerda, icones + menu hamburger a direita (inclui Pre-cadastro).
- Barra inferior mantida para atalhos de seccao.
- Removido botao flutuante de tema (ja no header).
- Espacamento superior uniforme (`headerHeight + 12`).

### Arquivos alterados
- lib/main.dart, docs/Atualiza.md

### Validacao
- [x] `flutter analyze lib/main.dart`

## [2026-06-12] Dominio canónico perfectgestdev.com + alinhamento Microsoft Store

### Contexto
- Pedido: corrigir desalinhamentos (domínio onrender, e-mail Gmail vs corporativo) para conformidade Partner Center / Microsoft Store.

### Arquivos alterados
- lib/site_public_urls.dart, lib/company_legal.dart, lib/app_theme.dart, lib/main.dart
- lib/l10n/site_policy_privacy_texts.dart, lib/l10n/play_store_app_legal_texts.dart, lib/l10n/site_pre_cadastro_texts.dart
- web/sitemap.xml, web/robots.txt
- scripts/leads-api-server.js, render.yaml
- docs/Checklist_critico.md, docs/Politica_Privacidade_PerfectGest_I.md, docs/Politica_Exclusao_Dados_PerfectGest_I.md

### O que foi feito
- `kSitePublicOrigin` → `https://perfectgestdev.com`; contacto único `suporte@perfectgestdev.com` (PT/EN/ES).
- Políticas app: CNPJ, crash reporting, e-mail corporativo; sitemap/robots actualizados.
- API leads: CORS default inclui `perfectgestdev.com` (+ onrender espelho).

### Pendencias (operador)
- Deploy `npm run publish-web` + Render `ALLOWED_ORIGINS` no serviço `perfectgest-leads-api` se ainda não actualizado no dashboard.

### Validacao
- [x] `dart analyze` ficheiros alterados

## [2026-06-12] Site vitrine — separar legal do site vs app (Google Sites)

### Contexto
- Pedido: site = vitrine da empresa; PerfectGest I só em Soluções; políticas da app no Google Sites (canónico).

### Arquivos alterados
- lib/app_legal_urls.dart (novo), lib/site_public_urls.dart, lib/main.dart, lib/site_deferred_pages.dart
- lib/l10n/site_policy_privacy_texts.dart, lib/l10n/app_localizations.dart
- scripts/spa-legal-paths.cjs, web/sitemap.xml, web/index.html
- docs/Checklist_critico.md, docs/RENDER_SPA_REWRITE.md, docs/Atualiza.md

### O que foi feito
- Removidas páginas Flutter duplicadas da app; rotas legadas → redirect HTML para Google Sites.
- Política do site só cobre cookies/pré-cadastro/analytics; links externos no rodapé e em Soluções.
- Sitemap sem URLs de política da app.

### Validacao
- [ ] Deploy `npm run publish-web` + teste redirects legados

## [2026-06-12] Documentação do site — vitrine vs app, domínio canónico

### Contexto
- Pedido: actualizar documentação alinhada à reorganização (site empresa, app no Google Sites).

### Arquivos alterados
- README.md, docs/README.md (novo índice), docs/PROJETO_SITE.md (reescrito)
- docs/Prompt_IA.md, docs/FICHA_TECNICA_SITE.md, docs/Checklist_critico.md
- docs/CheckPlay.md, docs/RENDER_SPA_REWRITE.md, docs/RENDER_LEADS_POSTGRES.md
- docs/Politica_Privacidade_PerfectGest_I.md, docs/Politica_Exclusao_Dados_PerfectGest_I.md

### O que foi feito
- Índice central em `docs/README.md`; `PROJETO_SITE.md` descreve arquitectura actual.
- URLs de teste e CORS apontam para `perfectgestdev.com`.
- Políticas app marcadas como referência interna; canónico = Google Sites.

### Validacao
- [x] Revisão manual de links e consistência com `lib/site_public_urls.dart` / `lib/app_legal_urls.dart`

## [2026-06-12] Site neutro — sem citar lojas de distribuição

### Contexto
- Pedido: site perfectgestdev = vitrine; compromisso com utilizadores; não tomar partido de Microsoft/Play Store no site; conformidade mantida no portal externo.

### Arquivos alterados
- lib/company_legal.dart, lib/app_legal_urls.dart, lib/app_theme.dart, lib/main.dart
- lib/l10n/app_localizations.dart, app_pt/en/es.arb, site_returns_policy_texts.dart
- docs/PROJETO_SITE.md, docs/Checklist_critico.md, docs/Atualiza.md

### O que foi feito
- Botão Soluções: «Obter o aplicativo» (ícone download); URL de distribuição só no código.
- Política de devoluções e rodapé: linguagem neutra («canal de aquisição», portal de suporte do produto).
- Documentação interna distingue site neutro vs portal legal para consolas.

### Validacao
- [x] `flutter analyze` + deploy

## [2026-06-12] Rodape vitrine — sem politicas da app + deploy alinhado

### Contexto
- Pedido: politicas da app so na secao Solucoes; rodape = site only; documentacao + publish.

### Arquivos alterados
- lib/main.dart, lib/l10n/app_localizations.dart, app_pt/en/es.arb
- docs/* (README, PROJETO_SITE, FICHA_TECNICA, Checklist, Atualiza, etc.)
- scripts/publish-web.cjs (stage docs/ + README no commit de deploy)

### O que foi feito
- Removidos do rodape: FAQ app, privacidade app, exclusao app.
- Rodape: politica do site + cookies Google; texto aponta Solucoes para PerfectGest I.
- Deploy vitrine neutra + redirects legados + reorganizacao Solucoes.

### Validacao
- [x] `flutter analyze`
- [x] `npm run publish-web` → Render main

## [2026-06-12] Rodape neutro — Etica e Compliance sem marcas Google

### Contexto
- Pedido: rodape sem Google/Microsoft/lojas; apenas Politicas de Privacidade, Gerenciar cookies, Etica e Compliance; compromisso com utilizador.

### Arquivos alterados
- lib/main.dart, lib/politica_page.dart, lib/site_deferred_pages.dart, lib/seo_meta_web.dart
- lib/l10n/app_localizations.dart, app_pt/en/es.arb, site_policy_privacy_texts.dart
- docs/FICHA_TECNICA_SITE.md, docs/PROJETO_SITE.md, docs/Atualiza.md

### O que foi feito
- Removidos links policies.google.com do rodape e da pagina de politica.
- Rodape: tres links internos (privacidade, cookies, devolucoes/compliance).
- Banner e politica do site: linguagem neutra (medicao de audiencia, sem nomes de fornecedor).

### Validacao
- [x] `flutter analyze`
- [x] `npm run publish-web` / commit `af962d4` → Render main

