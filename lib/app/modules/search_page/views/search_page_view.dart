import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pravas/Utils/commonWidgets/appBarContainer.dart';
import 'package:pravas/Utils/commonWidgets/appbar.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/Utils/commonWidgets/sizedbox.dart';
import 'package:pravas/colors.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
        future: Appbar.showAppbar(
            Constants.search, context, controller.scaffoldKey),
        builder: (context, snapshot) {
          {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.focusNode.unfocus();
                    controller.search.clear();
                    controller.close.value = false;
                  },
                  child: Scaffold(
                    key: controller.scaffoldKey,
                    resizeToAvoidBottomInset: false,
                    backgroundColor: PravasDarkColors().cardColor,
                    appBar: snapshot.data as PreferredSizeWidget,
                    drawer: Drawer(
                      backgroundColor:
                          PravasDarkColors().scaffoldBackgroundColor,
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
                                  Constants.search,
                                  controller.scaffoldKey),
                              Box.showSizedbox(.25.dp),
                              AppBarContainer.appbarContainer(
                                  Constants.resetpassword,
                                  context,
                                  Constants.search,
                                  controller.scaffoldKey),
                              Box.showSizedbox(.25.dp),
                              AppBarContainer.appbarContainer(
                                  Constants.notifications,
                                  context,
                                  Constants.search,
                                  controller.scaffoldKey),
                              Box.showSizedbox(.25.dp),
                              AppBarContainer.appbarContainer(
                                  Constants.logout, context, Constants.search),
                            ],
                          ),
                        ),
                      ),
                    ),
                    body: Column(
                      children: [
                        Box.showSizedbox(.30.dp),
                        Obx(() {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.px),
                            child: TextField(
                              onTap: () {
                                controller.close.value = true;
                              },
                              focusNode: controller.focusNode,
                              controller: controller.search,
                              style: TextStyle(
                                  color: PravasDarkColors().textColor),
                              cursorColor: PravasDarkColors().textColor,
                              decoration: InputDecoration(
                                suffixIcon: controller.close.value == true
                                    ? GestureDetector(
                                        onTap: () {
                                          controller.close.value = false;
                                          controller.search.clear();
                                          controller.focusNode.unfocus();
                                        },
                                        child: Icon(Icons.close,
                                            color:
                                                PravasDarkColors().textColor1),
                                      )
                                    : const SizedBox.shrink(),
                                prefixIcon: Image.asset(Constants.searchpng),
                                filled: true,
                                fillColor: PravasDarkColors().cardColor,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: .28.dp),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.px),
                                  borderSide: BorderSide(
                                      color: PravasDarkColors().textColor3,
                                      width: 0.06.dp),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.px),
                                  borderSide: BorderSide(
                                      color: PravasDarkColors().border,
                                      width: 0.06.dp),
                                ),
                                hintText: Constants.searchtour,
                                hintStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: PravasDarkColors().textColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16.sp),
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        });
  }
}
