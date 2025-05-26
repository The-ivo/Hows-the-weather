import 'package:dartz/dartz.dart';
import 'package:hows_the_weather/data/model/weather/weather_model.dart';
import 'package:hows_the_weather/domain/models/coordinates_model.dart';
import 'package:hows_the_weather/utils/failures.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherModel>> getWeatherByCurrentLocation({required CoordinatesModel coordinates});
}
