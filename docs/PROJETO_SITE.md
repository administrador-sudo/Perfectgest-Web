# Projeto — Site institucional Perfect Gest Dev

Site Flutter Web que funciona como **vitrine da Perfect Gest Dev** (`perfectgestdev.com`) para visitantes e utilizadores. Posicionamento **neutro** — sem citar lojas de distribuição no site público.

## Identidade

| Campo | Valor |
|--------|--------|
| Marca | Perfect Gest Dev |
| Razão social | PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA |
| CNPJ | 66.889.409/0001-19 |
| Domínio canónico | `https://perfectgestdev.com` |
| E-mail público | `suporte@perfectgestdev.com` |
| Pacote Flutter | `perfectpro_web` (nome histórico no `pubspec.yaml`) |
| Deploy | Render — serviço `perfectgest-web-desenvolvedor-apps` |

## Site vs app — regra de ouro

| Conteúdo | Onde vive |
|----------|-----------|
| Empresa, serviços web, contacto, pré-cadastro | **Site** (`perfectgestdev.com`) |
| Produto PerfectGest I (texto, mockups, obter app) | Secção **Soluções** do site |
| FAQ, privacidade da app, exclusão de dados, termos | **Portal externo de suporte** (URLs em `lib/app_legal_urls.dart`) |
| Rotas antigas `/politica-*-perfectgest-i` no domínio | Redirect estático → portal de suporte |

**Neutro:** o site não nomeia lojas de distribuição. Conformidade para consolas: portal externo + `docs/Checklist_critico.md`.

Fonte canónica das URLs da app: `apps/PerfectGest-I/Politicas-Privacidade/LINKS_EXTERNOS.md`.

## Estrutura da home (scroll)

Ordem percebida por quem visita de fora:

1. **Hero** — proposta da software house (mobile, web, SEO).
2. **Soluções (App/Web)** — ver secção abaixo.
3. **Portfolio** — diferenciais e competências.
4. **Contacto** — WhatsApp, e-mail, CTA.
5. **Rodapé compliance** — **Ética e Compliance**: Políticas de Privacidade, Gerenciar cookies, Ética e Compliance (sem citar marcas de terceiros).

Navegação adicional: página **Sobre nós** (rota interna, não no sitemap principal).

### Secção Soluções — ordem interna

1. Título e descrição do **PerfectGest I** (produto).
2. Mockups (screenshots telefone/tablet).
3. Botões: obter aplicativo + portal «FAQ e políticas do app» (portal externo).
4. Bloco **Web Apps** — serviços da empresa (Core Web Vitals, SEO, conversão).

Assim, a app não «invade» o resto do site; aparece como um produto dentro de Soluções.

## Páginas legais no domínio do site

| URL | Implementação | Âmbito |
|-----|---------------|--------|
| `/politica-privacidade-site` | Flutter SPA | Cookies, Google Analytics, formulário pré-cadastro |
| `/politica-devolucao` | Flutter SPA | Política de devoluções da vitrine |
| `/pre-cadastro` | Flutter SPA | Leads → API `perfectgest-leads-api` |
| `/politica-privacidade-perfectgest-i` | HTML redirect | → Google Sites (privacidade app) |
| `/politica-exclusao-dados-perfectgest-i` | HTML redirect | → Google Sites (exclusão app) |

Sitemap público (`web/sitemap.xml`): home + três rotas do site (sem políticas da app).

## Internacionalização

- Idiomas: **PT**, **EN**, **ES**.
- Ficheiros: `lib/l10n/app_pt.arb`, `app_en.arb`, `app_es.arb` + `app_localizations.dart`.
- Política do site: `lib/l10n/site_policy_privacy_texts.dart`.
- Pré-cadastro: `lib/l10n/site_pre_cadastro_texts.dart`.
- URLs da app **não** aparecem no rodapé — apenas na secção Soluções (`kAppSupportFaqUrl`, `kPerfectGestIProductUrl`).

## SEO e acessibilidade

- Meta tags injectadas em web: `lib/seo_meta_web.dart`.
- `Semantics` em blocos principais; animações reduzidas quando o SO pede.
- Canonical e origem: `kSitePublicOrigin` em `lib/site_public_urls.dart`.

## Deploy e rotas Render

```powershell
cd webs\Web_perfectgest
npm run publish-web -- --msg="descrição"
```

Pipeline: `flutter build web` → `spa-legal-paths.cjs` → commit/push → Render.

Rewrites obrigatórios: ver [RENDER_SPA_REWRITE.md](RENDER_SPA_REWRITE.md).  
Pré-cadastro + Postgres: ver [RENDER_LEADS_POSTGRES.md](RENDER_LEADS_POSTGRES.md).

## Checklist operacional pós-alteração

- [x] `flutter analyze` sem erros
- [x] Deploy com `npm run publish-web`
- [ ] Testar `perfectgestdev.com/politica-privacidade-site` e `/pre-cadastro`
- [ ] Testar redirect legado `/politica-privacidade-perfectgest-i` → portal externo
- [ ] Confirmar `ALLOWED_ORIGINS` na API leads inclui `https://perfectgestdev.com`

## Documentos relacionados

- [FICHA_TECNICA_SITE.md](FICHA_TECNICA_SITE.md) — detalhe técnico
- [Checklist_critico.md](Checklist_critico.md) — Play / Microsoft Store
- [README.md](README.md) — índice completo

---

*Perfect Gest Dev — vitrine em perfectgestdev.com. Legal da app: portal externo (consolas), não no rodapé.*
