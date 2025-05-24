import 'package:flutter/material.dart';
import 'package:hows_the_weather/UI/auth/widgets/login_form_widget.dart';

class SmallScreenLoginCardWidget extends StatelessWidget {
  const SmallScreenLoginCardWidget({
    super.key,
    required this.welcomeBackText,
    required this.loginText,
  });

  final String welcomeBackText;
  final String loginText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Welcome back!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Log in to continue',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 24),
        LoginFormWidget(),
      ],
    );
  }
}
