import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/app/api/model/participants%20Model.dart';
import 'package:pravas/app/sharedPreference.dart';

class ParticipantsInfoPageController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final image = "".obs;
  final ParticipantData participant = Get.arguments as ParticipantData;

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

  void back() {
    Get.back();
  }
}
