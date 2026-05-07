import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;

class TecnologiasPage extends StatefulWidget {
  const TecnologiasPage({super.key, this.onToggleTheme, this.initialTopic});

  final VoidCallback? onToggleTheme;
  final String? initialTopic;

  static const topicCleanArch = 'clean-arch';
  static const topicSeguranca = 'seguranca';
  static const topicEscala = 'escala';
  static const topicFullStack = 'full-stack';

  @override
  State<TecnologiasPage> createState() => _TecnologiasPageState();
}

class _TecnologiasPageState extends State<TecnologiasPage> {
  final _scrollCtrl = ScrollController();
  final _cleanArchKey = GlobalKey();
  final _segurancaKey = GlobalKey();
  final _escalaKey = GlobalKey();
  final _fullStackKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    seo_meta.applyTecnologiasSeoMetaTags();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToInitialTopic());
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    seo_meta.restoreGlobalSeoMetaTags();
    super.dispose();
  }

  void _scrollToInitialTopic() {
    final keyByTopic = <String, GlobalKey>{
      TecnologiasPage.topicCleanArch: _cleanArchKey,
      TecnologiasPage.topicSeguranca: _segurancaKey,
      TecnologiasPage.topicEscala: _escalaKey,
      TecnologiasPage.topicFullStack: _fullStackKey,
    };
    final selectedKey = keyByTopic[widget.initialTopic];
    final targetContext = selectedKey?.currentContext;
    if (targetContext == null) return;
    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 520),
      curve: Curves.easeOutCubic,
      alignment: 0.24,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final w = MediaQuery.sizeOf(context).width;
    final padH = w < 400 ? 16.0 : 24.0;
    return Semantics(
      label: 'Tecnologias Flutter e stack principal da PerfectGest I',
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: cs.surface.withValues(alpha: 0.96),
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: cs.primary),
            tooltip: 'Voltar para a página principal',
            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
          ),
          title: Text('Parceiros tecnológicos', style: GoogleFonts.inter(fontWeight: FontWeight.w700, color: cs.onSurface)),
          actions: [
            if (widget.onToggleTheme != null)
              IconButton(
                tooltip: Theme.of(context).brightness == Brightness.dark ? 'Tema claro' : 'Tema escuro',
                onPressed: widget.onToggleTheme,
                icon: Icon(
                  Theme.of(context).brightness == Brightness.dark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  color: cs.primary,
                ),
              ),
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollCtrl,
          padding: EdgeInsets.fromLTRB(padH, 16, padH, 28),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stack Flutter e tecnologias da PerfectGest I',
                    style: GoogleFonts.inter(fontSize: w < 400 ? 22 : 26, fontWeight: FontWeight.w800, color: cs.onSurface, height: 1.2),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Nossa estratégia técnica conecta arquitetura, dados, experiência de utilização e operação contínua. Cada componente abaixo foi pensado para funcionar em conjunto, reduzindo riscos e acelerando entregas com qualidade previsível.',
                    style: GoogleFonts.inter(fontSize: 14, height: 1.5, color: cs.onSurface.withValues(alpha: 0.82)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Fluxo integrado: base técnica sólida -> dados confiáveis -> experiência consistente -> operação mensurável. Assim, cada decisão reforça a próxima etapa e mantém coerência entre discurso comercial e execução de produto.',
                    style: GoogleFonts.inter(fontSize: 13.6, height: 1.5, color: cs.onSurface.withValues(alpha: 0.8)),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Diferenciais do Portfólio',
                    style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w800, color: cs.onSurface),
                  ),
                  const SizedBox(height: 10),
                  _TechItem(
                    key: _cleanArchKey,
                    title: 'Clean Arch',
                    body:
                        'Aplicamos arquitetura limpa com separação clara de responsabilidades, camadas desacopladas e componentes reutilizáveis. Isso acelera evolução de produto, melhora testes e reduz custo de manutenção.',
                    example:
                        'Exemplo prático: ao alterar uma regra de orçamento, ajustamos somente a camada de domínio sem quebrar interface ou integrações externas.',
                  ),
                  _TechItem(
                    key: _segurancaKey,
                    title: 'Segurança',
                    body:
                        'Adotamos boas práticas de segurança em autenticação, gestão de sessão, políticas de conteúdo web e proteção de dados. O objetivo é reduzir risco operacional e elevar confiança em produção.',
                    example:
                        'Exemplo prático: protegemos rotas sensíveis com validação de sessão e aplicamos CSP no web para bloquear scripts não autorizados.',
                  ),
                  _TechItem(
                    key: _escalaKey,
                    title: 'Escala',
                    body:
                        'Projetamos soluções para crescer com o negócio, com foco em performance, observabilidade e integração de serviços. A arquitetura é preparada para aumento de utilizadores e novos módulos.',
                    example:
                        'Exemplo prático: em campanhas sazonais, ampliamos serviços de API e cache sem refazer o app, mantendo estabilidade durante pico de acesso.',
                  ),
                  _TechItem(
                    key: _fullStackKey,
                    title: 'Full-Stack',
                    body:
                        'Atuamos do front-end ao back-end, conectando Flutter, APIs, serviços de dados, integrações corporativas e automação de build. Isso garante entregas consistentes em todo o ciclo do produto.',
                    example:
                        'Exemplo prático: publicamos uma funcionalidade completa de venda, desde a tela mobile até API, banco de dados e monitoramento.',
                  ),
                  const SizedBox(height: 8),
                  const _TechItem(
                    title: 'Flutter + Dart (base multiplataforma)',
                    body:
                        'Usamos Flutter como framework principal e Dart como linguagem para entregar uma base única de código com alta produtividade, consistência de interface e excelente performance em Android, iOS, Web e Desktop.',
                    example:
                        'Exemplo prático: um mesmo módulo de cadastro é compartilhado entre mobile e web, reduzindo retrabalho e tempo de lançamento.',
                  ),
                  const _TechItem(
                    title: 'Banco de dados offline (Dart/Flutter)',
                    body:
                        'Para persistência local e uso sem internet, utilizamos SQLite (sqflite/drift), Isar e Hive. Essa camada local mantém performance, resposta rápida da interface e continuidade das operações mesmo em cenários com conectividade limitada.',
                    example:
                        'Exemplo prático: técnico em campo registra atendimento sem internet e o app mantém os dados locais até a conexão voltar.',
                  ),
                  const _TechItem(
                    title: 'Banco de dados online (Dart/Flutter)',
                    body:
                        'Para sincronização e dados em nuvem, trabalhamos com Cloud Firestore, Firebase Realtime Database e Supabase/PostgreSQL. Isso permite backup, atualização em tempo real e acesso multiutilizador com confiabilidade em produção.',
                    example:
                        'Exemplo prático: alterações no estoque feitas no painel web aparecem quase em tempo real no app da equipe comercial.',
                  ),
                  const _TechItem(
                    title: 'Java (integrações e backend enterprise)',
                    body:
                        'Utilizamos Java em integrações corporativas e serviços de apoio para ambientes que exigem robustez, segurança e compatibilidade com ecossistemas enterprise, conectando aplicações Flutter a APIs e sistemas legados.',
                    example:
                        'Exemplo prático: integração com ERP legado para sincronizar pedidos e faturamento sem alterar o sistema principal do cliente.',
                  ),
                  const _TechItem(
                    title: 'Gradle (build e automação Android)',
                    body:
                        'No Android, usamos Gradle para gerenciamento de dependências, variantes de build e automação de pipeline. Isso melhora a previsibilidade de releases, organização de ambientes e qualidade contínua de entrega.',
                    example:
                        'Exemplo prático: geramos builds separados para homologação e produção com variáveis de ambiente e assinaturas distintas.',
                  ),
                  const _TechItem(
                    title: 'SDKs de terceiros e integrações nativas',
                    body:
                        'Integramos SDKs nativos e bibliotecas especializadas para recursos de negócio como autenticação, pagamentos, analytics, notificações e serviços proprietários, mantendo estabilidade e desempenho em produção.',
                    example:
                        'Exemplo prático: adicionamos gateway de pagamento e autenticação biométrica mantendo UX fluida em Android e iOS.',
                  ),
                  const _TechItem(
                    title: 'Material 3 e UI responsiva',
                    body:
                        'Adotamos Material 3, LayoutBuilder e breakpoints responsivos para criar interfaces adaptáveis a celulares, tablets e desktop. Isso melhora experiência do utilizador, retenção e métricas de usabilidade.',
                    example:
                        'Exemplo prático: a mesma jornada de compra se reorganiza automaticamente para tablet e desktop sem duplicar tela.',
                  ),
                  const _TechItem(
                    title: 'Integrações web e SEO técnico',
                    body:
                        'Implementamos metatags dinâmicas, Open Graph, canonical, robots.txt e sitemap.xml para melhorar rastreamento e indexação no Google. Também aplicamos boas práticas de segurança com Content Security Policy e políticas de permissões.',
                    example:
                        'Exemplo prático: página de serviço ganha preview otimizado no WhatsApp e melhor posicionamento orgânico no Google.',
                  ),
                  const _TechItem(
                    title: 'Analytics e consentimento (GA4)',
                    body:
                        'Medição com Google Analytics 4 integrada ao fluxo de consentimento de cookies. Isso permite análise de comportamento com respeito à privacidade e conformidade com políticas modernas de medição.',
                    example:
                        'Exemplo prático: funil de conversão registra apenas eventos consentidos e orienta ajustes de UX com base em dados reais.',
                  ),
                  const _TechItem(
                    title: 'Arquitetura limpa e manutenção',
                    body:
                        'Priorizamos código organizado, componentes reutilizáveis e separação de responsabilidades para facilitar evolução contínua do produto, redução de bugs e menor custo de manutenção.',
                    example:
                        'Exemplo prático: nova funcionalidade de assinatura é incluída reaproveitando componentes e reduzindo esforço de QA.',
                  ),
                  const _TechItem(
                    title: 'Integrações HTTP e serviços externos',
                    body:
                        'Integramos APIs externas e serviços de dados para fluxos reais de negócio, incluindo endpoints de back-end e serviços de observabilidade, garantindo confiabilidade operacional e evolução orientada a métricas.',
                    example:
                        'Exemplo prático: monitoramos latência e erro das APIs em produção para agir rápido antes de impactar clientes.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TechItem extends StatelessWidget {
  const _TechItem({super.key, required this.title, required this.body, this.example});

  final String title;
  final String body;
  final String? example;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: cs.surfaceContainerHighest.withValues(alpha: 0.55),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: cs.outline.withValues(alpha: 0.35)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.inter(fontSize: 15.5, fontWeight: FontWeight.w700, color: cs.primary)),
              const SizedBox(height: 6),
              const SizedBox(height: 2),
              Text(
                'Conceito aplicado:',
                style: GoogleFonts.inter(fontSize: 12.8, height: 1.4, color: cs.primary.withValues(alpha: 0.9), fontWeight: FontWeight.w700),
              ),
              Text(
                body,
                style: GoogleFonts.inter(fontSize: 12.8, height: 1.45, color: cs.onSurface.withValues(alpha: 0.84)),
              ),
              if (example != null) ...[
                const SizedBox(height: 8),
                Text(
                  example!,
                  style: GoogleFonts.inter(fontSize: 12.8, height: 1.45, color: cs.primary.withValues(alpha: 0.92), fontWeight: FontWeight.w600),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
