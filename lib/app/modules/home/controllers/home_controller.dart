import 'package:get/get.dart';
import 'package:pravas/Utils/commonWidgets/constants.dart';
import 'package:pravas/app/routes/app_pages.dart';
import 'package:pravas/app/sharedPreference.dart';

class HomeController extends GetxController {
  final isLogin = "".obs;

  @override
  void onInit() {
    fetchIsLoginValue();
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

  Future<void> fetchIsLoginValue() async {
    String? loginValue =
        await SharedPreference.getString(key: Constants.isLogin);
    if (loginValue != null) {
      isLogin.value = loginValue;
    } else {
      isLogin.value = "";
    }
    print("isLogin.value ${isLogin.value}");
    Duration delayDuration = Duration(seconds: 3);
    Future.delayed(delayDuration, () {
      getUser();
    });
  }

  void getUser() {
    if (isLogin.value == Constants.logout) {
      Get.offNamed(Routes.LOGIN_PAGE);
    }
    if (isLogin.value == Constants.isLogin) {
      Get.offNamed(Routes.DASHBOARD_PAGE);
    } else if (isLogin.value == Constants.exit) {
      Get.offNamed(Routes.DASHBOARD_PAGE);
    } else {
      Get.offNamed(Routes.LOGIN_PAGE);
    }
  }
}
