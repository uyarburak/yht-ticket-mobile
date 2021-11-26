import 'package:yht_ticket/models/requests/login_request.dart';
import 'package:yht_ticket/models/responses/login_response.dart';

abstract class BaseApiRepository {
  Future<LoginResponse?> login(LoginRequest data);
}
