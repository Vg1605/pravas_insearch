import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Message {
  static showToast(
    @required String msg,
    @required Color backgroundcolor,
    @required Color textcolor,
  ) {
    Fluttertoast.showToast(
        msg: msg.toString(),
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundcolor,
        textColor: textcolor,
        fontSize: 16.sp);
  }
}
