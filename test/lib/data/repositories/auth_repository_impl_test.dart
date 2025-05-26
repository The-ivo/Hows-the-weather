import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:hows_the_weather/data/model/auth_model.dart';
import 'package:hows_the_weather/data/repositories/auth_repository_impl.dart';
import 'package:hows_the_weather/data/services/interfaces/auth_service.dart';
import 'package:hows_the_weather/utils/failures.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  late MockAuthService mockAuthService;
  late AuthRepositoryImpl authRepository;

  setUp(() {
    mockAuthService = MockAuthService();
    authRepository = AuthRepositoryImpl(authService: mockAuthService);
  });

  group('login', () {
    const email = 'test@example.com';
    const password = 'password123';
    final authModel = AuthModel(token: 'token123');

    test('should return Right(AuthModel) when login returns successfully', () async {
      when(() => mockAuthService.login(email: email, password: password)).thenAnswer((_) async => authModel);

      final result = await authRepository.login(email: email, password: password);

      expect(result, Right(authModel));
      verify(() => mockAuthService.login(email: email, password: password)).called(1);
    });

    test('should return Left(ServerFailure)  when login throws a exception', () async {
      when(() => mockAuthService.login(email: email, password: password)).thenThrow(Exception('Erro'));

      final result = await authRepository.login(email: email, password: password);

      expect(result, Left(ServerFailure()));
      verify(() => mockAuthService.login(email: email, password: password)).called(1);
    });
  });
}
