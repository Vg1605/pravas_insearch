import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pravas/Utils/commonWidgets/appBarContainer.dart';
import 'package:pravas/Utils/commonWidgets/appbar.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/Utils/commonWidgets/progressindicator.dart';
import 'package:pravas/Utils/commonWidgets/sizedbox.dart';
import 'package:pravas/Utils/commonWidgets/text.dart';
import 'package:pravas/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/dashboard_page_controller.dart';

class DashboardPageView extends GetView<DashboardPageController> {
  const DashboardPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    Future<bool> _onWillPop() async {
      return controller.exit(context);
    }
    return FutureBuilder<Widget>(
        future: Appbar.showAppbar(
            Constants.dashboard, context, controller.scaffoldKey),
        builder: (context, snapshot) {
          {
            return WillPopScope(
              onWillPop: _onWillPop,
              child: DefaultTabController(
                initialIndex: 0,
                length: 3,
                child: Stack(
                  children: [
                    Scaffold(
                      key: controller.scaffoldKey,
                      resizeToAvoidBottomInset: false,
                      backgroundColor:
                          PravasDarkColors().scaffoldBackgroundColor,
                      appBar: snapshot.hasData ? snapshot.data as PreferredSizeWidget : null,
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
                                  backgroundColor: PravasDarkColors()
                                      .scaffoldBackgroundColor,
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
                                    Constants.dashboard,
                                    controller.scaffoldKey),
                                Box.showSizedbox(.25.dp),
                                AppBarContainer.appbarContainer(
                                    Constants.addbatch,
                                    context,
                                    Constants.dashboard,
                                    controller.scaffoldKey),
                                Box.showSizedbox(.25.dp),
                                AppBarContainer.appbarContainer(
                                    Constants.resetpassword,
                                    context,
                                    Constants.dashboard,
                                    controller.scaffoldKey),
                                Box.showSizedbox(.25.dp),
                                AppBarContainer.appbarContainer(
                                    Constants.notifications,
                                    context,
                                    Constants.dashboard,
                                    controller.scaffoldKey),
                                Box.showSizedbox(.25.dp),
                                AppBarContainer.appbarContainer(
                                    Constants.logout,
                                    context,
                                    Constants.dashboard),
                              ],
                            ),
                          ),
                        ),
                      ),
                      body: GestureDetector(
                        onTap: () {
                          controller.search.clear();
                          controller.close.value = false;
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.px, vertical: 8.px),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Txt.showText(
                                        Constants.Dashboard,
                                        22.px,
                                        FontWeight.w600,
                                        PravasDarkColors().textColor,
                                      ),
                                      Row(children: [
                                        SizedBox(width: 15.px),
                                        Image.asset(
                                          Constants.squarepng,
                                          color: PravasDarkColors().textColor3,
                                          width: 25.px,
                                        ),
                                      ]),
                                    ],
                                  ),
                                  SizedBox(height: 20.px),
                                  Obx(
                                    () => TabBar(
                                      onTap: (value) {
                                        controller.indicator.value = true;
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        controller.index.value = value;
                                        controller.apiCalling(value);
                                      },
                                      controller: controller.tabcontroller,
                                      indicator: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: PravasDarkColors().textColor3,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12.px),
                                        ),
                                      ),
                                      indicatorPadding:
                                          EdgeInsets.only(right: 14.px),
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      unselectedLabelColor:
                                          PravasDarkColors().textColor1,
                                      labelColor: PravasDarkColors().textColor,
                                      labelStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.px),
                                      ),
                                      unselectedLabelStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12.px),
                                      ),
                                      tabs: [
                                        Tab(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text("${Constants.all}"
                                                    " [${controller.upcomingLength.value}]"),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Tab(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                    "${Constants.available} [${controller.ongoingLength.value}]"),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Tab(
                                          child: Row(
                                            children: [
                                              Expanded(

                                                child: Text(
                                                    "${Constants.disabled} [${controller.past.value}]"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: PageView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  listview(Constants.all),
                                  listview(Constants.available),
                                  listview(Constants.disabled),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }

  Widget listview(String type) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 14.px),
            child: Obx(
              () {
                if (kDebugMode) {
                  print(controller.itemList);
                }
                return Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: .09.dp),
                    borderRadius: BorderRadius.circular(18.px),
                  ),
                  color: PravasDarkColors().cardColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: .25.dp),
                    child: Column(
                      children: [
                        Box.showSizedbox(.25.dp),
                        Obx(() {
                          return TextField(
                            onTap: () {
                              controller.close.value = true;
                            },
                            focusNode: controller.focusNode,
                            controller: controller.search,
                            style:
                                TextStyle(color: PravasDarkColors().textColor),
                            onChanged: (value) => controller.searchValue(
                                value, controller.index.value),
                            cursorColor: PravasDarkColors().textColor,
                            decoration: InputDecoration(
                              suffixIcon: controller.close.value == true
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.close.value = false;
                                        controller.search.clear();
                                        controller.focusNode.unfocus();
                                        controller
                                            .apiCalling(controller.index.value);
                                      },
                                      child: Icon(Icons.close,
                                          color: PravasDarkColors().textColor1),
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
                          );
                        }),
                        SizedBox(height: .14.dp),
                        Expanded(
                          child: Obx(
                            () {
                              return SizedBox(
                                child: controller.indicator.value == false
                                    ?
                                ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: controller.itemList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(top: .2.dp),
                                            child: Obx(
                                              () {
                                                return GestureDetector(
                                                  onTap: () {
                                                    controller.close.value =
                                                        false;
                                                    controller.search.clear();
                                                    controller.focusNode
                                                        .unfocus();

                                                    controller.profile(
                                                        controller
                                                            .itemList[index]
                                                            .tourTheme!,
                                                        controller
                                                            .itemList[index]
                                                            .tourCategory!,
                                                        controller
                                                            .itemList[index]
                                                            .tourCode!,
                                                        controller
                                                            .itemList[index]
                                                            .batchStartDate!,
                                                        controller
                                                            .itemList[index]
                                                            .batchEndDate!,
                                                        controller
                                                            .itemList[index]
                                                            .batchCode!,
                                                        controller
                                                            .itemList[index]
                                                            .batchLimit!,
                                                        controller
                                                            .itemList[index]
                                                            .batchFee!,
                                                        controller
                                                            .itemList[index]
                                                            .batchBooking!,
                                                        controller
                                                            .itemList[index]
                                                            .tourImage!,
                                                        controller
                                                            .itemList[index]
                                                            .tourTitle!,
                                                        controller
                                                            .itemList[index]
                                                            .tourId!,
                                                        controller
                                                            .itemList[index]
                                                            .batchId!);
                                                  },
                                                  child: Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color:
                                                              PravasDarkColors()
                                                                  .border,
                                                          width: 0.06.dp),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.px),
                                                    ),
                                                    color: PravasDarkColors()
                                                        .cardColor,
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                            height: .22.dp),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      .20.dp),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: .6.dp,
                                                                  height:
                                                                      .35.dp,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(PravasDarkColors()
                                                                        .available
                                                                        .value),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius.circular(
                                                                          .18.dp),
                                                                    ),
                                                                  ),
                                                                  child: Center(
                                                                    child: Txt.showText(
                                                                        controller
                                                                            .itemList[
                                                                                index]
                                                                            .tourTheme!,
                                                                        14.sp,
                                                                        FontWeight
                                                                            .normal,
                                                                        PravasDarkColors()
                                                                            .availabletxt),
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                        SizedBox(height: .2.dp),
                                                        SizedBox(
                                                          height: 1.dp,
                                                          width:
                                                              double.infinity,
                                                          child: Image.network(
                                                              controller
                                                                  .itemList[
                                                                      index]
                                                                  .tourImage!,
                                                              height: 32.px,
                                                              width: 32.px),
                                                        ),
                                                        Divider(
                                                          thickness: .03.dp,
                                                          color:
                                                              PravasDarkColors()
                                                                  .textColor1,
                                                        ),
                                                        Box.showSizedbox(
                                                            0.14.dp),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      .20.dp),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  controller
                                                                      .itemList[
                                                                          index]
                                                                      .tourTitle
                                                                      .toString(),
                                                                  maxLines: 2,
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle: TextStyle(
                                                                        color: PravasDarkColors()
                                                                            .textColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        fontSize:
                                                                            14.sp),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: .18.dp),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      .20.dp),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "${DateFormat('dd-MM').format(DateTime.parse(controller.itemList[index].batchStartDate!))} to ",
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  textStyle: TextStyle(
                                                                      color: PravasDarkColors()
                                                                          .textColor1,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontSize:
                                                                          14.sp),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  DateFormat(
                                                                          'dd-MM-yyyy')
                                                                      .format(DateTime.parse(controller
                                                                          .itemList[
                                                                              index]
                                                                          .batchEndDate!)),
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle: TextStyle(
                                                                        color: PravasDarkColors()
                                                                            .textColor1,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        fontSize:
                                                                            14.sp),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  controller
                                                                      .itemList[
                                                                          index]
                                                                      .tourCategory
                                                                      .toString(),
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle: TextStyle(
                                                                        color: PravasDarkColors()
                                                                            .textColor1,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        fontSize:
                                                                            14.sp),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                "₹ ${controller.itemList[index].batchFee}",
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  textStyle: TextStyle(
                                                                      color: PravasDarkColors()
                                                                          .textColor1,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontSize:
                                                                          14.sp),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: .21.dp),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      )
                                    : Center(
                                        child: Indicator.progressIndicator(),
                                      ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: .2.dp),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
