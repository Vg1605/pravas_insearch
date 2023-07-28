import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/Utils/commonWidgets/sizedbox.dart';
import 'package:pravas/Utils/commonWidgets/text.dart';
import 'package:pravas/app/modules/forget_password/controllers/forget_password_controller.dart';
import 'package:pravas/colors.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: PravasDarkColors().scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Box.showSizedbox(60.px),
              Image.asset(Constants.loginpng),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 8.px, horizontal: 20.px),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: .09.dp),
                    borderRadius: BorderRadius.circular(24.px),
                  ),
                  color: PravasDarkColors().cardColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.px),
                      child: Column(
                        children: [
                          Box.showSizedbox(40.px),
                          Container(
                            width: 150.px,
                            height: 150.px,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: PravasDarkColors().circleColor,
                            ),
                            child: Image.asset(Constants.lockpng),
                          ),
                          Box.showSizedbox(0.30.dp),
                          Txt.showText(
                            Constants.recoverpassword,
                            22.sp,
                            FontWeight.w600,
                            PravasDarkColors().textColor,
                          ),
                          Box.showSizedbox(0.32.dp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Txt.showText(
                                  Constants.email,
                                  16.sp,
                                  FontWeight.w300,
                                  PravasDarkColors().textColor1),
                            ],
                          ),
                          Box.showSizedbox(0.20.dp),
                          TextField(
                            controller: controller.emailController,
                            style:
                                TextStyle(color: PravasDarkColors().textColor2),
                            cursorColor: PravasDarkColors().textColor,
                            decoration: InputDecoration(
                              fillColor:
                                  PravasDarkColors().scaffoldBackgroundColor,
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
                          Box.showSizedbox(0.32.dp),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(.25.dp),
                              color: PravasDarkColors().textColor3,
                            ),
                            width: double.infinity,
                            height: 50.px,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.resetpassword();
                              },
                              child: Txt.showText(
                                  Constants.recoverpassword,
                                  16.sp,
                                  FontWeight.w600,
                                  PravasDarkColors().textColor),
                            ),
                          ),
                          Box.showSizedbox(0.38.dp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.back();
                                },
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: Constants.gobackto,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.normal,
                                            color:
                                                PravasDarkColors().textColor1,
                                            fontSize: 14.sp),
                                      ),
                                      TextSpan(
                                        text: Constants.Login,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.normal,
                                            color:
                                                PravasDarkColors().textColor3,
                                            fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Box.showSizedbox(0.26.dp),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
