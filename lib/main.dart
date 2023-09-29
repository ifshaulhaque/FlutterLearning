import 'package:flutter/material.dart';
import 'package:flutter_demo/navigation/routes.dart';
import 'package:flutter_demo/pages/main/home.dart';
import 'package:flutter_demo/pages/signup_signin/get_started.dart';
import 'package:flutter_demo/pages/signup_signin/sign_in.dart';
import 'package:flutter_demo/pages/signup_signin/sign_up.dart';
import 'package:flutter_demo/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.splashScreen,
      routes: {
        Routes.splashScreen: (context) => SplashScreen(),
        Routes.getStartedScreen: (context) => const GetStarted(),
        Routes.signUpScreen: (context) => SignUp(),
        Routes.signInScreen: (context) => SignIn(),
        Routes.homeScreen: (context) => Home(),
      },
    );
  }
}
