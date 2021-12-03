import 'package:get/get.dart';
import 'package:yht_ticket/modules/dashboard/dashboard_controller.dart';
import 'package:yht_ticket/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut<DashboardController>(
        () => DashboardController(apiRepository: Get.find()));
  }
}
