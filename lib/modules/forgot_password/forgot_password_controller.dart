import 'package:flutter/material.dart';
import 'package:yht_ticket/api/api.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/utils/common_widget.dart';
import 'package:yht_ticket/shared/utils/focus.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final BaseApiRepository apiRepository;
  ForgotPasswordController({required this.apiRepository});

  final emailController = TextEditingController();

  void forgotPassword(
      BuildContext context, GlobalKey<FormState> formKey) async {
    AppFocus.unfocus(context);
    if (formKey.currentState!.validate()) {
      final res = await apiRepository.forgotPassword(
        ForgotPasswordRequest(
          email: emailController.text,
        ),
      );

      if (res != null && res) {
        CommonWidget.toast(
            "${emailController.text} adresine parola sıfırlama maili gönderildi");
        Get.offAndToNamed(Routes.LOGIN);
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();

    super.onClose();
  }
}
