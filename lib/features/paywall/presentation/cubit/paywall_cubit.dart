import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/storage/onboarding_storage.dart';
import '../paywall_content.dart';

part 'paywall_cubit.freezed.dart';
part 'paywall_state.dart';

@injectable
class PaywallCubit extends Cubit<PaywallState> {
  PaywallCubit(this._storage)
    : super(PaywallState(selectedPlanId: subscriptionPlans.last.id));

  final OnboardingStorage _storage;

  void selectPlan(String planId) => emit(state.copyWith(selectedPlanId: planId));

  Future<void> completeOnboarding() => _storage.markCompleted();
}
