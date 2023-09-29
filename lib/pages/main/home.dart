import 'package:flutter/material.dart';
import 'package:flutter_demo/constants.dart';
import 'package:flutter_demo/navigation/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  Home({super.key}) {
    initializeSharedPreferences();
  }

  late final SharedPreferences prefs;

  Future<void> initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () {
              prefs.setBool(Constants.loginStatusKey, false);
              Navigator.pushNamed(context, Routes.getStartedScreen);
            },
            child: const Text(
              "Logout",
            ),
          ),
        ),
      ),
    );
  }
}
