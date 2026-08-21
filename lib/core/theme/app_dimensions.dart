import 'package:flutter/widgets.dart';

abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 40;

  static const double screenHorizontal = 20;

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: screenHorizontal,
  );
}

abstract final class AppRadius {
  static const double sm = 8;
  static const double card = 14;
  static const double md = 12;
  static const double lg = 16;
}

abstract final class AppSizes {
  static const double designWidth = 360;
  static const double designHeight = 800;
  static const double maxContentWidth = 480;
  static const double minComfortableHeight = 520;
  static const double buttonHeight = 56;
  static const double indicatorDot = 6;
  static const double indicatorActiveDot = 10;

  static const double titleUnderlineOffset = 20;
  static const double onboardingTitleMinHeight = 64;

  static const double paywallHeaderRatio = 1398 / 1080;
  static const double paywallHeaderTextAnchor = 0.60;
  static const double featureCardWidth = 155;
  static const double featureCardHeight = 124;
  static const double featureIconBox = 36;
  static const double planRadio = 24;
  static const double planCardPadding = 14;
  static const double featureCardBlur = 8;
  static const double featureCardGap = 10;
  static const double featureCardTrailingPadding = 42;
  static const double badgePaddingHorizontal = 10;
  static const double borderThin = 0.5;
  static const double borderThick = 1.5;
  static const double maxTextScale = 1.3;
  static const double closeButton = 16;

  static const double searchFieldHeight = 52;
  static const double bannerHeight = 64;
  static const double bannerIcon = 40;
  static const double questionCardWidth = 240;
  static const double questionCardHeight = 160;
  static const double categoryAspectRatio = 1;
  static const double categoryTitleWidthFactor = 0.7;
  static const double navBarHeight = 80;
  static const double navIcon = 26;
  static const double navActionButton = 66;

  static const double skeletonTitleWidth = 120;
  static const double skeletonTitleHeight = 24;
}
