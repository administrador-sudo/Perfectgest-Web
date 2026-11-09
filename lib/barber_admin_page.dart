import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'barber_cloud.dart';
import 'barber_firebase_options.dart';

/// Painel do dono: login + cadastrar email de profissional (senha padrão).
class BarberAdminPage extends StatefulWidget {
  const BarberAdminPage({super.key});

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

  final _adminEmail = TextEditingController();
  final _adminPass = TextEditingController();
  final _proEmail = TextEditingController();
  final _proName = TextEditingController();

  String? _idToken;
  String? _adminUid;
  String? _msg;
  String? _error;
  bool _busy = false;
  List<Map<String, String>> _pros = [];

  static final _apiKey = DefaultFirebaseOptions.web.apiKey;
  static const _projectId = 'perfectgest-barber';
  static const _shop = kBarberShopId;

  @override
  void dispose() {
    _adminEmail.dispose();
    _adminPass.dispose();
    _proEmail.dispose();
    _proName.dispose();
    super.dispose();
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
      final res = await http.post(
        _authUri('signInWithPassword'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _adminEmail.text.trim(),
          'password': _adminPass.text,
          'returnSecureToken': true,
        }),
      );
      if (res.statusCode != 200) {
        throw StateError('Login falhou: ${res.body}');
      }
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      _idToken = body['idToken'] as String?;
      _adminUid = body['localId'] as String?;
      await _loadPros();
      setState(() => _msg = 'Admin autenticado.');
    } catch (e) {
      setState(() => _error = '$e');
    } finally {
      setState(() => _busy = false);
    }
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
      final active = (fields['active'] as Map?)?['booleanValue'] as bool? ?? true;
      return {
        'id': id,
        'name': s('name'),
        'email': s('email'),
        'active': active ? 'sim' : 'não',
      };
    }).toList();
    setState(() {});
  }

  Future<void> _invite() async {
    if (_idToken == null || _adminUid == null) {
      setState(() => _error = 'Faça login de admin primeiro.');
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
      _msg = null;
    });
    try {
      final email = _proEmail.text.trim().toLowerCase();
      final name = _proName.text.trim();
      if (email.isEmpty || name.isEmpty) {
        throw StateError('Informe nome e email do profissional.');
      }
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
        // Já existe Auth: cria só o doc; o login no app liga ownerUid.
        ownerUid = '';
      } else {
        throw StateError('Criar Auth: ${signUp.body}');
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
        throw StateError('Gravar profissional: ${create.body}');
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
      _proEmail.clear();
      _proName.clear();
      await _loadPros();
      setState(() {
        _msg =
            'Convite criado. App: email $email · senha padrão $_defaultPw (trocar no 1.º login).';
      });
    } catch (e) {
      setState(() => _error = '$e');
    } finally {
      setState(() => _busy = false);
    }
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
                'Cadastre emails de profissionais. Eles entram no app com a senha padrão e trocam na 1.ª vez.',
                style: TextStyle(color: _muted),
              ),
              const SizedBox(height: 24),
              _field(_adminEmail, 'Email do dono (admin)'),
              const SizedBox(height: 10),
              _field(_adminPass, 'Senha do dono', obscure: true),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: _busy ? null : _login,
                style: FilledButton.styleFrom(backgroundColor: _olive),
                child: const Text('Entrar como admin'),
              ),
              const Divider(height: 40, color: _surface),
              _field(_proName, 'Nome do profissional'),
              const SizedBox(height: 10),
              _field(_proEmail, 'Email do profissional'),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: _busy || _idToken == null ? null : _invite,
                style: FilledButton.styleFrom(backgroundColor: _olive),
                child: const Text('Cadastrar / convidar'),
              ),
              const SizedBox(height: 8),
              Text(
                'Senha padrão: $_defaultPw',
                style: const TextStyle(color: _muted, fontSize: 13),
              ),
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
  }) {
    return TextField(
      controller: c,
      obscureText: obscure,
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
