import 'package:dartz/dartz.dart';
import 'package:hows_the_weather/data/model/auth_model.dart';
import 'package:hows_the_weather/data/repositories/interfaces/auth_repository.dart';
import 'package:hows_the_weather/data/services/interfaces/auth_service.dart';
import 'package:hows_the_weather/utils/failures.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authService});

  final AuthService authService;

  @override
  Future<Either<Failure, AuthModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authService.login(email: email, password: password);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
