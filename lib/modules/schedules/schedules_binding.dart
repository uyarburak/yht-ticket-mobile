import 'package:get/get.dart';
import 'package:yht_ticket/modules/schedules/schedules_controller.dart';

class SchedulesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchedulesController>(
        () => SchedulesController(apiRepository: Get.find()));
  }
}
