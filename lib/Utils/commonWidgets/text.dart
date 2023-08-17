import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Txt {
  static showText(
    @required String text,
    @required double? fontSize,
    @required FontWeight? fontweight,
    @required Color? color,
  ) {
    return Text(text,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: color, fontWeight: fontweight, fontSize: fontSize,),
        ));
  }
}
