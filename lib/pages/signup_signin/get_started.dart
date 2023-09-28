import 'package:flutter/material.dart';
import 'package:flutter_demo/components/heading_text.dart';
import 'package:flutter_demo/components/primary_button.dart';
import 'package:flutter_demo/navigation/routes.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: HeadingText(
                  heading: "Get Started",
                  subHeading: "Start with sign up or sign in",
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PrimaryButton(
                      text: "Sign up",
                      isTextCapital: true,
                      onClick: () {
                        Navigator.pushNamed(context, Routes.signUpScreen);
                      },
                    ),
                    PrimaryButton(
                      text: "Sign in",
                      isTextCapital: true,
                      onClick: () {
                        Navigator.pushNamed(context, Routes.signInScreen);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
