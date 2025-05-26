// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponseModel _$WeatherResponseModelFromJson(
        Map<String, dynamic> json) =>
    WeatherResponseModel(
      id: (json['id'] as num).toInt(),
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherResponseModelToJson(
        WeatherResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
