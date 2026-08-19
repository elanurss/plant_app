// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:plant_app/app/router/app_router.dart' as _i631;
import 'package:plant_app/app/router/guards/onboarding_guard.dart' as _i993;
import 'package:plant_app/core/di/injection.dart' as _i433;
import 'package:plant_app/core/network/dio_client.dart' as _i747;
import 'package:plant_app/core/storage/onboarding_storage.dart' as _i321;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i460.SharedPreferencesAsync>(() => appModule.preferences);
    gh.lazySingleton<_i747.DioClient>(() => appModule.dioClient);
    gh.lazySingleton<_i321.OnboardingStorage>(
      () => _i321.SharedPreferencesOnboardingStorage(
        gh<_i460.SharedPreferencesAsync>(),
      ),
    );
    gh.lazySingleton<_i993.OnboardingGuard>(
      () => _i993.OnboardingGuard(gh<_i321.OnboardingStorage>()),
    );
    gh.lazySingleton<_i631.AppRouter>(
      () => _i631.AppRouter(gh<_i993.OnboardingGuard>()),
    );
    return this;
  }
}

class _$AppModule extends _i433.AppModule {}
