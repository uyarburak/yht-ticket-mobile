import 'package:get/get.dart';

import 'dashboard_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
        () => DashboardController(apiRepository: Get.find()));
  }
}
