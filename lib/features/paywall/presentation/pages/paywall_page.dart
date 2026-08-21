import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/adaptive_body.dart';
import '../cubit/paywall_cubit.dart';
import '../paywall_content.dart';
import '../widgets/premium_feature_card.dart';
import '../widgets/subscription_plan_card.dart';

Future<void> finishOnboarding(BuildContext context) async {
  await context.read<PaywallCubit>().completeOnboarding();
  if (context.mounted) {
    unawaited(context.router.replaceAll([const HomeRoute()]));
  }
}

@RoutePage()
class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PaywallCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.paywallBackground,
        body: Builder(
          builder: (context) => Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  AppAssets.paywallHeader,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              const _PaywallContent(),
              SafeArea(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: _CloseButton(
                      onPressed: () => unawaited(finishOnboarding(context)),
                    ),
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

class _CloseButton extends StatelessWidget {
  const _CloseButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Close',
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.black.withValues(alpha: 0.5),
          ),
          child: const Icon(
            Icons.close,
            size: AppSizes.closeButton,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

class _PaywallContent extends StatelessWidget {
  const _PaywallContent();

  @override
  Widget build(BuildContext context) {
    final headerHeight =
        MediaQuery.sizeOf(context).width * AppSizes.paywallHeaderRatio;

    return AdaptiveBody(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: headerHeight * AppSizes.paywallHeaderTextAnchor),
            const Padding(
              padding: AppSpacing.screenPadding,
              child: _PaywallHeadline(),
            ),
            const SizedBox(height: AppSpacing.xl),
            const _FeatureCarousel(),
            const SizedBox(height: AppSpacing.xl),
            const Padding(
              padding: AppSpacing.screenPadding,
              child: _PlanList(),
            ),
            const SizedBox(height: AppSpacing.lg),
            const Padding(
              padding: AppSpacing.screenPadding,
              child: _PaywallFooter(),
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }
}

class _PaywallHeadline extends StatelessWidget {
  const _PaywallHeadline();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          const TextSpan(
            children: [
              TextSpan(
                text: AppStrings.paywallTitle,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: AppStrings.paywallTitleSuffix,
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
          style: AppTextStyles.paywallTitle.copyWith(
            color: AppColors.paywallTextPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          AppStrings.paywallSubtitle,
          style: AppTextStyles.paywallSubtitle.copyWith(
            color: AppColors.paywallTextSecondary,
          ),
        ),
      ],
    );
  }
}

class _FeatureCarousel extends StatelessWidget {
  const _FeatureCarousel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.featureCardHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: AppSpacing.screenPadding,
        itemCount: premiumFeatures.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, index) =>
            PremiumFeatureCard(feature: premiumFeatures[index]),
      ),
    );
  }
}

class _PlanList extends StatelessWidget {
  const _PlanList();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PaywallCubit>();

    return BlocBuilder<PaywallCubit, PaywallState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final plan in subscriptionPlans) ...[
              SubscriptionPlanCard(
                plan: plan,
                isSelected: plan.id == state.selectedPlanId,
                onSelected: () => cubit.selectPlan(plan.id),
              ),
              const SizedBox(height: AppSpacing.md),
            ],
          ],
        );
      },
    );
  }
}

class _PaywallFooter extends StatelessWidget {
  const _PaywallFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FilledButton(
          onPressed: () => unawaited(finishOnboarding(context)),
          child: const Text(AppStrings.paywallCta),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          AppStrings.paywallDisclaimer,
          textAlign: TextAlign.center,
          style: AppTextStyles.disclaimer.copyWith(
            color: AppColors.white.withValues(alpha: 0.52),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _FooterLink(label: AppStrings.paywallTerms),
            _FooterDot(),
            _FooterLink(label: AppStrings.paywallPrivacy),
            _FooterDot(),
            _FooterLink(label: AppStrings.paywallRestore),
          ],
        ),
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppTextStyles.footerLink.copyWith(
        color: AppColors.paywallTextMuted.withValues(alpha: 0.5),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _FooterDot extends StatelessWidget {
  const _FooterDot();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: Text(
        '•',
        style: AppTextStyles.footerLink.copyWith(
          color: AppColors.paywallTextMuted,
        ),
      ),
    );
  }
}
