import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  String heading;
  String? subHeading;
  HeadingText({super.key, this.subHeading, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subHeading ?? "",
        ),
      ],
    );
  }
}
