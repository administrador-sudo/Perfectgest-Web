import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'barber_pix_emv.dart';

/// Pagamento PIX no site: QR + copia-cola + anexar comprovante → WhatsApp.
class BarberPaymentScreen extends StatefulWidget {
  const BarberPaymentScreen({
    super.key,
    required this.title,
    required this.amount,
    required this.txid,
    required this.pixKey,
    required this.pixReceiverName,
    required this.pixCity,
    required this.professionalPhone,
    required this.whatsAppMessage,
    this.onProofSent,
  });

  final String title;
  final double amount;
  final String txid;
  final String pixKey;
  final String pixReceiverName;
  final String pixCity;
  final String professionalPhone;
  final String whatsAppMessage;
  final Future<void> Function()? onProofSent;

  @override
  State<BarberPaymentScreen> createState() => _BarberPaymentScreenState();
}

class _BarberPaymentScreenState extends State<BarberPaymentScreen> {
  static const _olive = Color(0xFF556B2F);
  static const _bg = Color(0xFF121212);
  static const _surface = Color(0xFF1E1E1E);
  static const _text = Color(0xFFF5F5F5);
  static const _muted = Color(0xFFB0B0B0);
  static const _font = 'Georgia';

  String? _payload;
  String? _error;
  bool _sending = false;
  bool _hasProof = false;

  @override
  void initState() {
    super.initState();
    try {
      _payload = BarberPixEmv.payload(
        chave: widget.pixKey,
        nomeRecebedor: widget.pixReceiverName.isEmpty
            ? 'BARBEARIA'
            : widget.pixReceiverName,
        cidade: widget.pixCity.isEmpty ? 'BRASIL' : widget.pixCity,
        valor: widget.amount,
        txid: widget.txid,
      );
    } catch (e) {
      _error = 'PIX indisponível: cadastre a chave no app do profissional.';
    }
  }

  String get _waDigits {
    final d = widget.professionalPhone.replaceAll(RegExp(r'\D'), '');
    if (d.isEmpty) return '';
    return d.startsWith('55') ? d : '55$d';
  }

  Future<void> _sendWhatsApp() async {
    if (!_hasProof) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Marque que anexou o comprovante (galeria do aparelho)'),
        ),
      );
      return;
    }
    final digits = _waDigits;
    if (digits.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profissional sem WhatsApp cadastrado'),
        ),
      );
      return;
    }
    setState(() => _sending = true);
    try {
      final text =
          '${widget.whatsAppMessage}\nTXID: ${widget.txid}\nValor: R\$ ${widget.amount.toStringAsFixed(2).replaceAll('.', ',')}\n(Anexe a foto do comprovante neste chat.)';
      final uri = Uri.parse(
        'https://wa.me/$digits?text=${Uri.encodeComponent(text)}',
      );
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      await widget.onProofSent?.call();
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha WhatsApp: $e')),
      );
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final price =
        'R\$ ${widget.amount.toStringAsFixed(2).replaceAll('.', ',')}';
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _surface,
        foregroundColor: _text,
        title: Text(widget.title, style: const TextStyle(fontFamily: _font)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            price,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: _font,
              color: _olive,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Pague via PIX, anexe o comprovante na galeria e envie no WhatsApp do profissional.',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: _font, color: _muted),
          ),
          const SizedBox(height: 20),
          if (_error != null)
            Text(_error!, style: const TextStyle(color: Colors.orangeAccent))
          else if (_payload != null) ...[
            Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                color: Colors.white,
                child: QrImageView(
                  data: _payload!,
                  size: 220,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'PIX copia e cola',
              style: TextStyle(
                fontFamily: _font,
                color: _muted,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            SelectableText(
              _payload!,
              style: const TextStyle(
                fontFamily: _font,
                color: _text,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: _payload!));
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Código PIX copiado')),
                );
              },
              icon: const Icon(Icons.copy, color: _olive),
              label: const Text(
                'Copiar código',
                style: TextStyle(fontFamily: _font, color: _olive),
              ),
            ),
          ],
          const SizedBox(height: 20),
          CheckboxListTile(
            value: _hasProof,
            activeColor: _olive,
            title: const Text(
              'Comprovante anexado / pronto na galeria',
              style: TextStyle(fontFamily: _font, color: _text),
            ),
            onChanged: (v) => setState(() => _hasProof = v ?? false),
          ),
          FilledButton.icon(
            onPressed: _sending ? null : _sendWhatsApp,
            style: FilledButton.styleFrom(backgroundColor: _olive),
            icon: _sending
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send),
            label: const Text(
              'Enviar comprovante no WhatsApp',
              style: TextStyle(fontFamily: _font),
            ),
          ),
        ],
      ),
    );
  }
}
