import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yht_ticket/models/models.dart';

import 'base_provider.dart';

class ApiProvider extends BaseProvider {
  Future<Response> register(RegisterRequest request) {
    return post('/auth/api/v1/auth/register', request.toJson());
  }

  Future<Response> login(LoginRequest request) {
    return post('/auth/api/v1/auth', request.toJson());
  }

  Future<Response> loginAsGuest(LoginAsGuestRequest request) {
    return post('/auth/api/v1/auth/guest', request.toJson());
  }

  Future<Response> getNotifications() {
    return get('/notification/api/v1/notifications');
  }

  Future<Response> getUnreadNotificationCount() {
    return get('/notification/api/v1/notifications/unread-count');
  }

  Future<Response> getActiveAlerts() {
    return get('/alert/api/v1/alerts?active=true');
  }

  Future<Response> getAlerts() {
    return get('/alert/api/v1/alerts?active=false&page=0');
  }

  Future<Response> getAlert(String alertId) {
    return get('/alert/api/v1/alerts/$alertId');
  }

  Future<Response> getStations() {
    return get('/catalog/api/v1/stations');
  }

  Future<Response> getSchedules(ScheduleRequest data) {
    var dateFormat = DateFormat("yyyy-MM-dd");
    return get(
        '/catalog/api/v1/schedules?departure=${data.departure}&destination=${data.destination}&day=${dateFormat.format(data.departureDate)}');
  }

  Future<Response> createAlerts(CreateAlertsRequest data) {
    return post('/alert/api/v1/alerts', data.toJson());
  }

  Future<Response> cancelAlert(String alertId) {
    return delete('/alert/api/v1/alerts/$alertId');
  }
}
