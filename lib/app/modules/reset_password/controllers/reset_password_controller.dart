import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pravas/app/routes/app_pages.dart';

class ResetPasswordController extends GetxController {
  final passwordVisible = true.obs;
  final passwordVisible1 = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cnfpasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void login() {
    Get.toNamed(Routes.LOGIN_PAGE);
  }

  void lockscreen() {
    emailController.text = "";
    passwordController.text = "";
    cnfpasswordController.text = "";
  }
}
