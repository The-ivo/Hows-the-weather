import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  const AuthModel({
    required this.token,
  });

  final String token;

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(token: json['token'] as String);
  }

  @override
  List<Object?> get props => [token];
}
