import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/gradient_text.dart';

class PremiumBanner extends StatelessWidget {
  const PremiumBanner({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: '${AppStrings.bannerTitle}. ${AppStrings.bannerSubtitle}',
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Container(
          height: AppSizes.bannerHeight,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.bannerBackground,
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Row(
            children: [
              const _MailIcon(),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GradientText(
                      AppStrings.bannerTitle,
                      colors: AppColors.bannerTitleGradient,
                      style: AppTextStyles.planTitle,
                    ),
                    Text(
                      AppStrings.bannerSubtitle,
                      style: AppTextStyles.featureSubtitle.copyWith(
                        color: AppColors.bannerAccent,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.arrowForward),
            ],
          ),
        ),
      ),
    );
  }
}

class _MailIcon extends StatelessWidget {
  const _MailIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.bannerIcon,
      height: AppSizes.bannerIcon,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Center(
            child: Icon(
              Icons.mail,
              size: AppSpacing.xxxl,
              color: AppColors.bannerAccent,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: AppSpacing.lg,
              height: AppSpacing.lg,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.badgeAlert,
              ),
              child: Text(
                '1',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
