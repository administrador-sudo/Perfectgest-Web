import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'barber_firebase_options.dart';
import 'barber_slot_engine.dart';

const String kBarberShopId = 'perfectgest_dev';

/// Site usa REST do Firestore (sem plugin firebase_core) — evita
/// PlatformException pigeon channel-error no Flutter Web em producao.
class BarberShopPresentation {
  const BarberShopPresentation({
    this.name = 'Barbear e Cortar',
    this.promoText = '',
    this.logoUrl = '',
    this.bookingUrl = 'https://perfectgestdev.com/Barber_Hairdresser',
  });

  final String name;
  final String promoText;
  final String logoUrl;
  final String bookingUrl;
}

class BarberPro {
  const BarberPro({required this.id, required this.name});
  /// ID cloud (string). Docs antigos numéricos também vêm como string.
  final String id;
  final String name;
}

class BarberServiceCard {
  const BarberServiceCard({
    required this.id,
    required this.professionalId,
    required this.name,
    required this.price,
    required this.durationMinutes,
  });
  final String id;
  final String professionalId;
  final String name;
  final double price;
  final int durationMinutes;

  String get priceLabel =>
      'R\$ ${price.toStringAsFixed(2).replaceAll('.', ',')}';
}

class BarberProductCard {
  const BarberProductCard({
    required this.id,
    required this.professionalId,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.stockQty,
    this.imageUrl = '',
  });

  final String id;
  final String professionalId;
  final String name;
  final String description;
  final double price;
  final String category;
  final int stockQty;
  final String imageUrl;

  String get priceLabel =>
      'R\$ ${price.toStringAsFixed(2).replaceAll('.', ',')}';
}

class BarberCloud {
  BarberCloud._();
  static final BarberCloud instance = BarberCloud._();

  bool ready = false;
  String? lastError;

  static const _projectId = 'perfectgest-barber';
  static final _apiKey = DefaultFirebaseOptions.web.apiKey;
  static const _base =
      'https://firestore.googleapis.com/v1/projects/$_projectId/databases/(default)/documents';

  String get _shopPath => '$_base/shops/$kBarberShopId';

  Uri _uri(String path, {Map<String, String>? query}) {
    final q = <String, String>{'key': _apiKey, ...?query};
    return Uri.parse(path).replace(queryParameters: q);
  }

  Future<void> ensureInitialized() async {
    // REST nao precisa de plugin; marca ready apos ping leve do shop.
    if (ready) return;
    try {
      final res = await http.get(_uri(_shopPath)).timeout(
            const Duration(seconds: 12),
          );
      // 200 = existe; 404 = ainda sem doc (ok, app publica depois).
      if (res.statusCode == 200 || res.statusCode == 404) {
        ready = true;
        lastError = null;
      } else {
        ready = false;
        lastError =
            'Firestore HTTP ${res.statusCode}. Verifique regras/API key/CSP.';
      }
    } catch (e) {
      ready = false;
      lastError = 'Firestore REST falhou: $e';
      debugPrint(lastError);
    }
  }

  int _asInt(dynamic v, [int fallback = 0]) {
    if (v is int) return v;
    if (v is num) return v.toInt();
    return int.tryParse('$v') ?? fallback;
  }

  String _asId(dynamic v) => '$v'.trim();

  bool _sameId(dynamic a, String b) => _asId(a) == b;

  /// Converte fields REST → mapa Dart simples.
  Map<String, dynamic> _decodeFields(Map<String, dynamic>? fields) {
    if (fields == null) return {};
    final out = <String, dynamic>{};
    fields.forEach((k, v) {
      out[k] = _decodeValue(v as Map<String, dynamic>);
    });
    return out;
  }

  dynamic _decodeValue(Map<String, dynamic> v) {
    if (v.containsKey('stringValue')) return v['stringValue'];
    if (v.containsKey('integerValue')) {
      return int.tryParse('${v['integerValue']}') ?? 0;
    }
    if (v.containsKey('doubleValue')) {
      return (v['doubleValue'] as num).toDouble();
    }
    if (v.containsKey('booleanValue')) return v['booleanValue'] as bool;
    if (v.containsKey('timestampValue')) {
      return DateTime.tryParse(v['timestampValue'] as String);
    }
    if (v.containsKey('nullValue')) return null;
    if (v.containsKey('arrayValue')) {
      final values =
          (v['arrayValue'] as Map<String, dynamic>)['values'] as List? ?? [];
      return values
          .map((e) => _decodeValue(Map<String, dynamic>.from(e as Map)))
          .toList();
    }
    if (v.containsKey('mapValue')) {
      final f = (v['mapValue'] as Map<String, dynamic>)['fields']
          as Map<String, dynamic>?;
      return _decodeFields(f);
    }
    return null;
  }

  Map<String, dynamic> _encodeFields(Map<String, dynamic> data) {
    final fields = <String, dynamic>{};
    data.forEach((k, v) {
      fields[k] = _encodeValue(v);
    });
    return fields;
  }

  Map<String, dynamic> _encodeValue(dynamic v) {
    if (v == null) return {'nullValue': null};
    if (v is String) return {'stringValue': v};
    if (v is bool) return {'booleanValue': v};
    if (v is int) return {'integerValue': '$v'};
    if (v is double) return {'doubleValue': v};
    if (v is DateTime) {
      return {'timestampValue': v.toUtc().toIso8601String()};
    }
    if (v is List) {
      return {
        'arrayValue': {
          'values': v.map(_encodeValue).toList(),
        },
      };
    }
    if (v is Map) {
      return {
        'mapValue': {
          'fields': _encodeFields(Map<String, dynamic>.from(v)),
        },
      };
    }
    return {'stringValue': '$v'};
  }

  /// Aceita https de imagem ou data URI; rejeita a URL da página de agendar.
  static bool isUsableLogoUrl(String raw, {String bookingUrl = ''}) {
    final url = raw.trim();
    if (url.isEmpty) return false;
    if (url.startsWith('data:image/')) return true;
    final lower = url.toLowerCase();
    final booking = bookingUrl.trim().toLowerCase();
    if (booking.isNotEmpty && lower == booking) return false;
    if (lower.contains('/barber_hairdresser') &&
        !RegExp(r'\.(png|jpe?g|webp|gif|svg)(\?|$)').hasMatch(lower)) {
      return false;
    }
    return lower.startsWith('https://') || lower.startsWith('http://');
  }

  String _pickShopLogoUrl(Map<String, dynamic> m, String bookingUrl) {
    for (final key in ['logoUrl', 'imageUrl', 'logo']) {
      final v = (m[key] as String?)?.trim() ?? '';
      if (isUsableLogoUrl(v, bookingUrl: bookingUrl)) return v;
    }
    return '';
  }

  Future<BarberShopPresentation> fetchPresentation() async {
    await ensureInitialized();
    if (!ready) return const BarberShopPresentation();
    try {
      final res = await http.get(_uri(_shopPath));
      if (res.statusCode == 404) return const BarberShopPresentation();
      if (res.statusCode != 200) {
        lastError = 'Shop HTTP ${res.statusCode}';
        return const BarberShopPresentation();
      }
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      final m = _decodeFields(body['fields'] as Map<String, dynamic>?);
      final bookingUrl = (m['bookingUrl'] as String?)?.trim().isNotEmpty == true
          ? m['bookingUrl'] as String
          : 'https://perfectgestdev.com/Barber_Hairdresser';
      return BarberShopPresentation(
        name: (m['name'] as String?)?.trim().isNotEmpty == true
            ? m['name'] as String
            : 'Barbear e Cortar',
        promoText: m['promoText'] as String? ?? '',
        logoUrl: _pickShopLogoUrl(m, bookingUrl),
        bookingUrl: bookingUrl,
      );
    } catch (e) {
      lastError = 'fetchPresentation: $e';
      return const BarberShopPresentation();
    }
  }

  Future<List<Map<String, dynamic>>> _listCollection(String collection) async {
    final res = await http.get(_uri('$_shopPath/$collection'));
    if (res.statusCode == 404) return const [];
    if (res.statusCode != 200) {
      throw StateError('list $collection HTTP ${res.statusCode}: ${res.body}');
    }
    final body = jsonDecode(res.body) as Map<String, dynamic>;
    final docs = body['documents'] as List? ?? [];
    return docs.map((d) {
      final doc = Map<String, dynamic>.from(d as Map);
      final name = doc['name'] as String? ?? '';
      final id = name.split('/').last;
      final fields = _decodeFields(doc['fields'] as Map<String, dynamic>?);
      return {...fields, '_docId': id};
    }).toList();
  }

  Future<List<BarberPro>> listProfessionals() async {
    await ensureInitialized();
    if (!ready) return const [];
    try {
      final rows = await _listCollection('professionals');
      lastError = null;
      return rows
          .where((m) => m['active'] != false)
          .map(
            (m) => BarberPro(
              id: _asId(m['_docId']),
              name: m['name'] as String? ?? 'Profissional',
            ),
          )
          .where((p) => p.id.isNotEmpty)
          .toList();
    } catch (e) {
      lastError = 'Falha ao ler profissionais: $e';
      debugPrint(lastError);
      return const [];
    }
  }

  Future<List<BarberServiceCard>> listServices(String professionalId) async {
    await ensureInitialized();
    if (!ready) return const [];
    try {
      final rows = await _listCollection('services');
      lastError = null;
      return rows
          .where((m) => m['active'] != false)
          .where((m) => _sameId(m['professionalId'], professionalId))
          .map(
            (m) => BarberServiceCard(
              id: _asId(m['_docId']),
              professionalId: professionalId,
              name: m['name'] as String? ?? '',
              price: (m['price'] as num?)?.toDouble() ?? 0,
              durationMinutes: _asInt(m['durationMinutes'], 30),
            ),
          )
          .where((s) => s.id.isNotEmpty && s.name.isNotEmpty)
          .toList();
    } catch (e) {
      lastError = 'Falha ao ler serviços: $e';
      debugPrint(lastError);
      return const [];
    }
  }

  /// Vitrine pública: só `active != false` e `stockQty > 0` (sem cadastro no site).
  Future<List<BarberProductCard>> listProducts({String? professionalId}) async {
    await ensureInitialized();
    if (!ready) return const [];
    try {
      final rows = await _listCollection('products');
      return rows
          .where((m) => m['active'] != false)
          .where((m) => _asInt(m['stockQty']) > 0)
          .where(
            (m) =>
                professionalId == null ||
                _sameId(m['professionalId'], professionalId),
          )
          .map(
            (m) => BarberProductCard(
              id: _asId(
                (m['localId']?.toString().trim().isNotEmpty == true)
                    ? m['localId']
                    : m['_docId'],
              ),
              professionalId: _asId(m['professionalId']),
              name: m['name'] as String? ?? '',
              description: m['description'] as String? ?? '',
              price: (m['price'] as num?)?.toDouble() ?? 0,
              category: m['category'] as String? ?? 'hair',
              stockQty: _asInt(m['stockQty']),
              imageUrl: m['imageUrl'] as String? ?? '',
            ),
          )
          .where((p) => p.id.isNotEmpty && p.name.isNotEmpty)
          .toList();
    } catch (e) {
      debugPrint('listProducts: $e');
      return const [];
    }
  }

  Future<Map<String, dynamic>?> _getDoc(String relativePath) async {
    final res = await http.get(_uri('$_shopPath/$relativePath'));
    if (res.statusCode == 404) return null;
    if (res.statusCode != 200) {
      throw StateError('get $relativePath HTTP ${res.statusCode}');
    }
    final body = jsonDecode(res.body) as Map<String, dynamic>;
    return _decodeFields(body['fields'] as Map<String, dynamic>?);
  }

  Future<DaySchedule> daySchedule(String professionalId, DateTime day) async {
    await ensureInitialized();
    if (!ready) return _fallbackDay(day.weekday);
    try {
      final data =
          await _getDoc('professionals/$professionalId/meta/schedule');
      if (data == null) return _fallbackDay(day.weekday);
      final dateKey =
          '${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';
      final overrides = data['overrides'] as List? ?? [];
      for (final o in overrides) {
        final m = Map<String, dynamic>.from(o as Map);
        if (m['dateKey'] == dateKey) return _fromHoursMap(m);
      }
      final week = data['week'] as List? ?? [];
      for (final w in week) {
        final m = Map<String, dynamic>.from(w as Map);
        if (_asInt(m['weekday']) == day.weekday) return _fromHoursMap(m);
      }
      return const DaySchedule(workBlocks: []);
    } catch (e) {
      lastError = 'Falha ao ler horário: $e';
      return _fallbackDay(day.weekday);
    }
  }

  DaySchedule _fromHoursMap(Map<String, dynamic> m) {
    final enabled = m['enabled'] as bool? ?? true;
    if (!enabled) return const DaySchedule(workBlocks: []);
    final start = _asInt(m['startMinutes'], 9 * 60);
    final end = _asInt(m['endMinutes'], 18 * 60);
    final breaks = <MinuteRange>[];
    final ls = m['lunchStartMinutes'] == null
        ? null
        : _asInt(m['lunchStartMinutes']);
    final le =
        m['lunchEndMinutes'] == null ? null : _asInt(m['lunchEndMinutes']);
    if (ls != null && le != null && le > ls) {
      breaks.add(MinuteRange(ls, le));
    }
    final rs =
        m['restStartMinutes'] == null ? null : _asInt(m['restStartMinutes']);
    final re =
        m['restEndMinutes'] == null ? null : _asInt(m['restEndMinutes']);
    if (rs != null && re != null && re > rs) {
      breaks.add(MinuteRange(rs, re));
    }
    return DaySchedule(
      workBlocks: [MinuteRange(start, end)],
      breaks: breaks,
    );
  }

  DaySchedule _fallbackDay(int weekday) {
    if (weekday >= 1 && weekday <= 5) {
      return const DaySchedule(
        workBlocks: [MinuteRange(9 * 60, 18 * 60)],
        breaks: [MinuteRange(12 * 60, 13 * 60)],
      );
    }
    if (weekday == 6) {
      return const DaySchedule(workBlocks: [MinuteRange(9 * 60, 13 * 60)]);
    }
    return const DaySchedule(workBlocks: []);
  }

  Future<List<BusyInterval>> busyDay(String professionalId, DateTime day) async {
    await ensureInitialized();
    if (!ready) return const [];
    try {
      final rows = await _listCollection('appointments');
      final start = DateTime(day.year, day.month, day.day);
      final end = start.add(const Duration(days: 1));
      return rows
          .where((m) => _sameId(m['professionalId'], professionalId))
          .where((m) => (m['status'] as String?) != 'cancelled')
          .map((m) {
            final rawS = m['startsAt'];
            if (rawS is! DateTime) return null;
            final s = rawS.toLocal();
            final rawE = m['endsAt'];
            final e = (rawE is DateTime
                    ? rawE.toLocal()
                    : s.add(Duration(
                        minutes: SlotEngine.allocateMinutes(30),
                      )));
            if (s.isBefore(start) || !s.isBefore(end)) return null;
            return BusyInterval(
              s.hour * 60 + s.minute,
              e.hour * 60 + e.minute,
              label: m['clientName'] as String?,
            );
          })
          .whereType<BusyInterval>()
          .toList();
    } catch (e) {
      debugPrint('busyDay: $e');
      return const [];
    }
  }

  Future<List<TimeOfDaySlot>> slots({
    required String professionalId,
    required DateTime day,
    required int durationMinutes,
  }) async {
    final schedule = await daySchedule(professionalId, day);
    final busy = await busyDay(professionalId, day);
    final now = DateTime.now();
    final isToday =
        day.year == now.year && day.month == now.month && day.day == now.day;
    return const SlotEngine().availableSlots(
      day: schedule,
      durationMinutes: durationMinutes,
      busy: busy,
      nowMinutesIfToday: isToday ? now.hour * 60 + now.minute : null,
    );
  }

  Future<void> book({
    required String professionalId,
    required String serviceId,
    required String clientName,
    required String phone,
    required DateTime startsAt,
    required DateTime endsAt,
  }) async {
    await ensureInitialized();
    if (!ready) {
      throw StateError(lastError ?? 'Firestore indisponível');
    }
    final day = DateTime(startsAt.year, startsAt.month, startsAt.day);
    final busy = await busyDay(professionalId, day);
    final startMin = startsAt.hour * 60 + startsAt.minute;
    final endMin = endsAt.hour * 60 + endsAt.minute;
    for (final b in busy) {
      if (startMin < b.endMinutes && endMin > b.startMinutes) {
        throw StateError(
          'Horário acabou de ser ocupado. Escolha outro.',
        );
      }
    }
    final safePro = professionalId.replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '');
    final safeSvc = serviceId.replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '');
    final id =
        'site_${startsAt.millisecondsSinceEpoch}_${safePro}_$safeSvc';
    final docUri = _uri(
      '$_shopPath/appointments',
      query: {'documentId': id},
    );
    final body = {
      'fields': _encodeFields({
        'professionalId': professionalId,
        'serviceId': serviceId,
        'clientName': clientName,
        'phone': phone,
        'startsAt': startsAt.toUtc(),
        'endsAt': endsAt.toUtc(),
        'status': 'scheduled',
        'source': 'site',
      }),
    };
    final res = await http.post(
      docUri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if (res.statusCode != 200) {
      throw StateError('Agendar falhou HTTP ${res.statusCode}: ${res.body}');
    }
  }
}
