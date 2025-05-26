import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hows_the_weather/data/repositories/local_repository_impl.dart';
import 'package:hows_the_weather/data/services/interfaces/local_service.dart';
import 'package:hows_the_weather/utils/failures.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalService extends Mock implements LocalService {}

void main() {
  late LocalRepositoryImpl repository;
  late MockLocalService mockLocalService;

  setUp(() {
    mockLocalService = MockLocalService();
    repository = LocalRepositoryImpl(localService: mockLocalService);
  });

  group('getUserToken', () {
    test('should return token when service returns successfully', () {
      const token = 'test_token';
      when(() => mockLocalService.getUserToken()).thenReturn(token);

      final result = repository.getUserToken();

      expect(result, equals(const Right(token)));
      verify(() => repository.getUserToken()).called(1);
    });

    test('should return LocalFailure when service throws exception', () {
      const errorMessage = 'Error message';
      when(() => mockLocalService.getUserToken()).thenThrow(Exception(errorMessage));

      final result = repository.getUserToken();

      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l, isA<LocalFailure>()),
        (r) => fail('Should return a Left with a Failure'),
      );
      verify(() => mockLocalService.getUserToken()).called(1);
    });
  });

  group('saveUserToken', () {
    test('should return true when service saves token successfully', () async {
      const token = 'test_token';
      when(() => mockLocalService.saveUserToken(token)).thenAnswer((_) async => true);

      final result = await repository.saveUserToken(token: token);

      expect(result, equals(const Right(true)));
      verify(() => mockLocalService.saveUserToken(token)).called(1);
    });

    test('should return LocalFailure when service throws exception', () async {
      const token = 'test_token';
      const errorMessage = 'Error message';
      when(() => mockLocalService.saveUserToken(token)).thenThrow(Exception(errorMessage));

      final result = await repository.saveUserToken(token: token);

      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l, isA<LocalFailure>()),
        (r) => fail('Should return a Left with a Failure'),
      );
      verify(() => mockLocalService.saveUserToken(token)).called(1);
    });
  });
}
