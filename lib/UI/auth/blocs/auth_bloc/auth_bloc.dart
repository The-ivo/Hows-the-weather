import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hows_the_weather/config/di/setup_di.dart';
import 'package:hows_the_weather/data/repositories/interfaces/auth_repository.dart';
import 'package:hows_the_weather/utils/enum.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<DoLogin>(_doLogin);
  }

  final authRepository = getIt<AuthRepository>();

  FutureOr<void> _doLogin(DoLogin event, emit) async {
    emit(state.copyWith(status: RequestStatus.loading));

    final response = await authRepository.login(
      email: event.email,
      password: event.password,
    );

    response.fold(
      (l) {
        emit(state.copyWith(status: RequestStatus.failure));
      },
      (r) {
        emit(
          state.copyWith(
            status: RequestStatus.success,
            token: r.token,
          ),
        );
      },
    );
  }
}
