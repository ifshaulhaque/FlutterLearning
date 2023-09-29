import 'package:flutter/material.dart';
import 'package:flutter_demo/components/checkbox_suffix_text.dart';
import 'package:flutter_demo/components/heading_text.dart';
import 'package:flutter_demo/components/primary_button.dart';
import 'package:flutter_demo/components/primary_text_field.dart';
import 'package:flutter_demo/components/text_last_clickable.dart';
import 'package:flutter_demo/constants.dart';
import 'package:flutter_demo/navigation/routes.dart';
import 'package:flutter_demo/utils/text_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key}) {
    initializeSharedPreferences();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  late final SharedPreferences prefs;

  Future<void> initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

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
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryTextField(
                      placeholder: "Email",
                      prefixIcon: Icons.email,
                      textEditingController: emailController,
                      validator: (value) {
                        if (!TextUtils.isValidEmail(value)) {
                          return "invalid Email Id";
                        } else if (prefs.getString(Constants.emailKey) == value) {
                          return "email already exist";
                        }
                        return null;
                      },
                    ),
                    PrimaryTextField(
                      placeholder: "Password",
                      prefixIcon: Icons.key,
                      obscureText: true,
                      visibilityIcon: true,
                      textEditingController: passwordController,
                      validator: (value) {
                        if (value != null && value.length < 8) {
                          return "minimum 8 digit required";
                        }
                        return null;
                      },
                    ),
                    PrimaryTextField(
                      placeholder: "Confirm Password",
                      prefixIcon: Icons.key,
                      obscureText: true,
                      visibilityIcon: true,
                      textEditingController: confirmPasswordController,
                      validator: (value) {
                        if (passwordController.value.text != value) {
                          return "password and confirm password not matched";
                        }
                        return null;
                      },
                    ),
                    CheckboxSuffixText(
                      suffixText: "I agree with Privacy Policy",
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              PrimaryButton(
                text: "Sign Up",
                onClick: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    prefs.setString(Constants.emailKey, emailController.value.text);
                    prefs.setString(Constants.passwordKey, passwordController.value.text);
                    prefs.setBool(Constants.loginStatusKey, true);
                    Navigator.pushNamed(context, Routes.homeScreen);
                  }
                },
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                child: TextLastClickable(
                  text: "You already have an account? ",
                  clickableText: "Sign In",
                  onClick: () {
                    Navigator.pushNamed(context, Routes.signInScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
