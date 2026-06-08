**Site (este repositório):** `webs/Web_perfectgest/` — Flutter Web (`perfectpro_web`).

**App Android (monorepo):** `apps/PerfectGest-I/` — Flutter Android/iOS; **`macos/`** (se existir) ao lado de `lib/` e `pubspec.yaml` em **`apps/PerfectGest-I/macos/`**, não na raiz do repositório.

---

## Conformidade Play Console e Microsoft Store (2026-06-08)

**Origem canónica:** `https://perfectgest-web-desenvolvedor-apps.onrender.com`

| Campo / requisito | Google Play Console | Microsoft Partner Center | URL no site |
|-------------------|---------------------|--------------------------|-------------|
| Política de privacidade da **app** | Obrigatório (Data safety + ficha) | Obrigatório se recolhe dados pessoais | `https://perfectgest-web-desenvolvedor-apps.onrender.com/politica-privacidade-perfectgest-i` |
| Exclusão de dados da **app** | URL dedicada (conta local = “Não”) | Mecanismo de eliminação / contacto | `https://perfectgest-web-desenvolvedor-apps.onrender.com/politica-exclusao-dados-perfectgest-i` |
| Política do **site** (cookies, pré-cadastro, analytics) | Opcional na ficha do app; útil para campanhas web | Suporte / site institucional | `https://perfectgest-web-desenvolvedor-apps.onrender.com/politica-privacidade-site` |
| Devoluções (vitrine) | Referência CDC / canal de compra | Política de reembolso se vender no site | `https://perfectgest-web-desenvolvedor-apps.onrender.com/politica-devolucao` |
| Pré-cadastro (leads) | Declarar na Data safety se recolher contactos via web ligada ao app | Declarar recolha se formulário estiver activo | `https://perfectgest-web-desenvolvedor-apps.onrender.com/pre-cadastro` |

### Checklist rápido

- [x] URLs públicas, sem PDF, sem geofencing, PT/EN/ES
- [x] Controlador = **Perfect Gest Dev** / **PERFECT GEST DESENVOLVIMENTO DE SOFTWARE LTDA**
- [x] LGPD + direitos do titular (app e site)
- [x] Consentimento explícito no pré-cadastro → política do **site**
- [x] Cookies/GA só após consentimento (`pp_cookie_consent`)
- [x] App: local-first + Firebase mínimo descrito; lojas Google Play **e** Microsoft Store referidas
- [ ] Play Console: Data safety alinhada ao texto (Firebase, identificador dispositivo, e-mail se pré-cadastro)
- [ ] Partner Center: marcar recolha de dados se o pacote MSIX declarar capabilities sensíveis
- [ ] Render: rewrites para `/politica-privacidade-site` e restantes rotas (ver `docs/RENDER_SPA_REWRITE.md`)

### Play Console — campos práticos

1. **Link de privacidade:** URL da app (`…/politica-privacidade-perfectgest-i`).
2. **URL de exclusão de dados:** `…/politica-exclusao-dados-perfectgest-i`.
3. **Contas:** marcar **Não** (app local-first, sem conta em nuvem).
4. **Data safety:** espelhar secções 2–5 da política da app + pré-cadastro web se aplicável.

### Microsoft Store — campos práticos

1. **Privacy policy URL:** mesma URL da app (`…/politica-privacidade-perfectgest-i`) enquanto o produto for PerfectGest I.
2. **Recolha de dados:** Sim, se Firebase/telemetria ou capabilities no manifesto o exigirem.
3. **Assinaturas:** gestão via conta Microsoft (texto na política de exclusão, secção 4).
4. Políticas Microsoft Store v7.x: URL activa, direitos do utilizador, base legal, sem venda de dados a terceiros para publicidade.

---

1. No Google Play Console (Ficha da Loja)
Link de Privacidade: Use o link da Política completa.
URL de exclusão de dados: Use este link simplificado que você acabou de escrever.
Declaração de conta: Quando o Console perguntar se o seu app permite criar contas, marque "Não". Isso é verdade, pois seu app é local/offline. Isso elimina a necessidade de um sistema complexo de deleção de conta em nuvem.
2. O "Pulo do Gato" no Android (Tablet)
Antes de fechar o código, faça este teste final no seu tablet:
Vá em Configurações > Dados no dispositivo > Eliminar todos os dados (a função que você criou).
Após o comando, feche o app e abra de novo.
O app deve voltar para a tela inicial (ou onboarding) como se tivesse sido instalado agora.
Por que? O revisor do Google pode testar exatamente isso para ver se a promessa do site é real.
3. Gerando o Build Final (Release)
Quando estiver satisfeito com os ajustes no tablet, pare o flutter run e execute:
```bash
cd apps/PerfectGest-I
flutter build appbundle --release
```
Use o código com cuidado.
💡 Uma última dica de "Amigo Google"
Como sua conta é nova, o Google pode levar de 3 a 7 dias para revisar seu app pela primeira vez. Não se assuste se o status ficar "Em análise" por um tempo.
O que você precisa ter em mãos agora:
As screenshots (pelo menos 4 fotos do app rodando no tablet/celular).
Um ícone de alta resolução (512x512 PNG).
Uma imagem de capa (1024x500).
Você já preparou essas imagens ou quer que eu te passe as especificações de design para elas não ficarem distorcidas na loja?
Parabéns, Marcos! O projeto está com uma cara extremamente profissional. 🚀

As 3 Métricas que Realmente Importam (Core Web Vitals)
O Google foca nessas três para decidir se a experiência do seu site é boa:
LCP (Largest Contentful Paint): Mede o tempo de carregamento. Indica quanto tempo leva para o maior elemento da tela (geralmente uma imagem ou bloco de texto) aparecer.
Meta: Menos de 2,5 segundos. 🟢
INP (Interaction to Next Paint): Mede a interatividade. Avalia quanto tempo o site demora para responder a um clique do usuário.
Meta: Menos de 200 milissegundos. 🟢
CLS (Cumulative Layout Shift): Mede a estabilidade visual. Sabe quando você vai clicar em algo e a página pula, fazendo você clicar no lugar errado? É isso que essa métrica penaliza.
Meta: Pontuação abaixo de 0.1. 🟢

Dicas de como usar para Otimizar seu Site
Analise Desktop vs. Mobile: O Google é Mobile-First. Foque primeiro em resolver os problemas da aba "Celular", que costumam ser os mais críticos para o ranking.
Verifique as "Oportunidades": Abaixo das notas, o PSI lista exatamente o que fazer, como:
Adie imagens fora da tela: Carregar fotos apenas quando o usuário rolar até elas (Lazy Loading).
Use formatos modernos: Trocar arquivos .jpg ou .png por .webp (muito mais leves).
Reduza o tempo de resposta do servidor: Geralmente resolvido com uma hospedagem melhor ou uso de CDN (como Cloudflare).
Não persiga o 100/100: Ter uma nota acima de 90 já é excelente. O objetivo é a experiência real do usuário, não apenas um número perfeito.
