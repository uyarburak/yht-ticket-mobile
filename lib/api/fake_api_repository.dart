import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:yht_ticket/models/requests/create_alerts_request.dart';
import 'package:yht_ticket/models/requests/forgot_password_request.dart';
import 'package:yht_ticket/models/requests/login_request.dart';
import 'package:yht_ticket/models/requests/register_request.dart';
import 'package:yht_ticket/models/requests/schedule_request.dart';
import 'package:yht_ticket/models/responses/alert_response.dart';
import 'package:yht_ticket/models/responses/full_alert_response.dart';
import 'package:yht_ticket/models/responses/login_response.dart';
import 'package:yht_ticket/models/responses/notification_response.dart';
import 'package:yht_ticket/models/responses/profile_response.dart';
import 'package:yht_ticket/models/responses/register_response.dart';
import 'package:yht_ticket/models/responses/schedule_response.dart';
import 'package:yht_ticket/models/responses/station_response.dart';

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
    return [];
  }

  @override
  Future<int?> getUnreadNotificationCount() async {
    await Future.delayed(const Duration(seconds: 1));
    return 2;
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
        status: 0,
        lastModifiedDate: DateTime.now(),
        unreadNotificationCount: 0,
      ),
      AlertResponse(
        id: "alert:1",
        departure: "Selçuklu Gar",
        destination: "Ankara Gar",
        wagonCount: 2,
        scheduleDate: DateTime(now.year, now.month, now.day, 15, 30)
            .add(Duration(days: 1)),
        status: 0,
        lastModifiedDate: DateTime.now(),
        unreadNotificationCount: 0,
      ),
      AlertResponse(
        id: "alert:1",
        departure: "Ankara Gar",
        destination: "Konya YHT",
        wagonCount: 5,
        scheduleDate: DateTime(now.year, now.month, now.day, 15, 30)
            .add(Duration(days: 7)),
        status: 0,
        lastModifiedDate: DateTime.now(),
        unreadNotificationCount: 0,
      ),
      AlertResponse(
        id: "alert:1",
        departure: "Ankara Gar",
        destination: "Konya YHT",
        wagonCount: 5,
        scheduleDate: DateTime(now.year, now.month, now.day, 15, 30)
            .add(Duration(days: 8)),
        status: 0,
        lastModifiedDate: DateTime.now(),
        unreadNotificationCount: 0,
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
    additionalAlerts.addAll(
      data.alerts.map((e) => AlertResponse(
            id: e.scheduleId.toString(),
            departure: e.departureStationName,
            destination: e.destinationStationName,
            wagonCount: e.wagons.length,
            scheduleDate: e.startDate,
            status: 0,
            lastModifiedDate: DateTime.now(),
            unreadNotificationCount: 0,
          )),
    );
    return data.alerts.map((e) => e.scheduleId.toString()).toList();
  }

  @override
  Future<ProfileResponse?> getProfile() async {
    await Future.delayed(const Duration(seconds: 2));

    return ProfileResponse(
        email: 'john@doe.com', name: 'John Doe', credits: 12);
  }

  @override
  Future<List<AlertResponse>?> getAlerts() async {
    var list = await getActiveAlerts();
    list!.addAll([
      AlertResponse(
        id: "alert:111",
        departure: "Eryaman YHT",
        destination: "Eskişehir",
        wagonCount: 1,
        scheduleDate: DateTime.parse("2021-11-01T18:30:00"),
        status: 1,
        lastModifiedDate: DateTime.parse("2021-10-29T18:30:00"),
        unreadNotificationCount: 1,
      ),
      AlertResponse(
        id: "alert:112",
        departure: "Eskişehir",
        destination: "Eryaman YHT",
        wagonCount: 7,
        scheduleDate: DateTime.parse("2021-10-28T18:30:00"),
        status: 2,
        lastModifiedDate: DateTime.parse("2021-10-28T18:30:00"),
        unreadNotificationCount: 11,
      ),
      AlertResponse(
        id: "alert:113",
        departure: "Eryaman YHT",
        destination: "Eskişehir",
        wagonCount: 1,
        scheduleDate: DateTime.parse("2021-10-14T18:30:00"),
        status: 2,
        lastModifiedDate: DateTime.parse("2021-10-14T18:30:00"),
        unreadNotificationCount: 0,
      ),
      AlertResponse(
        id: "alert:114",
        departure: "İstanbul (Pendik)",
        destination: "Eskişehir",
        wagonCount: 8,
        scheduleDate: DateTime.parse("2021-09-07T12:30:00"),
        status: 1,
        lastModifiedDate: DateTime.parse("2021-09-03T12:30:00"),
        unreadNotificationCount: 0,
      ),
    ]);

    return list;
  }

  @override
  Future<List<StationResponse>?> getStations() async {
    //await Future.delayed(const Duration(seconds: 2));
    String data = await DefaultAssetBundle.of(Get.context!)
        .loadString("assets/json/stations.json");
    List jsonResult = jsonDecode(data);

    return jsonResult.map((e) => StationResponse.fromMap(e)).toList();
  }

  @override
  Future<FullAlertResponse?> getAlert(String alertId) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
