part of 'onboarding_cubit.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({@Default(0) int pageIndex}) = _OnboardingState;
}
