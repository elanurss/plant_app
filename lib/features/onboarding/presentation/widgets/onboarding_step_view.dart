import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimensions.dart';
import '../../../../shared/widgets/illustration_image.dart';
import '../onboarding_steps.dart';
import 'onboarding_title.dart';

class OnboardingStepView extends StatelessWidget {
  const OnboardingStepView({required this.step, super.key});

  final OnboardingStep step;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: AppSpacing.screenPadding.copyWith(top: AppSpacing.xl),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: AppSizes.onboardingTitleMinHeight,
            ),
            child: OnboardingTitle(step.title, underlineEmphasis: true),
          ),
        ),
        Expanded(child: IllustrationImage(step.image, fit: step.fit)),
      ],
    );
  }
}
