import 'package:flutter_test/flutter_test.dart';
import 'package:perfectpro_web/barber_pix_emv.dart';

void main() {
  test('BarberPixEmv payload', () {
    final p = BarberPixEmv.payload(
      chave: 'teste@email.com',
      nomeRecebedor: 'CORTE E BARBA',
      cidade: 'PORTO ALEGRE',
      valor: 30,
      txid: 'SITE1',
    );
    expect(p.contains('BR.GOV.BCB.PIX'), isTrue);
    expect(p.contains('30.00'), isTrue);
  });
}
