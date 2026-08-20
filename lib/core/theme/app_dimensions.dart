import 'package:flutter/widgets.dart';

abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 32;

  static const double screenHorizontal = 20;

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: screenHorizontal,
  );
}

abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
}

abstract final class AppSizes {
  static const double designWidth = 360;
  static const double designHeight = 800;
  static const double maxContentWidth = 480;
  static const double buttonHeight = 56;
  static const double indicatorDot = 6;
  static const double indicatorActiveDot = 10;

  static const double titleUnderlineOffset = 20;
  static const double onboardingTitleMinHeight = 64;
}
