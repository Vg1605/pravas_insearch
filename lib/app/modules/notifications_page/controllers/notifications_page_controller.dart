import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/app/sharedPreference.dart';

class NotificationsPageController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final image = "".obs;
  @override
  Future<void> onInit() async {
    image.value = (await SharedPreference.getString(key: Constants.image))!;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
