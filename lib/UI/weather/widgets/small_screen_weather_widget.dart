import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hows_the_weather/UI/core/theme/typography/typography.dart';
import 'package:hows_the_weather/UI/weather/blocs/get_weather_bloc/get_weather_bloc.dart';

class SmallScreenWeatherWidget extends StatelessWidget {
  const SmallScreenWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weather = context.read<GetWeatherBloc>().state.weatherModel;
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'How\'s the weather?',
                style: WeatherAppTypo.of(context)?.display2xsm?.copyWith(
                      color: Colors.white,
                    ),
              ),
              SizedBox(height: 16),
              Text(
                weather!.name,
                style: WeatherAppTypo.of(context)?.displayMd?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  'https://openweathermap.org/img/wn/${weather.weather[0].icon}@2x.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Now: ${weather.main.temp}°F',
                style: WeatherAppTypo.of(context)?.displayXsm?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(height: 48),
              InfoContainer(
                title: 'Temperature details',
                buildTempDetailsList: [
                  BuildTempDetails(
                    title: 'Feels like',
                    data: '${weather.main.feelsLike.toString()}°F',
                  ),
                  VerticalDivider(
                    width: 24,
                  ),
                  BuildTempDetails(
                    title: 'Min temp',
                    data: '${weather.main.tempMin.toString()}°F',
                  ),
                  VerticalDivider(
                    width: 24,
                  ),
                  BuildTempDetails(
                    title: 'Max temp',
                    data: '${weather.main.tempMax.toString()}°F',
                  )
                ],
              ),
              SizedBox(height: 48),
              InfoContainer(
                title: 'Weather details',
                buildTempDetailsList: [
                  BuildTempDetails(
                    title: 'Cloudiness',
                    data: '${weather.clouds.all.toString()}%',
                  ),
                  VerticalDivider(width: 24),
                  BuildTempDetails(
                    title: 'Humidity',
                    data: '${weather.main.humidity.toString()}%',
                  ),
                  VerticalDivider(width: 24),
                  BuildTempDetails(
                    title: 'Pressure',
                    data: '${weather.main.humidity.toString()}hPa',
                  ),
                ],
              ),
              SizedBox(height: 48),
              InfoContainer(
                title: 'Wind details',
                buildTempDetailsList: [
                  BuildTempDetails(
                    title: 'Speed',
                    data: '${weather.wind.speed.toString()}Mph',
                  ),
                  VerticalDivider(width: 24),
                  BuildTempDetails(
                    title: 'Direction',
                    data: '${weather.wind.deg.toString()}°',
                  ),
                  VerticalDivider(width: 24),
                  BuildTempDetails(
                    title: 'Gust',
                    data: '${weather.wind.gust.toString()}Mph',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildTempDetails extends StatelessWidget {
  const BuildTempDetails({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: WeatherAppTypo.of(context)?.display2xsm?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          data,
          style: WeatherAppTypo.of(context)?.display2xsm?.copyWith(
                color: Colors.white,
              ),
        )
      ],
    );
  }
}

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.buildTempDetailsList,
    required this.title,
  });

  final String title;
  final List<Widget> buildTempDetailsList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: WeatherAppTypo.of(context)?.display2xsm?.copyWith(
                    color: Colors.white,
                  ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: buildTempDetailsList,
              ),
            )
          ],
        ),
      ),
    );
  }
}
