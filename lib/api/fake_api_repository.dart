import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yht_ticket/models/requests/forgot_password_request.dart';
import 'package:yht_ticket/models/requests/login_request.dart';
import 'package:yht_ticket/models/requests/register_request.dart';
import 'package:yht_ticket/models/responses/login_response.dart';
import 'package:yht_ticket/models/responses/notification_response.dart';
import 'package:yht_ticket/models/responses/register_response.dart';

import 'base_api_repository.dart';

class FakeApiRepository implements BaseApiRepository {
  @override
  Future<LoginResponse?> login(LoginRequest data) async {
    EasyLoading.show(status: 'Bekleyiniz...');
    await Future.delayed(const Duration(seconds: 3));
    EasyLoading.dismiss();
    return LoginResponse(token: "blabla");
  }

  @override
  Future<RegisterResponse?> register(RegisterRequest data) async {
    EasyLoading.show(status: 'Bekleyiniz...');
    await Future.delayed(const Duration(seconds: 3));
    EasyLoading.dismiss();
    return RegisterResponse(token: "blabla");
  }

  @override
  Future<bool?> forgotPassword(ForgotPasswordRequest data) async {
    EasyLoading.show(status: 'Bekleyiniz...');
    await Future.delayed(const Duration(seconds: 3));
    EasyLoading.dismiss();
    return true;
  }

  @override
  Future<List<NotificationResponse>?> getNotifications() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      NotificationResponse(
        id: "blabla2",
        notificationType: 1,
        message: "Message 1",
        date: DateTime(2021, 11, 27, 18, 0),
      ),
      NotificationResponse(
        id: "blabla3",
        notificationType: 2,
        message: "Message 2",
        date: DateTime(2021, 11, 27, 17, 50),
      ),
      NotificationResponse(
        id: "blabla4",
        notificationType: 2,
        message: "Message 3",
        date: DateTime.now().subtract(Duration(days: 3)),
      ),
      NotificationResponse(
        id: "blabla5",
        notificationType: 2,
        message: "Message 4",
        date: DateTime.now().subtract(Duration(days: 12)),
      ),
      NotificationResponse(
        id: "blabla6",
        notificationType: 3,
        message: "Message 5",
        date: DateTime.now().subtract(Duration(days: 122)),
      ),
    ];
  }
}
