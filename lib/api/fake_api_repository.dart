import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yht_ticket/models/requests/login_request.dart';
import 'package:yht_ticket/models/responses/login_response.dart';

import 'base_api_repository.dart';

class FakeApiRepository implements BaseApiRepository {
  @override
  Future<LoginResponse?> login(LoginRequest data) async {
    EasyLoading.show(status: 'Bekleyiniz...');
    await Future.delayed(const Duration(seconds: 3));
    EasyLoading.dismiss();
    return LoginResponse(token: "blabla");
  }
}
