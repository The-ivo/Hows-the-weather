part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class DoLogin extends AuthEvent {
  const DoLogin({required this.email, required this.password});

  final String email;
  final String password;
}
