import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'devolucao_page.dart' deferred as devolucao;
import 'clinica_iii_legal_pages.dart' deferred as clinica_iii;
import 'elastic_service.dart' deferred as elastic;
import 'metallic_preview_page.dart' deferred as metallic;
import 'politica_page.dart' deferred as politica;
import 'pre_cadastro_page.dart' deferred as pre_cadastro;
import 'tecnologias_page.dart' deferred as tecnologias;

/// IDs de tópicos (espelham [tecnologias.TecnologiasPage] no chunk diferido).
const kTecnologiaTopicCleanArch = 'clean-arch';
const kTecnologiaTopicSeguranca = 'seguranca';
const kTecnologiaTopicEscala = 'escala';
const kTecnologiaTopicFullStack = 'full-stack';

typedef DeferredPageBuilder = Widget Function();

/// Carrega um chunk diferido antes de montar a página.
class DeferredRouteLoader extends StatefulWidget {
  const DeferredRouteLoader({
    super.key,
    required this.loadLibrary,
    required this.builder,
  });

  final Future<void> Function() loadLibrary;
  final DeferredPageBuilder builder;

  @override
  State<DeferredRouteLoader> createState() => _DeferredRouteLoaderState();
}

class _DeferredRouteLoaderState extends State<DeferredRouteLoader> {
  late final Future<void> _loadFuture;

  @override
  void initState() {
    super.initState();
    _loadFuture = widget.loadLibrary();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _loadFuture,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary),
            ),
          );
        }
        if (snap.hasError) {
          return const Scaffold(body: Center(child: Text('Erro ao carregar a página.')));
        }
        return widget.builder();
      },
    );
  }
}

Widget buildPoliticaDevolucaoPage() {
  return DeferredRouteLoader(
    loadLibrary: devolucao.loadLibrary,
    builder: () => devolucao.PoliticaDevolucaoPage(),
  );
}

Widget buildPoliticaPrivacidadeSitePage({VoidCallback? onToggleTheme}) {
  return DeferredRouteLoader(
    loadLibrary: politica.loadLibrary,
    builder: () => politica.PoliticaPrivacidadePage(onToggleTheme: onToggleTheme),
  );
}

Widget buildPreCadastroPage({VoidCallback? onToggleTheme}) {
  return DeferredRouteLoader(
    loadLibrary: pre_cadastro.loadLibrary,
    builder: () => pre_cadastro.PreCadastroPage(onToggleTheme: onToggleTheme),
  );
}

Widget buildClinicaIiiPrivacyPage() {
  return DeferredRouteLoader(
    loadLibrary: clinica_iii.loadLibrary,
    builder: () => clinica_iii.ClinicaIiiPrivacyPolicyPage(),
  );
}

Widget buildClinicaIiiTermsPage() {
  return DeferredRouteLoader(
    loadLibrary: clinica_iii.loadLibrary,
    builder: () => clinica_iii.ClinicaIiiTermsPage(),
  );
}

Widget buildClinicaIiiHealthLgpdPage() {
  return DeferredRouteLoader(
    loadLibrary: clinica_iii.loadLibrary,
    builder: () => clinica_iii.ClinicaIiiHealthLgpdPage(),
  );
}

Future<void> openPreCadastroPage(
  BuildContext context, {
  VoidCallback? onToggleTheme,
}) async {
  await pre_cadastro.loadLibrary();
  if (!context.mounted) return;
  await Navigator.of(context).push<void>(
    MaterialPageRoute<void>(
      builder: (_) => pre_cadastro.PreCadastroPage(onToggleTheme: onToggleTheme),
    ),
  );
}

Widget buildMetallicPreviewPage() {
  return DeferredRouteLoader(
    loadLibrary: metallic.loadLibrary,
    builder: () => metallic.MetallicPreviewPage(),
  );
}

Future<void> openPoliticaDevolucaoPage(BuildContext context) async {
  if (kIsWeb) {
    await Navigator.of(context).pushNamed<void>('/politica-devolucao');
    return;
  }
  await devolucao.loadLibrary();
  if (!context.mounted) return;
  await Navigator.of(context).push<void>(
    MaterialPageRoute<void>(
      builder: (_) => devolucao.PoliticaDevolucaoPage(),
    ),
  );
}

Future<void> openPoliticaPrivacidadePage(
  BuildContext context, {
  VoidCallback? onToggleTheme,
}) async {
  if (kIsWeb) {
    await Navigator.of(context).pushNamed<void>(
      '/politica-privacidade-site',
    );
    return;
  }
  await politica.loadLibrary();
  if (!context.mounted) return;
  await Navigator.of(context).push<void>(
    MaterialPageRoute<void>(
      builder: (_) => politica.PoliticaPrivacidadePage(onToggleTheme: onToggleTheme),
    ),
  );
}

Future<void> openTecnologiasPage(
  BuildContext context, {
  VoidCallback? onToggleTheme,
  String? initialTopic,
}) async {
  await tecnologias.loadLibrary();
  if (!context.mounted) return;
  await Navigator.of(context).push<void>(
    MaterialPageRoute<void>(
      builder: (_) => tecnologias.TecnologiasPage(
        onToggleTheme: onToggleTheme,
        initialTopic: initialTopic,
      ),
    ),
  );
}

Future<void> pingElasticWakeTest() async {
  await elastic.loadLibrary();
  await elastic.ElasticService.enviarTeste();
}
