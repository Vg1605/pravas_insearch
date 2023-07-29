import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pravas/Utils/commonWidgets/appBarContainer.dart';
import 'package:pravas/Utils/commonWidgets/appbar.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/Utils/commonWidgets/sizedbox.dart';
import 'package:pravas/Utils/commonWidgets/text.dart';
import 'package:pravas/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/participants_info_page_controller.dart';

class ParticipantsInfoPageView extends GetView<ParticipantsInfoPageController> {
  const ParticipantsInfoPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
        future:
            Appbar.showAppbar(Constants.info, context, controller.scaffoldKey),
        builder: (context, snapshot) {
          {
            return Scaffold(
              key: controller.scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: PravasDarkColors().scaffoldBackgroundColor,
              appBar: snapshot.data as PreferredSizeWidget,
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
                        AppBarContainer.appbarContainer(Constants.dashboard,
                            context, Constants.info, controller.scaffoldKey),
                        Box.showSizedbox(.25.dp),
                        AppBarContainer.appbarContainer(Constants.addbatch,
                            context, Constants.info, controller.scaffoldKey),
                        Box.showSizedbox(.25.dp),
                        AppBarContainer.appbarContainer(Constants.resetpassword,
                            context, Constants.info, controller.scaffoldKey),
                        Box.showSizedbox(.25.dp),
                        AppBarContainer.appbarContainer(Constants.notifications,
                            context, Constants.info, controller.scaffoldKey),
                        Box.showSizedbox(.25.dp),
                        AppBarContainer.appbarContainer(
                            Constants.logout, context, Constants.info),
                      ],
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: .1.dp),
                    AppBar(
                        elevation: 0,
                        backgroundColor:
                            PravasDarkColors().scaffoldBackgroundColor,
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
                          Constants.information,
                          20.px,
                          FontWeight.w600,
                          PravasDarkColors().textColor,
                        ),
                        centerTitle: true),
                    Divider(
                      thickness: .15.px,
                      color: PravasDarkColors().textColor1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: .15.dp),
                          Txt.showText(Constants.id, 16.sp, FontWeight.w600,
                              PravasDarkColors().textColor),
                          SizedBox(height: .1.dp),
                          Txt.showText(controller.participant.pId, 14.sp,
                              FontWeight.w600, PravasDarkColors().textColor1),
                          SizedBox(height: .2.dp),
                          Txt.showText(Constants.Name, 16.sp, FontWeight.w600,
                              PravasDarkColors().textColor),
                          SizedBox(height: .1.dp),
                          Txt.showText(controller.participant.name, 14.sp,
                              FontWeight.w600, PravasDarkColors().textColor1),
                          SizedBox(height: .2.dp),
                          Txt.showText(Constants.Contact, 16.sp,
                              FontWeight.w600, PravasDarkColors().textColor),
                          SizedBox(height: .1.dp),
                          Txt.showText(
                              controller.participant.contactNo != ""
                                  ? controller.participant.contactNo
                                  : "-",
                              14.sp,
                              FontWeight.w600,
                              PravasDarkColors().textColor1),
                          SizedBox(height: .2.dp),
                          Txt.showText(Constants.Email, 16.sp, FontWeight.w600,
                              PravasDarkColors().textColor),
                          SizedBox(height: .1.dp),
                          Txt.showText(
                              controller.participant.emailId != ""
                                  ? controller.participant.emailId
                                  : "-",
                              14.sp,
                              FontWeight.w600,
                              PravasDarkColors().textColor1),
                          SizedBox(height: .2.dp),
                          Txt.showText(Constants.Gender, 16.sp, FontWeight.w600,
                              PravasDarkColors().textColor),
                          SizedBox(height: .1.dp),
                          Txt.showText(controller.participant.gender, 14.sp,
                              FontWeight.w600, PravasDarkColors().textColor1),
                          SizedBox(height: .2.dp),
                          Txt.showText(Constants.Status, 16.sp, FontWeight.w600,
                              PravasDarkColors().textColor),
                          SizedBox(height: .1.dp),
                          Txt.showText(
                              controller.participant.paymentStatus,
                              14.sp,
                              FontWeight.w600,
                              PravasDarkColors().textColor1),
                          SizedBox(height: .2.dp),
                          Txt.showText(Constants.Remaining, 16.sp,
                              FontWeight.w600, PravasDarkColors().textColor),
                          SizedBox(height: .1.dp),
                          Txt.showText(
                              controller.participant.totalRemainingAmount,
                              14.sp,
                              FontWeight.w600,
                              PravasDarkColors().textColor1),
                          SizedBox(height: .2.dp),
                          Txt.showText(Constants.bill, 16.sp, FontWeight.w600,
                              PravasDarkColors().textColor),
                          SizedBox(height: .1.dp),
                          Txt.showText(
                              controller.participant.totalBillAmount,
                              14.sp,
                              FontWeight.w600,
                              PravasDarkColors().textColor1),
                          SizedBox(height: .2.dp),
                          Txt.showText(Constants.paidamount, 16.sp,
                              FontWeight.w600, PravasDarkColors().textColor),
                          SizedBox(height: .1.dp),
                          Txt.showText(
                              controller.participant.totalPaidAmount,
                              14.sp,
                              FontWeight.w600,
                              PravasDarkColors().textColor1),
                          SizedBox(height: .2.dp),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        });
  }
}
