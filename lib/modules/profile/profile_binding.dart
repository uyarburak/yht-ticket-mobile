import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
        () => ProfileController(apiRepository: Get.find()));
  }
}
