import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../../core/storage/onboarding_storage.dart';
import '../app_router.dart';

@lazySingleton
class OnboardingGuard extends AutoRouteGuard {
  OnboardingGuard(this._storage);

  final OnboardingStorage _storage;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (await _storage.isCompleted()) {
      resolver.redirectUntil(const HomeRoute());
      return;
    }
    resolver.next();
  }
}
