import 'package:get/get.dart';

import '../controllers/new_event_controller.dart';

class NewEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewEventController>(
      () => NewEventController(),
    );
  }
}
