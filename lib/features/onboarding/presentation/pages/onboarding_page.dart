import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../shared/widgets/adaptive_body.dart';
import '../cubit/onboarding_cubit.dart';
import '../onboarding_steps.dart';
import '../widgets/onboarding_step_view.dart';
import '../widgets/page_indicator.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  static const Duration _transition = Duration(milliseconds: 300);

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onContinuePressed(int currentIndex) {
    if (currentIndex >= onboardingSteps.length - 1) {
      unawaited(context.router.push(const PaywallRoute()));
      return;
    }

    unawaited(
      _pageController.nextPage(duration: _transition, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OnboardingCubit>(),
      child: Scaffold(
        body: AdaptiveBody(
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: onboardingSteps.length,
                      onPageChanged: context
                          .read<OnboardingCubit>()
                          .onPageChanged,
                      itemBuilder: (context, index) =>
                          OnboardingStepView(step: onboardingSteps[index]),
                    ),
                  ),
                  Padding(
                    padding: AppSpacing.screenPadding,
                    child: FilledButton(
                      onPressed: () => _onContinuePressed(state.pageIndex),
                      child: const Text(AppStrings.continueLabel),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  PageIndicator(
                    count: onboardingSteps.length,
                    activeIndex: state.pageIndex,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
