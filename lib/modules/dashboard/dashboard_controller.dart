import 'package:get/get.dart';
import 'package:yht_ticket/api/api.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/shared/utils/focus.dart';

class DashboardController extends GetxController {
  final BaseApiRepository apiRepository;
  DashboardController({required this.apiRepository});

  var error = false.obs;
  var loading = true.obs;
  var alertList = RxList<AlertResponse>();
  var unreadNotificationCount = 0.obs;

  @override
  void onInit() {
    refreshAlertsAndUnreadNotificationCount();
    super.onInit();
  }

  refreshAlertsAndUnreadNotificationCount() {
    _getActiveAlerts();
    _getUnreadNotificationsCount();
  }

  Future _getUnreadNotificationsCount() async {
    var count = await apiRepository.getUnreadNotificationCount();
    unreadNotificationCount.value = count ?? 0;
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

      alertList.value = alerts;
    } on Exception catch (_) {
      //
      error.value = true;
    } finally {
      loading.value = false;
    }
  }
}
