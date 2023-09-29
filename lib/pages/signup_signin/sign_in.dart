import 'package:flutter/material.dart';
import 'package:flutter_demo/components/heading_text.dart';
import 'package:flutter_demo/components/primary_button.dart';
import 'package:flutter_demo/components/primary_text_field.dart';
import 'package:flutter_demo/components/text_last_clickable.dart';
import 'package:flutter_demo/constants.dart';
import 'package:flutter_demo/navigation/routes.dart';
import 'package:flutter_demo/utils/text_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key}) {
    initializeSharedPreferences();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                heading: "Welcome Back",
                subHeading: "Hey! Good to see you again",
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PrimaryTextField(
                      placeholder: "Email",
                      prefixIcon: Icons.email,
                      textEditingController: emailController,
                      validator: (value) {
                        if (!TextUtils.isValidEmail(value)) {
                          return "invalid Email Id";
                        } else if (prefs.getString(Constants.emailKey) != value) {
                          return "email is incorrect";
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
                        } else if (prefs.getString(Constants.passwordKey) != value) {
                          return "password is incorrect";
                        }
                        return null;
                      },
                    ),
                    const Text(
                      "Forget Password?",
                      style: TextStyle (
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              PrimaryButton(
                text: "Sign In",
                onClick: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    prefs.setBool(Constants.loginStatusKey, true);
                  }
                },
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                child: TextLastClickable(
                  text: "Don't have an account? ",
                  clickableText: "Sign Up",
                  onClick: () {
                    Navigator.pushNamed(context, Routes.signUpScreen);
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
