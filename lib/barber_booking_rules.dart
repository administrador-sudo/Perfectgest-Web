/// Regras de agendamento / CDC (texto do modal no site).
class BarberBookingRules {
  static const minHoursCancelOrReschedule = 3;

  static bool canCancelOrReschedule(DateTime startsAt, {DateTime? now}) {
    final n = now ?? DateTime.now();
    return startsAt.difference(n).inMinutes >= minHoursCancelOrReschedule * 60;
  }

  static const modalTitle = 'Regras do agendamento';

  static const modalBody = '''
Como funciona
• Escolha o serviço, o dia e um horário livre na grade.
• O valor do serviço (ou do plano de fidelidade) é pago antecipado via PIX.
• Após pagar, anexe o comprovante e envie pelo WhatsApp do profissional.

Cancelamento e reagendamento
• Cancele ou remarque com pelo menos 3 horas de antecedência.
• Se não puder comparecer na semana do plano de fidelidade, adie o horário da semana com 3 horas de antecedência.
• Pedidos feitos com menos de 3 horas podem ser recusados e o horário permanece reservado.

Plano de fidelidade
• Plano mensal pago antecipado, com direito a até 1 atendimento por semana (até 4 no mês), nos dias liberados pelo profissional.
• O pacote pode incluir cabelo, barba e/ou bigode, conforme o plano contratado.
• Créditos não usados não acumulam para o mês seguinte (salvo orientação do profissional).

Direitos do consumidor (CDC)
• Preço e condições devem ser claros antes da contratação (arts. 6º e 31).
• Em compras pela internet/fora do estabelecimento, aplica-se o direito de arrependimento de 7 dias quando cabível (art. 49), sem prejuízo das regras de horário já reservado com antecedência mínima.
• Em caso de falha na prestação do serviço, cabem as medidas do art. 35 (cumprimento forçado, substituição ou restituição).
• Guarde o comprovante de pagamento e os dados do agendamento.
''';
}
