import 'package:get/get.dart';
import 'package:yht_ticket/modules/profile/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
        () => ProfileController(apiRepository: Get.find()));
  }
}
