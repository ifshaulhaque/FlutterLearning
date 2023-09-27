import 'package:flutter/material.dart';
import 'package:flutter_demo/navigation/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, Routes.getStartedScreen);
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Splash\nScreen",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
