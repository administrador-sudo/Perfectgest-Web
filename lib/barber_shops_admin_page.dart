import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'barber_firebase_options.dart';
import 'site_public_urls.dart';

/// Admin PerfectGest: criar / listar / desactivar lojas Barber (multi-loja).
/// Login = conta dona do shop piloto ([kBarberDefaultShopId]).
class BarberShopsAdminPage extends StatefulWidget {
  const BarberShopsAdminPage({super.key});

  @override
  State<BarberShopsAdminPage> createState() => _BarberShopsAdminPageState();
}

class _BarberShopsAdminPageState extends State<BarberShopsAdminPage> {
  static const _olive = Color(0xFF556B2F);
  static const _bg = Color(0xFF121212);
  static const _surface = Color(0xFF2A2A2A);
  static const _text = Color(0xFFFFFFFF);
  static const _muted = Color(0xFFD0D0D0);

  static final _apiKey = DefaultFirebaseOptions.web.apiKey;
  static const _projectId = 'perfectgest-barber';
  static const _base =
      'https://firestore.googleapis.com/v1/projects/$_projectId/databases/(default)/documents';

  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _shopId = TextEditingController();
  final _shopName = TextEditingController();
  final _adminEmail = TextEditingController();

  String? _idToken;
  String? _uid;
  String? _msg;
  String? _error;
  bool _busy = false;
  List<_ShopRow> _shops = [];

  bool get _loggedIn =>
      (_idToken?.isNotEmpty ?? false) && (_uid?.isNotEmpty ?? false);

  Map<String, String> get _authHeaders => {
        'Authorization': 'Bearer $_idToken',
        'Content-Type': 'application/json',
      };

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    _shopId.dispose();
    _shopName.dispose();
    _adminEmail.dispose();
    super.dispose();
  }

  Uri _uri(String path, {Map<String, String>? query}) {
    final q = <String, String>{'key': _apiKey, ...?query};
    return Uri.parse(path).replace(queryParameters: q);
  }

  Future<void> _login() async {
    setState(() {
      _busy = true;
      _error = null;
      _msg = null;
    });
    try {
      final email = _email.text.trim().toLowerCase();
      final res = await http.post(
        Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_apiKey',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': _pass.text,
          'returnSecureToken': true,
        }),
      );
      if (res.statusCode != 200) {
        throw StateError('Login falhou. Use a conta dona do shop piloto.');
      }
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      _idToken = body['idToken'] as String?;
      _uid = body['localId'] as String?;
      if (!_loggedIn) throw StateError('Login incompleto.');

      final pilot = await http.get(
        _uri('$_base/shops/$kBarberDefaultShopId'),
        headers: _authHeaders,
      );
      if (pilot.statusCode != 200) {
        throw StateError('Shop piloto inacessível.');
      }
      final fields =
          (jsonDecode(pilot.body) as Map)['fields'] as Map<String, dynamic>?;
      final adminUid =
          (fields?['adminUid'] as Map?)?['stringValue'] as String? ?? '';
      if (adminUid.isEmpty || adminUid != _uid) {
        _idToken = null;
        _uid = null;
        throw StateError(
          'Só o dono do shop piloto ($kBarberDefaultShopId) gere lojas.',
        );
      }
      await _loadShops();
      setState(() => _msg = 'Operador autenticado. Lojas carregadas.');
    } catch (e) {
      setState(() => _error = '$e'
          .replaceFirst('Bad state: ', '')
          .replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _loadShops() async {
    final res = await http.get(_uri('$_base/shops'));
    if (res.statusCode != 200) {
      _shops = [];
      return;
    }
    final body = jsonDecode(res.body) as Map<String, dynamic>;
    final docs = body['documents'] as List? ?? [];
    final rows = <_ShopRow>[];
    for (final d in docs) {
      final doc = Map<String, dynamic>.from(d as Map);
      final namePath = doc['name'] as String? ?? '';
      final id = namePath.split('/').last;
      final fields = doc['fields'] as Map<String, dynamic>? ?? {};
      String str(String k) =>
          (fields[k] as Map?)?['stringValue'] as String? ?? '';
      bool? boolOrNull(String k) {
        final m = fields[k] as Map?;
        if (m == null) return null;
        if (m.containsKey('booleanValue')) return m['booleanValue'] as bool?;
        return null;
      }

      final status = str('status').toLowerCase();
      final activeFlag = boolOrNull('active');
      final active = !(activeFlag == false ||
          status == 'inactive' ||
          status == 'deactivated');
      String billing = 'unknown';
      final billingMap = fields['billing'] as Map?;
      if (billingMap != null && billingMap['mapValue'] is Map) {
        final bf = (billingMap['mapValue'] as Map)['fields'] as Map? ?? {};
        billing = (bf['status'] as Map?)?['stringValue'] as String? ?? 'unknown';
      } else if (str('subscriptionStatus').isNotEmpty) {
        billing = str('subscriptionStatus');
      }
      rows.add(_ShopRow(
        shopId: id,
        name: str('name').isEmpty ? id : str('name'),
        adminEmail: str('adminEmail'),
        adminUid: str('adminUid'),
        active: active,
        billingStatus: billing.toLowerCase(),
      ));
    }
    rows.sort((a, b) => a.shopId.compareTo(b.shopId));
    if (mounted) setState(() => _shops = rows);
  }

  Future<void> _createShop() async {
    setState(() {
      _busy = true;
      _error = null;
      _msg = null;
    });
    try {
      final id = _shopId.text.trim().toLowerCase();
      if (!isValidBarberShopId(id)) {
        throw StateError(
          'shopId inválido. Use [a-z0-9_-] entre 3 e 48 caracteres.',
        );
      }
      if (id == 'admin' || id == 'new' || id == 'barber_shops_admin') {
        throw StateError('shopId reservado.');
      }
      final name = _shopName.text.trim();
      if (name.isEmpty) throw StateError('Informe o nome da loja.');
      final adminEmail = _adminEmail.text.trim().toLowerCase();
      if (adminEmail.isEmpty || !adminEmail.contains('@')) {
        throw StateError('Informe o email do dono (pending).');
      }

      final exists = await http.get(_uri('$_base/shops/$id'));
      if (exists.statusCode == 200) {
        throw StateError('shopId já existe: $id');
      }

      final booking = barberHairdresserPublicUrlFor(id);
      final patch = await http.patch(
        _uri('$_base/shops/$id'),
        headers: _authHeaders,
        body: jsonEncode({
          'fields': {
            'name': {'stringValue': name},
            'adminEmail': {'stringValue': adminEmail},
            'adminUid': {'stringValue': ''},
            'bookingUrl': {'stringValue': booking},
            'status': {'stringValue': 'provisioned'},
            'active': {'booleanValue': true},
            'provisionedAt': {
              'timestampValue': DateTime.now().toUtc().toIso8601String(),
            },
            'defaultPassword': {'stringValue': 'Barber@Mudar1'},
            'billing': {
              'mapValue': {
                'fields': {
                  'status': {'stringValue': 'none'},
                  'productId': {'stringValue': 'barber_pro_mensal'},
                },
              },
            },
            'updatedAt': {
              'timestampValue': DateTime.now().toUtc().toIso8601String(),
            },
          },
        }),
      );
      if (patch.statusCode != 200) {
        throw StateError('Falha ao criar loja: ${patch.statusCode}');
      }
      _shopId.clear();
      _shopName.clear();
      _adminEmail.clear();
      await _loadShops();
      setState(() => _msg = 'Loja $id criada. Link: $booking');
    } catch (e) {
      setState(() => _error = '$e'
          .replaceFirst('Bad state: ', '')
          .replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _setActive(_ShopRow row, bool active) async {
    setState(() {
      _busy = true;
      _error = null;
      _msg = null;
    });
    try {
      final status = active ? 'active' : 'inactive';
      final patchUri = Uri.parse(
        '$_base/shops/${row.shopId}?key=$_apiKey'
        '&updateMask.fieldPaths=active'
        '&updateMask.fieldPaths=status'
        '&updateMask.fieldPaths=updatedAt',
      );
      final res = await http.patch(
        patchUri,
        headers: _authHeaders,
        body: jsonEncode({
          'fields': {
            'active': {'booleanValue': active},
            'status': {'stringValue': status},
            'updatedAt': {
              'timestampValue': DateTime.now().toUtc().toIso8601String(),
            },
          },
        }),
      );
      if (res.statusCode != 200) {
        throw StateError('Falha ao actualizar ${row.shopId}');
      }
      await _loadShops();
      setState(() =>
          _msg = active ? '${row.shopId} reactivada.' : '${row.shopId} desactivada.');
    } catch (e) {
      setState(() => _error = '$e'
          .replaceFirst('Bad state: ', '')
          .replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _copy(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Link copiado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Text(
                  'Admin PerfectGest — Lojas Barber',
                  style: const TextStyle(
                    color: _text,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  kBarberShopsAdminPath,
                  style: const TextStyle(color: _muted, fontSize: 12),
                ),
                const SizedBox(height: 20),
                if (!_loggedIn) ...[
                  _field(_email, 'Email operador (dono piloto)', false),
                  const SizedBox(height: 10),
                  _field(_pass, 'Senha', true),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _busy ? null : _login,
                    style: FilledButton.styleFrom(backgroundColor: _olive),
                    child: Text(_busy ? 'Aguarde…' : 'Entrar'),
                  ),
                ] else ...[
                  Text(
                    'Operador: ${_email.text.trim()}',
                    style: const TextStyle(color: _muted, fontSize: 13),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Criar loja',
                    style: const TextStyle(
                      color: _olive,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _field(_shopId, 'shopId (ex.: barbearia_silva)', false),
                  const SizedBox(height: 8),
                  _field(_shopName, 'Nome da loja', false),
                  const SizedBox(height: 8),
                  _field(_adminEmail, 'Email dono (pending)', false),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: _busy ? null : _createShop,
                    style: FilledButton.styleFrom(backgroundColor: _olive),
                    child: Text(_busy ? 'Aguarde…' : 'Criar loja'),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Text(
                        'Lojas',
                        style: TextStyle(
                          color: _olive,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: _busy
                            ? null
                            : () async {
                                setState(() => _busy = true);
                                await _loadShops();
                                if (mounted) setState(() => _busy = false);
                              },
                        child: const Text('Actualizar'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ..._shops.map(_shopCard),
                ],
                if (_msg != null) ...[
                  const SizedBox(height: 16),
                  Text(_msg!, style: const TextStyle(color: Color(0xFF9CCC65))),
                ],
                if (_error != null) ...[
                  const SizedBox(height: 12),
                  Text(_error!, style: const TextStyle(color: Color(0xFFFF8A80))),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _field(TextEditingController c, String label, bool obscure) {
    return TextField(
      controller: c,
      obscureText: obscure,
      style: const TextStyle(color: _text),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: _muted),
        filled: true,
        fillColor: _surface,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _shopCard(_ShopRow row) {
    final link = barberHairdresserPublicUrlFor(row.shopId);
    return Card(
      color: _surface,
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              row.name,
              style: const TextStyle(
                color: _text,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text('shopId: ${row.shopId}',
                style: const TextStyle(color: _muted, fontSize: 12)),
            Text(
              'owner: ${row.adminEmail.isEmpty ? '(pending)' : row.adminEmail}'
              '${row.adminUid.isEmpty ? '' : ' · ${row.adminUid.substring(0, row.adminUid.length.clamp(0, 8))}…'}',
              style: const TextStyle(color: _muted, fontSize: 12),
            ),
            Text(
              'active: ${row.active} · billing: ${row.billingStatus}',
              style: const TextStyle(color: _muted, fontSize: 12),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                OutlinedButton(
                  onPressed: () => _copy(link),
                  child: const Text('Copiar link site'),
                ),
                OutlinedButton(
                  onPressed: () => _copy(barberAdminPublicUrlFor(row.shopId)),
                  child: const Text('Copiar admin'),
                ),
                if (row.active)
                  TextButton(
                    onPressed: _busy ? null : () => _setActive(row, false),
                    child: const Text('Desactivar'),
                  )
                else
                  TextButton(
                    onPressed: _busy ? null : () => _setActive(row, true),
                    child: const Text('Reactivar'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ShopRow {
  const _ShopRow({
    required this.shopId,
    required this.name,
    required this.adminEmail,
    required this.adminUid,
    required this.active,
    required this.billingStatus,
  });

  final String shopId;
  final String name;
  final String adminEmail;
  final String adminUid;
  final bool active;
  final String billingStatus;
}
