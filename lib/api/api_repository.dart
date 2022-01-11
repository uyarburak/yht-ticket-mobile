import 'dart:async';

import 'package:yht_ticket/api/fake_api_repository.dart';
import 'package:yht_ticket/models/requests/login_request.dart';
import 'package:yht_ticket/models/responses/full_alert_response.dart';
import 'package:yht_ticket/models/responses/login_response.dart';
import 'package:yht_ticket/models/responses/station_response.dart';

import 'package:yht_ticket/models/responses/schedule_response.dart';

import 'package:yht_ticket/models/responses/notification_response.dart';

import 'package:yht_ticket/models/responses/alert_response.dart';

import 'package:yht_ticket/models/requests/schedule_request.dart';

import 'package:yht_ticket/models/requests/create_alerts_request.dart';

import 'api_provider.dart';
import 'base_api_repository.dart';

class ApiRepository extends FakeApiRepository implements BaseApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  @override
  Future<LoginResponse?> login(LoginRequest data) async {
    final res = await apiProvider.login('/auth/api/v1/auth', data);
    if (res.statusCode == 200) {
      return LoginResponse.fromMap(res.body);
    }
  }

  @override
  Future<LoginResponse?> loginAsGuest(LoginRequest data) async {
    final res = await apiProvider.login('/auth/api/v1/auth/guest', data);
    if (res.statusCode == 200) {
      return LoginResponse.fromMap(res.body);
    }
  }

  @override
  Future<List<String>?> createAlerts(CreateAlertsRequest data) async {
    final res = await apiProvider.createAlerts('/alert/api/v1/alerts', data);
    if (res.statusCode == 200) {
      return (res.body as List).map((e) => e.toString()).toList();
    }
  }

  @override
  Future<List<AlertResponse>?> getActiveAlerts() async {
    final res = await apiProvider.getActiveAlerts('/alert/api/v1/alerts');
    if (res.statusCode == 200) {
      return (res.body as List).map((e) => AlertResponse.fromMap(e)).toList();
    }
  }

  @override
  Future<List<AlertResponse>?> getAlerts() async {
    final res = await apiProvider.getAlerts('/alert/api/v1/alerts');
    if (res.statusCode == 200) {
      return (res.body as List).map((e) => AlertResponse.fromMap(e)).toList();
    }
  }

  @override
  Future<FullAlertResponse?> getAlert(String alertId) async {
    final res = await apiProvider.getAlert('/alert/api/v1/alerts/$alertId');
    if (res.statusCode == 200) {
      return FullAlertResponse.fromMap(res.body);
    }
  }

  @override
  Future<List<NotificationResponse>?> getNotifications() async {
    final res =
        await apiProvider.getAlerts('/notification/api/v1/notifications');
    if (res.statusCode == 200) {
      return (res.body as List)
          .map((e) => NotificationResponse.fromMap(e))
          .toList();
    }
  }

  @override
  Future<int?> getUnreadNotificationCount() async {
    final res = await apiProvider.getUnreadNotificationCount(
        '/notification/api/v1/notifications/unread-count');
    if (res.statusCode == 200) {
      return res.body as int;
    }
  }

  @override
  Future<List<ScheduleResponse>?> getSchedules(ScheduleRequest data) async {
    final res =
        await apiProvider.getSchedules('/catalog/api/v1/schedules', data);
    if (res.statusCode == 200) {
      return (res.body as List)
          .map((e) => ScheduleResponse.fromMap(e))
          .toList();
    }
  }

  @override
  Future<List<StationResponse>?> getStations() async {
    final res = await apiProvider.getStations('/catalog/api/v1/stations');
    if (res.statusCode == 200) {
      return (res.body as List).map((e) => StationResponse.fromMap(e)).toList();
    }
  }
}
