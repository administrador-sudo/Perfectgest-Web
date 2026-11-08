/// Motor puro de slots — app e site usam a mesma regra.
library;

/// Intervalo [start, end) em minutos desde meia-noite (0..1440).
class MinuteRange {
  const MinuteRange(this.startMinutes, this.endMinutes);

  final int startMinutes;
  final int endMinutes;

  bool containsRange(int start, int end) =>
      start >= startMinutes && end <= endMinutes;

  bool overlaps(int start, int end) =>
      start < endMinutes && end > startMinutes;
}

/// Agenda de um dia (após resolver template + override).
class DaySchedule {
  const DaySchedule({
    required this.workBlocks,
    this.breaks = const [],
  });

  final List<MinuteRange> workBlocks;
  final List<MinuteRange> breaks;

  bool get isOff => workBlocks.isEmpty;

  List<MinuteRange> get usableWindows {
    if (workBlocks.isEmpty) return const [];
    var windows = List<MinuteRange>.from(workBlocks);
    for (final b in breaks) {
      windows = _subtractBreak(windows, b);
    }
    return windows.where((w) => w.endMinutes > w.startMinutes).toList();
  }

  static List<MinuteRange> _subtractBreak(
    List<MinuteRange> windows,
    MinuteRange br,
  ) {
    final out = <MinuteRange>[];
    for (final w in windows) {
      if (!w.overlaps(br.startMinutes, br.endMinutes)) {
        out.add(w);
        continue;
      }
      if (br.startMinutes > w.startMinutes) {
        out.add(MinuteRange(w.startMinutes, br.startMinutes));
      }
      if (br.endMinutes < w.endMinutes) {
        out.add(MinuteRange(br.endMinutes, w.endMinutes));
      }
    }
    return out;
  }
}

/// Agendamento existente (início/fim + nome opcional do cliente).
class BusyInterval {
  const BusyInterval(
    this.startMinutes,
    this.endMinutes, {
    this.label,
  });

  final int startMinutes;
  final int endMinutes;
  final String? label;
}

class SlotEngine {
  const SlotEngine({this.stepMinutes = 30});

  final int stepMinutes;

  /// Duração efetiva na grade: blocos de 30 min (mín. 30).
  static int allocateMinutes(int serviceMinutes) {
    if (serviceMinutes <= 0) return 30;
    final blocks = (serviceMinutes + 29) ~/ 30;
    return (blocks < 1 ? 1 : blocks) * 30;
  }

  static String? firstName(String? fullName) {
    final t = fullName?.trim() ?? '';
    if (t.isEmpty) return null;
    return t.split(RegExp(r'\s+')).first;
  }

  /// Candidatos do dia: livres e ocupados (available=false + bookedBy).
  List<TimeOfDaySlot> availableSlots({
    required DaySchedule day,
    required int durationMinutes,
    required List<BusyInterval> busy,
    int? nowMinutesIfToday,
  }) {
    final duration = allocateMinutes(durationMinutes);
    if (duration <= 0 || day.isOff) return const [];
    final slots = <TimeOfDaySlot>[];
    for (final window in day.usableWindows) {
      for (var start = window.startMinutes;
          start + duration <= window.endMinutes;
          start += stepMinutes) {
        final end = start + duration;
        final past =
            nowMinutesIfToday != null && start < nowMinutesIfToday;
        BusyInterval? hit;
        for (final b in busy) {
          if (start < b.endMinutes && end > b.startMinutes) {
            hit = b;
            break;
          }
        }
        final available = !past && hit == null;
        slots.add(
          TimeOfDaySlot(
            startMinutes: start,
            endMinutes: end,
            available: available,
            bookedBy: hit == null ? null : firstName(hit.label),
          ),
        );
      }
    }
    return slots;
  }

  static int timeToMinutes(int hour, int minute) => hour * 60 + minute;

  static String formatMinutes(int minutes) {
    final h = minutes ~/ 60;
    final m = minutes % 60;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
  }
}

class TimeOfDaySlot {
  const TimeOfDaySlot({
    required this.startMinutes,
    required this.endMinutes,
    this.available = true,
    this.bookedBy,
  });

  final int startMinutes;
  final int endMinutes;
  final bool available;
  final String? bookedBy;

  String get label => SlotEngine.formatMinutes(startMinutes);

  String get rangeLabel =>
      '${SlotEngine.formatMinutes(startMinutes)}–${SlotEngine.formatMinutes(endMinutes)}';
}
