import 'package:get/get.dart';
import 'package:yht_ticket/modules/forgot_password/forgot_password_controller.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
        () => ForgotPasswordController(apiRepository: Get.find()));
  }
}
