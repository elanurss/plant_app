part of 'paywall_cubit.dart';

@freezed
abstract class PaywallState with _$PaywallState {
  const factory PaywallState({required String selectedPlanId}) = _PaywallState;
}
