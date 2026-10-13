import 'package:flutter/material.dart';

import 'funil_a1_service.dart';
import 'funil_comprovante_pick.dart';
import 'l10n/site_contabilidade_funil_texts.dart';

const Color _a1Roxo = Color(0xFF7A2E9A);

Future<void> showA1QualityCertPop(
  BuildContext context, {
  FunilA1Prefill prefill = const FunilA1Prefill(),
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => _A1QualityCertPop(prefill: prefill),
  );
}

class _A1QualityCertPop extends StatefulWidget {
  const _A1QualityCertPop({required this.prefill});

  final FunilA1Prefill prefill;

  @override
  State<_A1QualityCertPop> createState() => _A1QualityCertPopState();
}

class _A1QualityCertPopState extends State<_A1QualityCertPop> {
  int _passo = 1;
  String _tipo = 'PJ';
  bool _consent = false;
  FunilComprovanteArquivo? _comp;
  bool _enviando = false;
  bool _ok = false;
  String? _erro;

  late final TextEditingController _docCtrl;
  late final TextEditingController _razaoCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _foneCtrl;
  late final TextEditingController _cepCtrl;
  final _logCtrl = TextEditingController();
  final _numCtrl = TextEditingController();
  final _baiCtrl = TextEditingController();
  final _compCtrl = TextEditingController();
  final _cidCtrl = TextEditingController();
  final _ufCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    final p = widget.prefill;
    _tipo = p.tipoPessoa.trim().toUpperCase() == 'PF' ? 'PF' : 'PJ';
    _comp = p.comprovante;
    _docCtrl = TextEditingController(text: p.cnpj);
    _razaoCtrl = TextEditingController(
      text: p.razao.trim().isNotEmpty ? p.razao : p.nome,
    );
    _emailCtrl = TextEditingController(text: p.email);
    _foneCtrl = TextEditingController(text: p.telefone);
    _cepCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _docCtrl.dispose();
    _razaoCtrl.dispose();
    _emailCtrl.dispose();
    _foneCtrl.dispose();
    _cepCtrl.dispose();
    _logCtrl.dispose();
    _numCtrl.dispose();
    _baiCtrl.dispose();
    _compCtrl.dispose();
    _cidCtrl.dispose();
    _ufCtrl.dispose();
    super.dispose();
  }

  String _digits(String raw) => FunilA1Service.digits(raw);

  bool get _tipoTravado => widget.prefill.tipoTravado;

  String _tituloPasso(SiteContabilidadeFunilTexts st) {
    if (!_tipoTravado) return st.a1StepOf(_passo, 3);
    return switch (_passo) {
      1 => st.a1StepCadastro1,
      2 => st.a1StepCadastro2,
      _ => st.a1StepEnviar,
    };
  }

  String? _erroIdentidade() {
    final doc = _digits(_docCtrl.text);
    if (_tipo == 'PJ' && doc.length != 14) return 'cnpj_invalid';
    if (_tipo == 'PF' && doc.length != 11) return 'cpf_invalid';
    if (_razaoCtrl.text.trim().length < 2) return 'razao_invalid';
    final mail = _emailCtrl.text.trim();
    if (!mail.contains('@') || !mail.contains('.')) return 'email_invalid';
    final fone = _digits(_foneCtrl.text);
    if (fone.length < 10 || fone.length > 11) return 'telefone_invalid';
    return null;
  }

  String? _erroEndereco() {
    if (_digits(_cepCtrl.text).length != 8) return 'cep_invalid';
    if (_logCtrl.text.trim().isEmpty) return 'logradouro_invalid';
    if (_numCtrl.text.trim().isEmpty) return 'numero_invalid';
    if (_baiCtrl.text.trim().isEmpty) return 'bairro_invalid';
    if (_cidCtrl.text.trim().isEmpty) return 'cidade_invalid';
    if (!RegExp(r'^[A-Za-z]{2}$').hasMatch(_ufCtrl.text.trim())) {
      return 'estado_invalid';
    }
    return null;
  }

  bool _avanca(SiteContabilidadeFunilTexts st) {
    setState(() => _erro = null);
    if (_tipoTravado) {
      if (_passo == 1) {
        final e = _erroIdentidade();
        if (e != null) {
          setState(() => _erro = e);
          return false;
        }
        setState(() => _passo = 2);
        return true;
      }
      if (_passo == 2) {
        final e = _erroEndereco();
        if (e != null) {
          setState(() => _erro = e);
          return false;
        }
        setState(() => _passo = 3);
        return true;
      }
      return true;
    }
    if (_passo == 1) {
      if (_tipo != 'PJ' && _tipo != 'PF') {
        setState(() => _erro = 'tipo_pessoa_invalid');
        return false;
      }
      setState(() => _passo = 2);
      return true;
    }
    if (_passo == 2) {
      final e = _erroIdentidade();
      if (e != null) {
        setState(() => _erro = e);
        return false;
      }
      setState(() => _passo = 3);
      return true;
    }
    return true;
  }

  Future<void> _enviar(SiteContabilidadeFunilTexts st) async {
    if (_enviando) return;
    setState(() => _erro = null);
    final eEnd = _erroEndereco();
    if (eEnd != null) {
      setState(() => _erro = eEnd);
      return;
    }
    if (!_consent) {
      setState(() => _erro = 'consent_required');
      return;
    }
    if (_comp == null) {
      setState(() => _erro = 'comprovante_required');
      return;
    }
    setState(() => _enviando = true);
    final result = await FunilA1Service.submit(
      tipoPessoa: _tipo,
      cnpjCpf: _docCtrl.text,
      razaoSocial: _razaoCtrl.text,
      email: _emailCtrl.text,
      telefone: _foneCtrl.text,
      cep: _cepCtrl.text,
      logradouro: _logCtrl.text,
      numero: _numCtrl.text,
      bairro: _baiCtrl.text,
      complemento: _compCtrl.text,
      cidade: _cidCtrl.text,
      estado: _ufCtrl.text,
      consent: true,
      pixA1Informado: true,
      comprovanteNome: _comp?.nome ?? '',
      comprovanteMime: _comp?.mime ?? '',
      comprovanteBase64: _comp?.base64 ?? '',
    );
    if (!mounted) return;
    setState(() {
      _enviando = false;
      if (result.ok) {
        _ok = true;
      } else {
        _erro = result.errorMessage ?? 'server_error';
      }
    });
  }

  Widget _campo({
    required TextEditingController controller,
    required String label,
    TextInputType keyboard = TextInputType.text,
    int? maxLen,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        maxLength: maxLen,
        enabled: !_enviando,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          isDense: true,
          counterText: '',
        ),
      ),
    );
  }

  List<Widget> _camposIdentidade(SiteContabilidadeFunilTexts st) => [
        _campo(
          controller: _docCtrl,
          label: _tipo == 'PJ' ? st.fieldCnpj : st.a1FieldCpf,
          keyboard: TextInputType.number,
        ),
        _campo(
          controller: _razaoCtrl,
          label: _tipo == 'PJ' ? st.fieldRazao : st.fieldName,
        ),
        _campo(
          controller: _emailCtrl,
          label: st.fieldEmail,
          keyboard: TextInputType.emailAddress,
        ),
        _campo(
          controller: _foneCtrl,
          label: st.a1FieldPhone,
          keyboard: TextInputType.phone,
        ),
      ];

  List<Widget> _camposEndereco(SiteContabilidadeFunilTexts st) => [
        _campo(controller: _cepCtrl, label: st.a1FieldCep, keyboard: TextInputType.number),
        _campo(controller: _logCtrl, label: st.a1FieldLogradouro),
        _campo(controller: _numCtrl, label: st.a1FieldNumero),
        _campo(controller: _baiCtrl, label: st.a1FieldBairro),
        _campo(controller: _compCtrl, label: st.a1FieldComplemento),
        _campo(controller: _cidCtrl, label: st.a1FieldCidade),
        _campo(controller: _ufCtrl, label: st.a1FieldUf, maxLen: 2),
      ];

  List<Widget> _camposEnvio(SiteContabilidadeFunilTexts st) => [
        OutlinedButton.icon(
          onPressed: _enviando
              ? null
              : () async {
                  try {
                    final arq = await escolherComprovanteFunil();
                    if (arq != null) setState(() => _comp = arq);
                  } on StateError catch (e) {
                    setState(() => _erro = e.message);
                  }
                },
          icon: const Icon(Icons.attach_file, size: 18),
          label: Text(
            _comp == null ? st.comprovanteAnexar : st.comprovanteTrocar,
          ),
        ),
        if (_comp != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 8),
            child: Text(_comp!.nome, style: const TextStyle(fontSize: 12)),
          ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          value: _consent,
          activeColor: _a1Roxo,
          onChanged: _enviando ? null : (v) => setState(() => _consent = v ?? false),
          title: Text(st.a1Consent, style: const TextStyle(fontSize: 13)),
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final st = SiteContabilidadeFunilTexts.of(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 680),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: _a1Roxo,
                padding: const EdgeInsets.fromLTRB(16, 14, 8, 14),
                child: Row(
                  children: [
                    const Icon(Icons.verified_user, color: Colors.white),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        st.a1PopTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _enviando ? null : () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                  child: _ok ? _sucesso(st) : _formulario(st),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formulario(SiteContabilidadeFunilTexts st) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(_tituloPasso(st), style: const TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 10),
        if (_tipoTravado) ...[
          if (_passo == 1) ..._camposIdentidade(st),
          if (_passo == 2) ..._camposEndereco(st),
          if (_passo == 3) ..._camposEnvio(st),
        ] else ...[
          if (_passo == 1) ...[
            Text(st.a1StepTipo, style: const TextStyle(fontWeight: FontWeight.w700)),
            ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              title: Text(st.a1TipoPj),
              leading: Icon(
                _tipo == 'PJ' ? Icons.radio_button_checked : Icons.radio_button_off,
                color: _a1Roxo,
              ),
              onTap: _enviando ? null : () => setState(() => _tipo = 'PJ'),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              title: Text(st.a1TipoPf),
              leading: Icon(
                _tipo == 'PF' ? Icons.radio_button_checked : Icons.radio_button_off,
                color: _a1Roxo,
              ),
              onTap: _enviando ? null : () => setState(() => _tipo = 'PF'),
            ),
          ],
          if (_passo == 2) ..._camposIdentidade(st),
          if (_passo == 3) ...[
            ..._camposEndereco(st),
            ..._camposEnvio(st),
          ],
        ],
        const SizedBox(height: 8),
        Text(st.a1Avisos, style: const TextStyle(fontSize: 12, height: 1.4)),
        if (_erro != null) ...[
          const SizedBox(height: 8),
          Text(
            st.errorForCode(_erro!),
            style: const TextStyle(color: Color(0xFFB00020), fontWeight: FontWeight.w700),
          ),
        ],
        const SizedBox(height: 14),
        Row(
          children: [
            if (_passo > 1)
              TextButton(
                onPressed: _enviando ? null : () => setState(() { _passo -= 1; _erro = null; }),
                child: Text(st.a1Back),
              ),
            const Spacer(),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: _a1Roxo,
                foregroundColor: Colors.white,
              ),
              onPressed: _enviando
                  ? null
                  : () {
                      if (_passo < 3) {
                        _avanca(st);
                      } else {
                        _enviar(st);
                      }
                    },
              child: Text(
                _enviando
                    ? st.a1Sending
                    : (_passo < 3 ? st.a1Next : st.a1Send),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _sucesso(SiteContabilidadeFunilTexts st) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(Icons.check_circle, color: Color(0xFF2E7D32), size: 48),
        const SizedBox(height: 12),
        Text(st.a1Success, style: const TextStyle(fontSize: 14, height: 1.4)),
        const SizedBox(height: 16),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: _a1Roxo,
            foregroundColor: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: Text(st.proposalBack),
        ),
      ],
    );
  }
}
