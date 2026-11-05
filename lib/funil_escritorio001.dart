import 'contabilidade_funil_page.dart';
import 'funil_apresentacao_app.dart';
import 'site_public_urls.dart';

const FunilEscritorioPerfil kFunilEscritorio001 = FunilEscritorioPerfil(
  id: 'Escritorio001',
  rota: kContabilidadeEscritorio001Path,
  imagens: kFunilApresentacaoImagens,
  enviaCadastroNuvem: false,
  legendasPt: kFunilApresentacaoLegendasPt,
  legendasEn: kFunilApresentacaoLegendasEn,
  legendasEs: kFunilApresentacaoLegendasEs,
  textosPt: kFunilApresentacaoTextosPt,
  textosEn: kFunilApresentacaoTextosEn,
  textosEs: kFunilApresentacaoTextosEs,
);

class ContabilidadeFunilEscritorio001Page extends ContabilidadeFunilPage {
  const ContabilidadeFunilEscritorio001Page({super.key})
      : super(perfil: kFunilEscritorio001);
}
