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

abstract class BaseApiRepository {
  Future<LoginResponse?> login(LoginRequest data);
  Future<RegisterResponse?> register(RegisterRequest data);
  Future<bool?> forgotPassword(ForgotPasswordRequest data);
  Future<ProfileResponse?> getProfile();

  Future<List<NotificationResponse>?> getNotifications();
  Future<List<AlertResponse>?> getActiveAlerts();
  Future<List<AlertResponse>?> getAlerts();

  Future<List<ScheduleResponse>?> getSchedules(ScheduleRequest data);
  Future<List<String>?> createAlerts(CreateAlertsRequest data);
}
