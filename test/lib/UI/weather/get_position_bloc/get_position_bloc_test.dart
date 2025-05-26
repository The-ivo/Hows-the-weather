import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hows_the_weather/UI/weather/blocs/get_position_bloc/get_position_bloc.dart';
import 'package:hows_the_weather/utils/enums.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGeolocatorPlatform extends Mock with MockPlatformInterfaceMixin implements GeolocatorPlatform {}

void main() {
  late GetPositionBloc getPositionBloc;
  late MockGeolocatorPlatform mockGeolocatorPlatform;

  final mockPosition = Position(
    latitude: -23.5505,
    longitude: -46.6333,
    timestamp: DateTime.now(),
    accuracy: 5.0,
    altitude: 0.0,
    altitudeAccuracy: 0.0,
    heading: 0.0,
    headingAccuracy: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
  );

  setUp(() {
    mockGeolocatorPlatform = MockGeolocatorPlatform();
    GeolocatorPlatform.instance = mockGeolocatorPlatform;
    getPositionBloc = GetPositionBloc();
  });

  tearDown(() {
    getPositionBloc.close();
  });

  group('GetPositionBloc', () {
    test('initial state should be GetPositionState with initial status', () {
      expect(
        getPositionBloc.state,
        equals(const GetPositionState()),
      );
    });

    group('CurrentPositionRequested', () {
      blocTest<GetPositionBloc, GetPositionState>(
        'emits [loading, success] when getCurrentPosition succeeds',
        build: () {
          when(() => mockGeolocatorPlatform.getCurrentPosition(
                locationSettings: any(named: 'locationSettings'),
              )).thenAnswer((_) async => mockPosition);

          return getPositionBloc;
        },
        act: (bloc) => bloc.add(CurrentPositionRequested()),
        expect: () => [
          const GetPositionState(status: GetCurrentPositionStatus.loading),
          GetPositionState(
            status: GetCurrentPositionStatus.success,
            position: mockPosition,
          ),
        ],
      );

      blocTest<GetPositionBloc, GetPositionState>(
        'emits [loading, failure] when PermissionDeniedException is thrown',
        build: () {
          when(() => mockGeolocatorPlatform.getCurrentPosition(
                locationSettings: any(named: 'locationSettings'),
              )).thenThrow(PermissionDeniedException('Permission denied'));

          return getPositionBloc;
        },
        act: (bloc) => bloc.add(CurrentPositionRequested()),
        expect: () => [
          const GetPositionState(status: GetCurrentPositionStatus.loading),
          const GetPositionState(
            status: GetCurrentPositionStatus.failure,
            error: 'User denied request for current position',
          ),
        ],
      );

      blocTest<GetPositionBloc, GetPositionState>(
        'emits [loading, failure] when generic exception is thrown',
        build: () {
          when(() => mockGeolocatorPlatform.getCurrentPosition(
                locationSettings: any(named: 'locationSettings'),
              )).thenThrow(Exception('Location error'));

          return getPositionBloc;
        },
        act: (bloc) => bloc.add(CurrentPositionRequested()),
        expect: () => [
          const GetPositionState(status: GetCurrentPositionStatus.loading),
          const GetPositionState(
            status: GetCurrentPositionStatus.failure,
            error: 'Unable to access your location. Please check your browser settings and allow location access.',
          ),
        ],
      );
    });
  });
}
