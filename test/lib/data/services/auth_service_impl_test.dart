import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hows_the_weather/data/model/auth_model.dart';
import 'package:hows_the_weather/data/services/auth_service_impl.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late AuthServiceImpl authService;

  setUp(() {
    mockDio = MockDio();
    authService = AuthServiceImpl(dioClient: mockDio);
  });

  group('login', () {
    test('should return AuthModel with token', () async {
      const email = 'test@example.com';
      const password = 'password123';
      const expectedToken = 'd1okpokopdo13kdo31d0ooakdopaksopkd1k3pkfok1kfsafko3fk';

      final result = await authService.login(email: email, password: password);

      expect(result, isA<AuthModel>());
      expect(result.token, equals(expectedToken));
    });

    test('should create AuthModel from correct JSON structure', () async {
      const email = 'test@example.com';
      const password = 'password123';

      final result = await authService.login(email: email, password: password);

      expect(result, equals(AuthModel.fromJson({'token': 'd1okpokopdo13kdo31d0ooakdopaksopkd1k3pkfok1kfsafko3fk'})));
    });
  });
}
