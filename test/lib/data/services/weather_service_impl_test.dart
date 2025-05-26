import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hows_the_weather/data/model/weather/weather_model.dart';
import 'package:hows_the_weather/data/services/weather_service_impl.dart';
import 'package:hows_the_weather/domain/models/coordinates_model.dart';

class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

void main() {
  late MockDio mockDio;
  late WeatherServiceImpl weatherService;
  late CoordinatesModel coordinates;

  setUp(() {
    mockDio = MockDio();
    weatherService = WeatherServiceImpl(dioClient: mockDio);
    coordinates = const CoordinatesModel(lat: '40.7128', lon: '-74.0060');

    registerFallbackValue(Uri());
  });

  group('getWeatherByCurrentLocation', () {
    test('should return WeatherModel when API call is successful', () async {
      final mockResponse = MockResponse();
      final weatherData = {
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
      };

      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.data).thenReturn(weatherData);
      when(() => mockDio.getUri(any())).thenAnswer((_) async => mockResponse);

      final result = await weatherService.getWeatherByCurrentLocation(coordinates);

      expect(result, isA<WeatherModel>());
      expect(result.name, 'Province of Turin');

      verify(() => mockDio.getUri(any())).called(1);
    });

    test('should throw Exception when API call returns non-200 status code', () async {
      final mockResponse = MockResponse();
      when(() => mockResponse.statusCode).thenReturn(404);
      when(() => mockDio.getUri(any())).thenAnswer((_) async => mockResponse);

      expect(
        () => weatherService.getWeatherByCurrentLocation(coordinates),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          'Exception: Server error',
        )),
      );
    });

    test('should throw Exception when API call throws an error', () async {
      when(() => mockDio.getUri(any())).thenThrow(Exception('Network error'));

      expect(
        () => weatherService.getWeatherByCurrentLocation(coordinates),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          'Exception: Server error',
        )),
      );
    });
  });
}
