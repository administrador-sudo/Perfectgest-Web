import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'barber_firebase_options.dart';
import 'barber_slot_engine.dart';
import 'site_public_urls.dart';

/// Compat: shop piloto. Preferir [kBarberDefaultShopId] / [BarberCloud.bindShop].
const String kBarberShopId = kBarberDefaultShopId;

/// Site usa REST do Firestore (sem plugin firebase_core) — evita
/// PlatformException pigeon channel-error no Flutter Web em producao.
class BarberShopPresentation {
  const BarberShopPresentation({
    this.name = 'Barbear e Cortar',
    this.promoText = '',
    this.logoUrl = '',
    this.bookingUrl = 'https://perfectgestdev.com/Barber_Hairdresser/perfectgest_dev',
    this.pixKey = '',
    this.whatsappPhone = '',
    this.pickupAddress = '',
    this.maxProductsOnSite = 12,
    this.active = true,
    this.billingStatus = 'unknown',
    this.shopId = kBarberDefaultShopId,
  });

  final String name;
  final String promoText;
  final String logoUrl;
  final String bookingUrl;
  final String pixKey;
  final String whatsappPhone;
  final String pickupAddress;
  /// 0 = sem limite; senão corta a vitrine após sort.
  final int maxProductsOnSite;
  /// Loja desactivada no Admin PerfectGest.
  final bool active;
  /// `active` | `grace` | `expired` | `none` | `unknown` (Play Billing).
  final String billingStatus;
  final String shopId;

  bool get billingAllowsBooking =>
      billingStatus == 'active' || billingStatus == 'grace';

  /// Banner / hard-gate: loja off ou assinatura none/expired.
  bool get showInactiveBanner => !active || !billingAllowsBooking;

  /// Site só agenda com loja activa + billing active/grace.
  bool get bookingAllowed => active && billingAllowsBooking;
}

class BarberPro {
  const BarberPro({
    required this.id,
    required this.name,
    this.phone = '',
    this.pixKey = '',
    this.pixKeyType = '',
    this.pixReceiverName = '',
    this.pixCity = '',
  });

  /// ID cloud (string). Docs antigos numéricos também vêm como string.
  final String id;
  final String name;
  final String phone;
  final String pixKey;
  final String pixKeyType;
  final String pixReceiverName;
  final String pixCity;

  bool get hasPix => pixKey.trim().isNotEmpty;
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

class BarberReviewCard {
  const BarberReviewCard({
    required this.id,
    required this.authorName,
    required this.rating,
    required this.text,
  });

  final String id;
  final String authorName;
  final int rating;
  final String text;
}

class BarberCloud {
  BarberCloud._();
  static final BarberCloud instance = BarberCloud._();

  bool ready = false;
  String? lastError;

  /// Shop activo na SPA (uma página de cada vez).
  static String _boundShopId = kBarberDefaultShopId;

  static String get boundShopId => _boundShopId;

  /// Liga REST a `shops/{shopId}`; invalida cache ready.
  static void bindShop(String shopId) {
    final id = shopId.trim();
    final next = isValidBarberShopId(id) ? id : kBarberDefaultShopId;
    if (next == _boundShopId && instance.ready) return;
    _boundShopId = next;
    instance.ready = false;
    instance.lastError = null;
  }

  static const _projectId = 'perfectgest-barber';
  static final _apiKey = DefaultFirebaseOptions.web.apiKey;
  static const _base =
      'https://firestore.googleapis.com/v1/projects/$_projectId/databases/(default)/documents';

  String get shopId => _boundShopId;

  String get _shopPath => '$_base/shops/$_boundShopId';

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
          : barberHairdresserPublicUrlFor(_boundShopId);
      final address = (m['address'] as String?)?.trim() ?? '';
      final pickup = (m['pickupAddress'] as String?)?.trim() ?? '';
      final maxN = _asInt(m['maxProductsOnSite'], 12);
      final status = (m['status'] as String?)?.trim().toLowerCase() ?? '';
      final activeFlag = m['active'];
      final active = activeFlag == false ||
              status == 'inactive' ||
              status == 'deactivated'
          ? false
          : true;
      final billing = m['billing'];
      String billingStatus = 'unknown';
      if (billing is Map) {
        billingStatus =
            '${billing['status'] ?? 'unknown'}'.trim().toLowerCase();
      } else if (m['subscriptionStatus'] is String) {
        billingStatus =
            (m['subscriptionStatus'] as String).trim().toLowerCase();
      }
      return BarberShopPresentation(
        name: (m['name'] as String?)?.trim().isNotEmpty == true
            ? m['name'] as String
            : 'Barbear e Cortar',
        promoText: m['promoText'] as String? ?? '',
        logoUrl: _pickShopLogoUrl(m, bookingUrl),
        bookingUrl: bookingUrl,
        pixKey: (m['pixKey'] as String?)?.trim() ?? '',
        whatsappPhone: (m['whatsappPhone'] as String?)
                ?.replaceAll(RegExp(r'\D'), '') ??
            '',
        pickupAddress: pickup.isNotEmpty ? pickup : address,
        maxProductsOnSite: maxN < 0 ? 12 : maxN,
        active: active,
        billingStatus: billingStatus.isEmpty ? 'unknown' : billingStatus,
        shopId: _boundShopId,
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
              phone: (m['phone'] as String?)?.trim() ?? '',
              pixKey: (m['pixKey'] as String?)?.trim() ?? '',
              pixKeyType: (m['pixKeyType'] as String?)?.trim() ?? '',
              pixReceiverName:
                  (m['pixReceiverName'] as String?)?.trim() ?? '',
              pixCity: (m['pixCity'] as String?)?.trim() ?? '',
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

  /// Vitrine: `showOnSite` (legado = active) + stock > 0; ordena e corta a N do shop.
  /// Dedupe por `localId` preferindo docs `prod_*` (ignora órfãos numéricos legados).
  Future<List<BarberProductCard>> listProducts({String? professionalId}) async {
    await ensureInitialized();
    if (!ready) return const [];
    try {
      final shop = await fetchPresentation();
      final maxN = shop.maxProductsOnSite;
      final rows = await _listCollection('products');
      final filtered = rows
          .where((m) => m['active'] != false)
          .where((m) => _asInt(m['stockQty']) > 0)
          .where((m) {
            // Legado sem showOnSite → aparece se active (já filtrado).
            if (!m.containsKey('showOnSite')) return true;
            return m['showOnSite'] == true;
          })
          .where(
            (m) =>
                professionalId == null ||
                _sameId(m['professionalId'], professionalId),
          )
          .toList();
      final byLocal = <String, Map<String, dynamic>>{};
      for (final m in filtered) {
        final docId = '${m['_docId'] ?? ''}';
        final localKey = (m['localId']?.toString().trim().isNotEmpty == true)
            ? '${m['localId']}'.trim()
            : docId;
        if (localKey.isEmpty) continue;
        final existing = byLocal[localKey];
        if (existing == null) {
          byLocal[localKey] = m;
          continue;
        }
        final existingDoc = '${existing['_docId'] ?? ''}';
        final preferNew =
            docId.startsWith('prod_') && !existingDoc.startsWith('prod_');
        if (preferNew) byLocal[localKey] = m;
      }
      final cards = byLocal.values
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
          .toList()
        ..sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
      if (maxN > 0 && cards.length > maxN) {
        return cards.take(maxN).toList();
      }
      return cards;
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
      // Custo: query do dia (pro+startsAt), NÃO listar appointments inteiro.
      final start = DateTime(day.year, day.month, day.day);
      final end = start.add(const Duration(days: 1));
      final rows = await _queryAppointmentsDay(
        professionalId: professionalId,
        rangeStart: start,
        rangeEnd: end,
      );
      return rows
          .where((m) {
            final st = (m['status'] as String?) ?? 'scheduled';
            return st == 'scheduled';
          })
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

  /// REST runQuery: `professionalId` + `startsAt` ∈ [start, end). Reads ≈ D do dia.
  Future<List<Map<String, dynamic>>> _queryAppointmentsDay({
    required String professionalId,
    required DateTime rangeStart,
    required DateTime rangeEnd,
  }) async {
    final uri = Uri.parse('$_shopPath:runQuery').replace(
      queryParameters: {'key': _apiKey},
    );
    final startIso = rangeStart.toUtc().toIso8601String();
    final endIso = rangeEnd.toUtc().toIso8601String();
    final res = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'structuredQuery': {
          'from': [
            {'collectionId': 'appointments'},
          ],
          'where': {
            'compositeFilter': {
              'op': 'AND',
              'filters': [
                {
                  'fieldFilter': {
                    'field': {'fieldPath': 'professionalId'},
                    'op': 'EQUAL',
                    'value': {'stringValue': professionalId},
                  },
                },
                {
                  'fieldFilter': {
                    'field': {'fieldPath': 'startsAt'},
                    'op': 'GREATER_THAN_OR_EQUAL',
                    'value': {'timestampValue': startIso},
                  },
                },
                {
                  'fieldFilter': {
                    'field': {'fieldPath': 'startsAt'},
                    'op': 'LESS_THAN',
                    'value': {'timestampValue': endIso},
                  },
                },
              ],
            },
          },
        },
      }),
    );
    if (res.statusCode != 200) {
      throw StateError(
        'queryAppointmentsDay HTTP ${res.statusCode}: ${res.body}',
      );
    }
    return _decodeRunQueryBody(res.body);
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

  static String phoneDigits(String phone) =>
      phone.replaceAll(RegExp(r'\D'), '');

  /// Site: cliente liberado a pagar em dinheiro (`shops/.../clients/{digits}`).
  Future<bool> clientAllowsCash(String phone) async {
    await ensureInitialized();
    if (!ready) return false;
    final digits = phoneDigits(phone);
    if (digits.isEmpty) return false;
    try {
      final data = await _getDoc('clients/$digits');
      if (data == null) return false;
      return data['allowCash'] == true;
    } catch (e) {
      debugPrint('clientAllowsCash: $e');
      return false;
    }
  }

  /// Grava agendamento; devolve o doc id. Pagamento: PIX ou na barbearia.
  /// [paymentMethod]: `pix` | `cash` (escolha do cliente no site).
  Future<String> book({
    required String professionalId,
    required String serviceId,
    required String clientName,
    required String phone,
    required DateTime startsAt,
    required DateTime endsAt,
    double amountDue = 0,
    String paymentStatus = 'pending_payment',
    String paymentMethod = '',
    String pixTxid = '',
    String receiptDataUri = '',
  }) async {
    await ensureInitialized();
    if (!ready) {
      throw StateError(lastError ?? 'Firestore indisponível');
    }
    // Mantém literal `pending_payment` no JS release (gate publish PS1).
    const pendingPayment = 'pending_payment';
    final status = paymentStatus.trim().isEmpty ? pendingPayment : paymentStatus;
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
    // Id estável pro+startsAt (UTC): create falha se o slot já existir (anti-race).
    final safePro = professionalId.replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '');
    final id =
        'slot_${safePro}_${startsAt.toUtc().millisecondsSinceEpoch}';
    final docUri = _uri(
      '$_shopPath/appointments',
      query: {'documentId': id},
    );
    final method = paymentMethod.trim().toLowerCase();
    final payload = <String, dynamic>{
      'professionalId': professionalId,
      'serviceId': serviceId,
      'clientName': clientName,
      'phone': phone,
      'startsAt': startsAt.toUtc(),
      'endsAt': endsAt.toUtc(),
      'status': 'scheduled',
      'source': 'site',
      'amountDue': amountDue,
      'paymentStatus': status,
      'pixTxid': pixTxid,
    };
    if (method == 'pix' || method == 'cash') {
      payload['paymentMethod'] = method;
    }
    if (receiptDataUri.trim().isNotEmpty) {
      payload['receiptDataUri'] = receiptDataUri.trim();
    }
    final body = {
      'fields': _encodeFields(payload),
    };
    final res = await http.post(
      docUri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if (res.statusCode == 409 ||
        res.body.contains('ALREADY_EXISTS') ||
        res.body.contains('already exists')) {
      throw StateError(
        'Horário acabou de ser ocupado. Escolha outro.',
      );
    }
    if (res.statusCode != 200) {
      throw StateError('Agendar falhou HTTP ${res.statusCode}: ${res.body}');
    }
    return id;
  }

  /// Anexa comprovante PIX ao appointment (após Confirmar + QR).
  Future<void> attachAppointmentReceipt({
    required String appointmentId,
    required String receiptDataUri,
  }) async {
    await ensureInitialized();
    if (!ready) {
      throw StateError(lastError ?? 'Firestore indisponível');
    }
    final safeId = appointmentId.trim();
    if (safeId.isEmpty) {
      throw StateError('Appointment inválido');
    }
    final uri = receiptDataUri.trim();
    if (uri.isEmpty) {
      throw StateError('Comprovante vazio');
    }
    final mask = [
      'updateMask.fieldPaths=receiptDataUri',
      'updateMask.fieldPaths=paymentStatus',
      'updateMask.fieldPaths=updatedAt',
    ].join('&');
    final patchUri = Uri.parse(
      '$_shopPath/appointments/$safeId?key=$_apiKey&$mask',
    );
    final res = await http.patch(
      patchUri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fields': _encodeFields({
          'receiptDataUri': uri,
          'paymentStatus': 'receipt_sent',
          'updatedAt': DateTime.now().toUtc(),
        }),
      }),
    );
    if (res.statusCode != 200) {
      throw StateError(
        'Comprovante falhou HTTP ${res.statusCode}: ${res.body}',
      );
    }
  }

  /// Avaliações publicadas via runQuery (GET collection falha 403 com pending).
  Future<List<BarberReviewCard>> listPublishedReviews() async {
    await ensureInitialized();
    if (!ready) return const [];
    try {
      final rows = await _runQuery(
        collectionId: 'reviews',
        fieldPath: 'status',
        equalTo: 'published',
      );
      final list = rows.map((m) {
        final n = (m['authorName'] as String?)?.trim() ?? '';
        return BarberReviewCard(
          id: _asId(m['_docId']),
          authorName: n.isEmpty ? 'Anónimo' : n,
          rating: _asInt(m['rating']),
          text: (m['text'] as String?)?.trim() ?? '',
        );
      }).where((r) => r.id.isNotEmpty && r.text.isNotEmpty).toList();
      return list;
    } catch (e) {
      debugPrint('listPublishedReviews: $e');
      return const [];
    }
  }

  /// Structured query no shop (anónimo OK quando rules exigem filtro).
  Future<List<Map<String, dynamic>>> _runQuery({
    required String collectionId,
    required String fieldPath,
    required String equalTo,
  }) async {
    final uri = Uri.parse('$_shopPath:runQuery').replace(
      queryParameters: {'key': _apiKey},
    );
    final res = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'structuredQuery': {
          'from': [
            {'collectionId': collectionId},
          ],
          'where': {
            'fieldFilter': {
              'field': {'fieldPath': fieldPath},
              'op': 'EQUAL',
              'value': {'stringValue': equalTo},
            },
          },
        },
      }),
    );
    if (res.statusCode != 200) {
      throw StateError(
        'runQuery $collectionId HTTP ${res.statusCode}: ${res.body}',
      );
    }
    return _decodeRunQueryBody(res.body);
  }

  List<Map<String, dynamic>> _decodeRunQueryBody(String body) {
    final decoded = jsonDecode(body);
    if (decoded is! List) return const [];
    final out = <Map<String, dynamic>>[];
    for (final row in decoded) {
      if (row is! Map) continue;
      final doc = row['document'];
      if (doc is! Map) continue;
      final name = doc['name'] as String? ?? '';
      final id = name.split('/').last;
      final fields = _decodeFields(
        (doc['fields'] as Map?)?.cast<String, dynamic>(),
      );
      out.add({...fields, '_docId': id});
    }
    return out;
  }

  /// Cliente envia avaliação → `status: pending` (moderação no app).
  /// Nome vazio → «Anónimo».
  Future<String> submitReview({
    required String authorName,
    required int rating,
    required String text,
  }) async {
    await ensureInitialized();
    if (!ready) {
      throw StateError(lastError ?? 'Firestore indisponível');
    }
    final rawName = authorName.trim();
    final name = rawName.isEmpty ? 'Anónimo' : rawName;
    final bodyText = text.trim();
    if (name.length > 80) {
      throw StateError('Nome demasiado longo');
    }
    if (rating < 1 || rating > 5) {
      throw StateError('Nota de 1 a 5');
    }
    if (bodyText.isEmpty) {
      throw StateError('Escreva a avaliação');
    }
    if (bodyText.length > 1000) {
      throw StateError('Texto demasiado longo');
    }
    final id = 'rev_${DateTime.now().millisecondsSinceEpoch}';
    final docUri = _uri(
      '$_shopPath/reviews',
      query: {'documentId': id},
    );
    final res = await http.post(
      docUri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fields': _encodeFields({
          'authorName': name,
          'rating': rating,
          'text': bodyText,
          'status': 'pending',
          'source': 'site',
          'createdAt': DateTime.now().toUtc(),
        }),
      }),
    );
    if (res.statusCode != 200) {
      throw StateError('Avaliação falhou HTTP ${res.statusCode}: ${res.body}');
    }
    return id;
  }

  /// Pedido da vitrine → `shops/{shopId}/orders/{orderId}`.
  Future<String> createOrder({
    required List<Map<String, dynamic>> items,
    required double total,
    required String paymentMethod,
    required String fulfillment,
    required String customerName,
    required String customerPhone,
    String deliveryAddress = '',
    String receiptUrl = '',
  }) async {
    await ensureInitialized();
    if (!ready) {
      throw StateError(lastError ?? 'Firestore indisponível');
    }
    if (paymentMethod != 'pix' && paymentMethod != 'cash') {
      throw StateError('Pagamento inválido');
    }
    if (paymentMethod == 'cash' && fulfillment != 'pickup') {
      throw StateError('Dinheiro só com retirada na loja');
    }
    if (fulfillment == 'delivery' && deliveryAddress.trim().isEmpty) {
      throw StateError('Informe o endereço de entrega');
    }
    if (paymentMethod == 'pix' && receiptUrl.trim().isEmpty) {
      throw StateError('Anexe o comprovante PIX');
    }
    final id = 'ord_${DateTime.now().millisecondsSinceEpoch}';
    final docUri = _uri(
      '$_shopPath/orders',
      query: {'documentId': id},
    );
    final payload = <String, dynamic>{
      'items': items,
      'total': total,
      'paymentMethod': paymentMethod,
      'fulfillment': fulfillment,
      'customerName': customerName.trim(),
      'customerPhone': customerPhone.trim(),
      'deliveryAddress':
          fulfillment == 'delivery' ? deliveryAddress.trim() : '',
      'receiptUrl': paymentMethod == 'pix' ? receiptUrl.trim() : '',
      'status': 'pending_review',
      'source': 'site',
      'createdAt': DateTime.now().toUtc(),
    };
    final res = await http.post(
      docUri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'fields': _encodeFields(payload)}),
    );
    if (res.statusCode != 200) {
      throw StateError('Pedido falhou HTTP ${res.statusCode}: ${res.body}');
    }
    return id;
  }
}
