import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:hows_the_weather/data/model/weather/weather_model.dart';
import 'package:hows_the_weather/data/repositories/weather_repository_impl.dart';
import 'package:hows_the_weather/data/services/interfaces/weather_service.dart';
import 'package:hows_the_weather/domain/models/coordinates_model.dart';
import 'package:hows_the_weather/utils/failures.dart';

class MockWeatherService extends Mock implements WeatherService {}

class MockWeatherModel extends Mock implements WeatherModel {}

void main() {
  late MockWeatherService mockWeatherService;
  late WeatherRepositoryImpl weatherRepository;
  late CoordinatesModel coordinates;
  late WeatherModel weatherModel;

  setUp(() {
    mockWeatherService = MockWeatherService();
    weatherRepository = WeatherRepositoryImpl(weatherService: mockWeatherService);
    coordinates = const CoordinatesModel(lat: ' 40.7128', lon: '-74.0060');
    weatherModel = MockWeatherModel();
  });

  group('getWeatherByCurrentLocation', () {
    test('should return Right(WeatherModel) when service call is successful', () async {
      when(() => mockWeatherService.getWeatherByCurrentLocation(coordinates)).thenAnswer((_) async => weatherModel);

      final result = await weatherRepository.getWeatherByCurrentLocation(coordinates: coordinates);

      expect(result, Right(weatherModel));
      verify(() => mockWeatherService.getWeatherByCurrentLocation(coordinates)).called(1);
    });

    test('should return Left(ServerFailure) when service call throws an exception', () async {
      final exception = Exception('Network error');
      when(() => mockWeatherService.getWeatherByCurrentLocation(coordinates)).thenThrow(exception);

      final result = await weatherRepository.getWeatherByCurrentLocation(coordinates: coordinates);

      expect(
        result,
        Left(ServerFailure(message: exception.toString())),
      );
      verify(() => mockWeatherService.getWeatherByCurrentLocation(coordinates)).called(1);
    });
  });
}
