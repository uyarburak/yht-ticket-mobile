import 'package:get/get.dart';
import 'package:yht_ticket/api/api.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/shared/utils/focus.dart';

class HistoryController extends GetxController {
  final BaseApiRepository apiRepository;
  HistoryController({required this.apiRepository});

  var error = false.obs;
  var loading = true.obs;
  var completedAlerts = RxList<AlertResponse>();
  var activeAlerts = RxList<AlertResponse>();

  @override
  void onInit() {
    refreshAlerts();
    super.onInit();
  }

  refreshAlerts() {
    _getAlerts();
    _getActiveAlerts();
  }

  void _getActiveAlerts() async {
    loading.value = true;
    try {
      AppFocus.unfocus(Get.context!);
      final alerts = await apiRepository.getActiveAlerts();

      if (alerts == null) {
        error.value = true;
        return;
      }

      activeAlerts.value = alerts;
    } on Exception catch (_) {
      //
      error.value = true;
    } finally {
      loading.value = false;
    }
  }

  void _getAlerts() async {
    loading.value = true;
    try {
      AppFocus.unfocus(Get.context!);
      final alerts = await apiRepository.getAlerts();

      if (alerts == null) {
        error.value = true;
        return;
      }

      completedAlerts.value = alerts;
    } on Exception catch (_) {
      //
      error.value = true;
    } finally {
      loading.value = false;
    }
  }
}
