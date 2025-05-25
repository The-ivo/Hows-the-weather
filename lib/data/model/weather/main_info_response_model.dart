import 'package:json_annotation/json_annotation.dart';

part 'main_info_response_model.g.dart';

@JsonSerializable()
class MainInfoResponseModel {
  const MainInfoResponseModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  @JsonKey(name: 'temp')
  final double temp;

  @JsonKey(name: 'feels_like')
  final double feelsLike;

  @JsonKey(name: 'temp_min')
  final double tempMin;

  @JsonKey(name: 'temp_max')
  final double tempMax;

  final int pressure;
  final int humidity;

  @JsonKey(name: 'sea_level')
  final int? seaLevel;

  @JsonKey(name: 'grnd_level')
  final int? grndLevel;

  factory MainInfoResponseModel.fromJson(Map<String, dynamic> json) => _$MainInfoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainInfoResponseModelToJson(this);
}
