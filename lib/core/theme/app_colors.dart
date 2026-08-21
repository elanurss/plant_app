import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color primary = Color(0xFF28AF6E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color textPrimary = Color(0xFF13231B);
  static const Color textSecondary = Color(0xB313231B);
  static const Color textMuted = Color(0xB3597165);

  static const Color background = Color(0xFFFDFFFE);
  static const Color surface = Color(0xFFFDFFFE);
  static const Color divider = Color(0xFFE8E8E8);

  static const Color indicatorActive = Color(0xFF13231B);
  static const Color indicatorInactive = Color(0x2613231B);

  static const Color darkBackground = Color(0xFF101E17);
  static const Color darkSurface = Color(0xFF1C2B22);
  static const Color darkTextPrimary = Color(0xFFFDFFFE);
  static const Color darkTextSecondary = Color(0xB3FDFFFE);

  static const Color paywallBackground = Color(0xFF101E17);
  static const Color paywallCardSurface = Color(0x14FFFFFF);
  static const Color paywallPlanSurface = Color(0x0DFFFFFF);
  static const Color paywallPlanBorder = Color(0x4DFFFFFF);
  static const Color paywallIconSurface = Color(0x3D000000);
  static const Color paywallScrim = Color(0x4D000000);

  static const List<Color> paywallSelectedGradient = [
    Color(0x0028AF6E),
    Color(0x3D28AF6E),
  ];
  static const Color paywallTextPrimary = Color(0xFFFFFFFF);
  static const Color paywallTextSecondary = Color(0xB3FFFFFF);
  static const Color paywallTextMuted = Color(0x80FFFFFF);

  static const Color homeBackground = Color(0xFFF6F6F6);
  static const Color searchFill = Color(0xFFFFFFFF);
  static const Color searchHint = Color(0xFFAFAFAF);
  static const Color bannerBackground = Color(0xFF24201A);
  static const Color bannerAccent = Color(0xFFFFDE9C);
  static const Color bannerYellow = Color(0xFFF5C25B);
  static const Color arrowForward = Color(0xFFD0B070);

  static const List<Color> bannerTitleGradient = [bannerAccent, bannerYellow];

  static const Color questionOverlay = Color(0xB3161B15);
  static const Color categoryCard = Color(0xFFFDFFFD);
  static const Color categoryBorder = Color(0x1F28AF6E);
  static const Color navSurface = Color(0xFFFFFFFF);
  static const Color navInactive = Color(0xFFB6B6B6);
  static const Color badgeAlert = Color(0xFFE94B3C);
}
