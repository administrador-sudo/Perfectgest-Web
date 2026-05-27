import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'l10n/app_localizations.dart';

/// Abre captura em tamanho grande (zoom com [InteractiveViewer]).
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
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxW, maxHeight: maxH),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ColoredBox(
                      color: cs.surfaceContainerHighest,
                      child: InteractiveViewer(
                        minScale: 0.6,
                        maxScale: 4,
                        child: _PreviewImage(
                          imageAsset: imageAsset,
                          fallbackImageAsset: fallbackImageAsset,
                        ),
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
  const _PreviewImage({required this.imageAsset, this.fallbackImageAsset});

  final String imageAsset;
  final String? fallbackImageAsset;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageAsset,
      fit: BoxFit.contain,
      alignment: Alignment.center,
      errorBuilder: (context, error, stackTrace) {
        if (fallbackImageAsset != null) {
          return Image.asset(
            fallbackImageAsset!,
            fit: BoxFit.contain,
            alignment: Alignment.center,
            errorBuilder: (context, error, stackTrace) => const SizedBox(
              width: 280,
              height: 420,
              child: Center(child: Icon(Icons.broken_image_outlined, size: 48)),
            ),
          );
        }
        return const SizedBox(
          width: 280,
          height: 420,
          child: Center(child: Icon(Icons.broken_image_outlined, size: 48)),
        );
      },
    );
  }
}
