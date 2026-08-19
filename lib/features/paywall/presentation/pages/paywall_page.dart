import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/storage/onboarding_storage.dart';

@RoutePage()
class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  Future<void> _completeOnboarding(BuildContext context) async {
    await getIt<OnboardingStorage>().markCompleted();
    if (context.mounted) {
      await context.router.replaceAll([const HomeRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () => _completeOnboarding(context),
          icon: const Icon(Icons.close),
        ),
      ),
    );
  }
}
