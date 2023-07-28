import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NewEventController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var calendarValue = ''.obs;
  var categoryValue = ''.obs;
  var tourValue = ''.obs;

  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;

  var sTime = DateTime.now().obs;
  var eTime = DateTime.now().obs;

  final calendarItems = ['Item 1', 'Item 2', 'Item 3'];
  final categoryItems = ['Item 1', 'Item 2', 'Item 3'];
  final tourItems = ['Item 1', 'Item 2', 'Item 3'];


  DateTime startTime = DateTime.now();
  List<DateTime> timeOptions = [];

  final startdate = false.obs;
  final starttime = false.obs;
  final enddate = false.obs;
  final endtime = false.obs;

  final allday = false.obs;
  final repeat = false.obs;
  final checkbox1 = false.obs;
  final checkbox2 = false.obs;

  final isSelected = false.obs;

  @override
  void onInit() {
    generateTimeOptions();

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

  void calendarItem(String item) {
    calendarValue.value = item;
  }

  void categoryItem(String item) {
    categoryValue.value = item;
  }

  void tourItem(String item) {
    tourValue.value = item;
  }

  void enddateItem(String item) {
    tourValue.value = item;
  }

  void generateTimeOptions() {
    final startTime = DateTime(2000, 1, 1, 0, 0);
    final endTime = DateTime(2000, 1, 2, 0, 0);
    final interval = const Duration(minutes: 30);
    DateTime currentTime = startTime;
    while (currentTime.isBefore(endTime)) {
      if (currentTime.hour == 24 && currentTime.minute == 0) {
        timeOptions.add(DateTime(2000, 1, 2, 0, 0));
      } else {
        timeOptions.add(currentTime);
      }
      currentTime = currentTime.add(interval);
    }
  }

  handleCheckbox1(bool? value) {
    checkbox1.value = value ?? false;
    checkbox2.value = !(value ?? false);
  }

  handleCheckbox2(bool? value) {
    checkbox2.value = value ?? false;
    checkbox1.value = !(value ?? false);
  }

}
