import 'package:dio/dio.dart';
import 'package:hows_the_weather/data/model/auth_model.dart';

abstract class AuthService {
  final Dio dioClient;

  AuthService({required this.dioClient});

  Future<AuthModel> login({
    required String email,
    required String passWord,
  });
}
