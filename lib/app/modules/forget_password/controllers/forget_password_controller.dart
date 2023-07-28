import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pravas/app/routes/app_pages.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void back() {
    Get.back();
  }

  void resetpassword() {
    emailController.text = "";
    Get.toNamed(Routes.Reset_PASSWORD);
  }
}
