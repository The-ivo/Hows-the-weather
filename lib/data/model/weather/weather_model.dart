import 'package:hows_the_weather/data/model/weather/clouds_response_model.dart';
import 'package:hows_the_weather/data/model/weather/coordinates_response_model.dart';
import 'package:hows_the_weather/data/model/weather/main_info_response_model.dart';
import 'package:hows_the_weather/data/model/weather/rain_response_model.dart';
import 'package:hows_the_weather/data/model/weather/sys_info_response_model.dart';
import 'package:hows_the_weather/data/model/weather/weather_response_model.dart';
import 'package:hows_the_weather/data/model/weather/wind_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  const WeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  final CoordinatesResponseModel coord;
  final List<WeatherResponseModel> weather;
  final String base;
  final MainInfoResponseModel main;
  final int visibility;
  final WindResponseModel wind;
  final RainResponseModel? rain;
  final CloudsResponseModel clouds;
  final int dt;
  final SysInfoResponseModel sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
