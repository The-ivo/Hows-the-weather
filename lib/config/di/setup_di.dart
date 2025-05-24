import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hows_the_weather/data/repositories/auth_repository_impl.dart';
import 'package:hows_the_weather/data/repositories/interfaces/auth_repository.dart';
import 'package:hows_the_weather/data/repositories/interfaces/local_repository.dart';
import 'package:hows_the_weather/data/repositories/local_repository_impl.dart';
import 'package:hows_the_weather/data/services/auth_service_impl.dart';
import 'package:hows_the_weather/data/services/interfaces/auth_service.dart';
import 'package:hows_the_weather/data/services/interfaces/local_service.dart';
import 'package:hows_the_weather/data/services/local_service_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  registerHttpClient();
  registerSharedPreferences();
  registerServicesDependencies();
  registerRepositoriesDependencies();
}

void registerHttpClient() {
  getIt.registerLazySingleton<Dio>(() => Dio());
}

void registerSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

void registerServicesDependencies() {
  getIt.registerLazySingleton<AuthService>(
    () => AuthServiceImpl(dioClient: getIt<Dio>()),
  );

  getIt.registerLazySingleton<LocalService>(
    () => LocalServiceImpl(sharedPreferences: getIt<SharedPreferences>()),
  );
}

void registerRepositoriesDependencies() {
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authService: getIt<AuthService>()),
  );
  getIt.registerLazySingleton<LocalRepository>(
    () => LocalRepositoryImpl(localService: getIt<LocalService>()),
  );
}
