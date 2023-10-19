import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pravas/Utils/commonWidgets/appBarContainer.dart';
import 'package:pravas/Utils/commonWidgets/appbar.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/Utils/commonWidgets/sizedbox.dart';
import 'package:pravas/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/notifications_page_controller.dart';

class NotificationsPageView extends GetView<NotificationsPageController> {
  const NotificationsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
        future: Appbar.showAppbar(
            Constants.notifications, context, controller.scaffoldKey),
        builder: (context, snapshot) {
          {
            return Scaffold(
              key: controller.scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: PravasDarkColors().scaffoldBackgroundColor,
              appBar: snapshot.hasData
                  ? snapshot.data as PreferredSizeWidget
                  : null,
              drawer: Drawer(
                backgroundColor: PravasDarkColors().scaffoldBackgroundColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: .2.dp),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        AppBar(
                          leading: const SizedBox.shrink(),
                          backgroundColor:
                              PravasDarkColors().scaffoldBackgroundColor,
                        ),
                        Obx(() {
                          return SizedBox(
                            height: .8.dp,
                            width: 1.dp,
                            child: controller.image.value == ""
                                ? Image.asset(
                                    Constants.avatarpng,
                                    height: 32.px,
                                    width: 32.px,
                                  )
                                : Image.network(
                                    controller.image.value,
                                    height: 32.px,
                                    width: 32.px,
                                  ),
                          );
                        }),
                        AppBarContainer.appbarContainer(
                            Constants.dashboard,
                            context,
                            Constants.notifications,
                            controller.scaffoldKey),
                        Box.showSizedbox(.25.dp),
                        AppBarContainer.appbarContainer(Constants.addbatch,
                            context, Constants.search, controller.scaffoldKey),
                        Box.showSizedbox(.25.dp),
                        AppBarContainer.appbarContainer(
                            Constants.resetpassword,
                            context,
                            Constants.notifications,
                            controller.scaffoldKey),
                        Box.showSizedbox(.25.dp),
                        AppBarContainer.appbarContainer(
                            Constants.notifications,
                            context,
                            Constants.notifications,
                            controller.scaffoldKey),
                        Box.showSizedbox(.25.dp),
                        AppBarContainer.appbarContainer(
                            Constants.logout, context, Constants.notifications),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
}
