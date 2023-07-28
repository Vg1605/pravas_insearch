import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/Utils/commonWidgets/text.dart';
import 'package:pravas/app/routes/app_pages.dart';
import 'package:pravas/app/sharedPreference.dart';
import 'package:pravas/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAlertDialog {
  static dialog(String type) async {
    return await showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.px),
          ),
        ),
        backgroundColor: PravasDarkColors().cardColor,
        title: Txt.showText(
            type == "exit" ? Constants.confirmexit : Constants.confirmlogout,
            20.sp,
            FontWeight.w600,
            PravasDarkColors().textColor),
        content: Txt.showText(Constants.areyousure, 18.sp, FontWeight.w600,
            PravasDarkColors().textColor),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (type == "exit") {
                Get.back();
              } else {
                Get.offAllNamed(Routes.DASHBOARD_PAGE);
              }
            },
            child: Txt.showText(Constants.no, 16.sp, FontWeight.w600,
                PravasDarkColors().textColor),
          ),
          TextButton(
            onPressed: () async {
              if (type == "exit") {
                closeDialog();
              } else {
                sessionLogout();
              }
            },
            child: Txt.showText(Constants.yes, 16.sp, FontWeight.w600,
                PravasDarkColors().textColor),
          ),
        ],
      ),
    );
  }

  static Future<void> closeDialog() async {
    SharedPreference.setString(key: Constants.isLogin, value: Constants.exit);
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  static void sessionLogout() {
    SharedPreference.clear();
    SharedPreference.setString(key: Constants.isLogin, value: Constants.logout);
    Get.offAllNamed(Routes.LOGIN_PAGE);
  }
}
