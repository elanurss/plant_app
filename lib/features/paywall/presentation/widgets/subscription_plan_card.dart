import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../paywall_content.dart';

class SubscriptionPlanCard extends StatelessWidget {
  const SubscriptionPlanCard({
    required this.plan,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  final SubscriptionPlan plan;
  final bool isSelected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: isSelected,
      label: '${plan.title}. ${plan.subtitle}',
      child: InkWell(
        onTap: onSelected,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              padding: const EdgeInsets.all(AppSizes.planCardPadding),
              decoration: BoxDecoration(
                color: isSelected ? null : AppColors.paywallPlanSurface,
                gradient: isSelected
                    ? const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: AppColors.paywallSelectedGradient,
                      )
                    : null,
                borderRadius: BorderRadius.circular(AppRadius.card),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.paywallPlanBorder,
                  width: isSelected
                      ? AppSizes.borderThick
                      : AppSizes.borderThin,
                ),
              ),
              child: Row(
                children: [
                  _PlanRadio(isSelected: isSelected),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          plan.title,
                          style: AppTextStyles.planTitle.copyWith(
                            color: AppColors.paywallTextPrimary,
                          ),
                        ),
                        Text(
                          plan.subtitle,
                          style: AppTextStyles.planSubtitle.copyWith(
                            color: AppColors.paywallTextSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (plan.badge case final String badge)
              Positioned(right: 0, top: 0, child: _SaveBadge(label: badge)),
          ],
        ),
      ),
    );
  }
}

class _PlanRadio extends StatelessWidget {
  const _PlanRadio({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.planRadio,
      height: AppSizes.planRadio,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.primary : AppColors.paywallPlanSurface,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.paywallPlanBorder,
          width: isSelected ? AppSizes.borderThick : AppSizes.borderThin,
        ),
      ),
      child: isSelected
          ? const Center(
              child: SizedBox(
                width: AppSpacing.sm,
                height: AppSpacing.sm,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.paywallTextPrimary,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

class _SaveBadge extends StatelessWidget {
  const _SaveBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppRadius.card),
          bottomLeft: Radius.circular(AppRadius.sm),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.badgePaddingHorizontal,
          vertical: AppSpacing.xs,
        ),
        child: Text(
          label,
          style: AppTextStyles.badgeLabel.copyWith(
            color: AppColors.paywallTextPrimary,
          ),
        ),
      ),
    );
  }
}
