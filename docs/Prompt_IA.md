# Prompt para nova IA — Site PerfectGest (Flutter Web)

Use este ficheiro no início de um chat novo. O utilizador prefere **respostas curtas** e pouco texto.

## 1) Contexto do repositório

- **Escopo IA (até segunda ordem):** alterações **somente** em `webs/Web_perfectgest/` — não mexer em `apps/`, `Clinica/`, etc. sem ordem expressa do operador.
- **Raiz deste projeto:** `Projetos/webs/Web_perfectgest/`
- **Pacote Flutter:** `perfectpro_web` (`pubspec.yaml` — nome histórico)
- **Marca / site:** **Perfect Gest Dev** — vitrine em `https://perfectgestdev.com`
- **Stack:** Flutter Web + `web/` + scripts npm (`package.json`, `scripts/`)
- **Deploy:** Render — `docs/RENDER_SPA_REWRITE.md`, `docs/RENDER_CACHE_HEADERS.md`
- **Evolução / histórico:** `docs/Atualiza.md` (ler e actualizar ao fechar tarefas)
- **App Android (espelho legal, só leitura):** `apps/PerfectGest-I/` — URLs canónicas em Google Sites (`lib/app_legal_urls.dart` espelha `apps/PerfectGest-I/lib/config/legal_urls.dart`)
- **Índice docs:** `docs/README.md`, visão geral `docs/PROJETO_SITE.md`

## 2) Arquitectura site vs app (obrigatório respeitar)

| Camada | Onde |
|--------|------|
| Site empresa | `perfectgestdev.com` — home, sobre, soluções, contacto, política **do site**, pré-cadastro |
| PerfectGest I (produto) | Secção **Soluções** apenas (obter app + FAQ/políticas) |
| Legal da app (privacidade, FAQ, exclusão) | **Portal externo** — não citar lojas no site |
| Rotas legadas `/politica-*-perfectgest-i` | Redirect estático (`scripts/spa-legal-paths.cjs`) |

Contacto público: `suporte@perfectgestdev.com` (`lib/company_legal.dart`).

## 3) Conduta de resposta (operador Marcos)

- Padrão: resposta curta, clara e objetiva.
- **Créditos:** optimizar consumo — não gastar com textos longos que não serão lidos; ir directo ao pedido.
- **Validação:** ao fechar, confirmar se o pedido **deu certo** ou se **atendeu a expectativa** do operador; se houver dúvida, perguntar em uma linha.
- Explicação longa: só quando for pedido explícito (`porquê`, `justifica`, `explica`).
- Evitar abertura com `Sim:` sem pergunta.
- Regras permanentes (prompt/rules): só podem ser alteradas com ordem explícita do operador no formato `incluir a regra: xxx`.
- Sem essa ordem explícita, não alterar regras; em caso de dúvida, perguntar ao operador o que deve ser feito antes de prosseguir.
- Toda alteração de texto em português no site deve ser padronizada também em **EN e ES** na mesma entrega (`lib/l10n/app_*.arb` + `app_localizations.dart`).
- Em EN, é obrigatório evitar mistura com PT; texto em PT no bloco EN é falta grave.
- Ao fechar tarefa com trabalho técnico, incluir secção final **«Resumo»** em português.
- Na secção final, primeira linha obrigatória:
  - `Foi modificado.`
  - ou `Não foi modificado.`
- Abaixo da primeira linha, listar os ficheiros tocados (um por linha, caminho relativo a `webs/Web_perfectgest/`).

## 4) Restrições (`.cursorrules`)

- Ler o ficheiro a alterar **antes** de qualquer acção.
- **UI estática:** não alterar código de ecrãs/layout já aperfeiçoados sem ordem explícita.
- **Pastas `BKP*`:** proibido editar ou usar como fonte de verdade.
- Planeamento de variantes: `docs/Atualiza.md` — não criar estruturas novas sem autorização.

**Não alterar este ficheiro sem ordem expressa do operador.**
