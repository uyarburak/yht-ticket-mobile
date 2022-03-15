import 'package:yht_ticket/api/api.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/services/auth_service.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  final BaseApiRepository apiRepository;
  IntroController({required this.apiRepository});

  void loginAsGuest() async {
    final res = await apiRepository.loginAsGuest(
      LoginAsGuestRequest(
        username: "41e879aa-859c-4bda-b77b-37b7e07c6674", // TODO make it random
      ),
    );

    if (res == null) return;

    AuthService.to.login(res);
  }
}
