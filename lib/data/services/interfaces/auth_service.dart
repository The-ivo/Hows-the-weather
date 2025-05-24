import 'package:dio/dio.dart';
import 'package:hows_the_weather/data/model/auth_model.dart';

abstract class AuthService {
  const AuthService({required this.dioClient});

  final Dio dioClient;

  Future<AuthModel> login({
    required String email,
    required String password,
  });
}
