import 'package:flutter/material.dart';
import 'package:yht_ticket/api/base_api_repository.dart';
import 'package:yht_ticket/models/requests/login_request.dart';
import 'package:yht_ticket/services/auth_service.dart';
import 'package:yht_ticket/shared/utils/focus.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final BaseApiRepository apiRepository;
  LoginController({required this.apiRepository});

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void login(BuildContext context) async {
    AppFocus.unfocus(context);
    if (loginFormKey.currentState!.validate()) {
      final res = await apiRepository.login(
        LoginRequest(
          email: loginEmailController.text,
          password: loginPasswordController.text,
        ),
      );

      if (res == null) return;

      AuthService.to.login(res);
    }
  }

  @override
  void onClose() {
    super.onClose();

    loginEmailController.dispose();
    loginPasswordController.dispose();
  }
}
