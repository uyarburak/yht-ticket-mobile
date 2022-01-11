import 'package:get/get.dart';

import 'alert_controller.dart';

class AlertBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlertController>(() => AlertController(
          alertId: Get.parameters['alertId'] ?? '',
          apiRepository: Get.find(),
        ));
  }
}
