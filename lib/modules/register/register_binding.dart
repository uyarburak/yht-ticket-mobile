import 'package:get/get.dart';

import 'register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
        () => RegisterController(apiRepository: Get.find()));
  }
}
