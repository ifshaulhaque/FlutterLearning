import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  String text;
  bool isTextCapital;
  PrimaryButton({super.key, this.isTextCapital = false, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                30,
              ),
            ),
          ),
          padding: const EdgeInsets.all(16),
          side: const BorderSide(
            width: 2,
          ),
        ),
        child: Text(
          isTextCapital ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
