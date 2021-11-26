import 'package:yht_ticket/models/requests/forgot_password_request.dart';
import 'package:yht_ticket/models/requests/login_request.dart';
import 'package:yht_ticket/models/requests/register_request.dart';
import 'package:yht_ticket/models/responses/login_response.dart';
import 'package:yht_ticket/models/responses/register_response.dart';

abstract class BaseApiRepository {
  Future<LoginResponse?> login(LoginRequest data);
  Future<RegisterResponse?> register(RegisterRequest data);
  Future<bool?> forgotPassword(ForgotPasswordRequest data);
}
