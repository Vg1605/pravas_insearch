import 'package:flutter/material.dart';

class BackgroundColor {
  static Color backgroundColor({required BuildContext context}) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.transparent
        : Theme.of(context).scaffoldBackgroundColor;
  }
}
