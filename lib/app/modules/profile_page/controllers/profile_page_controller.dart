import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/Utils/commonWidgets/toast.dart';
import 'package:pravas/app/api/model/participants%20Model.dart';
import 'package:pravas/app/api/model/tourModel.dart';
import 'package:pravas/app/routes/app_pages.dart';
import 'package:pravas/app/sharedPreference.dart';
import 'package:http/http.dart' as http;
import 'package:pravas/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePageController extends GetxController {
  TabController? tabcontroller;
  final Map<String, dynamic> arguments = Get.arguments;
  final tourTheme = "".obs;
  final tourCategory = "".obs;
  final tourCode = "".obs;
  final batchStartDate = "".obs;
  final batchEndDate = "".obs;
  final batchCode = "".obs;
  final batchLimit = "".obs;
  final batchFee = "".obs;
  final batchBooking = "".obs;
  final tourImage = "".obs;
  final tourTitle = "".obs;
  final tourId = "".obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final image = "".obs;

  final itemList = <TourItinerary>[].obs;
  final participants = <ParticipantData>[].obs;
  final tourModel = Rxn<TourResponse>();
  final participantsModel = Rxn<ParticipantsResponse>();
  final length = "".obs;

  @override
  Future<void> onInit() async {
    image.value = (await SharedPreference.getString(key: Constants.image))!;
    String? brandId =
        (await SharedPreference.getString(key: Constants.loginId))!;
    tourTheme.value = arguments['tourTheme'];
    tourCategory.value = arguments['tourCategory'];
    tourCode.value = arguments['tourCode'];
    batchStartDate.value = arguments['batchStartDate'];
    batchEndDate.value = arguments['batchEndDate'];
    batchCode.value = arguments['batchCode'];
    batchLimit.value = arguments['batchLimit'];
    batchFee.value = arguments['batchFee'];
    batchBooking.value = arguments['batchBooking'];
    tourImage.value = arguments['tourImage'];
    tourTitle.value = arguments['tourTitle'];
    tourId.value = arguments['tourId'];
    String? batchId = arguments['batchId'];
    getItinerary(brandId);
    getParticipants(brandId, batchId);
    super.onInit();
  }

  Future<void> getItinerary(String brandId) async {
    Map<String, dynamic> param = {"tour_id": tourId.value, "brand_id": brandId};
    var response = await http.post(Uri.parse(Constants.apigettourdetail),
        body: jsonEncode(param));
    var jsonResponseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (jsonResponseBody["message"] == "Tour available") {
        tourModel.value = TourResponse.fromJson(jsonResponseBody);
        itemList.clear();
        itemList.addAll(tourModel.value!.data.tourItineary);
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

  getParticipants(String brandId, String? batchId) async {
    Map<String, dynamic> param = {"batch_id": batchId, "brand_id": brandId};
    var response = await http.post(Uri.parse(Constants.apibatchparticipants),
        body: jsonEncode(param));
    var jsonResponseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (jsonResponseBody["message"] == "Participants available") {
        participantsModel.value =
            ParticipantsResponse.fromJson(jsonResponseBody);
        List<dynamic> dataList = jsonResponseBody["data"];
        length.value = dataList.length.toString();
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

  sendWhatsAppMessage(String number) async {
    if (number == "") {
      Message.showToast(Constants.noNumber, PravasDarkColors().textColor3,
          PravasDarkColors().textColor);
    } else {
      try {
        String formattedPhoneNumber = "+91$number";
        var whatsappUrl = "whatsapp://send?phone=$formattedPhoneNumber";
        await launchUrl(Uri.parse(whatsappUrl));
      } catch (e) {
        Message.showToast(e.toString(), PravasDarkColors().textColor3,
            PravasDarkColors().textColor);
      }
    }
  }

  callNumber(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      Message.showToast(
        Constants.noNumber,
        PravasDarkColors().textColor3,
        PravasDarkColors().textColor,
      );
      return;
    }
    String formattedPhoneNumber = "+91$phoneNumber";
    final uri = Uri.parse('tel:$formattedPhoneNumber');
    try {
      await launchUrl(uri);
    } catch (e) {
      Message.showToast(
        e.toString(),
        PravasDarkColors().textColor3,
        PravasDarkColors().textColor,
      );
    }
  }

   info(ParticipantData participant) {
    Get.toNamed(Routes.PARTICIPANTS_INFO_PAGE,arguments: participant);
  }
}
