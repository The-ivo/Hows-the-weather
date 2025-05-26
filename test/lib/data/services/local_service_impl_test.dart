import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hows_the_weather/data/services/local_service_impl.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late LocalServiceImpl localService;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();

    localService = LocalServiceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('saveUserToken', () {
    test('should return true when token is saved successfully', () async {
      when(() => mockSharedPreferences.setString('auth_token', any())).thenAnswer((_) async => true);

      final result = await localService.saveUserToken('test_token');

      expect(result, true);
      verify(() => mockSharedPreferences.setString('auth_token', 'test_token')).called(1);
    });

    test('should throw exception when token cannot be saved', () async {
      when(() => mockSharedPreferences.setString('auth_token', any())).thenAnswer((_) async => false);

      expect(
        () => localService.saveUserToken('test_token'),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          'Exception: Not able to save auth token',
        )),
      );
    });
  });

  group('getUserToken', () {
    test('should return token when it exists in shared preferences', () {
      when(() => mockSharedPreferences.getString('auth_token')).thenReturn('test_token');

      final result = localService.getUserToken();

      expect(result, 'test_token');
      verify(() => mockSharedPreferences.getString('auth_token')).called(1);
    });

    test('should throw exception when token does not exist', () {
      when(() => mockSharedPreferences.getString('auth_token')).thenReturn(null);

      expect(
        () => localService.getUserToken(),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          'Exception: Auth token not found in shared preferences',
        )),
      );
    });
  });
}
