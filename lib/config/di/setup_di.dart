import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hows_the_weather/data/repositories/auth_repository_impl.dart';
import 'package:hows_the_weather/data/repositories/interfaces/auth_repository.dart';
import 'package:hows_the_weather/data/services/auth_service_impl.dart';
import 'package:hows_the_weather/data/services/interfaces/auth_service.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  registerHttpClient();
  registerServicesDependencies();
  registerRepositoriesDependencies();
}

void registerHttpClient() {
  getIt.registerLazySingleton<Dio>(() => Dio());
}

void registerServicesDependencies() {
  getIt.registerLazySingleton<AuthService>(
    () => AuthServiceImpl(dioClient: getIt<Dio>()),
  );
}

void registerRepositoriesDependencies() {
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authService: getIt<AuthService>()),
  );
}
