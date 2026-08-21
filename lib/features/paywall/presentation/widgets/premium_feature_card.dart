import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../paywall_content.dart';

class PremiumFeatureCard extends StatelessWidget {
  const PremiumFeatureCard({required this.feature, super.key});

  final PremiumFeature feature;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: AppSizes.featureCardBlur,
          sigmaY: AppSizes.featureCardBlur,
        ),
        child: Container(
          width: AppSizes.featureCardWidth,
          height: AppSizes.featureCardHeight,
          color: AppColors.white.withValues(alpha: 0.08),
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.lg,
            AppSizes.featureCardTrailingPadding,
            AppSpacing.lg,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: AppSizes.featureIconBox,
                height: AppSizes.featureIconBox,
                decoration: BoxDecoration(
                  color: AppColors.black.withValues(alpha: 0.24),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: Center(
                  child: Image.asset(
                    feature.iconAsset,
                    width: AppSpacing.lg,
                    height: AppSpacing.lg,
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.featureCardGap),
              Flexible(
                child: Text(
                  feature.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.featureTitle.copyWith(
                    color: AppColors.paywallTextPrimary,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Flexible(
                child: Text(
                  feature.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.featureSubtitle.copyWith(
                    color: AppColors.paywallTextSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
