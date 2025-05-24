import 'package:dartz/dartz.dart';
import 'package:hows_the_weather/utils/failures.dart';

abstract class LocalRepository {
  Future<Either<Failure, bool>> saveUserToken({required String token});
  Either<Failure, String> getUserToken();
}
