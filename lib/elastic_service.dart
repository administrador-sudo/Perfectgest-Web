import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ElasticService {
  // Este é o endereço exclusivo que criamos para o seu projeto
  static const String _url = 'https://onrender.com';

  static Future<void> enviarTeste() async {
    try {
      debugPrint('Acordando o servidor Render... aguarde.');
      
      final response = await http.post(
        Uri.parse(_url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "mensagem": "Teste de iniciante com sucesso!",
          "usuario": "PerfectProAdmin",
          "data_envio": DateTime.now().toIso8601String()
        }),
      );

      if (response.statusCode == 200) {
        debugPrint('Sucesso: o dado chegou no Elastic.');
        debugPrint('ID do registro: ${jsonDecode(response.body)['id']}');
      } else {
        debugPrint('Erro do servidor: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Erro de conexao: verifique internet e endpoint.');
      debugPrint('Detalhe do erro: $e');
    }
  }
}
