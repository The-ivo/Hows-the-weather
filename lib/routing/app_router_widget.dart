import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hows_the_weather/UI/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:hows_the_weather/UI/auth/widgets/auth_screen.dart';
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
          case '/':
            return MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => AuthBloc(),
                child: AuthScreen(),
              ),
            );

          case WeatherScreen.mainRoute:
            return MaterialPageRoute(
              builder: (context) => WeatherScreen(),
            );

          default:
            return null;
        }
      },
    );
  }
}
