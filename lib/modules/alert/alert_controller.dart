import 'package:get/get.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:yht_ticket/api/api.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/modules/alert/widgets/alert_info_dialog.dart';

class AlertController extends GetxController {
  final String alertId;
  final BaseApiRepository apiRepository;
  late HubConnection hubConnection;

  AlertController({
    required this.apiRepository,
    required this.alertId,
  });

  var error = false.obs;
  var loading = true.obs;
  var alert = Rx<FullAlertResponse?>(null);

  @override
  void onInit() {
    connectToHub();
    refreshAlert();
    super.onInit();
  }

  connectToHub() async {
    hubConnection = HubConnectionBuilder()
        .withUrl(
          'http://yhtbilet.link:5001/alert-seats-change',
          HttpConnectionOptions(
            logging: (level, message) => print(message),
          ),
        )
        .build();

    await hubConnection.start();

    hubConnection.on('change', (arguments) {
      final int wagon = arguments![0];
      final int wagonEmptySeatsCount = arguments[1];
      final changes = arguments[2] as List;
      for (var change in changes) {
        final notification = AlertNotification(
          wagon: wagon,
          wagonEmptySeatsCount: wagonEmptySeatsCount,
          seatNo: change['seatNo'],
          oldStatus: change['oldStatus'],
          newStatus: change['newStatus'],
          createdAt: DateTime.now(),
        );

        addNotification(notification);
      }
    });

    await hubConnection.invoke('JoinGroup', args: [alertId]);
  }

  refreshAlert() async {
    getAlert();
  }

  addNotification(AlertNotification notification) {
    alert.update((alert) {
      alert!.notifications.insert(0, notification);
      alert.scheduleWagons
          .where((element) => element.wagon == notification.wagon)
          .forEach((element) {
        element.emptyCount = notification.wagonEmptySeatsCount;
      });
    });
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

  @override
  void onClose() async {
    await hubConnection.stop();
    super.onClose();
  }

  onInfoButtonClicked() {
    Get.dialog(AlertInfoDialog(
      onCancelPressed: onCancelAlertPressed,
    ));
  }

  onCancelAlertPressed() async {
    var response = await apiRepository.cancelAlert(alertId);

    if (response != null && response) {
      Get.back(closeOverlays: true);
    }
  }
}
