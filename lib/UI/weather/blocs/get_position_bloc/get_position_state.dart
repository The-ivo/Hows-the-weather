part of 'get_position_bloc.dart';

class GetPositionState extends Equatable {
  const GetPositionState({
    this.status = GetCurrentLocationStatus.inital,
    this.position,
    this.error,
  });

  final GetCurrentLocationStatus status;
  final Position? position;
  final String? error;

  GetPositionState copyWith({
    GetCurrentLocationStatus? status,
    Position? position,
    String? error,
  }) {
    return GetPositionState(
      status: status ?? this.status,
      position: position ?? this.position,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        position,
        error,
      ];
}
