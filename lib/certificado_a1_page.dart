import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'a1_quality_cert_pop.dart';
import 'company_legal.dart';
import 'contabilidade_funil_page.dart';
import 'funil_a1_service.dart';
import 'funil_pix_ticket_pop.dart';
import 'l10n/site_contabilidade_funil_texts.dart';
import 'locale_controller.dart';
import 'metallic_site_shell.dart';
import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;
import 'site_public_urls.dart';
import 'site_surface.dart';

class CertificadoA1Page extends StatefulWidget {
  const CertificadoA1Page({super.key});

  @override
  State<CertificadoA1Page> createState() => _CertificadoA1PageState();
}

class _CertificadoA1PageState extends State<CertificadoA1Page> {
  @override
  void initState() {
    super.initState();
    seo_meta.applyCertificadoA1SeoMetaTags();
  }

  void _goHome() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushReplacementNamed('/');
    }
  }

  Future<void> _adquirir(String tipoPessoa) async {
    final pago = await showFunilPixTicket(
      context: context,
      titulo: 'Certificado A1 QualityCert',
      linhas: const [
        FunilPixLinha(
          descricao: 'Certificado A1 QualityCert',
          valor: kFunilA1Ano,
        ),
      ],
      txidPrefixo: 'A1',
    );
    if (!mounted || !pago) return;
    FunilPixSessao.a1PagoAvulso = true;
    await showA1QualityCertPop(
      context,
      prefill: FunilA1Prefill(tipoPessoa: tipoPessoa),
    );
  }

  @override
  Widget build(BuildContext context) {
    final st = SiteContabilidadeFunilTexts.of(context);
    final narrow = MediaQuery.sizeOf(context).width < 720;

    return Semantics(
      label: st.a1PageSemantics,
      child: SiteBackgroundShell(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              _A1Header(st: st),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    narrow ? 16 : 24,
                    20,
                    narrow ? 16 : 24,
                    48,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 720),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SiteRaisedBlock(
                            borderColor: kFunilA1Purple,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Image.asset(
                                  FunilImg.qualityCert,
                                  height: 52,
                                  width: 200,
                                  fit: BoxFit.contain,
                                  alignment: Alignment.centerLeft,
                                  filterQuality: FilterQuality.high,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  st.a1PageHeroTitle,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 22,
                                    color: kFunilA1Purple,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  st.a1VideoTitle,
                                  style: const TextStyle(
                                    color: kFunilA1Purple,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  st.a1Price,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  st.a1PageHeroLead,
                                  style: siteBodyTextStyle(
                                    context,
                                    fontSize: 14.5,
                                    height: 1.45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SiteRaisedBlock(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                siteSectionTitle(
                                  context,
                                  st.a1PageStepsTitle,
                                  accentKey: st.a1PageStepsTitle,
                                  fontSize: 18,
                                ),
                                const SizedBox(height: 10),
                                for (var i = 1; i <= 6; i++) ...[
                                  Text(
                                    st.a1PageStepTitle(i),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: kFunilA1Purple,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    st.a1PageStepBody(i),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      height: 1.4,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                ],
                                Text(
                                  st.a1Avisos,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          _A1OfferCard(
                            titulo: st.a1PageCardCnpj,
                            onAdquirir: () => _adquirir('PJ'),
                          ),
                          const SizedBox(height: 12),
                          _A1OfferCard(
                            titulo: st.a1PageCardCpf,
                            onAdquirir: () => _adquirir('PF'),
                          ),
                          const SizedBox(height: 28),
                          _A1Footer(st: st, onHome: _goHome),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _A1OfferCard extends StatelessWidget {
  const _A1OfferCard({required this.titulo, required this.onAdquirir});

  final String titulo;
  final VoidCallback onAdquirir;

  @override
  Widget build(BuildContext context) {
    final st = SiteContabilidadeFunilTexts.of(context);
    return SiteRaisedBlock(
      borderColor: kFunilA1Purple,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            FunilImg.qualityCert,
            height: 40,
            width: 160,
            fit: BoxFit.contain,
            alignment: Alignment.centerLeft,
            filterQuality: FilterQuality.high,
          ),
          const SizedBox(height: 8),
          Text(
            titulo,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          Text(
            st.a1Price,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(st.a1Body, style: const TextStyle(fontSize: 13, height: 1.35)),
          const SizedBox(height: 12),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: kFunilA1Purple,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
            onPressed: onAdquirir,
            child: Text(
              st.a1BuyCta,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, height: 1.25),
            ),
          ),
        ],
      ),
    );
  }
}

class _A1Header extends StatelessWidget {
  const _A1Header({required this.st});

  final SiteContabilidadeFunilTexts st;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: siteHeaderBackground(context),
      elevation: 0,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Row(
            children: [
              const Spacer(),
              _LangChip(code: 'pt', label: st.langPt),
              _LangChip(code: 'en', label: st.langEn),
              _LangChip(code: 'es', label: st.langEs),
            ],
          ),
        ),
      ),
    );
  }
}

class _LangChip extends StatelessWidget {
  const _LangChip({required this.code, required this.label});

  final String code;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale?>(
      valueListenable: appLocaleController,
      builder: (context, manual, _) {
        final active =
            (manual?.languageCode ?? Localizations.localeOf(context).languageCode) ==
                code;
        return Padding(
          padding: const EdgeInsets.only(left: 4),
          child: TextButton(
            onPressed: () => appLocaleController.setLocale(Locale(code)),
            style: TextButton.styleFrom(
              foregroundColor: active
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.primary,
              backgroundColor:
                  active ? Theme.of(context).colorScheme.primary : Colors.transparent,
              minimumSize: const Size(40, 36),
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        );
      },
    );
  }
}

class _A1Footer extends StatelessWidget {
  const _A1Footer({required this.st, required this.onHome});

  final SiteContabilidadeFunilTexts st;
  final VoidCallback onHome;

  @override
  Widget build(BuildContext context) {
    Widget appDoc(String label, String url) {
      return TextButton(
        onPressed: () =>
            launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
        child: Text(label, style: const TextStyle(fontSize: 13)),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(kCompanyLegalName, style: const TextStyle(fontWeight: FontWeight.w800)),
        const SizedBox(height: 6),
        Text(st.footerLegal, style: const TextStyle(fontSize: 13, height: 1.4)),
        const SizedBox(height: 6),
        Text(st.footerCrc, style: const TextStyle(fontSize: 13, height: 1.4)),
        const SizedBox(height: 8),
        Text('Honorarios: ${st.honorariosEmail}', style: const TextStyle(fontSize: 13)),
        Text('App: ${st.appEmail}', style: const TextStyle(fontSize: 13)),
        const SizedBox(height: 8),
        Wrap(
          children: [
            appDoc(st.footerPrivacyApp, kPerfectGestContabilIPrivacyUrl),
            appDoc(st.footerTerms, kPerfectGestContabilITermsUrl),
            appDoc(st.footerDeletion, kPerfectGestContabilIDeletionUrl),
            appDoc(st.footerFaqApp, kPerfectGestContabilIFaqUrl),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(kSitePrivacyPolicyPath),
              child: Text(
                st.footerPrivacySite,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
        TextButton(onPressed: onHome, child: Text(st.backHome)),
      ],
    );
  }
}
