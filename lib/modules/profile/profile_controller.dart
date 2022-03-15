import 'package:get/get.dart';
import 'package:yht_ticket/api/api.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/services/auth_service.dart';

class ProfileController extends GetxController {
  final BaseApiRepository apiRepository;
  ProfileController({required this.apiRepository});

  var error = false.obs;
  var loading = true.obs;
  var profile = ProfileResponse(
    email: "email",
    name: "name",
    credits: 0,
    isGuest: false,
    photo: '',
  ).obs;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void getProfile() async {
    loading.value = true;
    try {
      var loginResponse = AuthService.to.loginResponse;
      profile.value = ProfileResponse(
        email: loginResponse!.email,
        name: loginResponse.name,
        photo: loginResponse.avatarUrl,
        credits: 3,
        isGuest: loginResponse.isGuest,
      );
    } on Exception catch (_) {
      //
      error.value = true;
    } finally {
      loading.value = false;
    }
  }
}
