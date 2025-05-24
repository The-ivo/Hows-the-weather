import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalService {
  const LocalService({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  Future<bool> saveUserToken(String token);
  String getUserToken();
}
