import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/components/primary_text_field/primary_text_field_cubit.dart';

class PrimaryTextField extends StatelessWidget {
  String? placeholder;
  IconData? prefixIcon;
  bool obscureText;
  bool visibilityIcon;
  String? Function(String?)? validator;
  TextEditingController textEditingController;
  PrimaryTextField({super.key, this.placeholder, this.prefixIcon, this.obscureText = false, this.visibilityIcon = false, this.validator, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PrimaryTextFieldCubit(obscureText),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: BlocBuilder<PrimaryTextFieldCubit,bool>(
          builder: (context, state) => TextFormField(
            maxLines: 1,
            controller: textEditingController,
            textAlign: TextAlign.start,
            obscureText: state,
            decoration: InputDecoration(
              hintText: placeholder ?? "",
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              suffixIcon: visibilityIcon ? InkWell(
                onTap: () {
                  context.read<PrimaryTextFieldCubit>().obscureToggle();
                },
                child: Icon(
                  state ? Icons.visibility_off : Icons.visibility,
                ),
              ) : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
              ),
            ),
            validator: validator,
          ),
        ),
      ),
    );
  }
}
