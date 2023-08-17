import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pravas/Utils/commonWidgets/appBarContainer.dart';
import 'package:pravas/Utils/commonWidgets/appbar.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/Utils/commonWidgets/sizedbox.dart';
import 'package:pravas/Utils/commonWidgets/text.dart';
import 'package:pravas/app/api/model/participants%20Model.dart';
import 'package:pravas/app/api/model/tourModel.dart';
import 'package:pravas/app/modules/profile_page/controllers/profile_page_controller.dart';
import 'package:pravas/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
        future: Appbar.showAppbar(
            Constants.profile, context, controller.scaffoldKey),
        builder: (context, snapshot) {
          {
            return DefaultTabController(
              initialIndex: 0,
              length: 3,
              child: Scaffold(
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
                              Constants.profile,
                              controller.scaffoldKey),
                          Box.showSizedbox(.25.dp),
                          AppBarContainer.appbarContainer(
                              Constants.addbatch,
                              context,
                              Constants.profile,
                              controller.scaffoldKey),
                          Box.showSizedbox(.25.dp),
                          AppBarContainer.appbarContainer(
                              Constants.resetpassword,
                              context,
                              Constants.profile,
                              controller.scaffoldKey),
                          Box.showSizedbox(.25.dp),
                          AppBarContainer.appbarContainer(
                              Constants.notifications,
                              context,
                              Constants.profile,
                              controller.scaffoldKey),
                          Box.showSizedbox(.25.dp),
                          AppBarContainer.appbarContainer(
                              Constants.logout, context, Constants.profile),
                        ],
                      ),
                    ),
                  ),
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 6.px),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.px, vertical: 8.px),
                          child: TabBar(
                            controller: controller.tabcontroller,
                            indicator: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: PravasDarkColors().textColor3,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.px),
                              ),
                            ),
                            indicatorPadding: EdgeInsets.only(right: 14.px),
                            indicatorSize: TabBarIndicatorSize.tab,
                            unselectedLabelColor: PravasDarkColors().textColor1,
                            labelColor: PravasDarkColors().textColor,
                            labelStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12.px),
                            ),
                            unselectedLabelStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.px),
                            ),
                            tabs: [
                              const Tab(
                                child:
                                    Center(child: Text(Constants.information)),
                              ),
                              Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Obx(() {
                                      return Expanded(
                                          child: Text(
                                              "${Constants.participants}[${controller.length.value.isNotEmpty ? controller.length.value : 0}]"));
                                    }),
                                  ],
                                ),
                              ),
                              const Tab(
                                child: Center(child: Text(Constants.itinerary)),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: .15.px,
                          color: PravasDarkColors().textColor1,
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          info(),
                          participants(),
                          itinerary(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }

  Widget info() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () {
          return Column(
            children: [
              SizedBox(height: .2.dp),
              Center(
                child: ClipRect(
                  child: Image.network(controller.tourImage.value),
                ),
              ),
              SizedBox(height: .2.dp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.px),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Txt.showText(controller.tourTitle.value, 14.px,
                              FontWeight.w500, PravasDarkColors().textColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: .18.dp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.px),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        thickness: .15.px,
                        color: PravasDarkColors().textColor1,
                      ),
                      SizedBox(height: .20.dp),
                      Txt.showText(Constants.Info, 16.sp, FontWeight.w600,
                          PravasDarkColors().textColor),
                      SizedBox(height: .2.dp),
                      Txt.showText(Constants.tourtheme, 16.sp, FontWeight.w600,
                          PravasDarkColors().textColor),
                      SizedBox(height: .1.dp),
                      Txt.showText(controller.tourTheme.value, 14.sp,
                          FontWeight.w600, PravasDarkColors().textColor1),
                      SizedBox(height: .2.dp),
                      Txt.showText(Constants.tourcategory, 16.sp,
                          FontWeight.w600, PravasDarkColors().textColor),
                      SizedBox(height: .1.dp),
                      Txt.showText(controller.tourCategory.value, 14.sp,
                          FontWeight.w600, PravasDarkColors().textColor1),
                      SizedBox(height: .2.dp),
                      Txt.showText(Constants.tourcode, 16.sp, FontWeight.w600,
                          PravasDarkColors().textColor),
                      SizedBox(height: .1.dp),
                      Txt.showText(controller.tourCode.value, 14.sp,
                          FontWeight.w600, PravasDarkColors().textColor1),
                      SizedBox(height: .2.dp),
                      Txt.showText(Constants.startdate, 16.sp, FontWeight.w600,
                          PravasDarkColors().textColor),
                      SizedBox(height: .1.dp),
                      Txt.showText(controller.batchStartDate.value, 14.sp,
                          FontWeight.w600, PravasDarkColors().textColor1),
                      SizedBox(height: .2.dp),
                      Txt.showText(Constants.enddate, 16.sp, FontWeight.w600,
                          PravasDarkColors().textColor),
                      SizedBox(height: .1.dp),
                      Txt.showText(controller.batchEndDate.value, 14.sp,
                          FontWeight.w600, PravasDarkColors().textColor1),
                      SizedBox(height: .2.dp),
                      Txt.showText(Constants.batchcode, 16.sp, FontWeight.w600,
                          PravasDarkColors().textColor),
                      SizedBox(height: .1.dp),
                      Txt.showText(controller.batchCode.value, 14.sp,
                          FontWeight.w600, PravasDarkColors().textColor1),
                      SizedBox(height: .2.dp),
                      Txt.showText(Constants.batchlimit, 16.sp, FontWeight.w600,
                          PravasDarkColors().textColor),
                      SizedBox(height: .1.dp),
                      Txt.showText(controller.batchLimit.value, 14.sp,
                          FontWeight.w600, PravasDarkColors().textColor1),
                      SizedBox(height: .2.dp),
                      Txt.showText(Constants.batchfee, 16.sp, FontWeight.w600,
                          PravasDarkColors().textColor),
                      SizedBox(height: .1.dp),
                      Txt.showText(controller.batchFee.value, 14.sp,
                          FontWeight.w600, PravasDarkColors().textColor1),
                      SizedBox(height: .2.dp),
                      Txt.showText(Constants.batchbooking, 16.sp,
                          FontWeight.w600, PravasDarkColors().textColor),
                      SizedBox(height: .1.dp),
                      Txt.showText(controller.batchBooking.value, 14.sp,
                          FontWeight.w600, PravasDarkColors().textColor1),
                      SizedBox(height: .2.dp),
                    ]),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget itinerary() {
    return Obx(() {
      return controller.itemList.isNotEmpty
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.itemList.length,
              itemBuilder: (context, index) {
                TourItinerary itinerary = controller.itemList[index];
                return ListTile(
                  title: Txt.showText(itinerary.title, 14.px, FontWeight.normal,
                      PravasDarkColors().textColor),
                  subtitle: Txt.showText(itinerary.desc, 12.px,
                      FontWeight.normal, PravasDarkColors().textColor1),
                );
              },
            )
          : Center(
              child: Txt.showText(Constants.noTour, 14.px, FontWeight.normal,
                  PravasDarkColors().textColor),
            );
    });
  }

  Widget participants() {
    return Obx(() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.length.value.isNotEmpty
                  ? Txt.showText(controller.tourCode.value, 14.px,
                      FontWeight.w500, PravasDarkColors().textColor)
                  : const SizedBox.shrink(),
            ],
          ),
          Expanded(
            child: controller.length.value.isNotEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount:
                        controller.participantsModel.value?.data.length ?? 0,
                    itemBuilder: (context, index) {
                      ParticipantData participant =
                          controller.participantsModel.value!.data[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: .20.dp, vertical: .10.dp),
                        child: GestureDetector(
                          onTap: () {
                            controller.info(
                              participant,
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: PravasDarkColors().border,
                                  width: 0.06.dp),
                              borderRadius: BorderRadius.circular(18.px),
                            ),
                            color: PravasDarkColors().scaffoldBackgroundColor,
                            child: SizedBox(
                                height: .65.dp,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: .20.dp,
                                    right: .20.dp,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: .25.dp),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          .15.dp),
                                                  color: participant
                                                              .totalRemainingAmount ==
                                                          "Rs.0"
                                                      ? PravasDarkColors()
                                                          .available
                                                      : PravasDarkColors()
                                                          .disabled),
                                              height: .30.dp,
                                              width: .5.dp,
                                              child: Center(
                                                child: participant
                                                            .totalRemainingAmount ==
                                                        "Rs.0"
                                                    ? Txt.showText(
                                                        Constants.paid,
                                                        10.px,
                                                        FontWeight.normal,
                                                        PravasDarkColors()
                                                            .availabletxt)
                                                    : Txt.showText(
                                                        Constants.pending,
                                                        10.px,
                                                        FontWeight.normal,
                                                        PravasDarkColors()
                                                            .disabledtxt),
                                              ),
                                            ),
                                            Box.showSizedbox(.20.dp),
                                            Txt.showText(
                                                participant.name,
                                                12.px,
                                                FontWeight.normal,
                                                PravasDarkColors().textColor),
                                            Txt.showText(
                                                participant.emailId,
                                                12.px,
                                                FontWeight.normal,
                                                PravasDarkColors().textColor1)
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.sendWhatsAppMessage(
                                                  participant.contactNo);
                                            },
                                            child: Card(
                                              color:
                                                  PravasDarkColors().available,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.px),
                                              ),
                                              child: SizedBox(
                                                height: .40.dp,
                                                width: .45.dp,
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.all(.15.dp),
                                                  child: Image.asset(
                                                    "assets/img.png",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.callNumber(
                                                  participant.contactNo);
                                            },
                                            child: Card(
                                              color:
                                                  PravasDarkColors().textColor3,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.px),
                                              ),
                                              child: SizedBox(
                                                height: .40.dp,
                                                width: .45.dp,
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.all(.15.dp),
                                                  child: Icon(
                                                    Icons.call,
                                                    color: PravasDarkColors()
                                                        .textColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Txt.showText(Constants.noParticipants, 14.px,
                        FontWeight.normal, PravasDarkColors().textColor),
                  ),
          ),
        ],
      );
    });
  }
}
