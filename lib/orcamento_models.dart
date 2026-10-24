import 'package:flutter/material.dart';

/// Tipos de abertura da v1 (catalogo fixo, facil de ampliar).
class OrcamentoCatalogTipo {
  const OrcamentoCatalogTipo({
    required this.id,
    required this.nome,
    required this.grupo,
    required this.icon,
  });

  final String id;
  final String nome;
  final String grupo;
  final IconData icon;
}

const String kGrupoJanelasCorrer = 'Janelas de correr';
const String kGrupoJanelasIntegradas = 'Janelas integradas';
const String kGrupoPortasIntegradas = 'Portas integradas / sacada';
const String kGrupoPortasGiro = 'Portas de giro';
const String kGrupoMaximOutros = 'Maxim-ar e outros';
const String kGrupoFixos = 'Fixos';
const String kGrupoTemperados = 'Temperados';
const String kGrupoBrisesRipados = 'Brises e Ripados';

const List<OrcamentoCatalogTipo> kOrcamentoCatalogo = [
  OrcamentoCatalogTipo(id: 'janela_correr_2', nome: 'Janela de correr 2 folhas', grupo: kGrupoJanelasCorrer, icon: Icons.window),
  OrcamentoCatalogTipo(id: 'janela_correr_2_fixa_movel', nome: 'Janela de correr de 2 folhas (uma fixa e uma móvel)', grupo: kGrupoJanelasCorrer, icon: Icons.window),
  OrcamentoCatalogTipo(id: 'janela_correr_3', nome: 'Janela de correr de 3 folhas (três trilhos)', grupo: kGrupoJanelasCorrer, icon: Icons.view_week),
  OrcamentoCatalogTipo(id: 'janela_correr_4', nome: 'Janela de correr 4 folhas', grupo: kGrupoJanelasCorrer, icon: Icons.grid_view),
  OrcamentoCatalogTipo(id: 'janela_int_2_rec1', nome: 'Janela integrada duas folhas 1 recolhedor', grupo: kGrupoJanelasIntegradas, icon: Icons.window),
  OrcamentoCatalogTipo(id: 'janela_int_2_rec2', nome: 'Janela integrada duas folhas 2 recolhedores', grupo: kGrupoJanelasIntegradas, icon: Icons.window),
  OrcamentoCatalogTipo(id: 'janela_int_2_persiana', nome: 'Janela sacada integrada 2 folhas 1 Recolhedor motorizada', grupo: kGrupoJanelasIntegradas, icon: Icons.blinds),
  OrcamentoCatalogTipo(id: 'porta_int_2_rec1', nome: 'Porta integrada duas folhas 1 recolhedor', grupo: kGrupoPortasIntegradas, icon: Icons.sensor_door),
  OrcamentoCatalogTipo(id: 'porta_int_2_rec2', nome: 'Porta integrada duas folhas 2 recolhedores', grupo: kGrupoPortasIntegradas, icon: Icons.sensor_door),
  OrcamentoCatalogTipo(id: 'porta_sacada_int_2_persiana', nome: 'Porta sacada integrada 2 folhas 1 Recolhedor motorizada', grupo: kGrupoPortasIntegradas, icon: Icons.deck),
  OrcamentoCatalogTipo(id: 'porta_giro', nome: 'Porta de giro', grupo: kGrupoPortasGiro, icon: Icons.meeting_room),
  OrcamentoCatalogTipo(id: 'porta_giro_veneziana_25', nome: 'Porta de giro veneziana linha 25', grupo: kGrupoPortasGiro, icon: Icons.meeting_room),
  OrcamentoCatalogTipo(id: 'porta_giro_veneziana_30', nome: 'Porta de giro veneziana linha 30', grupo: kGrupoPortasGiro, icon: Icons.meeting_room),
  OrcamentoCatalogTipo(id: 'porta_giro_lambri_25', nome: 'Porta de giro Lambri linha 25', grupo: kGrupoPortasGiro, icon: Icons.meeting_room),
  OrcamentoCatalogTipo(id: 'porta_giro_lambri_30', nome: 'Porta de giro Lambri linha 30', grupo: kGrupoPortasGiro, icon: Icons.meeting_room),
  OrcamentoCatalogTipo(id: 'porta_pivot_lambri_largo', nome: 'Porta pivotante Lambri largo', grupo: kGrupoPortasGiro, icon: Icons.rotate_right),
  OrcamentoCatalogTipo(id: 'porta_pivot_lambri_estreito', nome: 'Porta pivotante Lambri estreito', grupo: kGrupoPortasGiro, icon: Icons.rotate_right),
  OrcamentoCatalogTipo(id: 'porta_correr', nome: 'Porta de correr', grupo: kGrupoPortasGiro, icon: Icons.sensor_door),
  OrcamentoCatalogTipo(id: 'maxim_ar', nome: 'Maxim-ar', grupo: kGrupoMaximOutros, icon: Icons.open_in_full),
  OrcamentoCatalogTipo(id: 'maxim_ar_dupla', nome: 'Janela maxim-ar dupla', grupo: kGrupoMaximOutros, icon: Icons.open_in_full),
  OrcamentoCatalogTipo(id: 'basculante', nome: 'Basculante', grupo: kGrupoMaximOutros, icon: Icons.swap_vert),
  OrcamentoCatalogTipo(id: 'pivotante', nome: 'Pivotante', grupo: kGrupoMaximOutros, icon: Icons.rotate_right),
  OrcamentoCatalogTipo(id: 'batente', nome: 'Janela de batente', grupo: kGrupoMaximOutros, icon: Icons.crop_square),
  OrcamentoCatalogTipo(id: 'veneziana', nome: 'Veneziana', grupo: kGrupoMaximOutros, icon: Icons.view_week),
  OrcamentoCatalogTipo(id: 'veneziana_correr', nome: 'Janela veneziana de correr (palhetas cegas e ou ventiladas)', grupo: kGrupoMaximOutros, icon: Icons.view_week),
  OrcamentoCatalogTipo(id: 'quadro_fixo', nome: 'Quadro fixo', grupo: kGrupoFixos, icon: Icons.crop_square),
  OrcamentoCatalogTipo(id: 'fixo', nome: 'Peitoril/Bandeira', grupo: kGrupoFixos, icon: Icons.crop_landscape),
  OrcamentoCatalogTipo(id: 'box_banheiro', nome: 'Box de banheiro', grupo: kGrupoTemperados, icon: Icons.shower),
  OrcamentoCatalogTipo(id: 'guarda_corpo_vidro', nome: 'Guarda-corpo de vidro (sem estrutura de alumínio)', grupo: kGrupoTemperados, icon: Icons.crop_portrait),
  OrcamentoCatalogTipo(id: 'guarda_corpo_tradicional', nome: 'Guarda-corpo tradicional de alumínio e vidro', grupo: kGrupoTemperados, icon: Icons.fence),
  OrcamentoCatalogTipo(id: 'ripado_amadeirado', nome: 'Ripado com perfil amadeirado', grupo: kGrupoBrisesRipados, icon: Icons.view_week),
  OrcamentoCatalogTipo(id: 'ripado_cor', nome: 'Ripado com perfil de cor (branco, preto, bronze)', grupo: kGrupoBrisesRipados, icon: Icons.horizontal_split),
];

List<String> get kOrcamentoGruposOrdenados {
  final seen = <String>{};
  final out = <String>[];
  for (final t in kOrcamentoCatalogo) {
    if (seen.add(t.grupo)) out.add(t.grupo);
  }
  return out;
}

List<OrcamentoCatalogTipo> catalogoDoGrupo(String grupo) =>
    [for (final t in kOrcamentoCatalogo) if (t.grupo == grupo) t];

OrcamentoCatalogTipo? catalogoPorId(String id) {
  for (final t in kOrcamentoCatalogo) {
    if (t.id == id) return t;
  }
  return null;
}

class OrcamentoVidroTipo {
  const OrcamentoVidroTipo({required this.id, required this.nome});

  final String id;
  final String nome;
}

const List<OrcamentoVidroTipo> kOrcamentoVidros = [
  OrcamentoVidroTipo(id: 'v4_incolor', nome: 'Vidro 4 mm incolor'),
  OrcamentoVidroTipo(id: 'v4_fume', nome: 'Vidro 4 mm fumê'),
  OrcamentoVidroTipo(id: 'v6_incolor', nome: 'Vidro 6 mm incolor'),
  OrcamentoVidroTipo(id: 'v6_fume', nome: 'Vidro 6 mm fumê'),
  OrcamentoVidroTipo(id: 'v35_miniboreal', nome: 'Vidro 3,5 mm Miniboreal'),
  OrcamentoVidroTipo(id: 'v4_jateado', nome: 'Vidro jateado 4 mm'),
  OrcamentoVidroTipo(id: 'v6_jateado', nome: 'Vidro jateado 6 mm'),
  OrcamentoVidroTipo(id: 'vt4_incolor', nome: 'Vidro temperado 4 mm incolor'),
  OrcamentoVidroTipo(id: 'vt4_fume', nome: 'Vidro temperado 4 mm fumê'),
  OrcamentoVidroTipo(id: 'vt6_incolor', nome: 'Vidro temperado 6 mm incolor'),
  OrcamentoVidroTipo(id: 'vt6_fume', nome: 'Vidro temperado 6 mm fumê'),
  OrcamentoVidroTipo(id: 'vt8_incolor', nome: 'Vidro temperado 8 mm incolor'),
  OrcamentoVidroTipo(id: 'vt8_fume', nome: 'Vidro temperado 8 mm fumê'),
  OrcamentoVidroTipo(id: 'vt10_incolor', nome: 'Vidro temperado 10 mm incolor'),
  OrcamentoVidroTipo(id: 'vt10_fume', nome: 'Vidro temperado 10 mm fumê'),
];

OrcamentoVidroTipo? vidroPorId(String? id) {
  if (id == null || id.isEmpty) return null;
  for (final t in kOrcamentoVidros) {
    if (t.id == id) return t;
  }
  return null;
}

const double kOrcamentoDescontoAreaVidro = 0.95;

/// Cadastro da esquadria (preenchido na hora; nao usa company_legal).
class OrcamentoCadastro {
  const OrcamentoCadastro({
    this.empresaNome = '',
    this.cnpj = '',
    this.endereco = '',
    this.telefone = '',
    this.email = '',
    this.fabricante = '',
    this.vendedor = '',
    this.instalador = '',
    this.cliente = '',
    this.validadeAte = '',
  });

  final String empresaNome;
  final String cnpj;
  final String endereco;
  final String telefone;
  final String email;
  final String fabricante;
  final String vendedor;
  final String instalador;
  final String cliente;
  final String validadeAte;

  OrcamentoCadastro copyWith({
    String? empresaNome,
    String? cnpj,
    String? endereco,
    String? telefone,
    String? email,
    String? fabricante,
    String? vendedor,
    String? instalador,
    String? cliente,
    String? validadeAte,
  }) {
    return OrcamentoCadastro(
      empresaNome: empresaNome ?? this.empresaNome,
      cnpj: cnpj ?? this.cnpj,
      endereco: endereco ?? this.endereco,
      telefone: telefone ?? this.telefone,
      email: email ?? this.email,
      fabricante: fabricante ?? this.fabricante,
      vendedor: vendedor ?? this.vendedor,
      instalador: instalador ?? this.instalador,
      cliente: cliente ?? this.cliente,
      validadeAte: validadeAte ?? this.validadeAte,
    );
  }

  Map<String, dynamic> toJson() => {
        'empresaNome': empresaNome,
        'cnpj': cnpj,
        'endereco': endereco,
        'telefone': telefone,
        'email': email,
        'fabricante': fabricante,
        'vendedor': vendedor,
        'instalador': instalador,
        'cliente': cliente,
        'validadeAte': validadeAte,
      };

  factory OrcamentoCadastro.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const OrcamentoCadastro();
    String s(String k) => '${json[k] ?? ''}';
    return OrcamentoCadastro(
      empresaNome: s('empresaNome'),
      cnpj: s('cnpj'),
      endereco: s('endereco'),
      telefone: s('telefone'),
      email: s('email'),
      fabricante: s('fabricante'),
      vendedor: s('vendedor'),
      instalador: s('instalador'),
      cliente: s('cliente'),
      validadeAte: s('validadeAte'),
    );
  }
}

class OrcamentoItem {
  const OrcamentoItem({
    required this.id,
    required this.catalogId,
    required this.nome,
    this.precoM2 = 0,
    this.larguraMm = 0,
    this.alturaMm = 0,
    this.areaM2Override,
    this.cor = '',
    this.modelo = '',
    this.pctMaoObra = 0,
    this.pctComissao = 0,
    this.instalacao = 0,
    this.obs = '',
    this.vidroId = '',
    this.precoM2Vidro = 0,
  });

  final String id;
  final String catalogId;
  final String nome;
  final double precoM2;
  final double larguraMm;
  final double alturaMm;
  final double? areaM2Override;
  final String cor;
  final String modelo;
  final double pctMaoObra;
  final double pctComissao;
  final double instalacao;
  final String obs;
  final String vidroId;
  final double precoM2Vidro;

  double get areaCalculada => (larguraMm / 1000.0) * (alturaMm / 1000.0);

  double get area => areaM2Override ?? areaCalculada;

  double get material => area * precoM2;

  double get maoObra => material * pctMaoObra / 100.0;

  double get comissao => (material + maoObra) * pctComissao / 100.0;

  double get areaVidro => vidroId.isEmpty ? 0 : area * kOrcamentoDescontoAreaVidro;

  double get valorVidro => areaVidro * precoM2Vidro;

  String get vidroNome => vidroPorId(vidroId)?.nome ?? '';

  double get total => material + maoObra + comissao + instalacao + valorVidro;

  OrcamentoItem copyWith({
    String? id,
    String? catalogId,
    String? nome,
    double? precoM2,
    double? larguraMm,
    double? alturaMm,
    double? areaM2Override,
    bool clearAreaOverride = false,
    String? cor,
    String? modelo,
    double? pctMaoObra,
    double? pctComissao,
    double? instalacao,
    String? obs,
    String? vidroId,
    double? precoM2Vidro,
  }) {
    return OrcamentoItem(
      id: id ?? this.id,
      catalogId: catalogId ?? this.catalogId,
      nome: nome ?? this.nome,
      precoM2: precoM2 ?? this.precoM2,
      larguraMm: larguraMm ?? this.larguraMm,
      alturaMm: alturaMm ?? this.alturaMm,
      areaM2Override: clearAreaOverride ? null : (areaM2Override ?? this.areaM2Override),
      cor: cor ?? this.cor,
      modelo: modelo ?? this.modelo,
      pctMaoObra: pctMaoObra ?? this.pctMaoObra,
      pctComissao: pctComissao ?? this.pctComissao,
      instalacao: instalacao ?? this.instalacao,
      obs: obs ?? this.obs,
      vidroId: vidroId ?? this.vidroId,
      precoM2Vidro: precoM2Vidro ?? this.precoM2Vidro,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'catalogId': catalogId,
        'nome': nome,
        'precoM2': precoM2,
        'larguraMm': larguraMm,
        'alturaMm': alturaMm,
        'areaM2Override': areaM2Override,
        'cor': cor,
        'modelo': modelo,
        'pctMaoObra': pctMaoObra,
        'pctComissao': pctComissao,
        'instalacao': instalacao,
        'obs': obs,
        'vidroId': vidroId,
        'precoM2Vidro': precoM2Vidro,
      };

  factory OrcamentoItem.fromJson(Map<String, dynamic> json) {
    double d(String k) {
      final v = json[k];
      if (v is num) return v.toDouble();
      return double.tryParse('$v') ?? 0;
    }

    double? dn(String k) {
      final v = json[k];
      if (v == null) return null;
      if (v is num) return v.toDouble();
      return double.tryParse('$v');
    }

    return OrcamentoItem(
      id: '${json['id'] ?? ''}',
      catalogId: '${json['catalogId'] ?? ''}',
      nome: '${json['nome'] ?? ''}',
      precoM2: d('precoM2'),
      larguraMm: json.containsKey('larguraMm') ? d('larguraMm') : d('larguraCm') * 10,
      alturaMm: json.containsKey('alturaMm') ? d('alturaMm') : d('alturaCm') * 10,
      areaM2Override: dn('areaM2Override'),
      cor: '${json['cor'] ?? ''}',
      modelo: '${json['modelo'] ?? ''}',
      pctMaoObra: d('pctMaoObra'),
      pctComissao: d('pctComissao'),
      instalacao: d('instalacao'),
      obs: '${json['obs'] ?? ''}',
      vidroId: '${json['vidroId'] ?? ''}',
      precoM2Vidro: d('precoM2Vidro'),
    );
  }

  factory OrcamentoItem.fromCatalog(OrcamentoCatalogTipo tipo, {double precoM2 = 0}) {
    return OrcamentoItem(
      id: '${DateTime.now().microsecondsSinceEpoch}_${tipo.id}',
      catalogId: tipo.id,
      nome: tipo.nome,
      precoM2: precoM2,
    );
  }
}

class OrcamentoSnapshot {
  const OrcamentoSnapshot({
    this.cadastro = const OrcamentoCadastro(),
    this.itens = const [],
    this.precosM2 = const {},
    this.precosVidro = const {},
  });

  final OrcamentoCadastro cadastro;
  final List<OrcamentoItem> itens;
  final Map<String, double> precosM2;
  final Map<String, double> precosVidro;

  double get total => itens.fold<double>(0, (s, e) => s + e.total);

  Map<String, dynamic> toJson() => {
        'v': 1,
        'cadastro': cadastro.toJson(),
        'itens': itens.map((e) => e.toJson()).toList(),
        'precosM2': precosM2,
        'precosVidro': precosVidro,
      };

  factory OrcamentoSnapshot.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const OrcamentoSnapshot();
    final rawItens = json['itens'];
    final itens = <OrcamentoItem>[];
    if (rawItens is List) {
      for (final e in rawItens) {
        if (e is Map<String, dynamic>) {
          itens.add(OrcamentoItem.fromJson(e));
        } else if (e is Map) {
          itens.add(OrcamentoItem.fromJson(Map<String, dynamic>.from(e)));
        }
      }
    }
    final precos = <String, double>{};
    final rawP = json['precosM2'];
    if (rawP is Map) {
      rawP.forEach((k, v) {
        if (v is num) {
          precos['$k'] = v.toDouble();
        } else {
          precos['$k'] = double.tryParse('$v') ?? 0;
        }
      });
    }
    final precosVidro = <String, double>{};
    final rawV = json['precosVidro'];
    if (rawV is Map) {
      rawV.forEach((k, v) {
        if (v is num) {
          precosVidro['$k'] = v.toDouble();
        } else {
          precosVidro['$k'] = double.tryParse('$v') ?? 0;
        }
      });
    }
    final cadRaw = json['cadastro'];
    return OrcamentoSnapshot(
      cadastro: OrcamentoCadastro.fromJson(
        cadRaw is Map<String, dynamic>
            ? cadRaw
            : cadRaw is Map
                ? Map<String, dynamic>.from(cadRaw)
                : null,
      ),
      itens: itens,
      precosM2: precos,
      precosVidro: precosVidro,
    );
  }
}

double parsePtBrDouble(String raw) {
  var t = raw.trim().replaceAll(' ', '');
  if (t.isEmpty) return 0;
  if (t.contains(',')) {
    t = t.replaceAll('.', '').replaceAll(',', '.');
  }
  return double.tryParse(t) ?? 0;
}

String formatPtBrNumber(double v, {int casas = 2}) {
  final neg = v < 0;
  final abs = v.abs();
  final fator = _pow10(casas);
  final rounded = (abs * fator).round();
  final whole = rounded ~/ fator;
  final frac = (rounded % fator).toString().padLeft(casas, '0');
  final digits = whole.toString();
  final buf = StringBuffer();
  for (var i = 0; i < digits.length; i++) {
    final fromEnd = digits.length - i;
    if (i > 0 && fromEnd % 3 == 0) buf.write('.');
    buf.write(digits[i]);
  }
  final corpo = casas > 0 ? '${buf.toString()},$frac' : buf.toString();
  return neg ? '-$corpo' : corpo;
}

int _pow10(int n) {
  var r = 1;
  for (var i = 0; i < n; i++) {
    r *= 10;
  }
  return r;
}

String formatBrl(double v) => 'R\$ ${formatPtBrNumber(v)}';

String htmlEsc(String s) {
  return s
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;')
      .replaceAll('"', '&quot;')
      .replaceAll("'", '&#39;');
}

String formatDataBr(DateTime d) {
  final dd = d.day.toString().padLeft(2, '0');
  final mm = d.month.toString().padLeft(2, '0');
  return '$dd/$mm/${d.year}';
}

DateTime? parseDataBr(String raw) {
  final p = raw.trim().split(RegExp(r'[/\-.]'));
  if (p.length != 3) return null;
  final d = int.tryParse(p[0]);
  final m = int.tryParse(p[1]);
  final y = int.tryParse(p[2]);
  if (d == null || m == null || y == null) return null;
  if (y < 1000 || m < 1 || m > 12 || d < 1 || d > 31) return null;
  return DateTime(y, m, d);
}

String validadePadrao() => formatDataBr(DateTime.now().add(const Duration(days: 15)));

/// Folha HTML para o browser gravar PDF (sem pacote pdf).
String orcamentoToPrintHtml({
  required OrcamentoCadastro cadastro,
  required List<OrcamentoItem> itens,
  required DateTime data,
}) {
  final total = itens.fold<double>(0, (s, e) => s + e.total);
  final linhas = StringBuffer();
  if (itens.isEmpty) {
    linhas.writeln('<tr><td colspan="6" class="empty">Nenhuma abertura no orçamento.</td></tr>');
  } else {
    for (var i = 0; i < itens.length; i++) {
      final it = itens[i];
      final medidas = '${formatPtBrNumber(it.larguraMm, casas: 0)} x ${formatPtBrNumber(it.alturaMm, casas: 0)} mm';
      linhas.writeln('''
<tr>
  <td>${i + 1}</td>
  <td>${htmlEsc(it.nome)}<div class="sub">${htmlEsc(it.modelo)}${it.cor.isEmpty ? '' : ' · ${htmlEsc(it.cor)}'}</div></td>
  <td>$medidas</td>
  <td>${formatPtBrNumber(it.area, casas: 3)} m²</td>
  <td class="num">${formatBrl(it.valorVidro)}</td>
  <td class="num">${formatBrl(it.total)}</td>
</tr>''');
      if (it.vidroId.isNotEmpty) {
        linhas.writeln(
          '<tr class="obs"><td></td><td colspan="5">Vidro: ${htmlEsc(it.vidroNome)} · ${formatPtBrNumber(it.areaVidro, casas: 3)} m² (−5%)</td></tr>',
        );
      }
      if (it.obs.trim().isNotEmpty) {
        linhas.writeln(
          '<tr class="obs"><td></td><td colspan="5">Obs.: ${htmlEsc(it.obs)}</td></tr>',
        );
      }
    }
  }

  return '''
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Orçamento - ${htmlEsc(cadastro.empresaNome.isEmpty ? 'Esquadrias' : cadastro.empresaNome)}</title>
<style>
  @page { size: A4; margin: 14mm; }
  * { box-sizing: border-box; }
  body { margin: 0; background: #fff; color: #121212; font-family: "Segoe UI", Arial, sans-serif; font-size: 12px; }
  .sheet { max-width: 190mm; margin: 0 auto; padding: 8mm 6mm 14mm; }
  header { border-bottom: 2px solid #D4AF37; padding-bottom: 10px; margin-bottom: 14px; display: flex; justify-content: space-between; gap: 16px; }
  h1 { margin: 0 0 4px; font-size: 20px; letter-spacing: .04em; color: #121212; }
  .gold { color: #9A7B2F; }
  .meta { color: #3D3D3D; line-height: 1.45; }
  table { width: 100%; border-collapse: collapse; margin-top: 10px; }
  th { text-align: left; background: #121212; color: #F0F0F0; font-weight: 600; padding: 7px 6px; font-size: 11px; }
  td { border-bottom: 1px solid #C8C8C8; padding: 6px; vertical-align: top; }
  td.num { text-align: right; white-space: nowrap; font-weight: 600; }
  .sub { color: #555; font-size: 11px; margin-top: 2px; }
  .obs td { color: #444; font-size: 11px; border-bottom: 1px solid #E8E8E8; }
  .empty { text-align: center; color: #707070; padding: 18px; }
  .totais { margin-top: 14px; display: flex; justify-content: flex-end; }
  .totais div { border: 1px solid #D4AF37; background: #F7F7F7; padding: 10px 16px; min-width: 220px; }
  .totais strong { font-size: 16px; }
  footer.tool { margin-top: 28px; border-top: 1px solid #A8A8A8; padding-top: 8px; color: #555; font-size: 10px; text-align: center; }
  @media print { .noprint { display: none !important; } body { background: #fff; } }
</style>
</head>
<body>
<div class="sheet">
  <header>
    <div>
      <h1>${htmlEsc(cadastro.empresaNome.isEmpty ? 'ORÇAMENTO' : cadastro.empresaNome)}</h1>
      <div class="meta">
        ${cadastro.cnpj.isEmpty ? '' : 'CNPJ ${htmlEsc(cadastro.cnpj)}<br>'}
        ${cadastro.endereco.isEmpty ? '' : '${htmlEsc(cadastro.endereco)}<br>'}
        ${cadastro.telefone.isEmpty ? '' : 'Tel. ${htmlEsc(cadastro.telefone)} · '}
        ${htmlEsc(cadastro.email)}
      </div>
    </div>
    <div class="meta" style="text-align:right">
      <div class="gold">ORÇAMENTO DE ESQUADRIAS</div>
      <div>Data ${formatDataBr(data)}</div>
      ${cadastro.validadeAte.trim().isEmpty ? '' : 'Válido até ${htmlEsc(cadastro.validadeAte.trim())}<br>'}
      ${cadastro.fabricante.isEmpty ? '' : 'Fabricante: ${htmlEsc(cadastro.fabricante)}<br>'}
      ${cadastro.vendedor.isEmpty ? '' : 'Vendedor: ${htmlEsc(cadastro.vendedor)}<br>'}
      ${cadastro.instalador.isEmpty ? '' : 'Instalador: ${htmlEsc(cadastro.instalador)}<br>'}
      ${cadastro.cliente.isEmpty ? '' : 'Cliente: ${htmlEsc(cadastro.cliente)}'}
    </div>
  </header>
  <table>
    <thead>
      <tr>
        <th>#</th><th>Abertura</th><th>Medidas</th><th>m²</th><th>Vidro</th><th>Total</th>
      </tr>
    </thead>
    <tbody>
      ${linhas.toString()}
    </tbody>
  </table>
  <div class="totais"><div>Total do orçamento<br><strong>${formatBrl(total)}</strong></div></div>
  <footer class="tool">
    PerfectGestDev - Divisão ferramentas Digitais · © Todos os Direitos Reservados.<br>
    CNPJ 66.889.409/0001-19
  </footer>
</div>
</body>
</html>
''';
}
