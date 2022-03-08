import 'package:flutter/material.dart';
import 'package:yht_ticket/api/api.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/services/auth_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final BaseApiRepository apiRepository;
  LoginController({required this.apiRepository});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = new GlobalKey<FormState>();


  var isPasswordVisible = false.obs;

  void onPasswordVisibilityPressed() {
    isPasswordVisible.toggle();
  }

  void login() async {
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
