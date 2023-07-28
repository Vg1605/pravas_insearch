import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/Utils/commonWidgets/sizedbox.dart';
import 'package:pravas/Utils/commonWidgets/text.dart';
import 'package:pravas/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/cupertino.dart';

import '../controllers/new_event_controller.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart' show DateFormat;

class NewEventView extends GetView<NewEventController> {
  const NewEventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewEventController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0XFFF23262b),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: AppBar(
                elevation: 0,
                backgroundColor: PravasDarkColors().scaffoldBackgroundColor,
                leading: Image.asset(
                  Constants.menupng,
                ),
                actions: [
                  Image.asset(
                    Constants.searchpng,
                    height: 18.5.px,
                    width: 18.5.px,
                  ),
                  SizedBox(width: 15.px),
                  Icon(
                    Icons.notifications_none_outlined,
                    color: PravasDarkColors().textColor1,
                    size: 24.px,
                  ),
                  SizedBox(width: 15.px),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: .18.dp),
                    child: Container(
                        color: PravasDarkColors().border,
                        height: .2.dp,
                        width: .04.dp),
                  ),
                  SizedBox(width: 18.px),
                  ClipRect(
                    child: Image.asset(Constants.avatarpng,
                        height: 32.px, width: 32.px),
                  ),
                  Icon(Icons.arrow_drop_down_rounded,
                      size: 24.px, color: PravasDarkColors().textColor1),
                  SizedBox(width: 10.px),
                ],
              ),
            ),
            Expanded(
              child: Divider(
                thickness: .50.px,
                color: PravasDarkColors().textColor1,
              ),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          controller.startdate.value = false;
          controller.starttime.value = false;
          controller.enddate.value = false;
          controller.endtime.value = false;
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Card(
            elevation: 0,
            color: Color(0XFFF23262b),
            child: Column(
              children: [
                Column(
                  children: [
                    Box.showSizedbox(.1.dp),
                    AppBar(
                        elevation: 0,
                        backgroundColor: const Color(0XFFF23262b),
                        leading: Image.asset(
                          Constants.arrowleftpng,
                          height: 24.px,
                          width: 24.px,
                        ),
                        title: Txt.showText(
                          Constants.newevent,
                          28.px,
                          FontWeight.w600,
                          PravasDarkColors().textColor,
                        ),
                        centerTitle: true),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.px, vertical: 8.px),
                          child: Column(
                            children: [
                              Box.showSizedbox(0.24.dp),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Txt.showText(
                                      Constants.title,
                                      16.sp,
                                      FontWeight.w300,
                                      PravasDarkColors().textColor1),
                                ],
                              ),
                              Box.showSizedbox(0.20.dp),
                              TextField(
                                style: TextStyle(
                                    color: PravasDarkColors().textColor2),
                                controller: controller.titleController,
                                cursorColor: PravasDarkColors().textColor,
                                decoration: InputDecoration(
                                  fillColor: PravasDarkColors()
                                      .scaffoldBackgroundColor,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: .28.dp),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(.25.dp),
                                    borderSide: BorderSide(
                                        color: PravasDarkColors().border,
                                        width: 0.06.dp),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(.25.dp),
                                    borderSide: BorderSide(
                                        color: PravasDarkColors().border,
                                        width: 0.06.dp),
                                  ),
                                ),
                              ),
                              Box.showSizedbox(0.28.dp),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Txt.showText(
                                      Constants.description,
                                      16.sp,
                                      FontWeight.w300,
                                      PravasDarkColors().textColor1),
                                ],
                              ),
                              Box.showSizedbox(0.20.dp),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(.25.dp),
                                  border: Border.all(
                                      color: PravasDarkColors().border),
                                  color: Color(0XFFF23262b),
                                ),
                                height: .6.dp,
                                child: Stack(
                                  children: [
                                    TextField(
                                      style: TextStyle(
                                          color: PravasDarkColors().textColor2),
                                      cursorColor: PravasDarkColors().textColor,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: .28.dp),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: .2.dp,
                                      right: .2.dp,
                                      child: Image.asset(
                                        'assets/resize.png',
                                        width: 12.px,
                                        height: 12.px,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Box.showSizedbox(0.28.dp),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Txt.showText(
                                      Constants.starttime,
                                      16.sp,
                                      FontWeight.w300,
                                      PravasDarkColors().textColor1),
                                ],
                              ),
                              Box.showSizedbox(0.20.dp),
                              Container(
                                width: double.infinity,
                                height: 50.px,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(.25.dp),
                                  border: Border.all(
                                      color: PravasDarkColors().border,
                                      width: .05.dp),
                                ),
                                child: Row(
                                  children: [
                                    Obx(
                                      () {
                                        print(controller.starttime.value);
                                        return Container(
                                          width: 84.px,
                                          height: 50.px,
                                          decoration: BoxDecoration(
                                              // color: Colors.white,
                                              border: Border.all(
                                                  color:
                                                      controller.starttime.value
                                                          ? PravasDarkColors()
                                                              .textColor3
                                                          : PravasDarkColors()
                                                              .border,
                                                  width: .05.dp),
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(.25.dp),
                                                  bottomLeft:
                                                      Radius.circular(.25.dp))),
                                          child: time("start"),
                                        );
                                      },
                                    ),
                                    Expanded(
                                      child: Obx(
                                        () {
                                          print(controller.startdate.value);
                                          return Container(
                                              height: 50.px,
                                              decoration: BoxDecoration(
                                                // color: Colors.white,
                                                border: Border.all(
                                                    color: controller
                                                            .startdate.value
                                                        ? PravasDarkColors()
                                                            .textColor3
                                                        : PravasDarkColors()
                                                            .border,
                                                    width: .05.dp),
                                                borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(.25.dp),
                                                  bottomRight:
                                                      Radius.circular(.25.dp),
                                                ),
                                              ),
                                              child: Obx(
                                                () {
                                                  return Calendar("start");
                                                },
                                              ));
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Box.showSizedbox(0.28.dp),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Txt.showText(
                                      Constants.endtime,
                                      16.sp,
                                      FontWeight.w300,
                                      PravasDarkColors().textColor1),
                                ],
                              ),
                              Box.showSizedbox(0.20.dp),
                              Container(
                                width: double.infinity,
                                height: 50.px,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(.25.dp),
                                  border: Border.all(
                                      color: PravasDarkColors().border,
                                      width: .05.dp),
                                ),
                                child: Row(
                                  children: [
                                    Obx(
                                      () {
                                        print(controller.endtime.value);
                                        return Container(
                                          width: 84.px,
                                          height: 50.px,
                                          decoration: BoxDecoration(
                                              // color: Colors.white,
                                              border: Border.all(
                                                  color:
                                                      controller.endtime.value
                                                          ? PravasDarkColors()
                                                              .textColor3
                                                          : PravasDarkColors()
                                                              .border,
                                                  width: .05.dp),
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(.25.dp),
                                                  bottomLeft:
                                                      Radius.circular(.25.dp))),
                                          child: time("end"),
                                        );
                                      },
                                    ),
                                    Expanded(
                                      child: Obx(
                                        () {
                                          print(controller.enddate.value);
                                          return Container(
                                            height: 50.px,
                                            decoration: BoxDecoration(
                                              // color: Colors.white,
                                              border: Border.all(
                                                  color:
                                                      controller.enddate.value
                                                          ? PravasDarkColors()
                                                              .textColor3
                                                          : PravasDarkColors()
                                                              .border,
                                                  width: .05.dp),
                                              borderRadius: BorderRadius.only(
                                                topRight:
                                                    Radius.circular(.25.dp),
                                                bottomRight:
                                                    Radius.circular(.25.dp),
                                              ),
                                            ),
                                            child: Obx(
                                              () {
                                                final formattedDate =
                                                    DateFormat('MMMM d, y')
                                                        .format(controller
                                                            .endDate.value);
                                                return Calendar("end");
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(
                          () {
                            print(controller.allday.value);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: .12.dp),
                                Checkbox(
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return PravasDarkColors()
                                          .textColor3; // Selected checkbox color
                                    }
                                    return PravasDarkColors()
                                        .border; // Unselected checkbox color
                                  }),
                                  checkColor: PravasDarkColors().textColor,
                                  value: controller.checkbox1.value,
                                  onChanged: controller.handleCheckbox1,
                                ),
                                Txt.showText(
                                    Constants.allday,
                                    16.sp,
                                    FontWeight.w300,
                                    PravasDarkColors().textColor1),
                                Checkbox(
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return PravasDarkColors()
                                          .textColor3; // Selected checkbox color
                                    }
                                    return PravasDarkColors()
                                        .border; // Unselected checkbox color
                                  }),
                                  checkColor: PravasDarkColors().textColor,
                                  value: controller.checkbox2.value,
                                  onChanged: controller.handleCheckbox2,
                                ),
                                Txt.showText(
                                    Constants.repeat,
                                    16.sp,
                                    FontWeight.w300,
                                    PravasDarkColors().textColor1),
                              ],
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                            color: PravasDarkColors().border,
                                            width: .05.dp),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(.25.dp))),
                                    width: double.infinity,
                                    height: 50.px,
                                    child: Row(
                                      children: [
                                        SizedBox(width: .26.dp),
                                        Container(
                                            color: PravasDarkColors().red,
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
                                        // Obx(() => Text('Selected Item: ${controller.selectedItem.value}')),
                                        Expanded(
                                          child: DropdownButton<String>(
                                            icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                size: 24.px,
                                                color: PravasDarkColors()
                                                    .textColor1),
                                            isExpanded: true,
                                            value: controller
                                                    .calendarValue.value.isEmpty
                                                ? null
                                                : controller
                                                    .calendarValue.value,
                                            items: controller.calendarItems
                                                .map((String item) {
                                              return DropdownMenuItem<String>(
                                                value: item,
                                                child: Txt.showText(
                                                    item,
                                                    16.sp,
                                                    FontWeight.w300,
                                                    PravasDarkColors()
                                                        .textColor1),
                                              );
                                            }).toList(),
                                            onChanged: (String? newItem) {
                                              if (newItem != null) {
                                                controller
                                                    .calendarItem(newItem);
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
                              Box.showSizedbox(0.28.dp),
                              Txt.showText(
                                  Constants.selectcategory,
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
                                            color: PravasDarkColors().border,
                                            width: .05.dp),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(.25.dp))),
                                    width: double.infinity,
                                    height: 50.px,
                                    child: Row(
                                      children: [
                                        SizedBox(width: .26.dp),
                                        Container(
                                            color: PravasDarkColors().red,
                                            width: 14.px,
                                            height: 14.px),
                                        SizedBox(
                                          width: .25.dp,
                                        ),
                                        Expanded(
                                          child: DropdownButton<String>(
                                            icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                size: 24.px,
                                                color: PravasDarkColors()
                                                    .textColor1),
                                            isExpanded: true,
                                            value: controller
                                                    .categoryValue.value.isEmpty
                                                ? null
                                                : controller
                                                    .categoryValue.value,
                                            items: controller.categoryItems
                                                .map((String item) {
                                              return DropdownMenuItem<String>(
                                                value: item,
                                                child: Txt.showText(
                                                    item,
                                                    16.sp,
                                                    FontWeight.w300,
                                                    PravasDarkColors()
                                                        .textColor1),
                                              );
                                            }).toList(),
                                            onChanged: (String? newItem) {
                                              if (newItem != null) {
                                                controller
                                                    .categoryItem(newItem);
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
                              Box.showSizedbox(0.28.dp),
                              Txt.showText(
                                  Constants.selecttour,
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
                                            color: PravasDarkColors().border,
                                            width: .05.dp),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(.25.dp))),
                                    width: double.infinity,
                                    height: 50.px,
                                    child: Row(
                                      children: [
                                        SizedBox(width: .26.dp),
                                        Container(
                                            color: PravasDarkColors().red,
                                            width: 14.px,
                                            height: 14.px),
                                        SizedBox(
                                          width: .25.dp,
                                        ),
                                        Expanded(
                                          child: DropdownButton<String>(
                                            icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                size: 24.px,
                                                color: PravasDarkColors()
                                                    .textColor1),
                                            isExpanded: true,
                                            value: controller
                                                    .tourValue.value.isEmpty
                                                ? null
                                                : controller.tourValue.value,
                                            items: controller.tourItems
                                                .map((String item) {
                                              return DropdownMenuItem<String>(
                                                value: item,
                                                child: Txt.showText(
                                                    item,
                                                    16.sp,
                                                    FontWeight.w300,
                                                    PravasDarkColors()
                                                        .textColor1),
                                              );
                                            }).toList(),
                                            onChanged: (String? newItem) {
                                              if (newItem != null) {
                                                controller.tourItem(newItem);
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
                              Box.showSizedbox(0.32.dp),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(.25.dp),
                                  color: PravasDarkColors().textColor3,
                                ),
                                width: double.infinity,
                                height: 50.px,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Txt.showText(
                                      Constants.create,
                                      16.sp,
                                      FontWeight.w600,
                                      PravasDarkColors().textColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Box.showSizedbox(0.26.dp),
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

  Widget time(String type) {
    final formattedTime;
    if (type == "start") {
      formattedTime = DateFormat('HH:mm').format(controller.sTime.value);
    } else {
      formattedTime = DateFormat('HH:mm').format(controller.eTime.value);
    }
    return PopupMenuButton<DateTime>(
      position: PopupMenuPosition.under,
      color: Color(0XFFF23262b),
      onOpened: () {
        if (type == "start") {
          controller.starttime.value = true;
          controller.endtime.value = false;
          controller.startdate.value = false;
          controller.enddate.value = false;
        } else {
          controller.starttime.value = false;
          controller.endtime.value = true;
          controller.startdate.value = false;
          controller.enddate.value = false;
        }
      },
      offset: Offset(0, 52),
      icon: Txt.showText(
          formattedTime, 16.sp, FontWeight.w300, PravasDarkColors().textColor1),
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
              width: .7.dp,
              // Adjust the width as needed
              child: ListView.builder(
                itemCount: controller.timeOptions.length,
                itemBuilder: (context, index) {
                  final time = controller.timeOptions[index];
                  final formattedTime = DateFormat.Hm().format(time);
                  controller.isSelected.value = time == controller.startTime;
                  return ListTile(
                    onTap: () {
                      if (type == "start") {
                        controller.sTime.value = time;
                      } else {
                        controller.eTime.value = time;
                      }

                      Get.back();
                    },
                    title: Txt.showText(
                        formattedTime,
                        16.sp,
                        FontWeight.w600,
                        (controller.sTime.value == time)
                            ? PravasDarkColors().textColor3
                            : PravasDarkColors().textColor1),
                    leading: Icon(
                      Icons.check,
                      color: (controller.sTime.value == time)
                          ? PravasDarkColors().textColor3
                          : Colors.transparent,
                    ),
                  );
                },
              ),
            ),
          ),
        ];
      },
    );
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
          controller.starttime.value = false;
          controller.endtime.value = false;
          controller.startdate.value = true;
          controller.enddate.value = false;
        } else {
          controller.starttime.value = false;
          controller.endtime.value = false;
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

                  print('Selected date: ${controller.endDate.value}');
                  Get.back();
                },
              ),
            ),
          ),
        ];
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Txt.showText("   ${formattedDate}", 16.sp, FontWeight.w300,
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
