import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hows_the_weather/utils/enums.dart';

part 'get_position_event.dart';
part 'get_position_state.dart';

class GetPositionBloc extends Bloc<GetPositionEvent, GetPositionState> {
  GetPositionBloc() : super(const GetPositionState()) {
    on<CurrentPositionRequested>(_onCurrentPositionRequested);
  }

  FutureOr<void> _onCurrentPositionRequested(CurrentPositionRequested event, emit) async {
    try {
      emit(state.copyWith(status: GetCurrentLocationStatus.loading));
      final position = await Geolocator.getCurrentPosition();
      emit(
        state.copyWith(
          status: GetCurrentLocationStatus.success,
          position: position,
        ),
      );
    } on PermissionDeniedException catch (e) {
      emit(
        state.copyWith(
          status: GetCurrentLocationStatus.failure,
          error: 'User denied request for current position',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: GetCurrentLocationStatus.failure,
          error: 'Unable to access your location. Please check your browser settings and allow location access.',
        ),
      );
    }
  }
}
