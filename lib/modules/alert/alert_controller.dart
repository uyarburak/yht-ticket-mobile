import 'package:get/get.dart';
import 'package:yht_ticket/api/api.dart';
import 'package:yht_ticket/models/models.dart';

class AlertController extends GetxController {
  final String alertId;
  final BaseApiRepository apiRepository;
  AlertController({
    required this.apiRepository,
    required this.alertId,
  });

  var error = false.obs;
  var loading = true.obs;
  var alert = Rx<FullAlertResponse?>(null);

  @override
  void onInit() {
    refreshAlert();
    super.onInit();
  }

  refreshAlert() async {
    getAlert();
  }

  getAlert() async {
    loading.value = true;
    error.value = false;

    var response = await apiRepository.getAlert(alertId);
    if (response != null) {
      alert.value = response;
    } else {
      error.value = true;
    }
    loading.value = false;
  }
}
