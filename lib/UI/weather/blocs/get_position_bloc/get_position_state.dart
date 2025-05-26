part of 'get_position_bloc.dart';

class GetPositionState extends Equatable {
  const GetPositionState({
    this.status = GetCurrentPositionStatus.inital,
    this.position,
    this.error,
  });

  final GetCurrentPositionStatus status;
  final Position? position;
  final String? error;

  GetPositionState copyWith({
    GetCurrentPositionStatus? status,
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
