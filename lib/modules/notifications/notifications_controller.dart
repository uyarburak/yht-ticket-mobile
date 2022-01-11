import 'package:get/get.dart';
import 'package:yht_ticket/api/base_api_repository.dart';
import 'package:yht_ticket/models/models.dart';

class NotificationsController extends GetxController {
  final BaseApiRepository apiRepository;
  NotificationsController({required this.apiRepository});

  var notificationList = RxList<NotificationResponse>();

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }

  Future getNotifications() async {
    var notifications = await apiRepository.getNotifications();

    if (notifications == null) return;

    notificationList.value = notifications;
  }
}
