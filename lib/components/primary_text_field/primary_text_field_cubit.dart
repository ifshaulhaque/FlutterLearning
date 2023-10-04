import 'package:flutter_bloc/flutter_bloc.dart';

class PrimaryTextFieldCubit extends Cubit<bool> {
  PrimaryTextFieldCubit(bool obscureText) : super(obscureText);

  void obscureToggle() => emit(!state);
}