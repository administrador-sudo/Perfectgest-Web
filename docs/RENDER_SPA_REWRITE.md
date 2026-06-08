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

**Adicione quatro regras Rewrite** (uma por linha, por esta ordem):

| Source | Destination | Action |
|--------|-------------|--------|
| `/politica-devolucao` | `/politica-devolucao.html` | **Rewrite** |
| `/politica-privacidade-perfectgest-i` | `/politica-privacidade-perfectgest-i.html` | **Rewrite** |
| `/politica-exclusao-dados-perfectgest-i` | `/politica-exclusao-dados-perfectgest-i.html` | **Rewrite** |
| `/pre-cadastro` | `/pre-cadastro.html` | **Rewrite** |

O URL no browser continua `/politica-devolucao`; o conteudo vem do `.html` com tipo correto.

### 3) Testar

Janela anonima:

`https://perfectgest-web-desenvolvedor-apps.onrender.com/politica-devolucao`

Deve abrir a pagina (nao download, nao branco).

Teste direto do HTML:

`.../politica-devolucao.html`

Tambem deve abrir.

---

## Nunca fazer

- Ficheiro **sem extensao** `politica-devolucao` no `build/web` → browser **faz download**.
- Regra `/*` → `/*` ou destino vazio → pagina **branca** (200 com 0 bytes).

---

## Home `/` e resto do site

A home nao precisa de regra extra. So as quatro rotas acima (legais + pre-cadastro).

Documentacao Render: https://render.com/docs/redirects-rewrites

**Cache / compressao (PageSpeed):** ver [`docs/RENDER_CACHE_HEADERS.md`](RENDER_CACHE_HEADERS.md).
