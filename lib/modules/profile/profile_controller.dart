import 'package:get/get.dart';
import 'package:yht_ticket/api/api.dart';
import 'package:yht_ticket/models/models.dart';

class ProfileController extends GetxController {
  final BaseApiRepository apiRepository;
  ProfileController({required this.apiRepository});

  var error = false.obs;
  var loading = true.obs;
  var profile = ProfileResponse(email: "email", name: "name", credits: 0).obs;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void getProfile() async {
    loading.value = true;
    try {
      final profileResponse = await apiRepository.getProfile();

      if (profileResponse == null) {
        error.value = true;
        return;
      }

      profile.value = profileResponse;
    } on Exception catch (_) {
      //
      error.value = true;
    } finally {
      loading.value = false;
    }
  }
}
