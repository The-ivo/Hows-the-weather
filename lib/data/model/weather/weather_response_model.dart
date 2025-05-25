import 'package:json_annotation/json_annotation.dart';

part 'weather_response_model.g.dart';

@JsonSerializable()
class WeatherResponseModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherResponseModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) => _$WeatherResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseModelToJson(this);
}
