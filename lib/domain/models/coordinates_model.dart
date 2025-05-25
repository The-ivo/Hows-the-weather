import 'package:equatable/equatable.dart';

class CoordinatesModel extends Equatable {
  const CoordinatesModel({required this.lat, required this.lon});

  final double lat;
  final double lon;

  @override
  List<Object?> get props => [
        lat,
        lon,
      ];
}
