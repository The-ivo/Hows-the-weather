import 'package:flutter/material.dart';
import 'package:hows_the_weather/UI/auth/widgets/auth_screen.dart';

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
              builder: (context) => AuthScreen(),
            );

          default:
            return null;
        }
      },
    );
  }
}
