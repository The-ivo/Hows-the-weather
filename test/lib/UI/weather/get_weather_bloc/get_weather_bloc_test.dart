import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hows_the_weather/UI/weather/blocs/get_weather_bloc/get_weather_bloc.dart';
import 'package:hows_the_weather/config/di/setup_di.dart';
import 'package:hows_the_weather/data/model/weather/weather_model.dart';
import 'package:hows_the_weather/data/repositories/interfaces/weather_repository.dart';
import 'package:hows_the_weather/domain/models/coordinates_model.dart';
import 'package:hows_the_weather/utils/enums.dart';
import 'package:hows_the_weather/utils/failures.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late GetWeatherBloc getWeatherBloc;
  late MockWeatherRepository mockWeatherRepository;

  final mockWeatherModel = WeatherModel.fromJson({
    "coord": {"lon": 7.367, "lat": 45.133},
    "weather": [
      {"id": 501, "main": "Rain", "description": "moderate rain", "icon": "10d"}
    ],
    "base": "stations",
    "main": {
      "temp": 284.2,
      "feels_like": 282.93,
      "temp_min": 283.06,
      "temp_max": 286.82,
      "pressure": 1021,
      "humidity": 60,
      "sea_level": 1021,
      "grnd_level": 910
    },
    "visibility": 10000,
    "wind": {"speed": 4.09, "deg": 121, "gust": 3.47},
    "rain": {"1h": 2.73},
    "clouds": {"all": 83},
    "dt": 1726660758,
    "sys": {"type": 1, "id": 6736, "country": "IT", "sunrise": 1726636384, "sunset": 1726680975},
    "timezone": 7200,
    "id": 3165523,
    "name": "Province of Turin",
    "cod": 200
  });

  final mockCoordinates = CoordinatesModel(
    lat: '-23.5505',
    lon: '-46.6333',
  );

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();

    getIt.registerSingleton<WeatherRepository>(mockWeatherRepository);

    getWeatherBloc = GetWeatherBloc();
  });

  tearDown(() {
    getWeatherBloc.close();
    getIt.reset();
  });

  setUpAll(() {
    registerFallbackValue(mockCoordinates);
  });

  group('GetWeatherBloc', () {
    const lat = -23.5505;
    const lon = -46.6333;

    test('initial state should be GetWeatherState with initial status', () {
      expect(
        getWeatherBloc.state,
        equals(const GetWeatherState()),
      );
    });

    group('WeatherRequested', () {
      blocTest<GetWeatherBloc, GetWeatherState>(
        'emits [loading, success] when getWeatherByCurrentLocation succeeds',
        build: () {
          when(() => mockWeatherRepository.getWeatherByCurrentLocation(
                coordinates: any(named: 'coordinates'),
              )).thenAnswer((_) async => Right(mockWeatherModel));

          return getWeatherBloc;
        },
        act: (bloc) => bloc.add(WeatherRequested(lat: lat, lon: lon)),
        expect: () => [
          const GetWeatherState(status: RequestStatus.loading),
          GetWeatherState(
            status: RequestStatus.success,
            weatherModel: mockWeatherModel,
          ),
        ],
        verify: (_) {
          verify(() => mockWeatherRepository.getWeatherByCurrentLocation(
                coordinates: any(named: 'coordinates'),
              )).called(1);
        },
      );

      blocTest<GetWeatherBloc, GetWeatherState>(
        'emits [loading, failure] when getWeatherByCurrentLocation fails',
        build: () {
          when(() => mockWeatherRepository.getWeatherByCurrentLocation(
                coordinates: any(named: 'coordinates'),
              )).thenAnswer((_) async => Left(ServerFailure(message: 'Weather fetch failed')));

          return getWeatherBloc;
        },
        act: (bloc) => bloc.add(WeatherRequested(lat: lat, lon: lon)),
        expect: () => [
          const GetWeatherState(status: RequestStatus.loading),
          const GetWeatherState(status: RequestStatus.failure),
        ],
        verify: (_) {
          verify(() => mockWeatherRepository.getWeatherByCurrentLocation(
                coordinates: any(named: 'coordinates'),
              )).called(1);
        },
      );
    });
  });
}
