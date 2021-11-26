import 'package:yht_ticket/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:yht_ticket/services/auth_service.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(const Duration(milliseconds: 2000));

    if (AuthService.to.isLoggedInValue) {
      Get.rootDelegate.offAndToNamed(Routes.HOME);
    } else {
      Get.rootDelegate.offAndToNamed(Routes.LOGIN);
    }
  }
}
