import 'package:get/get.dart';
import 'package:yht_ticket/api/base_api_repository.dart';
import 'package:yht_ticket/models/responses/alert_response.dart';
import 'package:yht_ticket/shared/utils/focus.dart';

class DashboardController extends GetxController {
  final BaseApiRepository apiRepository;
  DashboardController({required this.apiRepository});

  var error = false.obs;
  var loading = true.obs;
  var alertList = RxList<AlertResponse>();

  @override
  void onInit() {
    getActiveAlerts();
    super.onInit();
  }

  void getActiveAlerts() async {
    print("getActiveAlerts started");
    loading.value = true;
    try {
      AppFocus.unfocus(Get.context!);
      final alerts = await apiRepository.getActiveAlerts();

      if (alerts == null) {
        error.value = true;
        return;
      }

      alertList.value = alerts;
    } on Exception catch (_) {
      //
      error.value = true;
    } finally {
      loading.value = false;
    }
    print("getActiveAlerts finished");
  }
}
