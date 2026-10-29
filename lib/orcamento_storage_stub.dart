import 'orcamento_models.dart';

String? readOrcamentoJson() => null;

void writeOrcamentoJson(String json) {}

Future<
    ({
      Map<String, double> precosM2,
      Map<String, double> precosVidro,
      double fatiaMaterial,
      double fatiaMaoObra,
    })?> fetchOrcamentoPrecos() async =>
    null;

Future<String?> saveOrcamentoPrecos({
  required String pin,
  required Map<String, double> precosM2,
  required Map<String, double> precosVidro,
  double fatiaMaterial = 60,
  double fatiaMaoObra = 40,
}) async =>
    'unsupported';

Future<({List<({String id, DateTime createdAt})> historico, String? err})> fetchOrcamentoPrecosHistorico(
  String pin,
) async =>
    (historico: <({String id, DateTime createdAt})>[], err: null);

Future<({Map<String, double> precosM2, Map<String, double> precosVidro, double fatiaMaterial, double fatiaMaoObra})?> restoreOrcamentoPrecosHistoricoData({
  required String pin,
  required String id,
}) async =>
    null;

Future<String?> deleteOrcamentoPrecosHistorico({
  required String pin,
  required String id,
}) async =>
    'unsupported';

Future<String?> postOrcamentoRegistro(Map<String, dynamic> payload) async => 'unsupported';

Future<List<OrcamentoRegistroResumo>?> fetchOrcamentoRegistros(String pin) async => const [];

Future<String?> deleteOrcamentoRegistro({
  required String pin,
  required String id,
}) async =>
    'unsupported';
