import 'package:hows_the_weather/data/services/interfaces/local_service.dart';

class LocalSeverviceImpl extends LocalService {
  LocalSeverviceImpl({required super.sharedPreferences});

  @override
  Future<bool> saveUserToken(String token) async {
    final response = await sharedPreferences.setString('auth_token', token);
    if (!response) {
      throw Exception('Not able to save auth token');
    }
    return response;
  }

  @override
  String getUserToken() {
    final token = sharedPreferences.getString('auth_token');

    if (token == null) {
      throw Exception('Auth token not found in shared preferences');
    }

    return token;
  }
}
