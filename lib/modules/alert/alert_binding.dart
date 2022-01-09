import 'package:get/get.dart';
import 'package:yht_ticket/modules/alert/alert_controller.dart';

class AlertBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlertController>(() => AlertController(
          alertId: Get.parameters['alertId'] ?? '',
          apiRepository: Get.find(),
        ));
  }
}
