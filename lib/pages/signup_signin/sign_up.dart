import 'package:flutter/material.dart';
import 'package:flutter_demo/components/checkbox_suffix_text.dart';
import 'package:flutter_demo/components/heading_text.dart';
import 'package:flutter_demo/components/primary_button.dart';
import 'package:flutter_demo/components/primary_text_field.dart';
import 'package:flutter_demo/components/text_last_clickable.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 32,
            right: 32,
            top: 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeadingText(
                heading: "Sign Up",
                subHeading: "Hello! let's join with us",
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryTextField(
                      placeholder: "Email",
                      prefixIcon: Icons.email,
                    ),
                    PrimaryTextField(
                      placeholder: "Password",
                      prefixIcon: Icons.key,
                    ),
                    PrimaryTextField(
                      placeholder: "Confirm Password",
                      prefixIcon: Icons.key,
                    ),
                    CheckboxSuffixText(
                      suffixText: "I agree with Privacy Policy",
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                text: "Sign Up",
                onClick: () {},
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                child: TextLastClickable(
                  text: "You already have an account? ",
                  clickableText: "Sign In",
                  onClick: () {},
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
