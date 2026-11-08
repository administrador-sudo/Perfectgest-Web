import 'package:flutter_test/flutter_test.dart';
import 'package:perfectpro_web/barber_booking_rules.dart';

void main() {
  test('regra 3h', () {
    final now = DateTime(2026, 11, 8, 10);
    expect(
      BarberBookingRules.canCancelOrReschedule(
        now.add(const Duration(hours: 3)),
        now: now,
      ),
      isTrue,
    );
    expect(
      BarberBookingRules.canCancelOrReschedule(
        now.add(const Duration(hours: 2, minutes: 59)),
        now: now,
      ),
      isFalse,
    );
  });
}
