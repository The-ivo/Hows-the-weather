import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hows_the_weather/UI/core/theme/typography/typography.dart';
import 'package:hows_the_weather/UI/weather/blocs/get_weather_bloc/get_weather_bloc.dart';

class LargeScreenWeatherWidget extends StatelessWidget {
  const LargeScreenWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weather = context.read<GetWeatherBloc>().state.weatherModel;
    final pageData = [
      InfoContainer(
        title: 'Temperature details',
        asset: Image.asset(
          'assets/images/thermometer.png',
        ),
        buildTempDetailsList: [
          BuildTempDetails(
            title: 'Feels like',
            data: '${weather!.main.feelsLike.toString()}°F',
          ),
          Divider(
            height: 24,
          ),
          BuildTempDetails(
            title: 'Min temp',
            data: '${weather.main.tempMin.toString()}°F',
          ),
          Divider(
            height: 24,
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
        asset: Image.asset(
          'assets/images/cloud.png',
        ),
        buildTempDetailsList: [
          BuildTempDetails(
            title: 'Cloudiness',
            data: '${weather.clouds.all.toString()}%',
          ),
          Divider(height: 24),
          BuildTempDetails(
            title: 'Humidity',
            data: '${weather.main.humidity.toString()}%',
          ),
          Divider(height: 24),
          BuildTempDetails(
            title: 'Pressure',
            data: '${weather.main.pressure.toString()}hPa',
          ),
        ],
      ),
      SizedBox(height: 48),
      InfoContainer(
        title: 'Wind details',
        asset: Image.asset(
          'assets/images/wind.png',
        ),
        buildTempDetailsList: [
          BuildTempDetails(
            title: 'Speed',
            data: '${weather.wind.speed.toString()}Mph',
          ),
          Divider(height: 24),
          BuildTempDetails(
            title: 'Direction',
            data: '${weather.wind.deg.toString()}°',
          ),
          Divider(height: 24),
          BuildTempDetails(
            title: 'Gust',
            data: '${weather.wind.gust.toString()}Mph',
          ),
        ],
      ),
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
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
                    weather.name,
                    style: WeatherAppTypo.of(context)?.displayMd?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.network(
                      'https://openweathermap.org/img/wn/${weather.weather[0].icon}@2x.png',
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.white,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Now: ${weather.main.temp}°F',
                    style: WeatherAppTypo.of(context)?.displayXl?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  SizedBox(height: 48),
                  constraints.maxWidth > 1340
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 20,
                          children: pageData,
                        )
                      : Column(
                          spacing: 20,
                          children: pageData,
                        ),
                ],
              ),
            ),
          ),
        );
      },
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
          style: WeatherAppTypo.of(context)?.displayXsm?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          data,
          style: WeatherAppTypo.of(context)?.displayXsm?.copyWith(
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
    required this.title,
    required this.asset,
    required this.buildTempDetailsList,
  });

  final String title;
  final Image asset;
  final List<Widget> buildTempDetailsList;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        width: 400,
        height: 400,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(5),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: WeatherAppTypo.of(context)?.displaySm?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildTempDetailsList,
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: asset,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
