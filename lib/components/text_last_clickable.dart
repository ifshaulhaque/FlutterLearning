import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextLastClickable extends StatelessWidget {
  String text;
  String clickableText;
  Function() onClick;
  TextLastClickable({super.key, required this.text, required this.clickableText, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text,
          style: const TextStyle(
            color: Colors.black,
          ),
          children: [
            TextSpan(
                text: clickableText,
                style: const TextStyle(
                  color: Colors.blue,
                ),
                recognizer: TapGestureRecognizer()..onTap = onClick
            )
          ]
      ),
    );
  }
}
