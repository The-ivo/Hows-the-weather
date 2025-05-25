import 'package:dartz/dartz.dart';
import 'package:hows_the_weather/data/model/weather/weather_model.dart';
import 'package:hows_the_weather/data/repositories/interfaces/weather_repository.dart';
import 'package:hows_the_weather/data/services/interfaces/weather_service.dart';
import 'package:hows_the_weather/domain/models/coordinates_model.dart';
import 'package:hows_the_weather/utils/failures.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({required this.weatherService});

  final WeatherService weatherService;

  @override
  Future<Either<Failure, WeatherModel>> getWeatherByCurrentLocation({required CoordinatesModel coordinates}) async {
    try {
      final response = await weatherService.getWeatherByCurrentLocation(coordinates);
      return Right(response);
    } catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
