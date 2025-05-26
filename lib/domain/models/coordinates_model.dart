import 'package:equatable/equatable.dart';

class CoordinatesModel extends Equatable {
  const CoordinatesModel({required this.lat, required this.lon});

  final String lat;
  final String lon;

  @override
  List<Object?> get props => [
        lat,
        lon,
      ];
}
