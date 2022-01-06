import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/constants/storage.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  /// Mocks a login process
  final isLoggedIn = false.obs;
  bool get isLoggedInValue => isLoggedIn.value;

  @override
  void onInit() {
    var token = Get.find<SharedPreferences>().getString(StorageConstants.token);
    isLoggedIn.value = token?.isNotEmpty ?? false;
    super.onInit();
  }

  void login(String token) {
    isLoggedIn.value = true;

    if (token.isNotEmpty) {
      final prefs = Get.find<SharedPreferences>();
      prefs.setString(StorageConstants.token, token);

      Get.offAndToNamed(Routes.DASHBOARD);
    }
  }

  void logout() {
    isLoggedIn.value = false;
    final prefs = Get.find<SharedPreferences>();
    prefs.clear();
    Get.offAndToNamed(Routes.LOGIN);
  }
}
