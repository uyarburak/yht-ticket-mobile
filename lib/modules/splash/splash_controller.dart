import 'package:yht_ticket/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:yht_ticket/services/auth_service.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    if (AuthService.to.isLoggedInValue) {
      Get.offAndToNamed(Routes.DASHBOARD);
    } else {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }
}
