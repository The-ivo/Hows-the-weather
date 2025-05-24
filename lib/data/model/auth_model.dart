class AuthModel {
  AuthModel({
    this.token,
  });

  String? token;

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(token: json['token'] as String);
  }
}
