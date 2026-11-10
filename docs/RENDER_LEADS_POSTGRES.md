# Render — pré-cadastro com PostgreSQL (Opção B)

Armazenamento **persistente** na tabela `site_leads`. **Sem e-mail automático** — consulta via Render, DBeaver ou script de exportação.

---

## 1) Criar infraestrutura (Blueprint recomendado)

1. [Render Dashboard](https://dashboard.render.com) → **New** → **Blueprint**.
2. Ligue o repositório **Perfectgest-Web** (branch `main`).
3. O ficheiro `render.yaml` na raiz cria:
   - **PostgreSQL** `perfectgest-leads-db`
   - **Web Service** `perfectgest-leads-api` (`npm start`)
4. Aguarde o deploy. Teste:

```text
https://perfectgest-leads-api-6v1e.onrender.com/health
```

(URL histórica sem sufixo: `perfectgest-leads-api.onrender.com` — o serviço activo no dashboard é **`perfectgest-leads-api-6v1e`**.)

Resposta esperada: `{"ok":true,"storage":"postgres",...}`

Se `storage` for `file`, falta `DATABASE_URL` — volte ao passo manual abaixo.

Se o deploy falhar com `getaddrinfo ENOTFOUND dpg-…-a` → a BD foi **apagada/expirou** ou o `DATABASE_URL` ficou com host Internal stale. Ver secção **8) ENOTFOUND**.

---

## 2) Criar manualmente (alternativa)

### A. Base PostgreSQL

1. **New** → **PostgreSQL** → nome `perfectgest-leads-db` (plano Free ou Starter).
2. Copie **Internal Database URL** (ou External se consultar de fora).

### B. Web Service da API

1. **New** → **Web Service** → mesmo repositório.
2. **Name:** `perfectgest-leads-api` (URL usada pelo site Flutter).
3. **Build:** `npm install`
4. **Start:** `npm start`
5. **Environment variables:**

| Variável | Valor |
|----------|--------|
| `DATABASE_URL` | URL completa do Postgres (Render liga automaticamente se usar “Link Database”) |
| `ALLOWED_ORIGINS` | `https://perfectgestdev.com,https://perfectgest-web-desenvolvedor-apps.onrender.com` |

---

## 3) Estrutura da tabela

Criada automaticamente no primeiro envio ou no `/health`:

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| `id` | bigint | Chave automática |
| `nome` | text | Nome informado |
| `email` | text | E-mail (minúsculas) |
| `comentario` | text | Comentário opcional |
| `locale` | text | Idioma (ex. `pt`, `en`) |
| `created_at` | timestamptz | Data/hora UTC |

---

## 4) Como ver os cadastros

### A. Shell do Render (rápido)

1. Dashboard → **perfectgest-leads-db** → **Connect** → **PSQL**.
2. Execute:

```sql
SELECT id, nome, email, comentario, locale,
       created_at AT TIME ZONE 'America/Sao_Paulo' AS criado_br
FROM site_leads
ORDER BY created_at DESC
LIMIT 50;
```

Exportar CSV no painel Render (se disponível) ou:

```sql
\copy (SELECT * FROM site_leads ORDER BY created_at DESC) TO STDOUT WITH CSV HEADER
```

### B. DBeaver / pgAdmin (PC)

1. **New connection** → PostgreSQL.
2. Use **External Database URL** do Render (host, port, user, password, database, SSL required).
3. Navegue: `public` → `site_leads` → botão direito → **Export data** (CSV/Excel).

### C. Script no projeto (PowerShell)

Com a URL externa do Postgres:

```powershell
cd ...\Web_perfectgest
$env:DATABASE_URL="postgresql://USER:PASS@HOST/DB"
npm run export:leads
```

Gera `exports/site_leads.csv` na pasta do projeto.

---

## 5) Testar o formulário

1. Abra: `https://perfectgestdev.com/pre-cadastro` (ou espelho Render durante transição).
2. Preencha e envie (primeiro envio pode demorar ~1 min — cold start do plano free).
3. Confirme na BD:

```sql
SELECT COUNT(*) FROM site_leads;
```

---

## 6) Convites de pré-lançamento (fluxo operacional)

1. Exporte ou consulte `site_leads` periodicamente.
2. Filtre e-mails válidos e duplicados (`SELECT email, COUNT(*) ... GROUP BY email HAVING COUNT(*) > 1`).
3. Use a lista para convites manuais (Gmail, WhatsApp Business, etc.) conforme a política de privacidade.

Pedidos de **eliminação** (LGPD): apague por e-mail ou SQL:

```sql
DELETE FROM site_leads WHERE email = 'usuario@exemplo.com';
```

---

## 7) Problemas comuns

| Sintoma | Causa | Solução |
|---------|--------|---------|
| «Sem ligação à API» | Web Service não criado ou URL errada | Confirmar `perfectgest-leads-api-6v1e` no Render |
| `/health` → `storage: file` | Sem `DATABASE_URL` | Ligar Postgres ao Web Service |
| Timeout ao enviar | Plano free dormiu | Aguardar 1 min e reenviar |
| Tabela vazia | Formulário nunca chegou | Ver logs do Web Service → **Logs** |
| Deploy Timed Out + `ENOTFOUND dpg-…-a` | Postgres free apagado/expirado ou Internal host stale | Secção **8** |

---

## 8) ENOTFOUND `dpg-…-a` (deploy health Timed Out)

O `/health` chama `ensurePgSchema` → `pg` resolve o host de `DATABASE_URL`. Host Internal curto (`dpg-xxxxx-a`, sem `.oregon-postgres.render.com`) **só** existe na rede privada Render. Se a BD free foi apagada/expirou, o DNS Internal some → `getaddrinfo ENOTFOUND` → health 503 → deploy **Timed Out**.

### O que o código faz (mitigação)

Em `scripts/leads-api-server.js`, host Internal curto é expandido para External:

`dpg-…-a` → `dpg-…-a.${RENDER_POSTGRES_HOST_SUFFIX||oregon-postgres.render.com}`

Isto **não recria** a BD. Se a instância morreu, o health continua 503 até o operador actualizar o env.

### Checklist Marcos (Dashboard Render) — obrigatório

1. Abrir [Render Dashboard](https://dashboard.render.com) → conta PerfectGest.
2. Em **Databases**, procurar `perfectgest-leads-db` (ou nome actual).
   - **Não existe / Suspended / Expired** → **New → PostgreSQL**
     - Name: `perfectgest-leads-db`
     - Database: `perfectgest_leads` (ou o que o painel gerar)
     - Região: a mesma do Web Service (Oregon se for o caso)
     - Plano: Free ou Starter (Free volta a expirar)
3. Abrir o Web Service **`perfectgest-leads-api-6v1e`** → **Environment**.
4. Actualizar `DATABASE_URL`:
   - Preferir **Connect → Internal Database URL** se Link Database estiver disponível **na mesma conta/região**, **ou**
   - Colar **External Database URL** (host completo `dpg-….REGION-postgres.render.com`) — funciona mesmo quando o DNS Internal falha.
5. Confirmar (opcional) `RENDER_POSTGRES_HOST_SUFFIX=oregon-postgres.render.com` (ou a região real).
6. **Manual Deploy** → Clear build cache / Deploy latest.
7. Testar:

```text
https://perfectgest-leads-api-6v1e.onrender.com/health
```

Esperado: HTTP 200 com `"ok":true,"storage":"postgres"`.

8. Dados antigos de `site_leads` / orçamento: **perdidos** se a BD free foi apagada (sem backup). O schema recria-se no primeiro `/health` ou POST.

### Evitar reincidência

- Não depender só do plano Free para leads de produção (expira).
- Qualquer push no repo Perfectgest-Web pode redeployar a leads-api; BD morta bloqueia o deploy mesmo em commits só de Barber/SPA.

---

Documentação relacionada: [`RENDER_SPA_REWRITE.md`](RENDER_SPA_REWRITE.md) (rotas do site).
