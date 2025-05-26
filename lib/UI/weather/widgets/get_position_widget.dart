import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hows_the_weather/UI/core/theme/typography/typography.dart';
import 'package:hows_the_weather/UI/weather/blocs/get_position_bloc/get_position_bloc.dart';
import 'package:hows_the_weather/utils/enums.dart';

class GetPositionWidget extends StatelessWidget {
  const GetPositionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPositionBloc, GetPositionState>(
      builder: (context, getPositionState) {
        if (getPositionState.status == GetCurrentPositionStatus.failure) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/11d@2x.png'),
                  Text(
                    'We are unable to proceed because:',
                    style: WeatherAppTypo.of(context)?.displayMd?.copyWith(
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    getPositionState.error ?? '',
                    style: WeatherAppTypo.of(context)?.displaySm?.copyWith(
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
                  'We need your location to continue',
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
      },
    );
  }
}
