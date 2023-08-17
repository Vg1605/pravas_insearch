import 'package:get/get.dart';

import '../controllers/participants_info_page_controller.dart';

class ParticipantsInfoPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParticipantsInfoPageController>(
      () => ParticipantsInfoPageController(),
    );
  }
}
