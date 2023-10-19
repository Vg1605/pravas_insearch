import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pravas/Utils/commonWidgets/alertDialog.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:http/http.dart' as http;
import 'package:pravas/Utils/commonWidgets/toast.dart';
import 'package:pravas/app/routes/app_pages.dart';
import 'package:pravas/app/sharedPreference.dart';
import '../../../api/model/upcomingModel.dart';

class DashboardPageController extends GetxController {
  TabController? tabcontroller;
  final itemList = <Data>[].obs;
  final ongoingLength = "".obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final close = false.obs;
  TextEditingController search = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final image = "".obs;
  final id = "".obs;
  final title = ["upcoming", "ongoing", "past"].obs;
  final upcomingModel = Rxn<UpcomingModel>();
  final index = 0.obs;
  final indicator = false.obs;
  final past = "".obs;
  final upcomingLength = "".obs;

  @override
  Future<void> onInit() async {
    indicator.value = true;
    image.value = (await SharedPreference.getString(key: Constants.image))!;
    id.value = (await SharedPreference.getString(key: Constants.loginId))!;
    tabcontroller?.addListener(() {
      if (tabcontroller?.index != null) apiCalling(tabcontroller!.index);
    });
    apiCalling(0);
    apiCalling1();
    apiCalling2();
    apiCalling3();
    super.onInit();
  }

  void searchPage() {
    Get.toNamed(Routes.SEARCH_PAGE);
  }

  apiCalling(int value) async {
    Map<String, dynamic> param = {"type": title[value], "brand_id": id.value};
    var response = await http.post(Uri.parse(Constants.apibatches),
        body: jsonEncode(param));
    var jsonResponseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      indicator.value = false;
      if (jsonResponseBody["message"] == "Batches available") {
        upcomingModel.value = UpcomingModel.fromJson(jsonResponseBody);
        itemList.clear();
        itemList.addAll(upcomingModel.value!.data!);
        Message.showToast(
            jsonResponseBody["message"], Colors.blue, Colors.white);
      } else {
        Message.showToast(
            jsonResponseBody["message"], Colors.blue, Colors.white);
      }
    } else {
      indicator.value = false;
      Message.showToast(jsonResponseBody["message"], Colors.blue, Colors.white);
    }
  }

  apiCalling1() async {
    Map<String, dynamic> param = {"type": title[1], "brand_id": id.value};
    var response = await http.post(Uri.parse(Constants.apibatches),
        body: jsonEncode(param));
    var jsonResponseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      /*  dynamic responseData = jsonResponseBody["data"];
      print(responseData);
      if (responseData != null && responseData is List<dynamic>) {
        List<dynamic> dataArray = responseData;
        ongoingLength.value = dataArray.length.toString();
        indicator.value = false;
      } else {
        print("null::");
      }*/
      List<dynamic> dataArray = jsonResponseBody["data"];
      print("dataarray:$dataArray");
      ongoingLength.value = dataArray.length.toString();
      indicator.value = false;
      if (jsonResponseBody["message"] == "Batches available") {
        Message.showToast(
            jsonResponseBody["message"], Colors.blue, Colors.white);
      } else {
        Message.showToast(
            jsonResponseBody["message"], Colors.blue, Colors.white);
      }
    } else {
      indicator.value = false;
      Message.showToast(jsonResponseBody["message"], Colors.blue, Colors.white);
    }
  }

  apiCalling3() async {
    Map<String, dynamic> param = {"type": title[0], "brand_id": id.value};
    var response = await http.post(Uri.parse(Constants.apibatches),
        body: jsonEncode(param));
    var jsonResponseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<dynamic> dataArray = jsonResponseBody["data"];
      upcomingLength.value = dataArray.length.toString();
      indicator.value = false;
      if (jsonResponseBody["message"] == "Batches available") {
        Message.showToast(
            jsonResponseBody["message"], Colors.blue, Colors.white);
      } else {
        Message.showToast(
            jsonResponseBody["message"], Colors.blue, Colors.white);
      }
    } else {
      indicator.value = false;
      Message.showToast(jsonResponseBody["message"], Colors.blue, Colors.white);
    }
  }

  apiCalling2() async {
    Map<String, dynamic> param = {"type": title[2], "brand_id": id.value};
    var response = await http.post(Uri.parse(Constants.apibatches),
        body: jsonEncode(param));
    var jsonResponseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<dynamic> dataArray = jsonResponseBody["data"];
      past.value = dataArray.length.toString();
      indicator.value = false;
      if (jsonResponseBody["message"] == "Batches available") {
        Message.showToast(
            jsonResponseBody["message"], Colors.blue, Colors.white);
      } else {
        Message.showToast(
            jsonResponseBody["message"], Colors.blue, Colors.white);
      }
    } else {
      indicator.value = false;
      Message.showToast(jsonResponseBody["message"], Colors.blue, Colors.white);
    }
  }

  searchValue(String value, int index) {
    if (value.isNotEmpty) {
      final suggestions = itemList
          .where((element) =>
              element.tourTitle!.toLowerCase().contains(value.toLowerCase()) ||
              element.tourCode!.toLowerCase().contains(value.toLowerCase()))
          .toList()
          .obs;
      itemList.clear();
      itemList.value = suggestions;
    } else {
      apiCalling(index);
    }
  }

  void profile(
    String tourTheme,
    String tourCategory,
    String tourCode,
    String batchStartDate,
    String batchEndDate,
    String batchCode,
    String batchLimit,
    String batchFee,
    String batchBooking,
    String tourImage,
    String tourTitle,
    String tourId,
    String batchId,
  ) {
    Map<String, dynamic> arguments = {
      'tourTheme': tourTheme,
      'tourCategory': tourCategory,
      'tourCode': tourCode,
      'batchStartDate': batchStartDate,
      'batchEndDate': batchEndDate,
      'batchCode': batchCode,
      'batchLimit': batchLimit,
      'batchFee': batchFee,
      'batchBooking': batchBooking,
      'tourImage': tourImage,
      'tourTitle': tourTitle,
      'tourId': tourId,
      'batchId': batchId,
    };
    Get.toNamed(Routes.PROFILE_PAGE, arguments: arguments);
  }

  exit(BuildContext context) async {
    return CustomAlertDialog.dialog(Constants.exit);
  }
}
