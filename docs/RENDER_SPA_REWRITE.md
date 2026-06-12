# Render — rotas Flutter Web (SPA)

## Politica de devolucao e paginas legais (recomendado)

### 1) Deploy

```powershell
cd ...\Web_perfectgest
npm run publish-web -- --msg=fix-rotas-legais-somente-html
```

Isto publica `politica-devolucao.html` (e as outras) e **remove** ficheiros sem extensao.

### 2) Regras no Render (Redirects / Rewrites)

**Apague** a regra global `/*` → `/index.html` se existir (pode dar pagina branca ou vazia).

**Adicione cinco regras Rewrite** (uma por linha, por esta ordem):

| Source | Destination | Action |
|--------|-------------|--------|
| `/politica-devolucao` | `/politica-devolucao.html` | **Rewrite** |
| `/politica-privacidade-perfectgest-i` | `/politica-privacidade-perfectgest-i.html` | **Rewrite** (HTML redirect → Google Sites) |
| `/politica-exclusao-dados-perfectgest-i` | `/politica-exclusao-dados-perfectgest-i.html` | **Rewrite** (HTML redirect → Google Sites) |
| `/politica-privacidade-site` | `/politica-privacidade-site.html` | **Rewrite** |
| `/pre-cadastro` | `/pre-cadastro.html` | **Rewrite** |

As duas rotas `…-perfectgest-i` servem **redirect estático** para o portal Google Sites (políticas da app). O site institucional mantém só `/politica-privacidade-site`.

O URL no browser continua `/politica-devolucao`; o conteudo vem do `.html` com tipo correto.

### 3) Testar

Janela anónima (domínio canónico):

`https://perfectgestdev.com/politica-devolucao`

Espelho Render (durante transição):

`https://perfectgest-web-desenvolvedor-apps.onrender.com/politica-devolucao`

Deve abrir a página (não download, não branco).

Redirect legado da app:

`https://perfectgestdev.com/politica-privacidade-perfectgest-i` → Google Sites

Teste directo do HTML:

`https://perfectgestdev.com/politica-devolucao.html`

---

## Nunca fazer

- Ficheiro **sem extensao** `politica-devolucao` no `build/web` → browser **faz download**.
- Regra `/*` → `/*` ou destino vazio → pagina **branca** (200 com 0 bytes).

---

## Home `/` e resto do site

A home nao precisa de regra extra. So as cinco rotas acima (legais, politica do site e pre-cadastro).

Documentacao Render: https://render.com/docs/redirects-rewrites

**Cache / compressao (PageSpeed):** ver [`docs/RENDER_CACHE_HEADERS.md`](RENDER_CACHE_HEADERS.md).
