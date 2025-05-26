part of 'get_weather_bloc.dart';

class GetWeatherState extends Equatable {
  const GetWeatherState({
    this.status = RequestStatus.initial,
    this.weatherModel,
  });

  final RequestStatus status;
  final WeatherModel? weatherModel;

  GetWeatherState copyWith({
    RequestStatus? status,
    WeatherModel? weatherModel,
  }) {
    return GetWeatherState(
      status: status ?? this.status,
      weatherModel: weatherModel ?? this.weatherModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        weatherModel,
      ];
}
