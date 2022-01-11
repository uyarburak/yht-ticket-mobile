import 'package:get/get.dart';
import 'package:yht_ticket/modules/dashboard/dashboard_controller.dart';
import 'package:yht_ticket/modules/history/history_controller.dart';
import 'package:yht_ticket/modules/profile/profile_controller.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut<DashboardController>(
        () => DashboardController(apiRepository: Get.find()));

    Get.lazyPut<ProfileController>(
        () => ProfileController(apiRepository: Get.find()));
    Get.lazyPut<HistoryController>(
        () => HistoryController(apiRepository: Get.find()));
  }
}
