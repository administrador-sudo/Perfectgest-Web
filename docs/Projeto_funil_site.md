# Projeto funil site

Especificação permanente para **novo funil isolado** no site Perfect Gest Dev (`webs/Web_perfectgest`).

Funil-modelo: `/contabilidade` (honorários + app ContabilGest, sem menu da vitrine).

Primeiro derivado: `/contabilidade_Escritorio001` (associados S-App+CRCADM, outro escritório/SPE) — implementado em `lib/funil_escritorio001.dart`.

Quando o operador pedir outro funil, seguir este ficheiro. Não inventar pasta, Function nem menu na home.

## Regras fixas

- Escopo só `webs/Web_perfectgest/`.
- **Não criar pastas.** Ficheiros novos na raiz de `lib/` (ex. `lib/funil_escritorio001.dart`).
- **Não copiar** `lib/contabilidade_funil_page.dart` nem `lib/l10n/site_contabilidade_funil_texts.dart` (milhares de linhas a divergir).
- O funil original `/contabilidade` **não muda de comportamento** de cadastro (perfil PerfectGest, `enviaCadastroNuvem: true`). A apresentação (shots + título/lead) usa as telas novas `esc001_*` partilhadas em `lib/funil_apresentacao_app.dart`.
- Página **isolada**: link direto, `noindex, nofollow`. **Não** entra em Soluções / home.
- Sem publish até ordem expressa.
- Imagens novas: pasta **já existente** `IMAGENS_APP/IMAGENS NOVA PAGE/` (nomes distintos). Sem pasta nova.
- Cadastro na nuvem: **não** ligar a `receberLeadFunil` / `receberSolicitacaoA1Funil` até o operador indicar o destino (AWS/API/e-mail). Function Firebase **não se altera** neste projeto.
- WhatsApp/PIX: manter os do funil original até ordem de número deste escritório.

## Arquitectura

```
/contabilidade                          perfil perfectgest, envia cadastro Firebase
/contabilidade_Escritorio001            perfil Escritorio001, cadastro nuvem desligado (até destino)
/contabilidade_EscritorioNNN            repetir o mesmo perfil + rota
```

Um único widget `ContabilidadeFunilPage` com `FunilEscritorioPerfil`:

```dart
class FunilEscritorioPerfil {
  const FunilEscritorioPerfil({
    required this.id,
    required this.rota,
    required this.imagens,
    this.enviaCadastroNuvem = true,
  });
  final String id;
  final String rota;
  final FunilImgMap imagens;
  final bool enviaCadastroNuvem;
}
```

- Default (`const ContabilidadeFunilPage()`): PerfectGest, `enviaCadastroNuvem: true`, imagens e frases de `kFunilApresentacaoImagens` (telas novas do app).
- Novo escritório: ficheiro `lib/funil_<id>.dart` com o perfil e `ContabilidadeFunilPage(perfil: kFunil...)`.
- `_FunilShot` e selo QualityCert leem `perfil.imagens`.
- Submit (~`FunilFirestoreService.submit`): se `!enviaCadastroNuvem`, não POST; aviso curto de que o destino será ligado depois. Layout do formulário permanece.

## Slots de imagem (obrigatórios)

Mesmas chaves do funil atual:

- welcome, accountant, mei, menu, home, close, duties, invoices, phoneNfe, tabletNfe, qualityCert

O modelo `/contabilidade` e o 001 partilham `kFunilApresentacaoImagens` (`esc001_*` em `IMAGENS_APP/IMAGENS NOVA PAGE/`). QualityCert permanece `FunilImg.qualityCert`. `pubspec.yaml` já inclui essa pasta.

## Checklist — cada escritório novo

Slug **exacto** (respeitar maiúsculas se o operador as pedir), exemplo: `/contabilidade_Escritorio001`.

1. `lib/funil_<id>.dart` — perfil, mapa de imagens, `enviaCadastroNuvem: false` até haver destino.
2. `lib/site_public_urls.dart` — constante do path.
3. `lib/main.dart` — `onGenerateRoute` `case` da rota.
4. `scripts/legal-routes.cjs` — `siteSpaPages` (gera `<slug>.html` no `flutter build` via `spa-legal-paths.cjs`).
5. `render.yaml` — rewrite `source: /<slug>` → `destination: /<slug>.html`.
6. `docs/RENDER_SPA_REWRITE.md` — uma linha na lista.
7. **Dashboard Render** → Settings → Redirects/Rewrites → a **mesma** regra (sem isto a URL cai na home).
8. `lib/seo_meta_web.dart` — título/descrição deste escritório; `robots: noindex, nofollow`.
9. `Evolucao.md` e `docs/Atualiza.md`.

Não mexer: Function Firebase, API leads, preços/PIX do funil PerfectGest, UI estática da home.

## Pendente por escritório (operador indica depois)

- Destino de cadastro (AWS / API / e-mail)
- Fotos finais do app/SPE
- WhatsApp e PIX deste escritório
- Ligar `enviaCadastroNuvem: true` só depois do destino existir

## Referência de código do modelo

- Apresentação (shots + frases): `lib/funil_apresentacao_app.dart`
- Página: `lib/contabilidade_funil_page.dart`
- Textos: `lib/l10n/site_contabilidade_funil_texts.dart`
- POST lead: `lib/funil_firestore_service.dart`
- POST A1: `lib/funil_a1_service.dart`
- Rotas SPA: `scripts/legal-routes.cjs`, `scripts/spa-legal-paths.cjs`
- Rewrites: `render.yaml`, `docs/RENDER_SPA_REWRITE.md`
