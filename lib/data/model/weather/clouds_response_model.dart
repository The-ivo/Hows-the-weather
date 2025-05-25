import 'package:json_annotation/json_annotation.dart';

part 'clouds_response_model.g.dart';

@JsonSerializable()
class CloudsResponseModel {
  CloudsResponseModel({required this.all});

  final int all;

  factory CloudsResponseModel.fromJson(Map<String, dynamic> json) => _$CloudsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsResponseModelToJson(this);
}
