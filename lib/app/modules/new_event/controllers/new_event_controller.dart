import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/Utils/commonWidgets/toast.dart';
import 'package:pravas/app/sharedPreference.dart';
import 'package:pravas/colors.dart';

class NewEventController extends GetxController {
  TextEditingController limitController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  TextEditingController studentfeeController = TextEditingController();
  TextEditingController adultfeeController = TextEditingController();
  TextEditingController earlybirdfeeController = TextEditingController();
  TextEditingController bookingamountController = TextEditingController();
  TextEditingController capacityController = TextEditingController();
  TextEditingController batchforController = TextEditingController();
  var calendarValue = ''.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final image = "".obs;
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;

  final startdate = false.obs;
  final enddate = false.obs;

  final calendarItems = ['Item 1', 'Item 2', 'Item 3'];

  final brandId = "".obs;

  final batchcode = "".obs;

  @override
  Future<void> onInit() async {
    image.value = (await SharedPreference.getString(key: Constants.image))!;
    brandId.value = (await SharedPreference.getString(key: Constants.loginId))!;
    super.onInit();
  }
  void calendarItem(String item) {
    calendarValue.value = item;
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

  void createbatch() {
    if (limitController.text.isNotEmpty &&
        feeController.text.isNotEmpty &&
        studentfeeController.text.isNotEmpty &&
        adultfeeController.text.isNotEmpty &&
        earlybirdfeeController.text.isNotEmpty &&
        batchcode.value.isNotEmpty &&
        bookingamountController.text.isNotEmpty &&
        capacityController.text.isNotEmpty) {
      apiCalling();
    } else {
      Message.showToast("Please fill the fields.",
          PravasDarkColors().textColor3, PravasDarkColors().textColor);
    }
  }

  Future<void> apiCalling() async {
    final formattedDate;
    final formattedDate1;
    formattedDate = DateFormat('yyyy-MM-d').format(startDate.value);
    formattedDate1 = DateFormat('yyyy-MM-d').format(endDate.value);

    Map<String, dynamic> data = {
      "brand_id": brandId.value.trim(),
      "tour_id": "244",
      "sdate": formattedDate,
      "edate": formattedDate1,
      "limit": limitController.text.trim(),
      "fee": feeController.text.trim(),
      "st_fee": studentfeeController.text.trim(),
      "ad_fee": adultfeeController.text.trim(),
      "b_er_brd_dis": earlybirdfeeController.text.trim(),
      "bcode": batchcode.value.trim(),
      "bfor": batchforController.text.trim(),
      "booking_amt": bookingamountController.text.trim(),
      "capacity": capacityController.text.trim(),
    };
    var response = await http.post(Uri.parse(Constants.apiaddbatch),
        body: jsonEncode(data));
    var jsonResponseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("statuscode::${response.statusCode}");
      print("response::${response}");
      print("jsonResponseBody::${jsonResponseBody["message"]}");
      if (jsonResponseBody["message"] == "Successfully login") {
        Message.showToast(
            jsonResponseBody["message"], Colors.blue, Colors.white);
      } else {
        Message.showToast(
            jsonResponseBody["message"], Colors.blue, Colors.white);
      }
    } else {
      Message.showToast(jsonResponseBody["message"], Colors.blue, Colors.white);
    }
  }
}
