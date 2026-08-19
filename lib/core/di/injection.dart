import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/dio_client.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(initializerName: 'init', asExtension: true)
void configureDependencies() => getIt.init();

@module
abstract class AppModule {
  @lazySingleton
  SharedPreferencesAsync get preferences => SharedPreferencesAsync();

  @lazySingleton
  DioClient get dioClient => DioClient();
}
