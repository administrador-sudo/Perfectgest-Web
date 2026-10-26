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
