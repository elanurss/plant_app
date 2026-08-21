import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../features/home/domain/entities/plant_category.dart';
import '../../features/home/presentation/pages/category_detail_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/onboarding/presentation/pages/welcome_page.dart';
import '../../features/paywall/presentation/pages/paywall_page.dart';
import 'guards/onboarding_guard.dart';

part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter(this._onboardingGuard);

  final OnboardingGuard _onboardingGuard;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: WelcomeRoute.page,
      initial: true,
      guards: [_onboardingGuard],
    ),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: PaywallRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: CategoryDetailRoute.page),
  ];
}
