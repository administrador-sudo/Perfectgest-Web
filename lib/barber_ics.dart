import 'barber_ics_download_stub.dart'
    if (dart.library.html) 'barber_ics_download_web.dart' as ics_dl;

/// Gera VEVENT mínimo (UID, DTSTART/DTEND, SUMMARY) e dispara download.
String buildBarberIcs({
  required String uid,
  required DateTime startsAt,
  required DateTime endsAt,
  required String summary,
  String description = '',
  String location = '',
}) {
  String stamp(DateTime d) {
    final u = d.toUtc();
    String tw(int n) => n.toString().padLeft(2, '0');
    return '${u.year}${tw(u.month)}${tw(u.day)}T'
        '${tw(u.hour)}${tw(u.minute)}${tw(u.second)}Z';
  }

  String escape(String raw) => raw
      .replaceAll('\\', '\\\\')
      .replaceAll(';', '\\;')
      .replaceAll(',', '\\,')
      .replaceAll('\n', '\\n');

  final buf = StringBuffer()
    ..writeln('BEGIN:VCALENDAR')
    ..writeln('VERSION:2.0')
    ..writeln('PRODID:-//PerfectGest Dev//Barber Hairdresser//PT')
    ..writeln('CALSCALE:GREGORIAN')
    ..writeln('METHOD:PUBLISH')
    ..writeln('BEGIN:VEVENT')
    ..writeln('UID:${escape(uid)}')
    ..writeln('DTSTAMP:${stamp(DateTime.now())}')
    ..writeln('DTSTART:${stamp(startsAt)}')
    ..writeln('DTEND:${stamp(endsAt)}')
    ..writeln('SUMMARY:${escape(summary)}');
  if (description.trim().isNotEmpty) {
    buf.writeln('DESCRIPTION:${escape(description.trim())}');
  }
  if (location.trim().isNotEmpty) {
    buf.writeln('LOCATION:${escape(location.trim())}');
  }
  buf
    ..writeln('END:VEVENT')
    ..writeln('END:VCALENDAR');
  return buf.toString().replaceAll('\n', '\r\n');
}

void downloadBarberAppointmentIcs({
  required String uid,
  required DateTime startsAt,
  required DateTime endsAt,
  required String summary,
  String description = '',
  String location = '',
  String filename = 'agendamento.ics',
}) {
  final body = buildBarberIcs(
    uid: uid,
    startsAt: startsAt,
    endsAt: endsAt,
    summary: summary,
    description: description,
    location: location,
  );
  ics_dl.downloadBarberIcs(body, filename);
}
