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
import 'package:plant_app/features/home/data/datasources/home_remote_data_source.dart'
    as _i613;
import 'package:plant_app/features/home/data/repositories/home_repository_impl.dart'
    as _i625;
import 'package:plant_app/features/home/domain/repositories/home_repository.dart'
    as _i790;
import 'package:plant_app/features/home/presentation/bloc/home_bloc.dart'
    as _i623;
import 'package:plant_app/features/onboarding/presentation/cubit/onboarding_cubit.dart'
    as _i672;
import 'package:plant_app/features/paywall/presentation/cubit/paywall_cubit.dart'
    as _i725;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i672.OnboardingCubit>(() => _i672.OnboardingCubit());
    gh.lazySingleton<_i460.SharedPreferencesAsync>(() => appModule.preferences);
    gh.lazySingleton<_i747.DioClient>(() => appModule.dioClient);
    gh.lazySingleton<_i321.OnboardingStorage>(
      () => _i321.SharedPreferencesOnboardingStorage(
        gh<_i460.SharedPreferencesAsync>(),
      ),
    );
    gh.lazySingleton<_i613.HomeRemoteDataSource>(
      () => _i613.DioHomeRemoteDataSource(gh<_i747.DioClient>()),
    );
    gh.lazySingleton<_i993.OnboardingGuard>(
      () => _i993.OnboardingGuard(gh<_i321.OnboardingStorage>()),
    );
    gh.factory<_i725.PaywallCubit>(
      () => _i725.PaywallCubit(gh<_i321.OnboardingStorage>()),
    );
    gh.lazySingleton<_i631.AppRouter>(
      () => _i631.AppRouter(gh<_i993.OnboardingGuard>()),
    );
    gh.lazySingleton<_i790.HomeRepository>(
      () => _i625.HomeRepositoryImpl(gh<_i613.HomeRemoteDataSource>()),
    );
    gh.factory<_i623.HomeBloc>(
      () => _i623.HomeBloc(gh<_i790.HomeRepository>()),
    );
    return this;
  }
}

class _$AppModule extends _i433.AppModule {}
