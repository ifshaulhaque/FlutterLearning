import 'package:flutter/material.dart';

class CheckboxSuffixText extends StatelessWidget {
  String suffixText;
  CheckboxSuffixText({super.key, required this.suffixText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {},
        ),
        Text(suffixText),
      ],
    );
  }
}
