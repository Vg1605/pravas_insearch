import 'package:flutter/material.dart';
import 'package:pravas/colors.dart';

class Indicator {
  static progressIndicator() {
    return CircularProgressIndicator(
      color: PravasDarkColors().textColor,
    );
  }
}
