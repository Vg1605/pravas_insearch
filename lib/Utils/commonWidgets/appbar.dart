import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/app/routes/app_pages.dart';
import 'package:pravas/app/sharedPreference.dart';
import 'package:pravas/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Appbar {
  static Future<PreferredSizeWidget> showAppbar(
    String page,
    BuildContext context,
    GlobalKey<ScaffoldState> scaffoldKey,
  ) async {
    var image = "";
    image = (await SharedPreference.getString(key: Constants.image))!;
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.zero,
            child: AppBar(
              elevation: 0,
              backgroundColor: PravasDarkColors().scaffoldBackgroundColor,
              leading: page == Constants.dashboard
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.DASHBOARD_PAGE);
                      },
                      child: Icon(
                        Icons.grid_view,
                        color: PravasDarkColors().textColor1,
                        size: 24.px,
                      ),
                    ),
              actions: [
                SizedBox(
                  width: 25.px,
                  height: 25.px,
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.SEARCH_PAGE);
                    },
                    icon: Icon(
                      Icons.search,
                      color: page == Constants.search
                          ? PravasDarkColors().textColor3
                          : PravasDarkColors().textColor1,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.NOTIFICATIONS_PAGE);
                      },
                      icon: Icon(
                        Icons.notifications_none_outlined,
                        color: page == Constants.notifications
                            ? PravasDarkColors().textColor3
                            : PravasDarkColors().textColor1,
                        size: 26.px,
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 5,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: const Text(
                          "5",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: .18.dp),
                  child: Container(
                      color: PravasDarkColors().border,
                      height: .2.dp,
                      width: .04.dp),
                ),
                SizedBox(width: 14.px),
                ClipRect(
                  child: image == ""
                      ? Image.asset(
                          Constants.avatarpng,
                          height: 32.px,
                          width: 32.px,
                        )
                      : Image.network(
                          image,
                          height: 32.px,
                          width: 32.px,
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  child: Image.asset(
                    Constants.menupng,
                  ),
                ),
                SizedBox(width: 6.px),
              ],
            ),
          ),
          Expanded(
            child: Divider(
              thickness: .18.px,
              color: PravasDarkColors().textColor1,
            ),
          ),
        ],
      ),
    );
  }
}
