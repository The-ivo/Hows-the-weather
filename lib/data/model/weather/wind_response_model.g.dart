// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindResponseModel _$WindResponseModelFromJson(Map<String, dynamic> json) =>
    WindResponseModel(
      speed: (json['speed'] as num).toDouble(),
      deg: (json['deg'] as num).toInt(),
      gust: (json['gust'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WindResponseModelToJson(WindResponseModel instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };
