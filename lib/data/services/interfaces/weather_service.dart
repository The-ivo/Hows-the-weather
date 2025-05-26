import 'package:dio/dio.dart';
import 'package:hows_the_weather/data/model/weather/weather_model.dart';
import 'package:hows_the_weather/domain/models/coordinates_model.dart';

abstract class WeatherService {
  const WeatherService({required this.dioClient});

  final Dio dioClient;

  Future<WeatherModel> getWeatherByCurrentLocation(CoordinatesModel coordinates);
}
