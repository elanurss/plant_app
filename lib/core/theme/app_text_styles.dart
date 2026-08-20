import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  static const String fontFamily = 'Roboto';

  static const TextStyle headlineRegular = TextStyle(
    fontSize: 28,
    height: 1,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle headlineEmphasis = TextStyle(
    fontSize: 28,
    height: 1,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    height: 22 / 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonLabel = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 11,
    height: 15 / 11,
    fontWeight: FontWeight.w400,
  );

  static const TextTheme textTheme = TextTheme(
    headlineLarge: headlineRegular,
    headlineMedium: headlineEmphasis,
    bodyLarge: bodyLarge,
    labelLarge: buttonLabel,
    labelSmall: caption,
  );
}
