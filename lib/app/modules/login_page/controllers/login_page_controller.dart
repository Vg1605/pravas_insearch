import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/Utils/commonWidgets/toast.dart';
import 'package:pravas/app/api/model/loginModel.dart';
import 'package:pravas/app/routes/app_pages.dart';
import 'package:pravas/app/sharedPreference.dart';

class LoginPageController extends GetxController {
  final passwordVisible = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final isChecked = false.obs;
  final userData = Rxn<LoginModel?>();
  final info = Rxn<Data?>();
  final indicator = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void forgetpassword() {
    emailController.text = "";
    passwordController.text = "";
    Get.toNamed(Routes.FORGET_PASSWORD);
  }

  Future<void> dashboard() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      Map<String, String> data = {
        "username": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };
      var response = await http.post(Uri.parse(Constants.apilogin),
          body: jsonEncode(data));
      var jsonResponseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        indicator.value = false;
        if (jsonResponseBody["message"] == "Successfully login") {
          userData.value = LoginModel.fromJson(jsonResponseBody);
          info.value = userData.value?.data;
          Message.showToast(
              jsonResponseBody["message"], Colors.blue, Colors.white);
          if (userData.value?.data?.brand_logo != null &&
              userData.value?.data?.brandId != null) {
            SharedPreference.setString(
                key: Constants.loginId, value: userData.value!.data!.brandId!);
            SharedPreference.setString(
                key: Constants.image, value: userData.value!.data!.brand_logo!);
            SharedPreference.setString(
                key: Constants.isLogin, value: Constants.isLogin);
            Get.offNamed(Routes.DASHBOARD_PAGE);
          }
        } else {
          indicator.value = false;
          Message.showToast(
              jsonResponseBody["message"], Colors.blue, Colors.white);
        }
      } else {
        indicator.value = false;
        Message.showToast(
            jsonResponseBody["message"], Colors.blue, Colors.white);
      }
    } else {
      indicator.value = false;
      Message.showToast(
          "Email and Password are mandatory", Colors.blue, Colors.white);
    }
  }
}
