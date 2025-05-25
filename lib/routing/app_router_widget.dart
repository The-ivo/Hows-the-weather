import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hows_the_weather/UI/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:hows_the_weather/UI/auth/widgets/auth_screen.dart';
import 'package:hows_the_weather/UI/weather/blocs/get_position_bloc/get_position_bloc.dart';
import 'package:hows_the_weather/UI/weather/blocs/get_weather_bloc/get_weather_bloc.dart';
import 'package:hows_the_weather/UI/weather/widgets/weather_screen.dart';

class AppRouterWidget extends StatefulWidget {
  const AppRouterWidget({super.key});

  @override
  State<AppRouterWidget> createState() => _AppRouterWidgetState();
}

class _AppRouterWidgetState extends State<AppRouterWidget> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> appMainNavKey = GlobalKey();

    return Navigator(
      key: appMainNavKey,
      onGenerateRoute: (settings) {
        final routeName = settings.name;

        switch (routeName) {
          case 'asd':
            return MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => AuthBloc(),
                child: AuthScreen(),
              ),
            );

          case '/':
            return MaterialPageRoute(
              builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => GetPositionBloc()..add(CurrentPositionRequested()),
                  ),
                  BlocProvider(
                    create: (context) => GetWeatherBloc(),
                  ),
                ],
                child: WeatherScreen(),
              ),
            );

          default:
            return null;
        }
      },
    );
  }
}
