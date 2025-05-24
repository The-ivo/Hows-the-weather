import 'package:flutter/material.dart';
import 'package:hows_the_weather/UI/auth/widgets/login_form_widget.dart';

class LargeScreenLoginCardWidget extends StatelessWidget {
  const LargeScreenLoginCardWidget({
    super.key,
    required this.welcomeBackText,
    required this.loginText,
  });

  final String welcomeBackText;
  final String loginText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                welcomeBackText,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                loginText,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 32),
        Expanded(
          flex: 1,
          child: LoginFormWidget(),
        ),
      ],
    );
  }
}
