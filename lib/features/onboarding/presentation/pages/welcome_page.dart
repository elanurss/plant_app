import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../shared/widgets/adaptive_body.dart';
import '../../../../shared/widgets/illustration_image.dart';
import '../widgets/legal_notice.dart';
import '../widgets/onboarding_title.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: AdaptiveBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppSpacing.screenPadding.copyWith(top: AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const OnboardingTitle(AppStrings.welcomeTitle),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    AppStrings.welcomeSubtitle,
                    style: textTheme.bodyLarge?.copyWith(
                      color: context.palette.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: IllustrationImage(AppAssets.welcomePlant)),
            Padding(
              padding: AppSpacing.screenPadding.copyWith(bottom: AppSpacing.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FilledButton(
                    onPressed: () =>
                        context.router.push(const OnboardingRoute()),
                    child: const Text(AppStrings.getStarted),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  const LegalNotice(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
