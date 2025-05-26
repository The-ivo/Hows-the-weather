part of 'get_weather_bloc.dart';

sealed class GetWeatherEvent {
  const GetWeatherEvent();
}

class WeatherRequested extends GetWeatherEvent {
  const WeatherRequested({required this.lat, required this.lon});

  final double lat;
  final double lon;
}
