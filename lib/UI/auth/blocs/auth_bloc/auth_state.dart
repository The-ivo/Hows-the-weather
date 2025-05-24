part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.status = RequestStatus.initial,
    this.token,
  });

  final RequestStatus status;
  final String? token;

  AuthState copyWith({
    RequestStatus? status,
    String? token,
  }) {
    return AuthState(
      status: status ?? this.status,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [
        status,
        token,
      ];
}
