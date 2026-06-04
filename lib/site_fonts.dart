import 'package:google_fonts/google_fonts.dart';

/// Fontes Inter / JetBrains Mono em [assets/fonts] — sem fetch em runtime (PageSpeed).
void configureSiteFonts() {
  GoogleFonts.config.allowRuntimeFetching = false;
}
