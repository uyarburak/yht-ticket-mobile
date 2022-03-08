import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:yht_ticket/models/models.dart';

import 'base_api_repository.dart';

class FakeApiRepository implements BaseApiRepository {
  List<AlertResponse> additionalAlerts = [];
  @override
  Future<LoginResponse?> login(LoginRequest data) async {
    EasyLoading.show(status: 'Bekleyiniz...');
    await Future.delayed(const Duration(seconds: 3));
    EasyLoading.dismiss();
    return null;
  }

  @override
  Future<LoginResponse?> loginAsGuest(LoginAsGuestRequest data) async {
    EasyLoading.show(status: 'Bekleyiniz...');
    await Future.delayed(const Duration(seconds: 3));
    EasyLoading.dismiss();
    return null;
  }

  @override
  Future<LoginResponse?> register(RegisterRequest data) async {
    EasyLoading.show(status: 'Bekleyiniz...');
    await Future.delayed(const Duration(seconds: 3));
    EasyLoading.dismiss();
    return null;
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
        departureStationName: "Ankara Gar",
        destinationStationName: "Konya YHT",
        wagonCount: 8,
        startDate: DateTime(now.year, now.month, now.day, 18, 30),
        alertStatusType: 0,
        lastModifiedAt: DateTime.now(),
        unreadNotificationCount: 0,
      ),
      AlertResponse(
        id: "alert:1",
        departureStationName: "Selçuklu Gar",
        destinationStationName: "Ankara Gar",
        wagonCount: 2,
        startDate: DateTime(now.year, now.month, now.day, 15, 30)
            .add(const Duration(days: 1)),
        alertStatusType: 0,
        lastModifiedAt: DateTime.now(),
        unreadNotificationCount: 0,
      ),
      AlertResponse(
        id: "alert:1",
        departureStationName: "Ankara Gar",
        destinationStationName: "Konya YHT",
        wagonCount: 5,
        startDate: DateTime(now.year, now.month, now.day, 15, 30)
            .add(const Duration(days: 7)),
        alertStatusType: 0,
        lastModifiedAt: DateTime.now(),
        unreadNotificationCount: 0,
      ),
      AlertResponse(
        id: "alert:1",
        departureStationName: "Ankara Gar",
        destinationStationName: "Konya YHT",
        wagonCount: 5,
        startDate: DateTime(now.year, now.month, now.day, 15, 30)
            .add(const Duration(days: 8)),
        alertStatusType: 0,
        lastModifiedAt: DateTime.now(),
        unreadNotificationCount: 0,
      ),
      ...additionalAlerts
    ];
  }

  @override
  Future<List<ScheduleResponse>?> getSchedules(ScheduleRequest data) async {
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
    EasyLoading.show(status: 'Bekleyiniz...');
    await Future.delayed(const Duration(seconds: 2));
    EasyLoading.dismiss();
    additionalAlerts.addAll(
      data.alerts.map((e) => AlertResponse(
            id: e.scheduleId.toString(),
            departureStationName: e.departureStationName,
            destinationStationName: e.destinationStationName,
            wagonCount: e.wagons.length,
            startDate: e.startDate,
            alertStatusType: 0,
            lastModifiedAt: DateTime.now(),
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
        departureStationName: "Eryaman YHT",
        destinationStationName: "Eskişehir",
        wagonCount: 1,
        startDate: DateTime.parse("2021-11-01T18:30:00"),
        alertStatusType: 1,
        lastModifiedAt: DateTime.parse("2021-10-29T18:30:00"),
        unreadNotificationCount: 1,
      ),
      AlertResponse(
        id: "alert:112",
        departureStationName: "Eskişehir",
        destinationStationName: "Eryaman YHT",
        wagonCount: 7,
        startDate: DateTime.parse("2021-10-28T18:30:00"),
        alertStatusType: 2,
        lastModifiedAt: DateTime.parse("2021-10-28T18:30:00"),
        unreadNotificationCount: 11,
      ),
      AlertResponse(
        id: "alert:113",
        departureStationName: "Eryaman YHT",
        destinationStationName: "Eskişehir",
        wagonCount: 1,
        startDate: DateTime.parse("2021-10-14T18:30:00"),
        alertStatusType: 2,
        lastModifiedAt: DateTime.parse("2021-10-14T18:30:00"),
        unreadNotificationCount: 0,
      ),
      AlertResponse(
        id: "alert:114",
        departureStationName: "İstanbul (Pendik)",
        destinationStationName: "Eskişehir",
        wagonCount: 8,
        startDate: DateTime.parse("2021-09-07T12:30:00"),
        alertStatusType: 1,
        lastModifiedAt: DateTime.parse("2021-09-03T12:30:00"),
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
    throw UnimplementedError();
  }

  @override
  Future<bool?> cancelAlert(String alertId) {
    // TODO: implement cancelAlert
    throw UnimplementedError();
  }
}
