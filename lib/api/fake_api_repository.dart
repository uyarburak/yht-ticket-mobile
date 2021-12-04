import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yht_ticket/models/requests/create_alerts_request.dart';
import 'package:yht_ticket/models/requests/forgot_password_request.dart';
import 'package:yht_ticket/models/requests/login_request.dart';
import 'package:yht_ticket/models/requests/register_request.dart';
import 'package:yht_ticket/models/requests/schedule_request.dart';
import 'package:yht_ticket/models/responses/alert_response.dart';
import 'package:yht_ticket/models/responses/login_response.dart';
import 'package:yht_ticket/models/responses/notification_response.dart';
import 'package:yht_ticket/models/responses/profile_response.dart';
import 'package:yht_ticket/models/responses/register_response.dart';
import 'package:yht_ticket/models/responses/schedule_response.dart';

import 'base_api_repository.dart';

class FakeApiRepository implements BaseApiRepository {
  List<AlertResponse> additionalAlerts = [];
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

  @override
  Future<List<AlertResponse>?> getActiveAlerts() async {
    await Future.delayed(const Duration(seconds: 2));
    var now = DateTime.now();
    return [
      AlertResponse(
        id: "alert:1",
        departure: "Ankara Gar",
        destination: "Konya YHT",
        wagonCount: 8,
        scheduleDate: DateTime(now.year, now.month, now.day, 18, 30),
      ),
      AlertResponse(
        id: "alert:1",
        departure: "Selçuklu Gar",
        destination: "Ankara Gar",
        wagonCount: 2,
        scheduleDate: DateTime(now.year, now.month, now.day, 15, 30)
            .add(Duration(days: 1)),
      ),
      AlertResponse(
        id: "alert:1",
        departure: "Ankara Gar",
        destination: "Konya YHT",
        wagonCount: 5,
        scheduleDate: DateTime(now.year, now.month, now.day, 15, 30)
            .add(Duration(days: 7)),
      ),
      AlertResponse(
        id: "alert:1",
        departure: "Ankara Gar",
        destination: "Konya YHT",
        wagonCount: 5,
        scheduleDate: DateTime(now.year, now.month, now.day, 15, 30)
            .add(Duration(days: 8)),
      ),
      ...additionalAlerts
    ];
  }

  @override
  Future<List<ScheduleResponse>?> getSchedules(ScheduleRequest data) async {
    print('getSchedules data: ${data.toJson()}');
    await Future.delayed(const Duration(seconds: 2));

    return [
      ScheduleResponse(
        id: 19192693865,
        name: "ANKARA KONYA",
        type: "YHT",
        startDate: DateTime.parse("2021-11-17T06:20:00"),
        endDate: DateTime.parse("2021-11-17T08:13:00"),
        wagonTypes: [
          WagonType(
            name: "2+2 Pulman (Ekonomi)",
            price: 43.5,
            wagons: [2, 3, 4, 5, 6, 7, 8],
          ),
          WagonType(
            name: "2+1 Pulman (Business)",
            price: 62.25,
            wagons: [1],
          ),
        ],
      ),
      ScheduleResponse(
        id: 19192693866,
        name: "ANKARA KONYA",
        type: "YHT",
        startDate: DateTime.parse("2021-11-17T09:15:00"),
        endDate: DateTime.parse("2021-11-17T11:05:00"),
        wagonTypes: [
          WagonType(
            name: "2+2 Pulman (Ekonomi)",
            price: 43.5,
            wagons: [2, 3, 4, 5, 6, 7, 8],
          ),
          WagonType(
            name: "2+1 Pulman (Business)",
            price: 62.25,
            wagons: [1],
          ),
        ],
      ),
      ScheduleResponse(
        id: 19192693867,
        name: "ANKARA KONYA",
        type: "YHT",
        startDate: DateTime.parse("2021-11-17T13:20:00"),
        endDate: DateTime.parse("2021-11-17T15:10:00"),
        wagonTypes: [
          WagonType(
            name: "2+2 Pulman (Ekonomi)",
            price: 43.5,
            wagons: [2, 3, 4, 5, 6, 7, 8],
          ),
          WagonType(
            name: "2+1 Pulman (Business)",
            price: 62.25,
            wagons: [1],
          ),
        ],
      ),
      ScheduleResponse(
        id: 19192693868,
        name: "ANKARA KONYA",
        type: "YHT",
        startDate: DateTime.parse("2021-11-17T15:30:00"),
        endDate: DateTime.parse("2021-11-17T17:22:00"),
        wagonTypes: [
          WagonType(
            name: "2+2 Pulman (Ekonomi)",
            price: 43.5,
            wagons: [2, 3, 4, 5, 6, 7, 8],
          ),
          WagonType(
            name: "2+1 Pulman (Business)",
            price: 62.25,
            wagons: [1],
          ),
        ],
      ),
      ScheduleResponse(
        id: 19192693869,
        name: "ANKARA KONYA",
        type: "YHT",
        startDate: DateTime.parse("2021-11-17T18:00:00"),
        endDate: DateTime.parse("2021-11-17T19:50:00"),
        wagonTypes: [
          WagonType(
            name: "2+2 Pulman (Ekonomi)",
            price: 43.5,
            wagons: [2, 3, 4, 5, 6, 7, 8],
          ),
          WagonType(
            name: "2+1 Pulman (Business)",
            price: 62.25,
            wagons: [1],
          ),
        ],
      ),
    ];
  }

  @override
  Future<List<String>?> createAlerts(CreateAlertsRequest data) async {
    print('createAlerts data: ${data.toJson()}');
    EasyLoading.show(status: 'Bekleyiniz...');
    await Future.delayed(const Duration(seconds: 2));
    EasyLoading.dismiss();
    additionalAlerts.addAll(data.alerts.map((e) => AlertResponse(
        id: e.scheduleId.toString(),
        departure: e.departureStationName,
        destination: e.destinationStationName,
        wagonCount: e.wagons.length,
        scheduleDate: e.startDate)));
    return data.alerts.map((e) => e.scheduleId.toString()).toList();
  }

  @override
  Future<ProfileResponse?> getProfile() async {
    await Future.delayed(const Duration(seconds: 2));

    return ProfileResponse(
        email: 'john@doe.com', name: 'John Doe', credits: 12);
  }
}
