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
https://perfectgest-leads-api.onrender.com/health
```

Resposta esperada: `{"ok":true,"storage":"postgres"}`

Se `storage` for `file`, falta `DATABASE_URL` — volte ao passo manual abaixo.

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
| «Sem ligação à API» | Web Service não criado ou URL errada | Criar `perfectgest-leads-api` no Render |
| `/health` → `storage: file` | Sem `DATABASE_URL` | Ligar Postgres ao Web Service |
| Timeout ao enviar | Plano free dormiu | Aguardar 1 min e reenviar |
| Tabela vazia | Formulário nunca chegou | Ver logs do Web Service → **Logs** |

---

Documentação relacionada: [`RENDER_SPA_REWRITE.md`](RENDER_SPA_REWRITE.md) (rotas do site).
