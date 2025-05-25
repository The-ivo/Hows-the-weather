import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hows_the_weather/UI/weather/blocs/get_position_bloc/get_position_bloc.dart';
import 'package:hows_the_weather/UI/weather/blocs/get_weather_bloc/get_weather_bloc.dart';
import 'package:hows_the_weather/UI/weather/widgets/get_position_widget.dart';
import 'package:hows_the_weather/UI/weather/widgets/small_screen_weather_widget.dart';
import 'package:hows_the_weather/utils/enums.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  static const mainRoute = '/weather';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111935),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLargeScreen = constraints.maxWidth > 800;

          return BlocListener<GetPositionBloc, GetPositionState>(
            listener: (context, state) {
              if (state.status == GetCurrentPositionStatus.success) {
                context.read<GetWeatherBloc>().add(
                      WeatherRequested(
                        lat: state.position!.latitude,
                        lon: state.position!.longitude,
                      ),
                    );
              }
            },
            child: BlocBuilder<GetWeatherBloc, GetWeatherState>(
              builder: (context, getWeatherState) {
                return SafeArea(
                  child: GetPositionWidget(
                    weather: SmallScreenWeatherWidget(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
