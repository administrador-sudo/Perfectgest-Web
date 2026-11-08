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

  /// Blocos de atendimento (já sem almoço/descanso se preferir; ou brutos).
  final List<MinuteRange> workBlocks;
  final List<MinuteRange> breaks;

  bool get isOff => workBlocks.isEmpty;

  /// Janelas úteis = work menos breaks.
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

/// Agendamento existente (só precisa início/fim).
class BusyInterval {
  const BusyInterval(this.startMinutes, this.endMinutes);

  final int startMinutes;
  final int endMinutes;
}

class SlotEngine {
  const SlotEngine({this.stepMinutes = 15});

  final int stepMinutes;

  /// Gera horários de início disponíveis no dia.
  List<TimeOfDaySlot> availableSlots({
    required DaySchedule day,
    required int durationMinutes,
    required List<BusyInterval> busy,
    int? nowMinutesIfToday,
  }) {
    if (durationMinutes <= 0 || day.isOff) return const [];
    final slots = <TimeOfDaySlot>[];
    for (final window in day.usableWindows) {
      for (var start = window.startMinutes;
          start + durationMinutes <= window.endMinutes;
          start += stepMinutes) {
        final end = start + durationMinutes;
        if (nowMinutesIfToday != null && start < nowMinutesIfToday) {
          continue;
        }
        final conflict = busy.any(
          (b) => start < b.endMinutes && end > b.startMinutes,
        );
        if (conflict) continue;
        slots.add(TimeOfDaySlot(startMinutes: start, endMinutes: end));
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
  });

  final int startMinutes;
  final int endMinutes;

  String get label => SlotEngine.formatMinutes(startMinutes);

  String get rangeLabel =>
      '${SlotEngine.formatMinutes(startMinutes)}–${SlotEngine.formatMinutes(endMinutes)}';
}
