import 'package:flutter/material.dart';
import 'package:yht_ticket/api/api.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final BaseApiRepository apiRepository;
  RegisterController({required this.apiRepository});

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordVisible = false.obs;

  void onPasswordVisibilityPressed() {
    isPasswordVisible.toggle();
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      final res = await apiRepository.register(
        RegisterRequest(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          username: usernameController.text,
          password: passwordController.text,
        ),
      );

      if (res == null) return;

      //AuthService.to.login(res);
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
