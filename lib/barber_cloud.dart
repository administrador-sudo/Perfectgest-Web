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
  const BarberPro({
    required this.id,
    required this.name,
    this.phone = '',
    this.pixKey = '',
    this.pixReceiverName = '',
    this.pixCity = '',
  });
  final int id;
  final String name;
  final String phone;
  final String pixKey;
  final String pixReceiverName;
  final String pixCity;

  bool get hasPix => pixKey.trim().isNotEmpty;
}

class BarberLoyaltyPlan {
  const BarberLoyaltyPlan({
    required this.id,
    required this.professionalId,
    required this.name,
    required this.monthlyPrice,
    required this.discountPercent,
    required this.includeHair,
    required this.includeBeard,
    required this.includeMustache,
    required this.cutsPerMonth,
    required this.maxPerWeek,
    required this.allowedWeekdays,
    required this.rulesText,
  });

  final int id;
  final int professionalId;
  final String name;
  final double monthlyPrice;
  final double discountPercent;
  final bool includeHair;
  final bool includeBeard;
  final bool includeMustache;
  final int cutsPerMonth;
  final int maxPerWeek;
  final String allowedWeekdays;
  final String rulesText;

  String get inclusionsLabel {
    final parts = <String>[];
    if (includeHair) parts.add('Cabelo');
    if (includeBeard) parts.add('Barba');
    if (includeMustache) parts.add('Bigode');
    return parts.isEmpty ? 'Personalizado' : parts.join(' + ');
  }
}

class BarberServiceCard {
  const BarberServiceCard({
    required this.id,
    required this.professionalId,
    required this.name,
    required this.price,
    required this.durationMinutes,
    this.audience = 'unisex',
  });
  final int id;
  final int professionalId;
  final String name;
  final double price;
  final int durationMinutes;
  final String audience;

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

  final int id;
  final int professionalId;
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
      return BarberShopPresentation(
        name: (m['name'] as String?)?.trim().isNotEmpty == true
            ? m['name'] as String
            : 'Barbear e Cortar',
        promoText: m['promoText'] as String? ?? '',
        logoUrl: m['logoUrl'] as String? ?? '',
        bookingUrl: (m['bookingUrl'] as String?)?.trim().isNotEmpty == true
            ? m['bookingUrl'] as String
            : 'https://perfectgestdev.com/Barber_Hairdresser',
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
              id: _asInt(m['localId'], int.tryParse('${m['_docId']}') ?? 0),
              name: m['name'] as String? ?? 'Profissional',
              phone: m['phone'] as String? ?? '',
              pixKey: m['pixKey'] as String? ?? '',
              pixReceiverName: m['pixReceiverName'] as String? ?? '',
              pixCity: m['pixCity'] as String? ?? '',
            ),
          )
          .where((p) => p.id > 0)
          .toList();
    } catch (e) {
      lastError = 'Falha ao ler profissionais: $e';
      debugPrint(lastError);
      return const [];
    }
  }

  Future<List<BarberServiceCard>> listServices(int professionalId) async {
    await ensureInitialized();
    if (!ready) return const [];
    try {
      final rows = await _listCollection('services');
      lastError = null;
      return rows
          .where((m) => m['active'] != false)
          .where((m) => _asInt(m['professionalId']) == professionalId)
          .map(
            (m) => BarberServiceCard(
              id: _asInt(m['localId'], int.tryParse('${m['_docId']}') ?? 0),
              professionalId: _asInt(m['professionalId'], professionalId),
              name: m['name'] as String? ?? '',
              price: (m['price'] as num?)?.toDouble() ?? 0,
              durationMinutes: _asInt(m['durationMinutes'], 30),
              audience: m['audience'] as String? ?? 'unisex',
            ),
          )
          .where((s) => s.id > 0 && s.name.isNotEmpty)
          .toList();
    } catch (e) {
      lastError = 'Falha ao ler serviços: $e';
      debugPrint(lastError);
      return const [];
    }
  }

  /// Vitrine: só ativos com estoque > 0.
  Future<List<BarberProductCard>> listProducts({int? professionalId}) async {
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
                _asInt(m['professionalId']) == professionalId,
          )
          .map(
            (m) => BarberProductCard(
              id: _asInt(m['localId'], int.tryParse('${m['_docId']}') ?? 0),
              professionalId: _asInt(m['professionalId']),
              name: m['name'] as String? ?? '',
              description: m['description'] as String? ?? '',
              price: (m['price'] as num?)?.toDouble() ?? 0,
              category: m['category'] as String? ?? 'hair',
              stockQty: _asInt(m['stockQty']),
              imageUrl: m['imageUrl'] as String? ?? '',
            ),
          )
          .where((p) => p.id > 0 && p.name.isNotEmpty)
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

  Future<DaySchedule> daySchedule(int professionalId, DateTime day) async {
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

  Future<List<BusyInterval>> busyDay(int professionalId, DateTime day) async {
    await ensureInitialized();
    if (!ready) return const [];
    try {
      final rows = await _listCollection('appointments');
      final start = DateTime(day.year, day.month, day.day);
      final end = start.add(const Duration(days: 1));
      return rows
          .where((m) => _asInt(m['professionalId']) == professionalId)
          .where((m) => (m['status'] as String?) != 'cancelled')
          .where((m) {
            final s = m['startsAt'];
            if (s is! DateTime) return false;
            return !s.isBefore(start) && s.isBefore(end);
          })
          .map((m) {
            final s = m['startsAt'] as DateTime;
            final e = m['endsAt'] as DateTime? ??
                s.add(Duration(
                  minutes: SlotEngine.allocateMinutes(30),
                ));
            return BusyInterval(
              s.hour * 60 + s.minute,
              e.hour * 60 + e.minute,
              label: m['clientName'] as String?,
            );
          })
          .toList();
    } catch (e) {
      debugPrint('busyDay: $e');
      return const [];
    }
  }

  Future<List<TimeOfDaySlot>> slots({
    required int professionalId,
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

  Future<List<BarberLoyaltyPlan>> listLoyaltyPlans(int professionalId) async {
    await ensureInitialized();
    if (!ready) return const [];
    try {
      final rows = await _listCollection('loyaltyPlans');
      return rows
          .where((m) => m['active'] != false)
          .where((m) => _asInt(m['professionalId']) == professionalId)
          .map(
            (m) => BarberLoyaltyPlan(
              id: _asInt(m['localId'], int.tryParse('${m['_docId']}') ?? 0),
              professionalId: _asInt(m['professionalId'], professionalId),
              name: m['name'] as String? ?? 'Plano',
              monthlyPrice: (m['monthlyPrice'] as num?)?.toDouble() ?? 0,
              discountPercent: (m['discountPercent'] as num?)?.toDouble() ?? 0,
              includeHair: m['includeHair'] as bool? ?? true,
              includeBeard: m['includeBeard'] as bool? ?? false,
              includeMustache: m['includeMustache'] as bool? ?? false,
              cutsPerMonth: _asInt(m['cutsPerMonth'], 4),
              maxPerWeek: _asInt(m['maxPerWeek'], 1),
              allowedWeekdays: m['allowedWeekdays'] as String? ?? '1,2,3,4,5',
              rulesText: m['rulesText'] as String? ?? '',
            ),
          )
          .where((p) => p.id > 0)
          .toList();
    } catch (e) {
      debugPrint('listLoyaltyPlans: $e');
      return const [];
    }
  }

  Future<String> book({
    required int professionalId,
    required int serviceId,
    required String clientName,
    required String phone,
    required DateTime startsAt,
    required DateTime endsAt,
    String paymentStatus = 'pending_payment',
    String pixTxid = '',
    double amountDue = 0,
  }) async {
    await ensureInitialized();
    if (!ready) {
      throw StateError(lastError ?? 'Firestore indisponível');
    }
    final id =
        'site_${startsAt.millisecondsSinceEpoch}_${professionalId}_$serviceId';
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
        'paymentStatus': paymentStatus,
        'pixTxid': pixTxid,
        'amountDue': amountDue,
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
    return id;
  }

  Future<void> createLoyaltySubscriptionPending({
    required int planId,
    required int professionalId,
    required String clientName,
    required String phone,
    required double amountDue,
    required String txid,
  }) async {
    await ensureInitialized();
    if (!ready) throw StateError(lastError ?? 'Firestore indisponível');
    final id = 'loyalty_$txid';
    final start = DateTime.now();
    final end = DateTime(start.year, start.month + 1, start.day);
    final docUri = _uri(
      '$_shopPath/loyaltySubscriptions',
      query: {'documentId': id},
    );
    final body = {
      'fields': _encodeFields({
        'planId': planId,
        'professionalId': professionalId,
        'clientName': clientName,
        'phone': phone,
        'status': 'pending_payment',
        'cycleStart': start.toUtc(),
        'cycleEnd': end.toUtc(),
        'amountDue': amountDue,
        'txid': txid,
        'source': 'site',
      }),
    };
    final res = await http.post(
      docUri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if (res.statusCode != 200) {
      throw StateError('Plano falhou HTTP ${res.statusCode}: ${res.body}');
    }
  }

  Future<List<Map<String, dynamic>>> appointmentsByPhone(String phone) async {
    await ensureInitialized();
    if (!ready) return const [];
    final cleaned = phone.trim();
    if (cleaned.isEmpty) return const [];
    try {
      final rows = await _listCollection('appointments');
      final now = DateTime.now();
      return rows
          .where((m) => (m['phone'] as String? ?? '') == cleaned)
          .where((m) => (m['status'] as String?) != 'cancelled')
          .where((m) {
            final s = m['startsAt'];
            return s is DateTime && s.isAfter(now);
          })
          .toList()
        ..sort((a, b) {
          final sa = a['startsAt'] as DateTime;
          final sb = b['startsAt'] as DateTime;
          return sa.compareTo(sb);
        });
    } catch (e) {
      debugPrint('appointmentsByPhone: $e');
      return const [];
    }
  }

  Future<void> cancelAppointmentDoc(String docId) async {
    await ensureInitialized();
    if (!ready) throw StateError(lastError ?? 'Firestore indisponível');
    final uri = _uri('$_shopPath/appointments/$docId').replace(
      queryParameters: {
        ..._uri('$_shopPath/appointments/$docId').queryParameters,
        'updateMask.fieldPaths': 'status',
      },
    );
    final body = {
      'fields': _encodeFields({'status': 'cancelled'}),
    };
    final res = await http.patch(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if (res.statusCode != 200) {
      throw StateError('Cancelar falhou HTTP ${res.statusCode}');
    }
  }
}
