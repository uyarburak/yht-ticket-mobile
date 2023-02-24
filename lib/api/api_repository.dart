import 'dart:async';

import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/models/responses/register_response.dart';

import 'api_provider.dart';
import 'base_api_repository.dart';
import 'fake_api_repository.dart';

class ApiRepository extends FakeApiRepository implements BaseApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  @override
  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await apiProvider.register(data);
    if (res.isOk) {
      return RegisterResponse.fromMap(res.body);
    }
  }

  @override
  Future<LoginResponse?> login(LoginRequest data) async {
    final res = await apiProvider.login(data);
    if (res.isOk) {
      return LoginResponse.fromMap(res.body);
    }
  }

  @override
  Future<LoginResponse?> loginAsGuest(LoginAsGuestRequest data) async {
    final res = await apiProvider.loginAsGuest(data);
    if (res.isOk) {
      return LoginResponse.fromMap(res.body);
    }
  }

  @override
  Future<List<String>?> createAlerts(CreateAlertsRequest data) async {
    final res = await apiProvider.createAlerts(data);
    if (res.isOk) {
      return (res.body as List).map((e) => e.toString()).toList();
    }
  }

  @override
  Future<List<AlertResponse>?> getActiveAlerts() async {
    final res = await apiProvider.getActiveAlerts();
    if (res.isOk) {
      return (res.body as List).map((e) => AlertResponse.fromMap(e)).toList();
    }
  }

  @override
  Future<List<AlertResponse>?> getAlerts() async {
    final res = await apiProvider.getAlerts();
    if (res.isOk) {
      return (res.body as List).map((e) => AlertResponse.fromMap(e)).toList();
    }
  }

  @override
  Future<FullAlertResponse?> getAlert(String alertId) async {
    final res = await apiProvider.getAlert(alertId);
    if (res.isOk) {
      return FullAlertResponse.fromMap(res.body);
    }
  }

  @override
  Future<List<NotificationResponse>?> getNotifications() async {
    final res = await apiProvider.getNotifications();
    if (res.isOk) {
      return (res.body as List)
          .map((e) => NotificationResponse.fromMap(e))
          .toList();
    }
  }

  @override
  Future<int?> getUnreadNotificationCount() async {
    final res = await apiProvider.getUnreadNotificationCount();
    if (res.isOk) {
      return res.body as int;
    }
  }

  @override
  Future<List<ScheduleResponse>?> getSchedules(ScheduleRequest data) async {
    final res = await apiProvider.getSchedules(data);
    if (res.isOk) {
      return (res.body as List)
          .map((e) => ScheduleResponse.fromMap(e))
          .toList();
    }
  }

  @override
  Future<List<StationResponse>?> getStations() async {
    final res = await apiProvider.getStations();
    if (res.isOk) {
      return (res.body as List).map((e) => StationResponse.fromMap(e)).toList();
    }
  }

  @override
  Future<bool?> cancelAlert(String alertId) async {
    final res = await apiProvider.cancelAlert(alertId);
    if (res.isOk) {
      return res.body as bool;
    }
  }
}
