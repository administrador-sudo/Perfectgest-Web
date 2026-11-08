import 'package:flutter_test/flutter_test.dart';
import 'package:perfectpro_web/barber_slot_engine.dart';

void main() {
  test('site: 13:30 sem manhã livre', () {
    const day = DaySchedule(
      workBlocks: [MinuteRange(13 * 60 + 30, 19 * 60)],
    );
    final slots = const SlotEngine().availableSlots(
      day: day,
      durationMinutes: 40,
      busy: const [],
    );
    expect(slots.every((s) => s.startMinutes >= 13 * 60 + 30), isTrue);
  });
}
