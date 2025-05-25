import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hows_the_weather/UI/core/theme/typography/typography.dart';
import 'package:hows_the_weather/UI/weather/blocs/get_weather_bloc/get_weather_bloc.dart';

class SmallScreenWeatherWidget extends StatelessWidget {
  const SmallScreenWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weather = context.read<GetWeatherBloc>().state.weatherModel;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'How\'s the weather?',
              style: WeatherAppTypo.of(context)?.displayXsm?.copyWith(
                    color: Colors.white,
                  ),
            ),
            SizedBox(height: 10),
            Text(
              weather!.name,
              style: WeatherAppTypo.of(context)?.displaySm?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Text(
              'Now: ${weather.main.temp}°F',
              style: WeatherAppTypo.of(context)?.display2xsm?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
