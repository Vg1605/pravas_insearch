import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/Utils/commonWidgets/progressindicator.dart';
import 'package:pravas/Utils/commonWidgets/sizedbox.dart';
import 'package:pravas/Utils/commonWidgets/text.dart';
import 'package:pravas/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: PravasDarkColors().scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Box.showSizedbox(60.px),
              Image.asset(Constants.loginpng),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 8.px, horizontal: 18.px),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: .09.dp),
                    borderRadius: BorderRadius.circular(24.px),
                  ),
                  color: PravasDarkColors().cardColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.px),
                    child: Obx(
                      () {
                        return Column(
                          children: [
                            Box.showSizedbox(30.px),
                            Txt.showText(Constants.Login, 22.sp,
                                FontWeight.w600, PravasDarkColors().textColor),
                            Box.showSizedbox(0.35.dp),
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
                              style: TextStyle(
                                  color: PravasDarkColors().textColor2),
                              controller: controller.emailController,
                              cursorColor: PravasDarkColors().textColor,
                              decoration: InputDecoration(
                                fillColor:
                                    PravasDarkColors().scaffoldBackgroundColor,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: .28.dp),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(.25.dp),
                                  borderSide: BorderSide(
                                      color: PravasDarkColors().textColor3,
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
                                    Constants.password,
                                    16.sp,
                                    FontWeight.w300,
                                    PravasDarkColors().textColor1),
                              ],
                            ),
                            Box.showSizedbox(0.20.dp),
                            TextField(
                              style: TextStyle(
                                  color: PravasDarkColors().textColor2),
                              controller: controller.passwordController,
                              cursorColor: PravasDarkColors().textColor,
                              obscureText: controller.passwordVisible.value,
                              decoration: InputDecoration(
                                fillColor:
                                    PravasDarkColors().scaffoldBackgroundColor,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: .28.dp),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(.25.dp),
                                  borderSide: BorderSide(
                                      color: PravasDarkColors().textColor3,
                                      width: 0.06.dp),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(.25.dp),
                                  borderSide: BorderSide(
                                      color: PravasDarkColors().border,
                                      width: 0.06.dp),
                                ),
                                suffixIcon: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    controller.passwordVisible.value =
                                        !controller.passwordVisible.value;
                                  },
                                  icon: controller.passwordVisible.value
                                      ? Image.asset(
                                          Constants.hidepng,
                                          height: 24.px,
                                        )
                                      : Image.asset(
                                          Constants.eyepng,
                                          height: 24.px,
                                          color: PravasDarkColors().textColor1,
                                          width: .3.dp,
                                        ),
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
                                child: Obx(
                                  () {
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        // The background color of the button
                                        onPrimary: Colors.white,
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                .25.dp)), // Button
                                      ),
                                      onPressed: () {
                                        controller.indicator.value = true;
                                        controller.dashboard();
                                      },
                                      child: controller.indicator.value == false
                                          ? Txt.showText(
                                              Constants.login,
                                              16.sp,
                                              FontWeight.w600,
                                              PravasDarkColors().textColor)
                                          : Center(
                                              child: Indicator
                                                  .progressIndicator()),
                                    );
                                  },
                                )),
                            Box.showSizedbox(0.45.dp),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
