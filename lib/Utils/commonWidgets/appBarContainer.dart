import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pravas/Utils/commonWidgets/alertDialog.dart';
import 'package:pravas/Utils/commonWidgets/text.dart';
import 'package:pravas/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../colors.dart';
import 'constants.dart';

class AppBarContainer {
  static appbarContainer(String type, BuildContext context, String? page,
      [GlobalKey<ScaffoldState>? scaffoldKey]) {
    return GestureDetector(
      onTap: () {
        if (page == Constants.dashboard) {
          if (type == Constants.dashboard) {
            Get.back();
          }
          if (type == Constants.addbatch) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.NEW_EVENT);
          }
          if (type == Constants.resetpassword) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.Reset_PASSWORD);
          }
          if (type == Constants.notifications) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.NOTIFICATIONS_PAGE);
          }
          if (type == Constants.logout) {
            logout();
          }
        }

        if (page == Constants.addbatch) {
          if (type == Constants.dashboard) {
            Get.offNamed(Routes.DASHBOARD_PAGE);
          }
          if (type == Constants.addbatch) {
            Get.back();
          }
          if (type == Constants.resetpassword) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.Reset_PASSWORD);
          }
          if (type == Constants.notifications) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.NOTIFICATIONS_PAGE);
          }
          if (type == Constants.logout) {
            logout();
          }
        }

        if (page == Constants.search) {
          if (type == Constants.dashboard) {
            Get.offNamed(Routes.DASHBOARD_PAGE);
          }
          if (type == Constants.addbatch) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.NEW_EVENT);
          }
          if (type == Constants.notifications) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.NOTIFICATIONS_PAGE);
          }
          if (type == Constants.resetpassword) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.Reset_PASSWORD);
          }
          if (type == Constants.logout) {
            logout();
          }
        }

        if (page == Constants.info) {
          if (type == Constants.dashboard) {
            Get.offAllNamed(Routes.DASHBOARD_PAGE);
          }
          if (type == Constants.addbatch) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.NEW_EVENT);
          }
          if (type == Constants.notifications) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.NOTIFICATIONS_PAGE);
          }

          if (type == Constants.resetpassword) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.Reset_PASSWORD);
          }
          if (type == Constants.logout) {
            logout();
          }
        }

        if (page == Constants.notifications) {
          if (type == Constants.dashboard) {
            Get.offNamed(Routes.DASHBOARD_PAGE);
          }
          if (type == Constants.addbatch) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.NEW_EVENT);
          }
          if (type == Constants.notifications) {
            Get.back();
          }
          if (type == Constants.resetpassword) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.Reset_PASSWORD);
          }
          if (type == Constants.logout) {
            logout();
          }
        }

        if (page == Constants.profile) {
          if (type == Constants.dashboard) {
            Get.offNamed(Routes.DASHBOARD_PAGE);
          }
          if (type == Constants.addbatch) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.NEW_EVENT);
          }
          if (type == Constants.resetpassword) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.Reset_PASSWORD);
          }
          if (type == Constants.notifications) {
            toggleDrawer(scaffoldKey);
            Get.toNamed(Routes.NOTIFICATIONS_PAGE);
          }
          if (type == Constants.logout) {
            logout();
          }
        }
      },
      child:
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: PravasDarkColors().border, width: 1.px),
          borderRadius: BorderRadius.circular(.25.dp),
        ),
        width: double.infinity,
        height: 50.px,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: .2.dp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Txt.showText(
                  type == Constants.resetpassword
                      ? Constants.Resetpassword
                      : (type == Constants.dashboard
                          ? Constants.Dashboard
                          : (type == Constants.notifications
                              ? Constants.Notifications
                              : (type == Constants.addbatch
                                  ? Constants.addbatch
                                  : Constants.Logout))),
                  14.px,
                  FontWeight.normal,
                  PravasDarkColors().textColor),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                color: PravasDarkColors().textColor1,
                size: 24.px,
              )
            ],
          ),
        ),
      ),
    );
  }

  static logout() {
    return CustomAlertDialog.dialog(Constants.logout);
  }

  static void toggleDrawer(GlobalKey<ScaffoldState>? scaffoldKey) {
    if (scaffoldKey != null) {
      if (scaffoldKey.currentState!.hasEndDrawer) {
        scaffoldKey.currentState?.openDrawer();
      } else {
        scaffoldKey.currentState?.openEndDrawer();
      }
    }
  }
}
