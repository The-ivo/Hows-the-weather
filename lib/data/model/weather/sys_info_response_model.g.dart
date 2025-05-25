// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SysInfoResponseModel _$SysInfoResponseModelFromJson(
        Map<String, dynamic> json) =>
    SysInfoResponseModel(
      type: (json['type'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      country: json['country'] as String,
      sunrise: (json['sunrise'] as num).toInt(),
      sunset: (json['sunset'] as num).toInt(),
    );

Map<String, dynamic> _$SysInfoResponseModelToJson(
        SysInfoResponseModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
