import 'orcamento_models.dart';

String? readOrcamentoJson() => null;

void writeOrcamentoJson(String json) {}

String? readOrcamentoSessaoToken() => null;

String? readOrcamentoSessaoPapel() => null;

void writeOrcamentoSessao({required String token, required String papel}) {}

void clearOrcamentoSessao() {}

String? readOrcamentoDocumentoId() => null;

void writeOrcamentoDocumentoId(String? id) {}

Future<({String? token, String? papel, String? err})> loginOrcamentoSessao(String pin) async =>
    (token: null, papel: null, err: 'unsupported');

Future<
    ({
      Map<String, double> precosM2,
      Map<String, double> precosVidro,
      double fatiaMaterial,
      double fatiaMaoObra,
      String? err,
    })> fetchOrcamentoPrecos() async =>
    (
      precosM2: <String, double>{},
      precosVidro: <String, double>{},
      fatiaMaterial: 60.0,
      fatiaMaoObra: 40.0,
      err: null,
    );

Future<String?> saveOrcamentoPrecos({
  required Map<String, double> precosM2,
  required Map<String, double> precosVidro,
  double fatiaMaterial = 60,
  double fatiaMaoObra = 40,
}) async =>
    'unsupported';

Future<({List<({String id, DateTime createdAt})> historico, String? err})> fetchOrcamentoPrecosHistorico() async =>
    (historico: <({String id, DateTime createdAt})>[], err: null);

Future<({Map<String, double> precosM2, Map<String, double> precosVidro, double fatiaMaterial, double fatiaMaoObra})?>
    restoreOrcamentoPrecosHistoricoData({required String id}) async =>
    null;

Future<String?> deleteOrcamentoPrecosHistorico({required String id}) async => 'unsupported';

Future<({String? id, String? err})> upsertOrcamentoDocumento({
  String? id,
  required Map<String, dynamic> payload,
}) async =>
    (id: null, err: 'unsupported');

Future<({OrcamentoSnapshot? snap, String? err})> fetchOrcamentoDocumento(String id) async =>
    (snap: null, err: 'unsupported');

Future<List<OrcamentoRegistroResumo>?> fetchOrcamentoRegistros() async => const [];

Future<String?> deleteOrcamentoRegistro({required String id}) async => 'unsupported';
