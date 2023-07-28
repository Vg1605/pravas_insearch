import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/Utils/commonWidgets/sizedbox.dart';
import 'package:pravas/Utils/commonWidgets/text.dart';
import 'package:pravas/app/modules/reset_password/controllers/reset_password_controller.dart';
import 'package:pravas/colors.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PravasDarkColors().scaffoldBackgroundColor,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.grid_view,
              color: PravasDarkColors().textColor1,
              size: 24.px,
            ),
          ),
        ),
        backgroundColor: PravasDarkColors().scaffoldBackgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                    child: Obx(
                      () {
                        if (kDebugMode) {
                          print(controller.passwordVisible.value);
                        }
                        return Column(
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
                              Constants.Resetpassword,
                              22.sp,
                              FontWeight.w600,
                              PravasDarkColors().textColor,
                            ),
                            Box.showSizedbox(0.30.dp),
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
                            Box.showSizedbox(0.18.dp),
                            TextField(
                              controller: controller.emailController,
                              style: TextStyle(
                                  color: PravasDarkColors().textColor2),
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
                            Box.showSizedbox(0.18.dp),
                            TextField(
                              controller: controller.passwordController,
                              style: TextStyle(
                                  color: PravasDarkColors().textColor2),
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
                            Box.showSizedbox(0.28.dp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Txt.showText(
                                    Constants.confirmpassword,
                                    16.sp,
                                    FontWeight.w300,
                                    PravasDarkColors().textColor1),
                              ],
                            ),
                            Box.showSizedbox(0.18.dp),
                            TextField(
                              controller: controller.cnfpasswordController,
                              style: TextStyle(
                                  color: PravasDarkColors().textColor2),
                              cursorColor: PravasDarkColors().textColor,
                              obscureText: controller.passwordVisible1.value,
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
                                    controller.passwordVisible1.value =
                                        !controller.passwordVisible1.value;
                                  },
                                  icon: controller.passwordVisible1.value
                                      ? Image.asset(
                                          Constants.hidepng,
                                          height: 24.px,
                                        )
                                      : Image.asset(
                                          height: 24.px,
                                          Constants.eyepng,
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
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  // The background color of the button
                                  onPrimary: Colors.white,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(.25.dp),
                                  ), // Button
                                ),
                                onPressed: () {
                                  controller.lockscreen();
                                },
                                child: Txt.showText(
                                    Constants.Resetpassword,
                                    16.sp,
                                    FontWeight.w600,
                                    PravasDarkColors().textColor),
                              ),
                            ),
                            Box.showSizedbox(0.38.dp),
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
