import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hows_the_weather/UI/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:hows_the_weather/data/model/auth_model.dart';
import 'package:hows_the_weather/data/repositories/interfaces/auth_repository.dart';
import 'package:hows_the_weather/data/repositories/interfaces/local_repository.dart';
import 'package:hows_the_weather/utils/enums.dart';
import 'package:hows_the_weather/utils/failures.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockLocalRepository extends Mock implements LocalRepository {}

void main() {
  late AuthBloc authBloc;
  late MockAuthRepository mockAuthRepository;
  late MockLocalRepository mockLocalRepository;

  final getIt = GetIt.instance;
  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockLocalRepository = MockLocalRepository();

    getIt.registerSingleton<AuthRepository>(mockAuthRepository);
    getIt.registerSingleton<LocalRepository>(mockLocalRepository);

    authBloc = AuthBloc();
  });

  tearDown(() {
    authBloc.close();
    getIt.reset();
  });

  group('AuthBloc', () {
    const email = 'test@example.com';
    const password = 'password123';
    const token = 'mock_token_123';

    test('initial state should be AuthState with initial status', () {
      expect(authBloc.state, equals(AuthState()));
    });

    group('DoLogin', () {
      blocTest<AuthBloc, AuthState>(
        'emits [loading, success] when login is successful',
        build: () {
          when(() => mockAuthRepository.login(
                email: email,
                password: password,
              )).thenAnswer(
            (_) async => Right(AuthModel(token: token)),
          );

          when(() => mockLocalRepository.saveUserToken(token: token)).thenAnswer((_) async => Right(true));

          return authBloc;
        },
        act: (bloc) => bloc.add(DoLogin(email: email, password: password)),
        expect: () => [
          AuthState(status: RequestStatus.loading),
          AuthState(status: RequestStatus.success, token: token),
        ],
        verify: (_) {
          verify(() => mockAuthRepository.login(
                email: email,
                password: password,
              )).called(1);
          verify(() => mockLocalRepository.saveUserToken(token: token)).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [loading, failure] when login fails',
        build: () {
          when(() => mockAuthRepository.login(
                email: email,
                password: password,
              )).thenAnswer(
            (_) async => Left(ServerFailure(message: 'Login failed')),
          );

          return authBloc;
        },
        act: (bloc) => bloc.add(DoLogin(email: email, password: password)),
        expect: () => [
          AuthState(status: RequestStatus.loading),
          AuthState(status: RequestStatus.failure),
        ],
        verify: (_) {
          verify(() => mockAuthRepository.login(
                email: email,
                password: password,
              )).called(1);
          verifyNever(() => mockLocalRepository.saveUserToken(token: any(named: 'token')));
        },
      );
    });
  });
}
