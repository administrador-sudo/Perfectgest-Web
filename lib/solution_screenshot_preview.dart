import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'l10n/app_localizations.dart';

/// Abre captura em tamanho grande — imagem preenche o pop-up; zoom com [InteractiveViewer].
Future<void> showSolutionScreenshotPreview(
  BuildContext context, {
  required String imageAsset,
  String? fallbackImageAsset,
  required String title,
}) {
  final l10n = AppLocalizations.of(context);
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (dialogContext) {
      final cs = Theme.of(dialogContext).colorScheme;
      final size = MediaQuery.sizeOf(dialogContext);
      final maxW = math.min(size.width - 32, 960.0);
      final maxH = size.height * 0.88;

      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        backgroundColor: cs.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SizedBox(
          width: maxW,
          height: maxH,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 4, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: cs.onSurface,
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: l10n.solPreviewClose,
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      icon: Icon(Icons.close_rounded, color: cs.onSurface),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(
                  l10n.solPreviewZoomHint,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: cs.onSurface.withValues(alpha: 0.65),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ColoredBox(
                      color: cs.surfaceContainerHighest,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final viewW = constraints.maxWidth;
                          final viewH = constraints.maxHeight;
                          return InteractiveViewer(
                            minScale: 0.85,
                            maxScale: 5,
                            clipBehavior: Clip.hardEdge,
                            boundaryMargin: const EdgeInsets.all(48),
                            child: _PreviewImage(
                              imageAsset: imageAsset,
                              fallbackImageAsset: fallbackImageAsset,
                              width: viewW,
                              height: viewH,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _PreviewImage extends StatelessWidget {
  const _PreviewImage({
    required this.imageAsset,
    this.fallbackImageAsset,
    required this.width,
    required this.height,
  });

  final String imageAsset;
  final String? fallbackImageAsset;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        imageAsset,
        width: width,
        height: height,
        fit: BoxFit.contain,
        alignment: Alignment.center,
        filterQuality: FilterQuality.high,
        errorBuilder: (context, error, stackTrace) {
          if (fallbackImageAsset != null) {
            return Image.asset(
              fallbackImageAsset!,
              width: width,
              height: height,
              fit: BoxFit.contain,
              alignment: Alignment.center,
              filterQuality: FilterQuality.high,
              errorBuilder: (context, error, stackTrace) => _brokenPlaceholder(width, height),
            );
          }
          return _brokenPlaceholder(width, height);
        },
      ),
    );
  }

  Widget _brokenPlaceholder(double w, double h) {
    return SizedBox(
      width: w,
      height: h,
      child: const Center(child: Icon(Icons.broken_image_outlined, size: 48)),
    );
  }
}
