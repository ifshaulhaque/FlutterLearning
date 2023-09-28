import 'package:flutter/material.dart';

class TextUtils {
  static bool isValidEmail(String? email) {
    // Regular expression for a valid email address
    final RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return email != null ? regex.hasMatch(email) : false;
  }
}