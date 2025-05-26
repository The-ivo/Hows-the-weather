// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      coord: CoordinatesResponseModel.fromJson(
          json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'] as String,
      main:
          MainInfoResponseModel.fromJson(json['main'] as Map<String, dynamic>),
      visibility: (json['visibility'] as num).toInt(),
      wind: WindResponseModel.fromJson(json['wind'] as Map<String, dynamic>),
      rain: json['rain'] == null
          ? null
          : RainResponseModel.fromJson(json['rain'] as Map<String, dynamic>),
      clouds:
          CloudsResponseModel.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: (json['dt'] as num).toInt(),
      sys: SysInfoResponseModel.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: (json['timezone'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      cod: (json['cod'] as num).toInt(),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'rain': instance.rain,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };
