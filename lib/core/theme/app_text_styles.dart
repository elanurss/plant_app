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

  static const TextStyle homeGreeting = TextStyle(
    fontSize: 24,
    height: 28 / 24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 20,
    height: 24 / 20,
    fontWeight: FontWeight.w600,
  );

  static const TextTheme textTheme = TextTheme(
    headlineLarge: headlineRegular,
    headlineMedium: headlineEmphasis,
    bodyLarge: bodyLarge,
    labelLarge: buttonLabel,
    labelSmall: caption,
  );

  static const TextStyle paywallTitle = TextStyle(
    fontSize: 27,
    letterSpacing: 0.38,
    height: 27 / 27,
  );

  static const TextStyle paywallSubtitle = TextStyle(
    fontSize: 17,
    letterSpacing: 0.38,
    height: 24 / 17,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle featureTitle = TextStyle(
    fontSize: 20,
    height: 24 / 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle featureSubtitle = TextStyle(
    fontSize: 13,
    height: 18 / 13,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle planTitle = TextStyle(
    fontSize: 16,
    height: 20 / 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle planSubtitle = TextStyle(
    fontSize: 12,
    height: 15 / 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle badgeLabel = TextStyle(
    fontSize: 12,
    height: 18 / 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle disclaimer = TextStyle(
    fontSize: 9,
    height: 12 / 9,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle footerLink = TextStyle(
    fontSize: 11,
    height: 15 / 11,
    fontWeight: FontWeight.w300,
  );
}
