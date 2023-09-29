import 'package:flutter/material.dart';
import 'package:flutter_demo/constants.dart';
import 'package:flutter_demo/navigation/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key}) {
    initializeSharedPreferences();
  }

  late final SharedPreferences prefs;

  Future<void> initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (prefs.getBool(Constants.loginStatusKey) ?? false) {
        Navigator.pushNamed(context, Routes.homeScreen);
      } else {
        Navigator.pushNamed(context, Routes.getStartedScreen);
      }
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
