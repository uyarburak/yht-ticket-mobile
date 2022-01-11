import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:yht_ticket/services/auth_service.dart';

FutureOr<Request> requestInterceptor(request) async {
  final token = AuthService.to.loginResponse?.token;

  request.headers['Authorization'] = 'Bearer $token';

  EasyLoading.show(status: 'Yükleniyor...');
  return request;
}
