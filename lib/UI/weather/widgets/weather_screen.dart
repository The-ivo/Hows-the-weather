import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hows_the_weather/UI/core/theme/typography/typography.dart';
import 'package:hows_the_weather/UI/weather/blocs/get_position_bloc/get_position_bloc.dart';
import 'package:hows_the_weather/UI/weather/blocs/get_weather_bloc/get_weather_bloc.dart';
import 'package:hows_the_weather/UI/weather/widgets/get_position_widget.dart';
import 'package:hows_the_weather/UI/weather/widgets/large_screen_weather_widget.dart';
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
            child: BlocBuilder<GetPositionBloc, GetPositionState>(
              builder: (context, getPositionState) {
                if (getPositionState.status == GetCurrentPositionStatus.success) {
                  return BlocBuilder<GetWeatherBloc, GetWeatherState>(builder: (context, getWeatherState) {
                    if (getWeatherState.status == RequestStatus.success) {
                      return isLargeScreen ? LargeScreenWeatherWidget() : SmallScreenWeatherWidget();
                    } else if (getWeatherState.status == RequestStatus.failure) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(35),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/11d@2x.png'),
                              Text(
                                'Something went wrong, please try again later',
                                style: WeatherAppTypo.of(context)?.displayMd?.copyWith(
                                      color: Colors.white,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(35),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Getting weather for your current position',
                              style: WeatherAppTypo.of(context)?.displayLg?.copyWith(
                                    color: Colors.white,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 32),
                            CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    );
                  });
                }
                return SafeArea(
                  child: GetPositionWidget(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
