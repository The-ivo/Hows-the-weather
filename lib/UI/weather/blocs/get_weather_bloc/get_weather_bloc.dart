import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hows_the_weather/config/di/setup_di.dart';
import 'package:hows_the_weather/data/model/weather/weather_model.dart';
import 'package:hows_the_weather/data/repositories/interfaces/weather_repository.dart';
import 'package:hows_the_weather/domain/models/coordinates_model.dart';
import 'package:hows_the_weather/utils/enum.dart';

part 'get_weather_event.dart';
part 'get_weather_state.dart';

class GetWeatherBloc extends Bloc<GetWeatherEvent, GetWeatherState> {
  GetWeatherBloc() : super(const GetWeatherState()) {
    on<WeatherRequested>(_onWeatherRequested);
  }

  final weatherRepository = getIt<WeatherRepository>();

  FutureOr<void> _onWeatherRequested(WeatherRequested event, emit) async {
    emit(state.copyWith(status: RequestStatus.loading));

    final response = await weatherRepository.getWeatherByCurrentLocation(
      coordinates: CoordinatesModel(
        lat: event.lat,
        lon: event.lon,
      ),
    );

    response.fold(
      (l) {
        emit(
          state.copyWith(status: RequestStatus.failure),
        );
      },
      (r) {
        emit(
          state.copyWith(
            status: RequestStatus.success,
            weatherModel: r,
          ),
        );
      },
    );
  }
}
