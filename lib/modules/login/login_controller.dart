import 'package:flutter/material.dart';
import 'package:yht_ticket/api/api.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/services/auth_service.dart';
import 'package:yht_ticket/shared/utils/focus.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final BaseApiRepository apiRepository;
  LoginController({required this.apiRepository});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(BuildContext context, GlobalKey<FormState> formKey) async {
    AppFocus.unfocus(context);
    if (formKey.currentState!.validate()) {
      final res = await apiRepository.login(
        LoginRequest(
          usernameOrEmail: emailController.text,
          password: passwordController.text,
        ),
      );

      if (res == null) return;

      AuthService.to.login(res);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
