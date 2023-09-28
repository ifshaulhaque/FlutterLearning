import 'package:flutter/material.dart';
import 'package:flutter_demo/components/checkbox_suffix_text.dart';
import 'package:flutter_demo/components/heading_text.dart';
import 'package:flutter_demo/components/primary_button.dart';
import 'package:flutter_demo/components/primary_text_field.dart';
import 'package:flutter_demo/components/text_last_clickable.dart';
import 'package:flutter_demo/utils/text_utils.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                child: Form(
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
              ),
              PrimaryButton(
                text: "Sign Up",
                onClick: () {
                  if (_formKey.currentState?.validate() ?? false) {

                  }
                },
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
