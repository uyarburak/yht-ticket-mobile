import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/services/auth_service.dart';
import 'package:yht_ticket/shared/utils/common_widget.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  EasyLoading.dismiss();

  if (response.hasError) {
    handleErrorStatus(response);
  }

  return response;
}

void handleErrorStatus(Response response) {
  if (response.unauthorized) {
    AuthService.to.logout();
    return;
  }

  try {
    final error = ErrorResponse.fromMap(response.body);
    CommonWidget.toast(error.message);
  } catch (e) {
    CommonWidget.toast("Beklenmedik bir hata meydana geldi");
  }
}
