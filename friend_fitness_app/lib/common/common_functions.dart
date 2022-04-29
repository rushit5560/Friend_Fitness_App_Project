import 'package:flutter/material.dart';

// This Function Use For Hide Keyboard
void hideKeyboard() {
  FocusManager.instance.primaryFocus!.unfocus();
}