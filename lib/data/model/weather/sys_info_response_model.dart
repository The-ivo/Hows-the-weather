import 'package:json_annotation/json_annotation.dart';

part 'sys_info_response_model.g.dart';

@JsonSerializable()
class SysInfoResponseModel {
  SysInfoResponseModel({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  factory SysInfoResponseModel.fromJson(Map<String, dynamic> json) => _$SysInfoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SysInfoResponseModelToJson(this);
}
