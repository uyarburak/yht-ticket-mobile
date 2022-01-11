import 'package:yht_ticket/models/models.dart';

abstract class BaseApiRepository {
  Future<LoginResponse?> login(LoginRequest data);
  Future<LoginResponse?> loginAsGuest(LoginAsGuestRequest data);
  Future<LoginResponse?> register(RegisterRequest data);
  Future<bool?> forgotPassword(ForgotPasswordRequest data);
  Future<ProfileResponse?> getProfile();

  Future<List<NotificationResponse>?> getNotifications();
  Future<int?> getUnreadNotificationCount();
  Future<List<AlertResponse>?> getActiveAlerts();
  Future<List<AlertResponse>?> getAlerts();
  Future<FullAlertResponse?> getAlert(String alertId);

  Future<List<StationResponse>?> getStations();
  Future<List<ScheduleResponse>?> getSchedules(ScheduleRequest data);
  Future<List<String>?> createAlerts(CreateAlertsRequest data);
}
