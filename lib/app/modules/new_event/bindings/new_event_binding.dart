import 'package:get/get.dart';
import 'package:pravas/app/modules/new_event/controllers/new_event_controller.dart';


class NewEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewEventController>(
      () => NewEventController(),
    );
  }
}
