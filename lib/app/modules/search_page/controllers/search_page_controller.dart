import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/app/sharedPreference.dart';

class SearchPageController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final image = "".obs;
  final close = false.obs;
  TextEditingController search = TextEditingController();
  final FocusNode focusNode = FocusNode();

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
