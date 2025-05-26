// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinatesResponseModel _$CoordinatesResponseModelFromJson(
        Map<String, dynamic> json) =>
    CoordinatesResponseModel(
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordinatesResponseModelToJson(
        CoordinatesResponseModel instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };
