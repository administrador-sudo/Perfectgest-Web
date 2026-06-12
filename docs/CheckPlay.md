# Checklist Google Play Store — PerfectGest I

**App ID:** `br.com.perfectpro.one`  
**Nome na loja:** PerfectGest I  
**Código-fonte:** `apps/PerfectGest-I/` (este ficheiro está em `webs/Web_perfectgest/docs/` por conveniência de conformidade conjunta site + app).

**URLs legais canónicas (Google Sites):** ver [`Checklist_critico.md`](Checklist_critico.md) e `apps/PerfectGest-I/docs/google_sites/LINKS_EXTERNOS.md`.

**Objetivo:** lista única para publicação e conformidade na Play Console.

Marque `[x]` quando cada item estiver concluído e validado.

---

## 1) Conta e aplicação na Play Console

- [ ] **Conta de programador Google Play** ativa (taxa única paga, dados fiscais corretos).
  - *Como cumprir:* [Google Play Console](https://play.google.com/console) → criar conta ou verificar estado em **Configuração da conta**.

- [ ] **App criado** na Console com o mesmo **nome** e **idioma predefinido** pretendidos para a ficha.
  - *Como cumprir:* **Todos os apps** → **Criar app** → preencher nome, tipo (app ou jogo), gratuito/pago.

- [ ] **ID da aplicação** na Console = `br.com.perfectpro.one` (não alterável após a primeira publicação).
  - *Como cumprir:* Confirmar no primeiro upload do AAB que o `applicationId` do projeto coincide (`apps/PerfectGest-I/android/app/build.gradle.kts`).

---

## 2) Assinatura de aplicação e ficheiro de publicação

- [ ] **Assinatura de aplicação da Google Play** aceite (recomendado: Google gere a chave de assinatura da app).
  - *Como cumprir:* Na primeira submissão, seguir o assistente de **Assinatura da aplicação**; guardar cópia das instruções de recuperação se aplicável.

- [ ] **Keystore de upload** criado localmente; `android/key.properties` preenchido (não versionar).
  - *Como cumprir:* Copiar de `android/key.properties.example`; preencher `storePassword`, `keyPassword`, `keyAlias`, `storeFile`; garantir que `android/.gitignore` ignora `key.properties` e `*.jks` / `*.keystore`.

- [ ] **AAB de release** gerado e testado antes de cada envio relevante.
  - *Como cumprir:* Na raiz do app (`apps/PerfectGest-I/`, `pubspec.yaml`):
    ```text
    flutter pub get
    flutter test
    flutter build appbundle --release --analyze-size --target-platform android-arm64
    ```
  - Artefacto: `build/app/outputs/bundle/release/app-release.aab`.

---

## 3) Ficha da loja (presença na loja)

- [ ] **Título curto** (até 30 caracteres) e **descrição completa** (funcionalidades, público, limitações).
  - *Como cumprir:* **Presença na loja** → **Ficha principal da loja** → textos em cada idioma publicado.

- [ ] **Ícone da aplicação** 512×512 px (PNG, 32 bits, máx. 1 MB).
  - *Como cumprir:* Exportar do asset de marca; carregar em **Gráficos da aplicação**.

- [ ] **Imagem de destaque** (feature graphic) 1024×500 px.
  - *Como cumprir:* Criar imagem alinhada à marca; carregar na mesma secção.

- [ ] **Capturas de ecrã** (telefone obrigatório; tablet opcional conforme políticas atuais).
  - *Como cumprir:* Instalar build release ou interno no dispositivo; capturar ecrãs das abas principais (Início, Empresa, Clientes, etc.); carregar no mínimo o número exigido pela Console (ver aviso no formulário).

- [ ] **Categoria** e **detalhes de contacto** (email ou site de suporte).
  - *Como cumprir:* **Ficha principal** → categoria adequada; email visível ao utilizador se exigido.

---

## 4) Classificação de conteúdo e público

- [ ] **Questionário de classificação de conteúdo** concluído (PEGI/ESRB equivalente por região).
  - *Como cumprir:* **Política da app** → **Classificação de conteúdo** → responder com base no conteúdo real da app (sem subestimar).

- [ ] **Público-alvo** e, se aplicável, **programas para crianças** declarados corretamente.
  - *Como cumprir:* **Política da app** → **Público-alvo e conteúdo** → alinhar com o uso real (dados locais, sem rede social infantil, etc.).

- [ ] **Anúncios**: declarar se a app exibe anúncios ou não.
  - *Como cumprir:* Mesmo ecrã de público-alvo; marcar conforme implementação real.

---

## 5) Política de privacidade, dados e conta

- [ ] **URL pública da política de privacidade** na ficha da loja e **igual** à referência no código.
  - *Como cumprir:* **Política da app** → **Política de privacidade** → colar URL Google Sites. No projeto: `apps/PerfectGest-I/lib/config/legal_urls.dart`. Texto de referência: `docs/Politica_Privacidade_PerfectGest_I.md` (canónico no Google Sites).

- [ ] **URL de informação sobre eliminação de dados / conta** (quando a Play exigir para o tipo de app).
  - *Como cumprir:* Inserir na Console onde solicitado. No código: `legal_urls.dart`. Documento: `docs/Politica_Exclusao_Dados_PerfectGest_I.md` (canónico no Google Sites).

- [ ] **Formulário Data safety** preenchido de forma **consistente** com o que a app faz (armazenamento local, permissões, partilha, encriptação).
  - *Como cumprir:* **Política da app** → **Segurança dos dados** → declarar tipos de dados recolhidos, finalidade, se são partilhados, retenção. Revisar permissões em `AndroidManifest.xml` e fluxos (câmara, ficheiros, faturação, etc.).

- [ ] **Declaração de conta** (se a app permite criar conta / login).
  - *Como cumprir:* Para app **sem** conta na nuvem, declarar claramente que não há conta de utilizador remota, se for o caso, conforme opções da Console.

---

## 6) Compras dentro da app (Google Play Billing)

- [ ] **Produto(s) de subscrição ou compra** criados na Console e **IDs** iguais aos usados no código.
  - *Como cumprir:* **Monetização com a Play** → criar/ativar produtos; cruzar com `LicenseService` / IAP no projeto.

- [ ] **Licença de teste** e **testadores internos** (ou licenciados) configurados.
  - *Como cumprir:* **Configuração** → **Gestão de licenças** / listas de testadores; instalar build da faixa **teste interno** no dispositivo físico e validar compra de teste e restauração.

---

## 7) Versões, faixas e testes antes da produção

- [ ] **Nome da versão** e **código da versão** (`version` / `versionCode` em `pubspec.yaml` / Android) incrementados em cada envio.
  - *Como cumprir:* Editar `pubspec.yaml`; confirmar que o `versionCode` Android aumenta (Flutter mapeia conforme configuração do projeto).

- [ ] **Faixa de teste interno** (recomendado) com AAB enviado e **instalação validada** em dispositivo real.
  - *Como cumprir:* **Testar e lançar** → **Teste interno** → criar versão → carregar AAB → adicionar emails de testadores → abrir link de opt-in e instalar.

- [ ] **Testes de regressão** no dispositivo: primeiro arranque, consentimento, fluxos principais, PDF/partilha, backup, eliminação de dados (se aplicável ao checklist interno).
  - *Como cumprir:* Checklist manual; após “Eliminar dados”, confirmar reabertura como primeira instalação conforme `docs/Eliminacao_de_Dados.md`.

---

## 8) Conformidade e revisão pela Google

- [ ] **Políticas do programa para programadores** e **regras de conteúdo** revistas (sem funcionalidades proibidas ou enganosas).
  - *Como cumprir:* Ler resumo em [Políticas](https://support.google.com/googleplay/android-developer/answer/9888170); alinhar descrição da loja com a app.

- [ ] **Declarações de permissões sensíveis** (se alguma for considerada sensível ou restrita) corretas e justificadas.
  - *Como cumprir:* Se a Console pedir formulário ou vídeo para permissão, submeter; manter texto da ficha coerente com o uso.

- [ ] **Enviar para revisão** a partir da faixa desejada (produção ou promover de teste interno → fechado → aberto → produção).
  - *Como cumprir:* **Testar e lançar** → selecionar faixa → **Revisar versão** → **Começar lançamento para a produção** (ou equivalente).

---

## 9) Após publicação

- [ ] **Monitorizar** painel de **Android vitals**, ANRs, crashes e avaliações.
  - *Como cumprir:* Play Console → **Qualidade** → Android vitals; responder a reviews críticos quando fizer sentido.

- [ ] **Atualizar** política, Data safety e URLs se a app ou o tratamento de dados mudarem.
  - *Como cumprir:* Sincronizar `legal_urls.dart`, sites públicos e formulário Data safety na mesma alteração.

---

## Referências no repositório

| Tema | Caminho |
|------|---------|
| URLs legais no app | `apps/PerfectGest-I/lib/config/legal_urls.dart` |
| URLs no site (Soluções) | `webs/Web_perfectgest/lib/app_legal_urls.dart` |
| Política (texto ref.) | `webs/Web_perfectgest/docs/Politica_Privacidade_PerfectGest_I.md` |
| Eliminação (texto ref.) | `webs/Web_perfectgest/docs/Politica_Exclusao_Dados_PerfectGest_I.md` |
| Checklist site + lojas | `webs/Web_perfectgest/docs/Checklist_critico.md` |
| Build release | `apps/PerfectGest-I/build/app/outputs/bundle/release/app-release.aab` |

**URLs canónicas (Google Sites — devem coincidir com a Console):**

- Privacidade PT: `https://sites.google.com/view/perfectgest-i-faq-suporte/politica-em-pt`
- Exclusão PT: `https://sites.google.com/view/perfectgest-exclusao-dados/exclus%C3%A3o-de-dados`
- FAQ: `https://sites.google.com/view/perfectgest-i-faq-suporte/faq`
- Site institucional: `https://perfectgestdev.com`

---

*Documento gerado para apoio à publicação; as regras oficiais são as da Google Play no momento do envio.*
