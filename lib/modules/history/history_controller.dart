import 'package:get/get.dart';
import 'package:yht_ticket/api/base_api_repository.dart';
import 'package:yht_ticket/models/responses/alert_response.dart';
import 'package:yht_ticket/shared/utils/focus.dart';

class HistoryController extends GetxController {
  final BaseApiRepository apiRepository;
  HistoryController({required this.apiRepository});

  var error = false.obs;
  var loading = true.obs;
  var alertList = RxList<AlertResponse>();

  List<AlertResponse> get activeAlerts =>
      alertList.where((p0) => p0.status == 0).toList();

  List<AlertResponse> get completedAlerts =>
      alertList.where((p0) => p0.status != 0).toList();

  @override
  void onInit() {
    getAlerts();
    super.onInit();
  }

  void getAlerts() async {
    print("getAlerts started");
    loading.value = true;
    try {
      AppFocus.unfocus(Get.context!);
      final alerts = await apiRepository.getAlerts();

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
    print("getAlerts finished");
  }
}
