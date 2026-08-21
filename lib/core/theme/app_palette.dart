import 'package:flutter/material.dart';

@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.background,
    required this.surface,
    required this.surfaceBorder,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.searchFill,
    required this.searchHint,
    required this.navSurface,
    required this.navInactive,
    required this.indicatorActive,
    required this.indicatorInactive,
    required this.skeletonBase,
    required this.skeletonHighlight,
  });

  final Color background;
  final Color surface;
  final Color surfaceBorder;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color searchFill;
  final Color searchHint;
  final Color navSurface;
  final Color navInactive;
  final Color indicatorActive;
  final Color indicatorInactive;
  final Color skeletonBase;
  final Color skeletonHighlight;

  static const AppPalette light = AppPalette(
    background: Color(0xFFF6F6F6),
    surface: Color(0xFFFDFFFD),
    surfaceBorder: Color(0x1F28AF6E),
    textPrimary: Color(0xFF13231B),
    textSecondary: Color(0xB313231B),
    textMuted: Color(0xB3597165),
    searchFill: Color(0xFFFFFFFF),
    searchHint: Color(0xFFAFAFAF),
    navSurface: Color(0xFFFFFFFF),
    navInactive: Color(0xFFB6B6B6),
    indicatorActive: Color(0xFF13231B),
    indicatorInactive: Color(0x2613231B),
    skeletonBase: Color(0xFFE6E8E7),
    skeletonHighlight: Color(0xFFF7F9F8),
  );

  static const AppPalette dark = AppPalette(
    background: Color(0xFF0C1611),
    surface: Color(0xFF16241C),
    surfaceBorder: Color(0x3D28AF6E),
    textPrimary: Color(0xFFFDFFFE),
    textSecondary: Color(0xB3FDFFFE),
    textMuted: Color(0x99CFE0D5),
    searchFill: Color(0xFF16241C),
    searchHint: Color(0xFF7C8E84),
    navSurface: Color(0xFF101E17),
    navInactive: Color(0xFF7C8E84),
    indicatorActive: Color(0xFFFDFFFE),
    indicatorInactive: Color(0x33FDFFFE),
    skeletonBase: Color(0xFF1C2B22),
    skeletonHighlight: Color(0xFF27392F),
  );

  @override
  AppPalette copyWith({
    Color? background,
    Color? surface,
    Color? surfaceBorder,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? searchFill,
    Color? searchHint,
    Color? navSurface,
    Color? navInactive,
    Color? indicatorActive,
    Color? indicatorInactive,
    Color? skeletonBase,
    Color? skeletonHighlight,
  }) {
    return AppPalette(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceBorder: surfaceBorder ?? this.surfaceBorder,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      searchFill: searchFill ?? this.searchFill,
      searchHint: searchHint ?? this.searchHint,
      navSurface: navSurface ?? this.navSurface,
      navInactive: navInactive ?? this.navInactive,
      indicatorActive: indicatorActive ?? this.indicatorActive,
      indicatorInactive: indicatorInactive ?? this.indicatorInactive,
      skeletonBase: skeletonBase ?? this.skeletonBase,
      skeletonHighlight: skeletonHighlight ?? this.skeletonHighlight,
    );
  }

  @override
  AppPalette lerp(covariant AppPalette? other, double t) {
    if (other == null) {
      return this;
    }

    return AppPalette(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceBorder: Color.lerp(surfaceBorder, other.surfaceBorder, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      searchFill: Color.lerp(searchFill, other.searchFill, t)!,
      searchHint: Color.lerp(searchHint, other.searchHint, t)!,
      navSurface: Color.lerp(navSurface, other.navSurface, t)!,
      navInactive: Color.lerp(navInactive, other.navInactive, t)!,
      indicatorActive: Color.lerp(indicatorActive, other.indicatorActive, t)!,
      indicatorInactive: Color.lerp(
        indicatorInactive,
        other.indicatorInactive,
        t,
      )!,
      skeletonBase: Color.lerp(skeletonBase, other.skeletonBase, t)!,
      skeletonHighlight: Color.lerp(
        skeletonHighlight,
        other.skeletonHighlight,
        t,
      )!,
    );
  }
}

extension AppPaletteX on BuildContext {
  AppPalette get palette =>
      Theme.of(this).extension<AppPalette>() ?? AppPalette.light;
}
