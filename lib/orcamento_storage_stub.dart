String? readOrcamentoJson() => null;

void writeOrcamentoJson(String json) {}

Future<({Map<String, double> precosM2, Map<String, double> precosVidro})?> fetchOrcamentoPrecos() async =>
    null;

Future<String?> saveOrcamentoPrecos({
  required String pin,
  required Map<String, double> precosM2,
  required Map<String, double> precosVidro,
}) async =>
    'unsupported';
