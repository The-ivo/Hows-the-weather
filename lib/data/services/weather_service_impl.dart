import 'dart:async';

import 'package:hows_the_weather/data/model/weather/weather_model.dart';
import 'package:hows_the_weather/data/services/interfaces/weather_service.dart';
import 'package:hows_the_weather/domain/models/coordinates_model.dart';

class WeatherServiceImpl extends WeatherService {
  WeatherServiceImpl({required super.dioClient});

  final String baseUrl = String.fromEnvironment('openWeatherBaseUrl');

  @override
  Future<WeatherModel> getWeatherByCurrentLocation(CoordinatesModel coordinates) async {
    try {
      final queryParams = {
        'lat': coordinates.lat,
        'lon': coordinates.lon,
        'appid': String.fromEnvironment('openWeatherApiKey'),
      };

      Uri uri = Uri.https(baseUrl, '/data/2.5/weather', queryParams);
      final response = await dioClient.getUri(
        uri,
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Server error');
      }
    } catch (e) {
      throw Exception('Server error');
    }
  }
}
