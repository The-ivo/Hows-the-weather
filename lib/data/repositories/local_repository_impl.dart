import 'package:dartz/dartz.dart';
import 'package:hows_the_weather/data/repositories/interfaces/local_repository.dart';
import 'package:hows_the_weather/data/services/interfaces/local_service.dart';
import 'package:hows_the_weather/utils/failures.dart';

class LocalRepositoryImpl implements LocalRepository {
  LocalRepositoryImpl({required this.localService});

  final LocalService localService;

  @override
  Either<Failure, String> getUserToken() {
    try {
      final response = localService.getUserToken();
      return Right(response);
    } on Exception catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> saveUserToken({required String token}) async {
    try {
      final response = await localService.saveUserToken(token);
      return Right(response);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }
}
