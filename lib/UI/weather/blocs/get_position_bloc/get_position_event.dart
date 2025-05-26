part of 'get_position_bloc.dart';

sealed class GetPositionEvent {
  const GetPositionEvent();
}

class CurrentPositionRequested extends GetPositionEvent {}
