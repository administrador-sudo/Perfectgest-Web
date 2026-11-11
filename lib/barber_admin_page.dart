import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'barber_cloud.dart';
import 'barber_firebase_options.dart';
import 'site_public_urls.dart';

/// Painel do dono: login + cadastrar email de profissional (senha padrão).
class BarberAdminPage extends StatefulWidget {
  const BarberAdminPage({
    super.key,
    this.shopId = kBarberDefaultShopId,
  });

  final String shopId;

  @override
  State<BarberAdminPage> createState() => _BarberAdminPageState();
}

class _BarberAdminPageState extends State<BarberAdminPage> {
  static const _olive = Color(0xFF556B2F);
  static const _bg = Color(0xFF121212);
  static const _surface = Color(0xFF2A2A2A);
  static const _text = Color(0xFFFFFFFF);
  static const _muted = Color(0xFFD0D0D0);
  static const _defaultPw = 'Barber@Mudar1';

  /// Tipagens comuns de domínio — aviso só UI.
  static const _typoDomains = {
    'gamil.com',
    'gmial.com',
    'gnail.com',
    'hotnail.com',
    'outlok.com',
  };

  final _adminEmail = TextEditingController();
  final _adminPass = TextEditingController();
  final _proEmail = TextEditingController();
  final _proName = TextEditingController();

  String? _idToken;
  String? _adminUid;
  String? _msg;
  String? _error;
  String? _emailHint;
  bool _busy = false;
  List<Map<String, String>> _pros = [];

  static final _apiKey = DefaultFirebaseOptions.web.apiKey;
  static const _projectId = 'perfectgest-barber';

  String get _shop {
    final id = widget.shopId.trim();
    return isValidBarberShopId(id) ? id : kBarberDefaultShopId;
  }

  bool get _loggedIn =>
      _idToken != null &&
      _idToken!.isNotEmpty &&
      _adminUid != null &&
      _adminUid!.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _adminEmail.addListener(_onEmailChanged);
    _proEmail.addListener(_onEmailChanged);
  }

  @override
  void dispose() {
    _adminEmail.removeListener(_onEmailChanged);
    _proEmail.removeListener(_onEmailChanged);
    _adminEmail.dispose();
    _adminPass.dispose();
    _proEmail.dispose();
    _proName.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    final hints = <String>[];
    for (final raw in [_adminEmail.text, _proEmail.text]) {
      final h = _typoHint(raw);
      if (h != null) hints.add(h);
    }
    final next = hints.isEmpty ? null : hints.first;
    if (next != _emailHint) setState(() => _emailHint = next);
  }

  String? _typoHint(String raw) {
    final email = raw.trim().toLowerCase();
    final at = email.lastIndexOf('@');
    if (at < 0 || at == email.length - 1) return null;
    final domain = email.substring(at + 1);
    if (_typoDomains.contains(domain)) {
      return 'Verifique o email: «$domain» parece typo (ex.: gmail.com).';
    }
    return null;
  }

  String _normEmail(String raw) => raw.trim().toLowerCase();

  /// Mensagens curtas PT — sem JSON / Bad state.
  String _authErrorPt(String bodyOrMsg) {
    final s = bodyOrMsg.toLowerCase();
    if (s.contains('invalid_login_credentials') ||
        s.contains('email_not_found') ||
        s.contains('invalid_password')) {
      return 'Email ou senha incorrectos. Use o email exacto do Firebase '
          '(gmail.com, não gamil) e a senha do dono — não a senha padrão '
          'Barber@Mudar1.';
    }
    if (s.contains('user_disabled')) {
      return 'Conta desactivada no Firebase.';
    }
    if (s.contains('too_many_attempts') || s.contains('too_many_requests')) {
      return 'Muitas tentativas. Aguarde e tente de novo.';
    }
    if (s.contains('email_exists')) {
      return 'Este email já tem conta Auth. O perfil foi ligado ao shop.';
    }
    if (s.contains('operation_not_allowed')) {
      return 'Email/senha não está activo no projecto Firebase.';
    }
    if (s.contains('api_key_http_referrer_blocked') ||
        s.contains('api_key_invalid')) {
      return 'API key bloqueada para este domínio. Verifique restrições no Console.';
    }
    if (s.contains('permission') || s.contains('403')) {
      return 'Sem permissão na nuvem. Confirme que este email é o dono (adminUid).';
    }
    // Extrai message do JSON Identity Toolkit se existir.
    try {
      final start = bodyOrMsg.indexOf('{');
      if (start >= 0) {
        final json = jsonDecode(bodyOrMsg.substring(start)) as Map;
        final err = json['error'];
        if (err is Map && err['message'] is String) {
          return _authErrorPt(err['message'] as String);
        }
      }
    } catch (_) {}
    return 'Falha de autenticação. Confira email, senha e projecto perfectgest-barber.';
  }

  Uri _authUri(String method) => Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$method?key=$_apiKey',
      );

  Uri _fsDoc(String path) => Uri.parse(
        'https://firestore.googleapis.com/v1/projects/$_projectId/databases/(default)/documents/$path?key=$_apiKey',
      );

  Map<String, String> get _authHeaders => {
        'Content-Type': 'application/json',
        if (_idToken != null) 'Authorization': 'Bearer $_idToken',
      };

  Future<void> _login() async {
    setState(() {
      _busy = true;
      _error = null;
      _msg = null;
    });
    try {
      final email = _normEmail(_adminEmail.text);
      if (email.isEmpty || !_adminPass.text.isNotEmpty) {
        throw StateError('Informe email e senha do dono.');
      }
      final typo = _typoHint(email);
      if (typo != null) {
        throw StateError(typo);
      }

      // Só signInWithPassword do DONO — nunca senha padrão do profissional.
      final res = await http.post(
        _authUri('signInWithPassword'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': _adminPass.text,
          'returnSecureToken': true,
        }),
      );
      if (res.statusCode != 200) {
        throw StateError(_authErrorPt(res.body));
      }
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      _idToken = body['idToken'] as String?;
      _adminUid = body['localId'] as String?;
      if (!_loggedIn) {
        throw StateError('Login incompleto. Tente de novo.');
      }
      await _ensureShopAdminUid();
      await _loadPros();
      setState(() {
        _msg =
            'Admin autenticado ($email). Já pode convidar profissionais.';
      });
    } catch (e) {
      _idToken = null;
      _adminUid = null;
      setState(() => _error = '$e'
          .replaceFirst('Bad state: ', '')
          .replaceFirst('Exception: ', ''));
    } finally {
      setState(() => _busy = false);
    }
  }

  /// Se o dono foi criado só no Console, grava adminUid na 1.ª entrada.
  Future<void> _ensureShopAdminUid() async {
    final get = await http.get(_fsDoc('shops/$_shop'), headers: _authHeaders);
    String? existing;
    if (get.statusCode == 200) {
      final fields =
          (jsonDecode(get.body) as Map)['fields'] as Map<String, dynamic>?;
      existing =
          (fields?['adminUid'] as Map?)?['stringValue'] as String?;
    }
    if (existing != null &&
        existing.isNotEmpty &&
        existing != _adminUid) {
      throw StateError(
        'Este shop já tem outro dono (adminUid). Use a conta correcta.',
      );
    }
    if (existing == _adminUid) return;

    final uri = Uri.parse(
      'https://firestore.googleapis.com/v1/projects/$_projectId/databases/(default)/documents/shops/$_shop'
      '?key=$_apiKey'
      '&updateMask.fieldPaths=adminUid'
      '&updateMask.fieldPaths=defaultPassword',
    );
    final patch = await http.patch(
      uri,
      headers: _authHeaders,
      body: jsonEncode({
        'fields': {
          'adminUid': {'stringValue': _adminUid},
          'defaultPassword': {'stringValue': _defaultPw},
        },
      }),
    );
    if (patch.statusCode == 200) return;
    if (get.statusCode == 404) {
      final create = await http.patch(
        Uri.parse(
          'https://firestore.googleapis.com/v1/projects/$_projectId/databases/(default)/documents/shops/$_shop?key=$_apiKey',
        ),
        headers: _authHeaders,
        body: jsonEncode({
          'fields': {
            'adminUid': {'stringValue': _adminUid},
            'defaultPassword': {'stringValue': _defaultPw},
            'name': {'stringValue': 'Barbearia'},
          },
        }),
      );
      if (create.statusCode != 200) {
        debugPrint('ensureShopAdminUid create: ${create.body}');
      }
      return;
    }
    debugPrint('ensureShopAdminUid patch: ${patch.body}');
  }

  Future<void> _loadPros() async {
    final res = await http.get(
      Uri.parse(
        'https://firestore.googleapis.com/v1/projects/$_projectId/databases/(default)/documents/shops/$_shop/professionals?key=$_apiKey',
      ),
    );
    if (res.statusCode != 200) {
      _pros = [];
      return;
    }
    final body = jsonDecode(res.body) as Map<String, dynamic>;
    final docs = body['documents'] as List? ?? [];
    _pros = docs.map((d) {
      final doc = Map<String, dynamic>.from(d as Map);
      final namePath = doc['name'] as String? ?? '';
      final id = namePath.split('/').last;
      final fields = doc['fields'] as Map<String, dynamic>? ?? {};
      String s(String k) =>
          (fields[k] as Map?)?['stringValue'] as String? ?? '';
      final active =
          (fields['active'] as Map?)?['booleanValue'] as bool? ?? true;
      return {
        'id': id,
        'name': s('name'),
        'email': s('email'),
        'active': active ? 'sim' : 'não',
      };
    }).toList();
    setState(() {});
  }

  static const _maxStaff = 3;

  Future<bool> _isPlatformOperator() async {
    final res = await http.get(
      _fsDoc('shops/$kBarberDefaultShopId'),
      headers: _authHeaders,
    );
    if (res.statusCode != 200) return false;
    final fields =
        (jsonDecode(res.body) as Map)['fields'] as Map<String, dynamic>? ?? {};
    final uid =
        (fields['adminUid'] as Map?)?['stringValue'] as String? ?? '';
    return uid.isNotEmpty && uid == _adminUid;
  }

  Future<void> _invite() async {
    if (!_loggedIn) {
      setState(() => _error = 'Faça login de admin primeiro.');
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
      _msg = null;
    });
    try {
      final email = _normEmail(_proEmail.text);
      final name = _proName.text.trim();
      if (email.isEmpty || name.isEmpty) {
        throw StateError('Informe nome e email do profissional.');
      }
      final typo = _typoHint(email);
      if (typo != null) {
        throw StateError(typo);
      }

      await _loadPros();
      final active =
          _pros.where((p) => (p['active'] as String?) == 'sim').length;
      final operator = await _isPlatformOperator();
      if (!operator && active >= _maxStaff) {
        throw StateError(
          'Limite do plano: 1 dono + 2 funcionários (máx. $_maxStaff). '
          'Remova um profissional ou contacte a PerfectGest.',
        );
      }

      // Criar conta Auth do profissional (signUp) — NÃO signIn.
      final signUp = await http.post(
        _authUri('signUp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': _defaultPw,
          'returnSecureToken': true,
        }),
      );
      String ownerUid;
      if (signUp.statusCode == 200) {
        ownerUid =
            (jsonDecode(signUp.body) as Map)['localId'] as String? ?? '';
      } else if (signUp.body.contains('EMAIL_EXISTS')) {
        ownerUid = '';
      } else {
        throw StateError(_authErrorPt(signUp.body));
      }

      final cloudId =
          'c_${DateTime.now().microsecondsSinceEpoch.toRadixString(16)}';
      final fields = <String, dynamic>{
        'fields': {
          'name': {'stringValue': name},
          'email': {'stringValue': email},
          'active': {'booleanValue': true},
          'role': {'stringValue': 'professional'},
          'mustChangePassword': {'booleanValue': true},
          if (ownerUid.isNotEmpty) 'ownerUid': {'stringValue': ownerUid},
        },
      };
      final create = await http.post(
        Uri.parse(
          'https://firestore.googleapis.com/v1/projects/$_projectId/databases/(default)/documents/shops/$_shop/professionals?documentId=$cloudId&key=$_apiKey',
        ),
        headers: _authHeaders,
        body: jsonEncode(fields),
      );
      if (create.statusCode != 200) {
        throw StateError(
          create.body.contains('PERMISSION') || create.statusCode == 403
              ? (active >= _maxStaff && !operator
                  ? 'Limite de $_maxStaff profissionais atingido.'
                  : 'Sem permissão para convidar. Confirme adminUid no shop.')
              : 'Não foi possível gravar o profissional.',
        );
      }
      await http.patch(
        _fsDoc('shops/$_shop/invites/${Uri.encodeComponent(email)}'),
        headers: _authHeaders,
        body: jsonEncode({
          'fields': {
            'email': {'stringValue': email},
            'name': {'stringValue': name},
            'professionalId': {'stringValue': cloudId},
            'defaultPasswordHint': {'stringValue': _defaultPw},
          },
        }),
      );
      // Actualiza contador de assentos (rules usam staffSeatCount).
      await http.patch(
        Uri.parse(
          'https://firestore.googleapis.com/v1/projects/$_projectId/databases/(default)/documents/shops/$_shop?key=$_apiKey'
          '&updateMask.fieldPaths=staffSeatCount'
          '&updateMask.fieldPaths=updatedAt',
        ),
        headers: _authHeaders,
        body: jsonEncode({
          'fields': {
            'staffSeatCount': {'integerValue': '${active + 1}'},
            'updatedAt': {
              'timestampValue': DateTime.now().toUtc().toIso8601String(),
            },
          },
        }),
      );
      _proEmail.clear();
      _proName.clear();
      await _loadPros();
      setState(() {
        _msg = ownerUid.isEmpty
            ? 'Email já existia no Auth. Perfil criado — app: $email · senha que o barbeiro já usa (ou reset no Console).'
            : 'Convite OK. App: $email · senha padrão $_defaultPw (trocar no 1.º login). '
                'Vagas: ${active + 1}/$_maxStaff.';
      });
    } catch (e) {
      setState(() => _error = '$e'
          .replaceFirst('Bad state: ', '')
          .replaceFirst('Exception: ', ''));
    } finally {
      setState(() => _busy = false);
    }
  }

  Future<void> _logout() async {
    setState(() {
      _idToken = null;
      _adminUid = null;
      _msg = 'Sessão encerrada.';
      _error = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: ListView(
            padding: const EdgeInsets.all(28),
            children: [
              const Text(
                'Admin Barbearia',
                style: TextStyle(
                  color: _text,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1) Entre com o email/senha do DONO (projecto perfectgest-barber).\n'
                '2) Convide profissionais — eles usam a senha padrão no app.',
                style: TextStyle(color: _muted, height: 1.4),
              ),
              const SizedBox(height: 8),
              Text(
                'Projecto: $_projectId',
                style: const TextStyle(color: _muted, fontSize: 12),
              ),
              const SizedBox(height: 24),
              _field(
                _adminEmail,
                'Email do dono (admin)',
                keyboard: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              _field(_adminPass, 'Senha do dono', obscure: true),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: _busy ? null : _login,
                      style: FilledButton.styleFrom(backgroundColor: _olive),
                      child: Text(_loggedIn ? 'Revalidar sessão' : 'Entrar como admin'),
                    ),
                  ),
                  if (_loggedIn) ...[
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: _busy ? null : _logout,
                      style: OutlinedButton.styleFrom(foregroundColor: _muted),
                      child: const Text('Sair'),
                    ),
                  ],
                ],
              ),
              if (_loggedIn)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Sessão activa · uid ${_adminUid!.substring(0, _adminUid!.length.clamp(0, 8))}…',
                    style: const TextStyle(color: _olive, fontSize: 12),
                  ),
                ),
              const Divider(height: 40, color: _surface),
              _field(_proName, 'Nome do profissional'),
              const SizedBox(height: 10),
              _field(
                _proEmail,
                'Email do profissional',
                keyboard: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: (_busy || !_loggedIn) ? null : _invite,
                style: FilledButton.styleFrom(backgroundColor: _olive),
                child: Text(
                  _loggedIn
                      ? 'Cadastrar / convidar (máx. $_maxStaff)'
                      : 'Cadastrar / convidar (entre como admin)',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Limite: 1 dono + 2 funcionários. Senha padrão: $_defaultPw\n'
                '(não use esta senha no «Entrar como admin»)',
                style: const TextStyle(color: _muted, fontSize: 13, height: 1.35),
              ),
              if (_emailHint != null) ...[
                const SizedBox(height: 12),
                Text(_emailHint!, style: const TextStyle(color: Color(0xFFFFB74D))),
              ],
              if (_msg != null) ...[
                const SizedBox(height: 16),
                Text(_msg!, style: const TextStyle(color: _olive)),
              ],
              if (_error != null) ...[
                const SizedBox(height: 12),
                Text(_error!, style: const TextStyle(color: Colors.redAccent)),
              ],
              const SizedBox(height: 28),
              const Text(
                'Profissionais',
                style: TextStyle(color: _text, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              if (_pros.isEmpty)
                const Text(
                  'Nenhum profissional listado ainda.',
                  style: TextStyle(color: _muted),
                ),
              ..._pros.map(
                (p) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    p['name'] ?? '',
                    style: const TextStyle(color: _text),
                  ),
                  subtitle: Text(
                    '${p['email']} · activo: ${p['active']}',
                    style: const TextStyle(color: _muted),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController c,
    String label, {
    bool obscure = false,
    TextInputType? keyboard,
  }) {
    return TextField(
      controller: c,
      obscureText: obscure,
      keyboardType: keyboard,
      autocorrect: false,
      style: const TextStyle(color: _text),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: _muted),
        filled: true,
        fillColor: _surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
