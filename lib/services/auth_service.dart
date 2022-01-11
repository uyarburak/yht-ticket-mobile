import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yht_ticket/models/responses/login_response.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/constants/storage.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  /// Mocks a login process
  final isLoggedIn = false.obs;
  bool get isLoggedInValue => isLoggedIn.value;

  LoginResponse? loginResponse;

  @override
  void onInit() {
    var storage =
        Get.find<SharedPreferences>().getString(StorageConstants.loginResponse);
    isLoggedIn.value = storage?.isNotEmpty ?? false;

    if (isLoggedInValue) {
      loginResponse = LoginResponse.fromJson(storage!);
    }

    super.onInit();
  }

  void login(LoginResponse loginResponse) {
    isLoggedIn.value = true;

    this.loginResponse = loginResponse;

    final prefs = Get.find<SharedPreferences>();

    prefs.setString(StorageConstants.loginResponse, loginResponse.toJson());

    // Setting External User Id with Callback Available in SDK Version 3.9.3+
    OneSignal.shared.setExternalUserId(loginResponse.username).then((results) {
      print(results.toString());
    }).catchError((error) {
      print(error.toString());
    });

    Get.offAndToNamed(Routes.DASHBOARD);
  }

  void logout() {
    if (isLoggedInValue) {
      isLoggedIn.value = false;

      loginResponse = null;

      OneSignal.shared.removeExternalUserId().then((results) {
        print(results.toString());
      }).catchError((error) {
        print(error.toString());
      });

      final prefs = Get.find<SharedPreferences>();
      prefs.clear();
      Get.offAndToNamed(Routes.LOGIN);
    }
  }
}
