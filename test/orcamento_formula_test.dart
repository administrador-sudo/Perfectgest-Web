import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perfectpro_web/orcamento_models.dart';

void main() {
  test('total da abertura: material + mao de obra + comissao + instalacao (mm)', () {
    const item = OrcamentoItem(
      id: 't1',
      catalogId: 'maxim_ar',
      nome: 'Maxim-ar',
      precoM2: 400,
      larguraMm: 1000,
      alturaMm: 1200,
      pctMaoObra: 10,
      pctComissao: 5,
      instalacao: 80,
    );
    expect(item.area, closeTo(1.2, 0.0001));
    expect(item.material, closeTo(480, 0.0001));
    expect(item.maoObra, closeTo(72, 0.0001));
    expect(item.comissao, closeTo(29.6, 0.0001));
    expect(item.instalacaoEfetiva, 40);
    expect(item.valorFabricacao, closeTo(581.6, 0.0001));
    expect(item.total, closeTo(621.6, 0.0001));
  });

  test('parsePtBrDouble aceita virgula', () {
    expect(parsePtBrDouble('1.250,50'), closeTo(1250.5, 0.0001));
  });

  test('mm: format sem ponto e parse de 1.900', () {
    expect(formatMm(1900), '1900');
    expect(parseMm('1.900'), 1900);
    expect(parseMm('1900'), 1900);
    expect(formatMm(0), '');
  });

  test('catalogo: sacadas, lambri pivotante, sem porta balcao', () {
    expect(catalogoPorId('porta_balcao'), isNull);
    expect(
      catalogoPorId('porta_sacada_int_2_persiana')?.nome,
      'Porta sacada integrada 2 folhas 1 Recolhedor motorizada',
    );
    expect(
      catalogoPorId('janela_int_2_persiana')?.nome,
      'Janela sacada integrada 2 folhas 1 Recolhedor motorizada',
    );
    expect(catalogoPorId('porta_pivot_lambri_largo')?.grupo, kGrupoPortasGiro);
    expect(catalogoPorId('porta_pivot_lambri_estreito')?.grupo, kGrupoPortasGiro);
  });

  test('catalogo: portas de correr sacada e giro lambri/correr', () {
    expect(kOrcamentoGruposOrdenados, contains(kGrupoPortasCorrerSacada));
    expect(catalogoPorId('porta_sacada_2')?.grupo, kGrupoPortasCorrerSacada);
    expect(catalogoPorId('porta_sacada_2')?.nome, 'Porta sacada 2 folhas');
    expect(catalogoPorId('porta_sacada_3_trilho_triplo')?.nome, 'Porta sacada 3 folhas (Trilho Triplo)');
    expect(catalogoPorId('porta_sacada_4_2fixa_2moveis')?.nome, 'Porta sacada 4 folhas (2 Fixa e 2 Móveis)');
    expect(
      catalogoPorId('porta_sacada_4_moveis_quadruplo')?.nome,
      'Porta sacada 4 folhas Móveis (Trilho quádruplo)',
    );
    expect(catalogoPorId('porta_giro')?.nome, 'Porta de giro com vidro');
    expect(
      catalogoPorId('porta_correr')?.nome,
      'Porta de correr Interna/Externa lambri estreito (Trilho superior)',
    );
    expect(
      catalogoPorId('porta_correr_int_ext_veneziana')?.nome,
      'Porta de correr Interna/Externa Veneziana (Trilho superior)',
    );
    expect(catalogoPorId('porta_giro_lambri_25')?.nome, 'Porta de giro Lambri Estreito 100mm linha 25');
    expect(catalogoPorId('porta_giro_lambri_30')?.nome, 'Porta de giro Lambri Estreito 100mm linha 30');
    expect(catalogoPorId('porta_giro_lambri_largo_25'), isNull);
    expect(catalogoPorId('porta_giro_lambri_largo_30')?.nome, 'Porta de giro Lambri Largo 160mm linha 30');
    expect(
      catalogoPorId('veneziana')?.nome,
      'Veneziana de acoplar externa 2 folhas de giro (Palheta Cega)',
    );
    expect(catalogoPorId('veneziana')?.grupo, kGrupoJanelasCorrer);
    expect(catalogoPorId('veneziana_correr')?.grupo, kGrupoJanelasCorrer);
    expect(catalogoPorId('batente')?.nome, 'Maxim-ar quádrupla');
    expect(catalogoPorId('batente')?.icon, Icons.open_in_full);
    expect(catalogoPorId('maxim_ar')?.nome, 'Maxim-ar');
    expect(catalogoPorId('maxim_ar')?.nota, kMaximArNota);
    expect(
      kGrupoPortasGiro,
      'Portas de giro (Portas com medidas acima de 900 de largura e 2100 de altura consultar Fabricante)',
    );
  });

  test('limite porta giro 900 x 2100: obs consultar fabricante', () {
    const giro = OrcamentoItem(
      id: 'g1',
      catalogId: 'porta_giro',
      nome: 'Porta de giro com vidro',
      larguraMm: 901,
      alturaMm: 2100,
    );
    expect(ultrapassaLimitePortaGiro(giro), isTrue);
    expect(obsComLimitePortaGiro(giro, ''), kObsLimitePortaGiro);
    expect(obsComLimitePortaGiro(giro, 'Instalar cedo'), contains('Instalar cedo'));
    expect(obsComLimitePortaGiro(giro, kObsLimitePortaGiro), kObsLimitePortaGiro);

    const noLimite = OrcamentoItem(
      id: 'g2',
      catalogId: 'porta_giro',
      nome: 'Porta de giro com vidro',
      larguraMm: 900,
      alturaMm: 2100,
    );
    expect(ultrapassaLimitePortaGiro(noLimite), isFalse);
    expect(obsComLimitePortaGiro(noLimite, kObsLimitePortaGiro), '');

    const pivot = OrcamentoItem(
      id: 'g3',
      catalogId: 'porta_pivot_lambri_largo',
      nome: 'Porta pivotante Lambri largo, Linha 30',
      larguraMm: 900,
      alturaMm: 2101,
    );
    expect(ultrapassaLimitePortaGiro(pivot), isTrue);

    const maximPivot = OrcamentoItem(
      id: 'g4',
      catalogId: 'pivotante',
      nome: 'Maxim-ar Pivotante',
      larguraMm: 1000,
      alturaMm: 2200,
    );
    expect(ultrapassaLimitePortaGiro(maximPivot), isFalse);
  });

  test('mao de obra 15% e instalacao por area 40/80/120', () {
    expect(instalacaoPorArea(0), 40);
    expect(instalacaoPorArea(1.5), 40);
    expect(instalacaoPorArea(1.51), 80);
    expect(instalacaoPorArea(2.5), 80);
    expect(instalacaoPorArea(2.51), 120);
    expect(instalacaoPorArea(3.5), 120);
    expect(instalacaoPorArea(3.51), 120);
    const grande = OrcamentoItem(
      id: 'a1',
      catalogId: 'maxim_ar',
      nome: 'Maxim-ar',
      precoM2: 400,
      larguraMm: 2000,
      alturaMm: 2000,
    );
    expect(grande.area, closeTo(4, 0.0001));
    expect(ultrapassaInstalacao35(grande), isTrue);
    expect(obsComRegrasAbertura(grande, ''), kObsInstalacaoAcima35);
    expect(grande.instalacaoEfetiva, 120);
  });

  test('box banheiro: nasce 1900 mm; acima consulta fabricante', () {
    final tipo = catalogoPorId('box_banheiro')!;
    final nascido = OrcamentoItem.fromCatalog(tipo);
    expect(nascido.alturaMm, kBoxBanheiroAlturaPadraoMm);
    expect(ultrapassaLimiteBoxBanheiro(nascido), isFalse);
    const alto = OrcamentoItem(
      id: 'b1',
      catalogId: 'box_banheiro',
      nome: 'Box de banheiro',
      alturaMm: 1901,
    );
    expect(ultrapassaLimiteBoxBanheiro(alto), isTrue);
    expect(obsComRegrasAbertura(alto, ''), kObsLimiteBoxBanheiro);
    const noLimite = OrcamentoItem(
      id: 'b2',
      catalogId: 'box_banheiro',
      nome: 'Box de banheiro',
      alturaMm: 1900,
    );
    expect(ultrapassaLimiteBoxBanheiro(noLimite), isFalse);
  });

  test('maxim-ar: minimo cobrado 500 x 500; acima de 1000 alerta', () {
    const pequeno = OrcamentoItem(
      id: 'm1',
      catalogId: 'maxim_ar',
      nome: 'Maxim-ar',
      precoM2: 400,
      larguraMm: 400,
      alturaMm: 400,
    );
    expect(pequeno.area, closeTo(0.25, 0.0001));
    expect(pequeno.material, closeTo(100, 0.0001));
    expect(ultrapassaLimiteMaximAr(pequeno), isFalse);
    const largo = OrcamentoItem(
      id: 'm2',
      catalogId: 'maxim_ar',
      nome: 'Maxim-ar',
      larguraMm: 1200,
      alturaMm: 800,
    );
    expect(ultrapassaLimiteMaximAr(largo), isTrue);
    expect(kObsLimiteMaximAr, 'Não é permitido maior que 1000 mm.');
  });

  test('catalogo: temperados, brises e vidros 8/10 mm', () {
    expect(catalogoPorId('box_banheiro')?.grupo, kGrupoTemperados);
    expect(catalogoPorId('box_banheiro')?.nome, 'Box de banheiro');
    expect(catalogoPorId('box_banheiro')?.nota, 'Medida de altura padrão 1,90 m');
    expect(catalogoPorId('guarda_corpo_vidro')?.nome, 'Guarda-corpo de vidro (sem estrutura de alumínio)');
    expect(catalogoPorId('guarda_corpo_tradicional')?.grupo, kGrupoTemperados);
    expect(
      catalogoPorId('guarda_corpo_simples_tubular')?.nome,
      'Guarda-corpo simples de alumínio e vidro (Tubular)',
    );
    expect(catalogoPorId('ripado_amadeirado')?.grupo, kGrupoBrisesRipados);
    expect(catalogoPorId('ripado_cor')?.grupo, kGrupoBrisesRipados);
    expect(vidroPorId('vt8_incolor')?.nome, 'Vidro temperado 8 mm incolor');
    expect(vidroPorId('vt8_fume')?.nome, 'Vidro temperado 8 mm fumê');
    expect(vidroPorId('vt10_incolor')?.nome, 'Vidro temperado 10 mm incolor');
    expect(vidroPorId('vt10_fume')?.nome, 'Vidro temperado 10 mm fumê');
  });

  test('vidro padrao extra zero; outro vidro so a diferenca', () {
    const padrao = OrcamentoItem(
      id: 't1',
      catalogId: 'maxim_ar',
      nome: 'Maxim-ar',
      precoM2: 400,
      larguraMm: 1000,
      alturaMm: 1200,
      pctComissao: 5,
      vidroId: kVidroPadraoId,
      precoM2Vidro: 100,
      precoM2VidroPadrao: 100,
    );
    expect(padrao.areaVidro, closeTo(1.14, 0.0001));
    expect(padrao.valorVidro, 0);
    expect(padrao.vidroNome, 'Vidro incolor 4 mm (padrão)');
    const outro = OrcamentoItem(
      id: 't2',
      catalogId: 'maxim_ar',
      nome: 'Maxim-ar',
      precoM2: 400,
      larguraMm: 1000,
      alturaMm: 1200,
      vidroId: 'v6_incolor',
      precoM2Vidro: 150,
      precoM2VidroPadrao: 100,
    );
    expect(outro.valorVidro, closeTo(57, 0.0001));
  });

  test('vidro padrao: valorVidro zero', () {
    const item = OrcamentoItem(
      id: 't2',
      catalogId: 'maxim_ar',
      nome: 'Maxim-ar',
      precoM2: 400,
      larguraMm: 1000,
      alturaMm: 1200,
    );
    expect(item.vidroIdEfetivo, kVidroPadraoId);
    expect(item.valorVidro, 0);
  });

  test('PDF do item: m2, vidro e total; comissao so abaixo do total', () {
    const item = OrcamentoItem(
      id: 't1',
      catalogId: 'maxim_ar',
      nome: 'Maxim-ar',
      precoM2: 400,
      larguraMm: 1000,
      alturaMm: 1200,
      pctMaoObra: 10,
      pctComissao: 5,
      instalacao: 80,
      vidroId: 'v4_incolor',
      precoM2Vidro: 100,
    );
    final html = orcamentoToPrintHtml(
      cadastro: const OrcamentoCadastro(),
      itens: const [item],
      data: DateTime(2026, 10, 23),
    );
    expect(html.contains('Mão de obra'), isFalse);
    expect(html.contains('class="comissao-pdf'), isFalse);
    expect(html.contains('class="comissao">Comissão: ${formatBrl(item.comissao)}</span>'), isTrue);
    expect(html.contains('R\$/m²'), isFalse);
    expect(html.contains('(−5%)'), isFalse);
    expect(html.contains('1,200 m²'), isTrue);
    expect(html.contains(formatBrl(item.valorFabricacao)), isTrue);
    expect(
      item.valorFabricacao + item.valorVidro + item.instalacaoEfetiva,
      closeTo(item.total, 0.0001),
    );
    expect(html.contains(formatBrl(item.valorVidro)), isTrue);
    expect(html.contains(formatBrl(item.total)), isTrue);
    expect(html.contains('Vidro: Vidro incolor 4 mm (padrão)'), isTrue);
    expect(html.contains('class="sub">Vidro: Vidro incolor 4 mm (padrão)</div>'), isTrue);
    expect(html.contains('<tr class="obs">'), isFalse);
    expect(html.contains('<tbody class="bloco">'), isTrue);
    expect(html.contains('outline: 0.4pt'), isTrue);
    expect(html.contains('Instalação:'), isFalse);
    expect(html.contains('<th>Material de Fixação</th>'), isTrue);
    expect(html.contains(formatBrl(item.instalacaoEfetiva)), isTrue);
    expect(html.contains('margin: 6mm'), isTrue);
    expect(html.contains('<th>Diferença de Vidro</th>'), isTrue);
    expect(html.contains('<th>Valor de fabricação</th>'), isTrue);
  });

  test('PDF: vidro padrao aparece; instalacao so se houver', () {
    const item = OrcamentoItem(
      id: 't3',
      catalogId: 'maxim_ar',
      nome: 'Maxim-ar',
      precoM2: 400,
      larguraMm: 1000,
      alturaMm: 1200,
    );
    final html = orcamentoToPrintHtml(
      cadastro: const OrcamentoCadastro(),
      itens: const [item],
      data: DateTime(2026, 10, 23),
    );
    expect(html.contains('Vidro: Vidro incolor 4 mm (padrão)'), isTrue);
    expect(html.contains('Comissão: ${formatBrl(item.comissao)}'), isTrue);
    expect(html.contains('Instalação:'), isFalse);
    expect(html.contains(formatBrl(item.instalacaoEfetiva)), isTrue);
    expect(html.contains('<tbody class="bloco">'), isTrue);
  });

  test('PDF: vidro na linha do modelo; obs extra; quadro por item', () {
    const comVidro = OrcamentoItem(
      id: 't4',
      catalogId: 'maxim_ar',
      nome: 'Maxim-ar',
      precoM2: 400,
      larguraMm: 1000,
      alturaMm: 1200,
      modelo: 'Linha 21',
      cor: 'Branco',
      vidroId: 'v4_incolor',
      precoM2Vidro: 100,
      obs: 'Instalar com silicone',
    );
    const semVidro = OrcamentoItem(
      id: 't5',
      catalogId: 'maxim_ar',
      nome: 'Maxim-ar',
      precoM2: 400,
      larguraMm: 800,
      alturaMm: 1000,
    );
    final html = orcamentoToPrintHtml(
      cadastro: const OrcamentoCadastro(),
      itens: const [comVidro, semVidro],
      data: DateTime(2026, 10, 26),
    );
    expect(html.contains('Linha 21 · Branco · Vidro: Vidro incolor 4 mm (padrão)'), isTrue);
    expect(html.contains('Obs.: Instalar com silicone'), isTrue);
    expect(RegExp(r'<tbody class="bloco">').allMatches(html).length, 2);
  });

  test('reajuste abertura: fatia 60/40 material +15% e MO +10%', () {
    final fatorMat = fatorReajusteAbertura(
      fatiaMaterial: 60,
      fatiaMaoObra: 40,
      pctMaterial: 15,
      pctMaoObra: 0,
    );
    expect(fatorMat, closeTo(1.09, 0.0001));
    expect(aplicarReajustePreco(400, fatorMat), closeTo(436, 0.0001));
    final fatorMo = fatorReajusteAbertura(
      fatiaMaterial: 60,
      fatiaMaoObra: 40,
      pctMaterial: 0,
      pctMaoObra: 10,
    );
    expect(aplicarReajustePreco(400, fatorMo), closeTo(416, 0.0001));
    expect(aplicarAjustePct(80, 15), closeTo(92, 0.0001));
    expect(aplicarAjustePct(0, 15), 0);
    expect(normalizarFatia(60).maoObra, 40);
    final fatorBaixa = fatorReajusteAbertura(
      fatiaMaterial: 60,
      fatiaMaoObra: 40,
      pctMaterial: -15,
      pctMaoObra: 0,
    );
    expect(fatorBaixa, closeTo(0.91, 0.0001));
    expect(aplicarReajustePreco(400, fatorBaixa), closeTo(364, 0.0001));
    expect(aplicarAjustePct(80, -10), closeTo(72, 0.0001));
  });

  test('JSON antigo em cm converte para mm', () {
    final item = OrcamentoItem.fromJson({
      'id': 'x',
      'catalogId': 'maxim_ar',
      'nome': 'Maxim-ar',
      'larguraCm': 100,
      'alturaCm': 120,
    });
    expect(item.larguraMm, 1000);
    expect(item.alturaMm, 1200);
    expect(item.area, closeTo(1.2, 0.0001));
  });

  test('precos padrao da folha e overlay so se remoto > 0', () {
    expect(kOrcamentoFerramentaVersao, '1.2.9');
    expect(kOrcamentoPrecosM2Padrao['janela_correr_2'], 600);
    expect(kOrcamentoPrecosM2Padrao['maxim_ar'], 1300);
    expect(kOrcamentoPrecosM2Padrao['porta_giro_lambri_largo_30'], 1716);
    expect(kOrcamentoPrecosM2Padrao.containsKey('porta_giro_lambri_largo_25'), isFalse);
    expect(kOrcamentoPrecosM2Padrao.containsKey('ripado_amadeirado'), isFalse);
    expect(kOrcamentoPrecosVidroPadrao['v4_incolor'], 90);
    expect(kOrcamentoPrecosVidroPadrao['vt10_fume'], 200);
    final m2 = overlayPrecosPositivos(kOrcamentoPrecosM2Padrao, {'janela_correr_2': 0, 'maxim_ar': 1400});
    expect(m2['janela_correr_2'], 600);
    expect(m2['maxim_ar'], 1400);
  });

  test('snapshot de orcamento reabre itens completos', () {
    const item = OrcamentoItem(
      id: 'a1',
      catalogId: 'janela_correr_2',
      nome: 'Janela de correr 2 folhas',
      precoM2: 600,
      larguraMm: 1200,
      alturaMm: 1000,
      pctComissao: 5,
      vidroId: 'v4_fume',
      precoM2Vidro: 90,
      precoM2VidroPadrao: 90,
    );
    final payload = orcamentoRegistroPayload(
      cadastro: const OrcamentoCadastro(cliente: 'Ana', vendedor: 'Joao'),
      itens: [item],
      data: DateTime.utc(2026, 10, 29),
    );
    final snap = snapshotFromRegistro({'payload': payload});
    expect(snap.cadastro.cliente, 'Ana');
    expect(snap.itens, hasLength(1));
    expect(snap.itens.first.catalogId, 'janela_correr_2');
    expect(snap.itens.first.precoM2, 600);
    expect(snap.itens.first.larguraMm, 1200);
    expect(snap.itens.first.vidroId, 'v4_fume');
    final viaString = snapshotFromRegistro({'payload': jsonEncode(payload)});
    expect(viaString.cadastro.cliente, 'Ana');
    expect(viaString.itens.first.larguraMm, 1200);
    expect(viaString.itens.first.vidroId, 'v4_fume');
  });

  test('box e guarda-corpos nascem com vidro temperado 8 mm incolor', () {
    for (final id in kCatalogoVidroTemperado8) {
      final tipo = catalogoPorId(id);
      expect(tipo, isNotNull);
      final nascido = OrcamentoItem.fromCatalog(tipo!, precoM2VidroPadrao: 90, precoM2Vidro: 0);
      expect(nascido.vidroId, kVidroTemperado8IncolorId);
      expect(nascido.precoM2Vidro, 100);
      expect(nascido.precoM2VidroPadrao, 90);
      final item = nascido.copyWith(larguraMm: 1000, alturaMm: 1000);
      expect(item.valorVidro, closeTo(item.areaVidro * (100 - 90), 0.0001));
      expect(item.valorVidro, greaterThan(0));
    }
    final janela = OrcamentoItem.fromCatalog(
      catalogoPorId('janela_correr_2')!,
      precoM2VidroPadrao: 90,
    );
    expect(janela.vidroId, kVidroPadraoId);
    expect(janela.precoM2Vidro, 90);
    expect(janela.copyWith(larguraMm: 1000, alturaMm: 1000).valorVidro, 0);
  });

  test('upsert: id vazio cria; id preenchido atualiza; 404 recria', () {
    expect(documentoDeveAtualizar(null), isFalse);
    expect(documentoDeveAtualizar(''), isFalse);
    expect(documentoDeveAtualizar('  '), isFalse);
    expect(documentoDeveAtualizar('42'), isTrue);
    expect(upsertDeveRecriarApos404(404), isTrue);
    expect(upsertDeveRecriarApos404(200), isFalse);
    expect(upsertDeveRecriarApos404(201), isFalse);
  });

  test('texto WhatsApp do orçamento traz cliente, item e comissão', () {
    const item = OrcamentoItem(
      id: 'w1',
      catalogId: 'janela_correr_2',
      nome: 'Janela 2 folhas',
      precoM2: 600,
      larguraMm: 1200,
      alturaMm: 1400,
      modelo: 'Linha 25',
      cor: 'Branco',
      pctComissao: 5,
      vidroId: 'v4_incolor',
      precoM2Vidro: 90,
      precoM2VidroPadrao: 90,
    );
    final texto = textoWhatsAppOrcamento(
      cadastro: const OrcamentoCadastro(cliente: 'Maria Silva', vendedor: 'Joao'),
      itens: [item],
      data: DateTime(2026, 10, 15),
    );
    expect(texto, contains('Cliente: Maria Silva'));
    expect(texto, contains('Vendedor: Joao'));
    expect(texto, contains('Janela 2 folhas'));
    expect(texto, contains('Linha 25'));
    expect(texto, contains('Branco'));
    expect(texto, contains('1.200 x 1.400 mm'));
    expect(texto, contains('Fabricação:'));
    expect(texto, contains('Comissão item:'));
    expect(texto, contains('Total:'));
    expect(texto, contains('Comissão:'));
  });

  test('registros agrupam por mês 01-31 e separam mês aberto dos fechados', () {
    final a = OrcamentoRegistroResumo(
      id: '1',
      cliente: 'Ana',
      total: 100,
      comissao: 10,
      data: DateTime(2026, 9, 1),
    );
    final b = OrcamentoRegistroResumo(
      id: '2',
      cliente: 'Beto',
      total: 200,
      comissao: 20,
      data: DateTime(2026, 9, 30),
    );
    final c = OrcamentoRegistroResumo(
      id: '3',
      cliente: 'Caio',
      total: 300,
      comissao: 30,
      data: DateTime(2026, 10, 1),
    );
    final d = OrcamentoRegistroResumo(
      id: '4',
      cliente: 'Dora',
      total: 400,
      comissao: 40,
      data: DateTime(2026, 10, 31),
    );
    final lista = [a, b, c, d];
    expect(chaveMesOrcamento(a.data), '2026-09');
    expect(registrosDoMes(lista, '2026-09').map((e) => e.id), ['1', '2']);
    expect(registrosDoMes(lista, '2026-10').map((e) => e.id), ['3', '4']);
    final agora = DateTime(2026, 10, 29);
    expect(mesmoMesOrcamento(c.data, agora), isTrue);
    expect(mesmoMesOrcamento(a.data, agora), isFalse);
    expect(mesOrcamentoFechado(a.data, agora), isTrue);
    expect(mesOrcamentoFechado(d.data, agora), isFalse);
    expect(chavesMesesFechados(lista, agora), ['2026-09']);
    expect(rotuloMesOrcamento('2026-09'), 'Setembro/2026');
    expect(formatDataBr(inicioMesDaChave('2026-10')!), '01/10/2026');
    expect(formatDataBr(fimMesDaChave('2026-10')!), '31/10/2026');
  });

  test('partes WhatsApp do mês trazem itens e partem por orçamento', () {
    const item = OrcamentoItem(
      id: 'p1',
      catalogId: 'janela_correr_2',
      nome: 'Janela 2 folhas',
      precoM2: 600,
      larguraMm: 1000,
      alturaMm: 1200,
      pctComissao: 5,
    );
    final envios = [
      OrcamentoRegistroEnvio(
        resumo: OrcamentoRegistroResumo(
          id: '10',
          cliente: 'Ana',
          total: 100,
          comissao: 10,
          data: DateTime(2026, 10, 3),
        ),
        snap: const OrcamentoSnapshot(
          cadastro: OrcamentoCadastro(cliente: 'Ana'),
          itens: [item],
        ),
      ),
      OrcamentoRegistroEnvio(
        resumo: OrcamentoRegistroResumo(
          id: '11',
          cliente: 'Beto',
          total: 200,
          comissao: 20,
          data: DateTime(2026, 10, 20),
        ),
      ),
    ];
    final partes = partesWhatsAppRegistrosMes(chaveMes: '2026-10', envios: envios);
    expect(partes, isNotEmpty);
    final junto = partes.join('\n');
    expect(junto, contains('Outubro/2026'));
    expect(junto, contains('01/10/2026 a 31/10/2026'));
    expect(junto, contains('Cliente: Ana'));
    expect(junto, contains('Janela 2 folhas'));
    expect(junto, contains('Comissão item:'));
    expect(junto, contains('Cliente: Beto'));
    expect(junto, contains('Comissão: R\$'));
    final cortadas = partesTextoWhatsApp(['aaaa', 'bbbb'], maxChars: 6);
    expect(cortadas, hasLength(2));
    expect(cortadas[0], startsWith('Parte 1/2'));
    expect(cortadas[1], startsWith('Parte 2/2'));
  });
}
