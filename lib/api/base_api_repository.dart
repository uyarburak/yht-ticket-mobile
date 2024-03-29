import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/models/responses/register_response.dart';

abstract class BaseApiRepository {
  Future<LoginResponse?> login(LoginRequest data);
  Future<LoginResponse?> loginAsGuest(LoginAsGuestRequest data);
  Future<RegisterResponse?> register(RegisterRequest data);
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
  Future<bool?> cancelAlert(String alertId);
}
