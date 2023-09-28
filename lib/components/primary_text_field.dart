import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  String? placeholder;
  IconData? prefixIcon;
  PrimaryTextField({super.key, this.placeholder, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: TextField(
        maxLines: 1,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: placeholder ?? "",
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
          ),
        ),
      ),
    );
  }
}
