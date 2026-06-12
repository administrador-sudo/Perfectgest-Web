# Documentação — Site Web_perfectgest

Índice — **Perfect Gest Dev** (`perfectgestdev.com`), site vitrine neutra.

## Visão geral

| Documento | Para quê |
|-----------|----------|
| [PROJETO_SITE.md](PROJETO_SITE.md) | Arquitectura, secções, site vs app, URLs |
| [FICHA_TECNICA_SITE.md](FICHA_TECNICA_SITE.md) | Stack, `lib/`, build e deploy |
| [Prompt_IA.md](Prompt_IA.md) | Regras para agentes IA |
| [Atualiza.md](Atualiza.md) | Histórico (actualizar ao fechar tarefas) |

## Conformidade (documentação interna)

| Documento | Para quê |
|-----------|----------|
| [Checklist_critico.md](Checklist_critico.md) | URLs para consolas de distribuição |
| [CheckPlay.md](CheckPlay.md) | Checklist Google Play (app) |
| [Politica_Privacidade_PerfectGest_I.md](Politica_Privacidade_PerfectGest_I.md) | Referência PT (canónico no portal externo) |
| [Politica_Exclusao_Dados_PerfectGest_I.md](Politica_Exclusao_Dados_PerfectGest_I.md) | Referência PT (canónico no portal externo) |

## Infraestrutura Render

| Documento | Para quê |
|-----------|----------|
| [RENDER_SPA_REWRITE.md](RENDER_SPA_REWRITE.md) | Rewrites e redirects legados |
| [RENDER_LEADS_POSTGRES.md](RENDER_LEADS_POSTGRES.md) | API leads + Postgres |
| [RENDER_CACHE_HEADERS.md](RENDER_CACHE_HEADERS.md) | Cache / PageSpeed |

## Fontes de verdade (código)

| Tema | Ficheiro |
|------|----------|
| Site (domínio, rotas) | `lib/site_public_urls.dart` |
| App (portal externo) | `lib/app_legal_urls.dart` — **só UI em Soluções** |
| Empresa | `lib/company_legal.dart` |
| i18n | `lib/l10n/app_localizations.dart` |
| Build rotas legais | `scripts/spa-legal-paths.cjs` |

## Arquitectura (combinado)

```
perfectgestdev.com
  Home, Sobre, Portfolio, Contacto
  Rodapé → só política DO SITE + cookies analytics
  Soluções → PerfectGest I + «Obter app» + «FAQ e políticas do app»
  /politica-privacidade-site | /pre-cadastro | /politica-devolucao
  /politica-*-perfectgest-i → redirect HTML → portal externo

Portal externo + apps/PerfectGest-I → legal completo para consolas
```

*Revisão: 2026-06-12 — deploy vitrine alinhada.*
