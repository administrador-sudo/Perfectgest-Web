# Render — cache, compressão e PageSpeed (Fase 1)

## Compressão (Brotli / Gzip)

O Render activa **compressão automática** para sites estáticos na maioria dos planos. Confirme no dashboard:

1. **Dashboard** → serviço `perfectgest-web-*` → **Settings**
2. Verifique se **Compression** / compressão HTTP está activa (Gzip; Brotli quando disponível no plano/região).

Se a métrica PSI ainda reportar payloads grandes, o ganho principal vem do **tamanho do bundle Flutter** (`main.dart.js`), não só da compressão.

## Cabeçalhos HTTP (Cache-Control)

Ficheiro de referência: [`web/_headers`](../web/_headers) (copiado para `build/web` no deploy).

### Opção A — Render Dashboard (recomendado se `_headers` não aplicar)

**Settings → HTTP Headers** — adicionar regras equivalentes:

| Path pattern | Header | Valor |
|--------------|--------|--------|
| `/*.js` | Cache-Control | `public, max-age=31536000, immutable` |
| `/*.wasm` | Cache-Control | `public, max-age=31536000, immutable` |
| `/assets/*` | Cache-Control | `public, max-age=31536000, immutable` |
| `/icons/*` | Cache-Control | `public, max-age=31536000, immutable` |
| `/` | Cache-Control | `public, max-age=0, must-revalidate` |

### Opção B — Ficheiro `_headers` no artefacto

Após `flutter build web`, confirmar que `build/web/_headers` existe antes do push (script `publish-web` inclui `build/web`).

## Validação pós-deploy

1. DevTools → **Network** → recarregar: `main.dart.js` com `content-encoding: gzip` ou `br`.
2. Segunda visita: assets com **304** ou **from disk cache**.
3. PageSpeed Insights (mobile) — comparar mediana de **TBT** e **payload** com medição anterior.

## Analytics (GA4)

O gtag **não** carrega no `<head>`. Só após:

- consentimento `pp_cookie_consent=granted` no `localStorage`, e
- `requestIdleCallback` / após `flutter-first-frame`.

Script: [`web/pp_analytics.js`](../web/pp_analytics.js).
