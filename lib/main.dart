import 'package:flutter/material.dart';
import 'package:hows_the_weather/config/di/setup_di.dart';
import 'package:hows_the_weather/routing/app_router_widget.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppRouterWidget(),
    );
  }
}
