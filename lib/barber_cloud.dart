import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'barber_firebase_options.dart';
import 'barber_slot_engine.dart';

const String kBarberShopId = 'perfectgest_dev';

class BarberPro {
  const BarberPro({required this.id, required this.name});
  final int id;
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
  final int id;
  final int professionalId;
  final String name;
  final double price;
  final int durationMinutes;

  String get priceLabel =>
      'R\$ ${price.toStringAsFixed(2).replaceAll('.', ',')}';
}

class BarberCloud {
  BarberCloud._();
  static final BarberCloud instance = BarberCloud._();

  bool ready = false;

  Future<void> ensureInitialized() async {
    if (ready) return;
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }
      ready = true;
    } catch (e, st) {
      debugPrint('BarberCloud init: $e\n$st');
      ready = false;
    }
  }

  DocumentReference<Map<String, dynamic>> get _shop =>
      FirebaseFirestore.instance.collection('shops').doc(kBarberShopId);

  Future<List<BarberPro>> listProfessionals() async {
    await ensureInitialized();
    if (!ready) return const [];
    final snap = await _shop.collection('professionals').get();
    return snap.docs.map((d) {
      final m = d.data();
      return BarberPro(
        id: m['localId'] as int? ?? int.tryParse(d.id) ?? 0,
        name: m['name'] as String? ?? 'Profissional',
      );
    }).toList();
  }

  Future<List<BarberServiceCard>> listServices(int professionalId) async {
    await ensureInitialized();
    if (!ready) return const [];
    final snap = await _shop
        .collection('services')
        .where('professionalId', isEqualTo: professionalId)
        .get();
    return snap.docs.map((d) {
      final m = d.data();
      return BarberServiceCard(
        id: m['localId'] as int? ?? int.tryParse(d.id) ?? 0,
        professionalId: m['professionalId'] as int? ?? professionalId,
        name: m['name'] as String? ?? '',
        price: (m['price'] as num?)?.toDouble() ?? 0,
        durationMinutes: m['durationMinutes'] as int? ?? 30,
      );
    }).toList();
  }

  Future<DaySchedule> daySchedule(int professionalId, DateTime day) async {
    await ensureInitialized();
    if (!ready) {
      return _fallbackDay(day.weekday);
    }
    final doc = await _shop
        .collection('professionals')
        .doc('$professionalId')
        .collection('meta')
        .doc('schedule')
        .get();
    if (!doc.exists) return _fallbackDay(day.weekday);
    final data = doc.data()!;
    final dateKey =
        '${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';
    final overrides = data['overrides'] as List<dynamic>? ?? [];
    for (final o in overrides) {
      final m = Map<String, dynamic>.from(o as Map);
      if (m['dateKey'] == dateKey) {
        return _fromHoursMap(m);
      }
    }
    final week = data['week'] as List<dynamic>? ?? [];
    for (final w in week) {
      final m = Map<String, dynamic>.from(w as Map);
      if (m['weekday'] == day.weekday) {
        return _fromHoursMap(m);
      }
    }
    return const DaySchedule(workBlocks: []);
  }

  DaySchedule _fromHoursMap(Map<String, dynamic> m) {
    final enabled = m['enabled'] as bool? ?? true;
    if (!enabled) return const DaySchedule(workBlocks: []);
    final start = m['startMinutes'] as int? ?? 9 * 60;
    final end = m['endMinutes'] as int? ?? 18 * 60;
    final breaks = <MinuteRange>[];
    final ls = m['lunchStartMinutes'] as int?;
    final le = m['lunchEndMinutes'] as int?;
    if (ls != null && le != null && le > ls) {
      breaks.add(MinuteRange(ls, le));
    }
    final rs = m['restStartMinutes'] as int?;
    final re = m['restEndMinutes'] as int?;
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
    final start = DateTime(day.year, day.month, day.day);
    final end = start.add(const Duration(days: 1));
    final snap = await _shop
        .collection('appointments')
        .where('professionalId', isEqualTo: professionalId)
        .where('startsAt', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('startsAt', isLessThan: Timestamp.fromDate(end))
        .get();
    return snap.docs
        .where((d) => (d.data()['status'] as String?) != 'cancelled')
        .map((d) {
          final data = d.data();
          final s = (data['startsAt'] as Timestamp).toDate();
          final e = (data['endsAt'] as Timestamp).toDate();
          return BusyInterval(
            s.hour * 60 + s.minute,
            e.hour * 60 + e.minute,
          );
        })
        .toList();
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

  Future<void> book({
    required int professionalId,
    required int serviceId,
    required String clientName,
    required String phone,
    required DateTime startsAt,
    required DateTime endsAt,
  }) async {
    await ensureInitialized();
    if (!ready) {
      throw StateError('Firebase indisponível');
    }
    final id =
        'site_${startsAt.millisecondsSinceEpoch}_${professionalId}_$serviceId';
    await _shop.collection('appointments').doc(id).set({
      'professionalId': professionalId,
      'serviceId': serviceId,
      'clientName': clientName,
      'phone': phone,
      'startsAt': Timestamp.fromDate(startsAt),
      'endsAt': Timestamp.fromDate(endsAt),
      'status': 'scheduled',
      'source': 'site',
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}
