import 'package:flutter/material.dart';
import 'package:hows_the_weather/UI/core/theme/typography/typography.dart';
import 'package:hows_the_weather/config/di/setup_di.dart';
import 'package:hows_the_weather/routing/app_router_widget.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'How\'s the weather?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        extensions: [
          WeatherAppTypo(),
        ],
      ),
      home: const AppRouterWidget(),
    );
  }
}
