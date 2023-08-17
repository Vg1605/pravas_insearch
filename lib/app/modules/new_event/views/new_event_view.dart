import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pravas/Utils/commonWidgets/appBarContainer.dart';
import 'package:pravas/Utils/commonWidgets/appbar.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/Utils/commonWidgets/sizedbox.dart';
import 'package:pravas/Utils/commonWidgets/text.dart';
import 'package:pravas/app/modules/new_event/controllers/new_event_controller.dart';
import 'package:pravas/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart' show DateFormat;

class NewEventView extends GetView<NewEventController> {
  const NewEventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewEventController());

    return FutureBuilder<Widget>(
        future:
            Appbar.showAppbar(Constants.info, context, controller.scaffoldKey),
        builder: (context, snapshot) {
          {
            return Scaffold(
              key: controller.scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: PravasDarkColors().scaffoldBackgroundColor,
              appBar: snapshot.hasData ? snapshot.data as PreferredSizeWidget : null,
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
                            Constants.addbatch,
                            controller.scaffoldKey),
                        Box.showSizedbox(.25.dp),
                        AppBarContainer.appbarContainer(
                            Constants.addbatch,
                            context,
                            Constants.addbatch,
                            controller.scaffoldKey),
                        Box.showSizedbox(.25.dp),
                        AppBarContainer.appbarContainer(
                            Constants.resetpassword,
                            context,
                            Constants.addbatch,
                            controller.scaffoldKey),
                        Box.showSizedbox(.25.dp),
                        AppBarContainer.appbarContainer(
                            Constants.notifications,
                            context,
                            Constants.addbatch,
                            controller.scaffoldKey),
                        Box.showSizedbox(.25.dp),
                        AppBarContainer.appbarContainer(
                            Constants.logout, context, Constants.addbatch),
                      ],
                    ),
                  ),
                ),
              ),
              body: GestureDetector(
                onTap: () {
                  controller.startdate.value = false;
                  controller.enddate.value = false;
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Card(
                    elevation: 0,
                    color: PravasDarkColors().cardColor,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            AppBar(
                                elevation: 0,
                                backgroundColor: PravasDarkColors().cardColor,
                                leading: GestureDetector(
                                  onTap: () {
                                    controller.back();
                                  },
                                  child: Image.asset(
                                    Constants.arrowleftpng,
                                    height: 26.px,
                                    width: 26.px,
                                  ),
                                ),
                                title: Txt.showText(
                                  Constants.addbatch,
                                  20.px,
                                  FontWeight.w600,
                                  PravasDarkColors().textColor,
                                ),
                                centerTitle: true),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.px),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Box.showSizedbox(0.20.dp),
                                      Txt.showText(
                                          Constants.Limit,
                                          16.sp,
                                          FontWeight.w300,
                                          PravasDarkColors().textColor1),
                                      Box.showSizedbox(0.18.dp),
                                      TextField(
                                        style: TextStyle(
                                            color:
                                                PravasDarkColors().textColor2),
                                        controller: controller.limitController,
                                        cursorColor:
                                            PravasDarkColors().textColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: .28.dp),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color: PravasDarkColors()
                                                    .textColor3,
                                                width: 0.06.dp),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color:
                                                    PravasDarkColors().border,
                                                width: 0.06.dp),
                                          ),
                                        ),
                                      ),
                                      Box.showSizedbox(0.20.dp),
                                      Txt.showText(
                                          Constants.Fee,
                                          16.sp,
                                          FontWeight.w300,
                                          PravasDarkColors().textColor1),
                                      Box.showSizedbox(0.18.dp),
                                      TextField(
                                        style: TextStyle(
                                            color:
                                                PravasDarkColors().textColor2),
                                        controller: controller.feeController,
                                        cursorColor:
                                            PravasDarkColors().textColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: .28.dp),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color: PravasDarkColors()
                                                    .textColor3,
                                                width: 0.06.dp),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color:
                                                    PravasDarkColors().border,
                                                width: 0.06.dp),
                                          ),
                                        ),
                                      ),
                                      Box.showSizedbox(0.20.dp),
                                      Txt.showText(
                                          Constants.studentfee,
                                          16.sp,
                                          FontWeight.w300,
                                          PravasDarkColors().textColor1),
                                      Box.showSizedbox(0.18.dp),
                                      TextField(
                                        style: TextStyle(
                                            color:
                                                PravasDarkColors().textColor2),
                                        controller:
                                            controller.studentfeeController,
                                        cursorColor:
                                            PravasDarkColors().textColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: .28.dp),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color: PravasDarkColors()
                                                    .textColor3,
                                                width: 0.06.dp),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color:
                                                    PravasDarkColors().border,
                                                width: 0.06.dp),
                                          ),
                                        ),
                                      ),
                                      Box.showSizedbox(0.20.dp),
                                      Txt.showText(
                                          Constants.adultfee,
                                          16.sp,
                                          FontWeight.w300,
                                          PravasDarkColors().textColor1),
                                      Box.showSizedbox(0.18.dp),
                                      TextField(
                                        style: TextStyle(
                                            color:
                                                PravasDarkColors().textColor2),
                                        controller:
                                            controller.adultfeeController,
                                        cursorColor:
                                            PravasDarkColors().textColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: .28.dp),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color: PravasDarkColors()
                                                    .textColor3,
                                                width: 0.06.dp),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color:
                                                    PravasDarkColors().border,
                                                width: 0.06.dp),
                                          ),
                                        ),
                                      ),
                                      Box.showSizedbox(0.20.dp),
                                      Txt.showText(
                                          Constants.birdfee,
                                          16.sp,
                                          FontWeight.w300,
                                          PravasDarkColors().textColor1),
                                      Box.showSizedbox(0.18.dp),
                                      TextField(
                                        style: TextStyle(
                                            color:
                                                PravasDarkColors().textColor2),
                                        controller:
                                            controller.earlybirdfeeController,
                                        cursorColor:
                                            PravasDarkColors().textColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: .28.dp),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color: PravasDarkColors()
                                                    .textColor3,
                                                width: 0.06.dp),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color:
                                                    PravasDarkColors().border,
                                                width: 0.06.dp),
                                          ),
                                        ),
                                      ),
                                      Box.showSizedbox(0.20.dp),
                                      Txt.showText(
                                          Constants.bookingamount,
                                          16.sp,
                                          FontWeight.w300,
                                          PravasDarkColors().textColor1),
                                      Box.showSizedbox(0.18.dp),
                                      TextField(
                                        style: TextStyle(
                                            color:
                                                PravasDarkColors().textColor2),
                                        controller:
                                            controller.bookingamountController,
                                        cursorColor:
                                            PravasDarkColors().textColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: .28.dp),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color: PravasDarkColors()
                                                    .textColor3,
                                                width: 0.06.dp),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color:
                                                    PravasDarkColors().border,
                                                width: 0.06.dp),
                                          ),
                                        ),
                                      ),
                                      Box.showSizedbox(0.20.dp),
                                      Txt.showText(
                                          Constants.capacity,
                                          16.sp,
                                          FontWeight.w300,
                                          PravasDarkColors().textColor1),
                                      Box.showSizedbox(0.18.dp),
                                      TextField(
                                        style: TextStyle(
                                            color:
                                                PravasDarkColors().textColor2),
                                        controller:
                                            controller.capacityController,
                                        cursorColor:
                                            PravasDarkColors().textColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: .28.dp),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color: PravasDarkColors()
                                                    .textColor3,
                                                width: 0.06.dp),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color:
                                                    PravasDarkColors().border,
                                                width: 0.06.dp),
                                          ),
                                        ),
                                      ),
                                      Box.showSizedbox(0.20.dp),
                                      Txt.showText(
                                          Constants.batchfor,
                                          16.sp,
                                          FontWeight.w300,
                                          PravasDarkColors().textColor1),
                                      Box.showSizedbox(0.18.dp),
                                      TextField(
                                        style: TextStyle(
                                            color:
                                                PravasDarkColors().textColor2),
                                        controller:
                                            controller.batchforController,
                                        cursorColor:
                                            PravasDarkColors().textColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: .28.dp),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color: PravasDarkColors()
                                                    .textColor3,
                                                width: 0.06.dp),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(.25.dp),
                                            borderSide: BorderSide(
                                                color:
                                                    PravasDarkColors().border,
                                                width: 0.06.dp),
                                          ),
                                        ),
                                      ),
                                      Box.showSizedbox(0.20.dp),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Txt.showText(
                                              Constants.starttime,
                                              16.sp,
                                              FontWeight.w300,
                                              PravasDarkColors().textColor1),
                                        ],
                                      ),
                                      Box.showSizedbox(0.18.dp),
                                      Container(
                                        width: double.infinity,
                                        height: 50.px,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(.25.dp),
                                          border: Border.all(
                                              color: PravasDarkColors().border,
                                              width: .05.dp),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Obx(
                                                () {
                                                  return Container(
                                                      height: 50.px,
                                                      decoration: BoxDecoration(
                                                        // color: Colors.white,
                                                        border: Border.all(
                                                            color: controller
                                                                    .startdate
                                                                    .value
                                                                ? PravasDarkColors()
                                                                    .textColor3
                                                                : PravasDarkColors()
                                                                    .border,
                                                            width: .05.dp),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    .25.dp)),
                                                      ),
                                                      child: Obx(
                                                        () {
                                                          return Calendar(
                                                              "start");
                                                        },
                                                      ));
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Box.showSizedbox(0.20.dp),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Txt.showText(
                                              Constants.endtime,
                                              16.sp,
                                              FontWeight.w300,
                                              PravasDarkColors().textColor1),
                                        ],
                                      ),
                                      Box.showSizedbox(0.18.dp),
                                      Container(
                                        width: double.infinity,
                                        height: 50.px,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(.25.dp),
                                          border: Border.all(
                                              color: PravasDarkColors().border,
                                              width: .05.dp),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Obx(
                                                () {
                                                  return Container(
                                                    height: 50.px,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.white,
                                                      border: Border.all(
                                                          color: controller
                                                                  .enddate.value
                                                              ? PravasDarkColors()
                                                                  .textColor3
                                                              : PravasDarkColors()
                                                                  .border,
                                                          width: .05.dp),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  .25.dp)),
                                                    ),
                                                    child: Obx(
                                                      () {
                                                        final formattedDate =
                                                            DateFormat(
                                                                    'MMMM d, y')
                                                                .format(
                                                                    controller
                                                                        .endDate
                                                                        .value);
                                                        return Calendar("end");
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Box.showSizedbox(0.20.dp),
                                      Txt.showText(
                                          Constants.calendar,
                                          16.sp,
                                          FontWeight.w300,
                                          PravasDarkColors().textColor1),
                                      Box.showSizedbox(0.20.dp),
                                      Obx(
                                        () {
                                          print(controller.startdate);
                                          return Container(
                                            decoration: BoxDecoration(
                                                // color: Colors.white,
                                                border: Border.all(
                                                    color: PravasDarkColors()
                                                        .border,
                                                    width: .05.dp),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(.25.dp))),
                                            width: double.infinity,
                                            height: 50.px,
                                            child: Row(
                                              children: [
                                                SizedBox(width: .26.dp),
                                                Container(
                                                    color:
                                                        PravasDarkColors().red,
                                                    width: 14.px,
                                                    height: 14.px),
                                                SizedBox(
                                                  width: .25.dp,
                                                ),
                                                // Expanded(
                                                //   child: Txt.showText(
                                                //       Constants.important,
                                                //       16.sp,
                                                //       FontWeight.w400,
                                                //       PravasDarkColors().textColor2),
                                                // ),
                                                // Obx(() => Text('Selected Item:

                                                Expanded(
                                                  child: DropdownButton<String>(
                                                    icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        size: 24.px,
                                                        color:
                                                            PravasDarkColors()
                                                                .textColor1),
                                                    isExpanded: true,
                                                    value: controller
                                                            .calendarValue
                                                            .value
                                                            .isEmpty
                                                        ? null
                                                        : controller
                                                            .calendarValue
                                                            .value,
                                                    items: controller
                                                        .calendarItems
                                                        .map((String item) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: item,
                                                        child: Txt.showText(
                                                            item,
                                                            16.sp,
                                                            FontWeight.w300,
                                                            PravasDarkColors()
                                                                .textColor1),
                                                      );
                                                    }).toList(),
                                                    onChanged:
                                                        (String? newItem) {
                                                      if (newItem != null) {
                                                        controller.calendarItem(
                                                            newItem);
                                                      }
                                                    },
                                                    underline: Container(), //
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: .25.dp,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      Box.showSizedbox(0.30.dp),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(.25.dp),
                                          color: PravasDarkColors().textColor3,
                                        ),
                                        width: double.infinity,
                                        height: 50.px,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.blue,
                                            // The background color of the button
                                            onPrimary: Colors.white,
                                            elevation: 4,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        .25.dp)), // Button
                                          ),
                                          onPressed: () {
                                            controller.createbatch();
                                          },
                                          child: Txt.showText(
                                              Constants.create,
                                              16.sp,
                                              FontWeight.w600,
                                              PravasDarkColors().textColor),
                                        ),
                                      ),
                                      Box.showSizedbox(0.30.dp),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }

  Widget Calendar(String type) {
    final formattedDate;
    if (type == "start") {
      formattedDate =
          DateFormat('MMMM d, y').format(controller.startDate.value);
    } else {
      formattedDate = DateFormat('MMMM d, y').format(controller.endDate.value);
    }

    return PopupMenuButton<DateTime>(
      position: PopupMenuPosition.under,
      padding: EdgeInsets.all(18.px),
      color: Color(0XFFF23262b),
      onOpened: () {
        if (type == "start") {
          controller.startdate.value = true;
          controller.enddate.value = false;
        } else {
          controller.startdate.value = false;
          controller.enddate.value = true;
        }
      },
      offset: Offset(0, 52),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.px)),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<DateTime>(
            child: Container(
              height: 1.060.dp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18.px),
                ),
                color: Color(0XFFF23262b),
              ),
              width: 280.px,
              margin: EdgeInsets.zero,
              constraints: BoxConstraints(
                maxHeight: 1.060.dp,
              ),
              // Adjust the width as needed
              child: CalendarCarousel<Event>(
                selectedDateTime: controller.endDate.value,
                pageSnapping: true,
                leftButtonIcon: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff30323B),
                    borderRadius: BorderRadius.circular(8.px),
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_back_ios_rounded,
                        color: Color(0xfff93959C), size: 11.5.px),
                  ),
                ),
                rightButtonIcon: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff30323B),
                    borderRadius: BorderRadius.circular(8.px),
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_forward_ios_rounded,
                        color: Color(0xfff93959C), size: 11.5.px),
                  ),
                ),
                selectedDayButtonColor: PravasDarkColors().textColor3,
                daysTextStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                inactiveWeekendTextStyle:
                    TextStyle(color: Colors.white.withOpacity(0.9)),
                weekdayTextStyle:
                    TextStyle(color: Colors.white.withOpacity(0.4)),
                weekendTextStyle:
                    TextStyle(color: Colors.white.withOpacity(0.9)),
                onDayPressed: (DateTime date, List<Event> events) {
                  if (type == "start") {
                    controller.startDate.value = date;
                  } else {
                    controller.endDate.value = date;
                  }

                  Get.back();
                },
              ),
            ),
          ),
        ];
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Txt.showText("   $formattedDate", 16.sp, FontWeight.w300,
            PravasDarkColors().textColor1),
        Padding(
          padding: EdgeInsets.only(right: 0.22.dp),
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 24.px,
            color: PravasDarkColors().textColor1,
          ),
        ),
      ]),
    );
  }
}
