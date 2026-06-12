# Ficha técnica — Site PerfectGest (Web_perfectgest)

## 1. Identificação

| Campo | Valor |
|--------|--------|
| Nome do pacote | `perfectpro_web` (histórico) |
| Descrição | Site institucional PerfectGest — vitrine da empresa (Flutter Web) |
| Domínio canónico | `https://perfectgestdev.com` |
| Versão | `1.0.0+1` (pubspec) |
| Raiz do projeto | `Projetos/webs/Web_perfectgest` |

## 2. Papel do site vs app

| Camada | Onde | Conteúdo |
|--------|------|----------|
| **Site empresa** | `perfectgestdev.com` | Home, Sobre, Soluções (serviços + produto), Contacto, pré-cadastro, política **do site** |
| **App PerfectGest I** | Secção **Soluções** | Obter app + FAQ/políticas (portal externo; canónico consolas) |
| **Rotas legadas no domínio** | `/politica-privacidade-perfectgest-i`, etc. | Redirect HTML estático → Google Sites (`scripts/spa-legal-paths.cjs`) |

URLs legais da app: `apps/PerfectGest-I/docs/google_sites/LINKS_EXTERNOS.md`  
URLs do site: `lib/site_public_urls.dart`  
URLs da app (helpers): `lib/app_legal_urls.dart`

## 3. Stack

| Item | Detalhe |
|------|---------|
| Framework | Flutter (Material 3) |
| SDK Dart | `^3.11.4` |
| Alvo principal | **Web** (Render) |
| Contacto público | `suporte@perfectgestdev.com` (`lib/company_legal.dart`) |

## 4. Estrutura principal (`lib/`)

| Ficheiro | Função |
|----------|--------|
| `main.dart` | Home: Hero, Soluções, Portfolio, Contacto, rodapé (só site), Sobre nós |
| `site_public_urls.dart` | Origem do site, pré-cadastro, política site, devoluções |
| `app_legal_urls.dart` | URLs Google Sites (FAQ, privacidade app, exclusão) |
| `company_legal.dart` | CNPJ, razão social, e-mail, URL distribuição app (`kPerfectGestIProductUrl`) |
| `site_deferred_pages.dart` | Páginas legais **do site** (lazy load) |
| `site_layout.dart` / `metallic_site_shell.dart` | Layout, painéis e shell visual |
| `politica_page.dart` | Renderização política do site |
| `pre_cadastro_page.dart` | Formulário leads |
| `seo_meta_web.dart` | Meta tags no `<head>` |
| `l10n/app_localizations.dart` | Textos UI PT/EN/ES |
| `l10n/site_policy_privacy_texts.dart` | Corpo política do site |
| `l10n/site_pre_cadastro_texts.dart` | Textos pré-cadastro |

## 4b. Scripts npm relevantes

| Script | Função |
|--------|--------|
| `npm run publish-web` | Build + rotas legais + deploy |
| `npm run build:web:sync` | `flutter build web --release` |
| `npm start` / `server:leads` | API leads local |
| `npm run export:leads` | Export CSV Postgres |

## 5. Secção Soluções (ordem na página)

1. Título e texto **PerfectGest I** (produto)
2. Mockups (screenshots do app)
3. Botão obter aplicativo + portal FAQ/políticas (externo)
4. Bloco **Web Apps** (serviços da software house)

## 6. Páginas legais no domínio do site

| Rota | Tipo |
|------|------|
| `/politica-privacidade-site` | SPA Flutter — cookies, analytics, pré-cadastro |
| `/politica-devolucao` | SPA Flutter |
| `/pre-cadastro` | SPA Flutter — leads API |
| `/politica-privacidade-perfectgest-i` | Redirect → Google Sites |
| `/politica-exclusao-dados-perfectgest-i` | Redirect → Google Sites |

Ver `docs/RENDER_SPA_REWRITE.md` e `docs/Checklist_critico.md` para lojas (Play / Microsoft).

## 7. Deploy

```text
flutter pub get
flutter analyze
npm run publish-web -- --msg="..."
```

Build: `flutter build web` + `spa-legal-paths.cjs` → `build/web/` → Render.

## 8. Rodapé vs Soluções

| Zona | Conteúdo |
|------|----------|
| **Rodapé** | **Ética e Compliance** — Políticas de Privacidade, Gerenciar cookies, Ética e Compliance (links internos; **sem** marcas Google/Microsoft/lojas) |
| **Soluções** | PerfectGest I — Obter app + FAQ/políticas (portal externo) |
| **Banner cookies** | Texto neutro; consentimento explícito |

## 9. Pendências operacionais

- `ALLOWED_ORIGINS` na API `perfectgest-leads-api` com `https://perfectgestdev.com`
- Testar redirects legados após deploy
- Próxima fase: alinhar suporte nos restantes projetos (`apps/PerfectGest-I`, etc.)

---

*Atualizado em 2026-06-12 — vitrine neutra; legal da app só em Soluções + portal externo.*
