import 'package:get/get.dart';
import 'package:yht_ticket/modules/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(apiRepository: Get.find()));
  }
}
