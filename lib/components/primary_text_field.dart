import 'package:flutter/material.dart';

class PrimaryTextField extends StatefulWidget {
  String? placeholder;
  IconData? prefixIcon;
  bool obscureText;
  bool visibilityIcon;
  String? Function(String?)? validator;
  TextEditingController textEditingController;
  PrimaryTextField({super.key, this.placeholder, this.prefixIcon, this.obscureText = false, this.visibilityIcon = false, this.validator, required this.textEditingController});

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: TextFormField(
        maxLines: 1,
        controller: widget.textEditingController,
        textAlign: TextAlign.start,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.placeholder ?? "",
          prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          suffixIcon: widget.visibilityIcon ? InkWell(
            onTap: () {
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },
            child: Icon(
              widget.obscureText ? Icons.visibility_off : Icons.visibility,
            ),
          ) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
