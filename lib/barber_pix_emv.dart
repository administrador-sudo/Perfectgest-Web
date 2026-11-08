/// PIX copia-e-cola (EMV BR Code) estático para Barber. Sem PSP.
class BarberPixEmv {
  static String payload({
    required String chave,
    required String nomeRecebedor,
    required String cidade,
    required double valor,
    required String txid,
  }) {
    final key = chave.trim();
    if (key.isEmpty) {
      throw ArgumentError('Chave PIX vazia');
    }
    final amount = valor.toStringAsFixed(2);
    final id = _txid(txid);
    final nome = _fit(nomeRecebedor.toUpperCase(), 25);
    final city = _fit(cidade.toUpperCase(), 15);
    final mai = _tlv(
      '26',
      '${_tlv('00', 'BR.GOV.BCB.PIX')}${_tlv('01', key)}',
    );
    final add = _tlv('62', _tlv('05', id));
    final body = '000201'
        '$mai'
        '52040000'
        '5303986'
        '${_tlv('54', amount)}'
        '5802BR'
        '${_tlv('59', nome)}'
        '${_tlv('60', city)}'
        '$add'
        '6304';
    final crc = _crc16(body).toRadixString(16).toUpperCase().padLeft(4, '0');
    return '$body$crc';
  }

  static String _txid(String raw) {
    final s = raw.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toUpperCase();
    if (s.isEmpty) return 'BARBER';
    return s.length <= 25 ? s : s.substring(0, 25);
  }

  static String _fit(String s, int max) {
    final t = s.trim().isEmpty ? 'RECEBEDOR' : s.trim();
    return t.length <= max ? t : t.substring(0, max);
  }

  static String _tlv(String id, String value) {
    final len = value.length.toString().padLeft(2, '0');
    return '$id$len$value';
  }

  static int _crc16(String input) {
    var crc = 0xFFFF;
    for (final b in input.codeUnits) {
      crc ^= b << 8;
      for (var i = 0; i < 8; i++) {
        if ((crc & 0x8000) != 0) {
          crc = ((crc << 1) ^ 0x1021) & 0xFFFF;
        } else {
          crc = (crc << 1) & 0xFFFF;
        }
      }
    }
    return crc;
  }
}
