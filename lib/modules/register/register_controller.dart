import 'package:flutter/material.dart';
import 'package:yht_ticket/api/base_api_repository.dart';
import 'package:yht_ticket/models/requests/register_request.dart';
import 'package:yht_ticket/services/auth_service.dart';
import 'package:yht_ticket/shared/utils/focus.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final BaseApiRepository apiRepository;
  RegisterController({required this.apiRepository});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void register(BuildContext context, GlobalKey<FormState> formKey) async {
    AppFocus.unfocus(context);
    if (formKey.currentState!.validate()) {
      final res = await apiRepository.register(
        RegisterRequest(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
        ),
      );

      if (res == null) return;

      AuthService.to.login(res.token);
    }
  }

  @override
  void onClose() {
    super.onClose();

    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
