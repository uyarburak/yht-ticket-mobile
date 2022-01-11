import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';
import 'package:yht_ticket/services/auth_service.dart';

FutureOr<Request> authInterceptor(Request request) async {
  final token = AuthService.to.loginResponse?.token;

  request.headers['Authorization'] = 'Bearer $token';

  return request;
}
