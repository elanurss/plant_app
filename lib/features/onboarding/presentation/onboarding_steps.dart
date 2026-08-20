import 'package:flutter/widgets.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_strings.dart';

class OnboardingStep {
  const OnboardingStep({
    required this.title,
    required this.image,
    this.fit = BoxFit.cover,
  });

  final String title;
  final String image;
  final BoxFit fit;
}

const List<OnboardingStep> onboardingSteps = [
  //I set it this way because the scan image exported from Figma had some empty space below the phone.
  // With cover, it crops from the top to fill the box.
  //Using contain keeps the entire phone visible until the asset is re-exported without that extra empty space.
  OnboardingStep(
    title: AppStrings.scanStepTitle,
    image: AppAssets.scanPhone,
    fit: BoxFit.contain,
  ),
  OnboardingStep(title: AppStrings.guideStepTitle, image: AppAssets.guidePhone),
];
