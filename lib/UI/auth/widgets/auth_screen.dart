import 'package:flutter/material.dart';
import 'package:hows_the_weather/UI/auth/widgets/large_screen_login_card_widget.dart';
import 'package:hows_the_weather/UI/auth/widgets/small_screen_login_card_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLargeScreen = constraints.maxWidth > 800;

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade200, Colors.blue.shade900],
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: isLargeScreen ? 800 : 450,
                  ),
                  margin: const EdgeInsets.all(24),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: isLargeScreen
                          ? LargeScreenLoginCardWidget(
                              loginText: 'Log in to continue',
                              welcomeBackText: 'Welcome back!',
                            )
                          : SmallScreenLoginCardWidget(
                              loginText: 'Log in to continue',
                              welcomeBackText: 'Welcome back!',
                            ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
