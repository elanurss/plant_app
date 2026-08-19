import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class OnboardingStorage {
  Future<bool> isCompleted();

  Future<void> markCompleted();
}

@LazySingleton(as: OnboardingStorage)
class SharedPreferencesOnboardingStorage implements OnboardingStorage {
  const SharedPreferencesOnboardingStorage(this._preferences);

  static const String _completedKey = 'onboarding_completed';

  final SharedPreferencesAsync _preferences;

  @override
  Future<bool> isCompleted() async =>
      await _preferences.getBool(_completedKey) ?? false;

  @override
  Future<void> markCompleted() => _preferences.setBool(_completedKey, true);
}
