import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yht_ticket/api/base_provider.dart';
import 'package:yht_ticket/models/requests/create_alerts_request.dart';
import 'package:yht_ticket/models/requests/schedule_request.dart';

class ApiProvider extends BaseProvider {
  Future<Response> getNotifications(String path) {
    return get(path);
  }

  Future<Response> getUnreadNotificationCount(String path) {
    return get(path);
  }

  Future<Response> getActiveAlerts(String path) {
    return get(path + "?active=true");
  }

  Future<Response> getAlerts(String path) {
    return get(path + "?active=false&page=0");
  }

  Future<Response> getStations(String path) {
    return get(path);
  }

  Future<Response> getSchedules(String path, ScheduleRequest data) {
    var dateFormat = DateFormat("yyyy-MM-dd");
    return get(path +
        "?departure=${data.departure}&destination=${data.destination}&day=${dateFormat.format(data.departureDate)}");
  }

  Future<Response> createAlerts(String path, CreateAlertsRequest data) {
    final json = jsonEncode(data.alerts.map((e) => e.toMap()).toList());
    return post(path, json);
  }
}
