import 'package:json_annotation/json_annotation.dart';

part 'coordinates_response_model.g.dart';

@JsonSerializable()
class CoordinatesResponseModel {
  const CoordinatesResponseModel({
    required this.lon,
    required this.lat,
  });

  final double lon;
  final double lat;

  factory CoordinatesResponseModel.fromJson(Map<String, dynamic> json) => _$CoordinatesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesResponseModelToJson(this);
}
