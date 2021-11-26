import 'package:get/get.dart';
import 'package:yht_ticket/modules/register/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
        () => RegisterController(apiRepository: Get.find()));
  }
}
