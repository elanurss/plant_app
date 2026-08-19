import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/storage/onboarding_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockPreferences extends Mock implements SharedPreferencesAsync {}

void main() {
  late _MockPreferences preferences;
  late OnboardingStorage storage;

  setUp(() {
    preferences = _MockPreferences();
    storage = SharedPreferencesOnboardingStorage(preferences);
  });

  group('SharedPreferencesOnboardingStorage', () {
    test('reports not completed when the flag was never written', () async {
      when(() => preferences.getBool(any())).thenAnswer((_) async => null);

      expect(await storage.isCompleted(), isFalse);
    });

    test('reports completed once the flag is set', () async {
      when(() => preferences.getBool(any())).thenAnswer((_) async => true);

      expect(await storage.isCompleted(), isTrue);
    });

    test('persists the flag under a stable key', () async {
      when(() => preferences.setBool(any(), any())).thenAnswer((_) async {});

      await storage.markCompleted();

      verify(() => preferences.setBool('onboarding_completed', true)).called(1);
    });
  });
}
