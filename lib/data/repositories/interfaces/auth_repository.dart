import 'package:dartz/dartz.dart';
import 'package:hows_the_weather/data/model/auth_model.dart';
import 'package:hows_the_weather/utils/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthModel>> login({required String email, required String password,});
}
