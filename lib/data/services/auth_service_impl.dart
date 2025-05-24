import 'package:hows_the_weather/data/model/auth_model.dart';
import 'package:hows_the_weather/data/services/interfaces/auth_service.dart';

class AuthServiceImpl extends AuthService {
  AuthServiceImpl({required super.dioClient});

  final baseUrl = 'test.com';

  @override
  Future<AuthModel> login({required String email, required String passWord}) async {
    final body = {
      'email': email,
      'passWord': passWord,
    };

    Uri uri = Uri.https(baseUrl, '/login');
    final response = await dioClient.getUri(
      uri,
      data: body,
    );

    return AuthModel.fromJson({'token': 'd1okpokopdo13kdo31d0ooakdopaksopkd1k3pkfok1kfsafko3fk'});
  }
}
