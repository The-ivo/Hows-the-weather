import 'package:json_annotation/json_annotation.dart';

part 'wind_response_model.g.dart';

@JsonSerializable()
class WindResponseModel {
  final double speed;
  final int deg;
  final double? gust;

  WindResponseModel({
    required this.speed,
    required this.deg,
    this.gust,
  });

  factory WindResponseModel.fromJson(Map<String, dynamic> json) => _$WindResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WindResponseModelToJson(this);
}
