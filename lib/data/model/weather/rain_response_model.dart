import 'package:json_annotation/json_annotation.dart';

part 'rain_response_model.g.dart';

@JsonSerializable()
class RainResponseModel {
  const RainResponseModel({
    required this.oneHour,
  });

  @JsonKey(name: '1h')
  final double oneHour;

  factory RainResponseModel.fromJson(Map<String, dynamic> json) => _$RainResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RainResponseModelToJson(this);
}
