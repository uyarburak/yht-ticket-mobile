import 'package:get/get.dart';

import 'notifications_controller.dart';

class NotificationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(
        () => NotificationsController(apiRepository: Get.find()));
  }
}
