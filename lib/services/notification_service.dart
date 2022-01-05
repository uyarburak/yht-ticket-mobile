import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yht_ticket/api/base_api_repository.dart';
import 'package:yht_ticket/models/responses/notification_response.dart';
import 'package:yht_ticket/shared/constants/storage.dart';

// TODO convert it to GetxController

class NotificationService extends GetxService {
  final BaseApiRepository apiRepository;
  NotificationService({required this.apiRepository});
  static NotificationService get to => Get.find();

  var unreadNotificationCount = 0.obs;
  var notificationList = RxList<NotificationResponse>();

  @override
  void onInit() {
    getNotifications();
    getUnreadNotificationsCount();
    super.onInit();
  }

  Future getUnreadNotificationsCount() async {
    var count = await apiRepository.getUnreadNotificationCount();

    unreadNotificationCount.value = count ?? 0;
  }

  Future getNotifications() async {
    print("getNotifications called");
    var notifications = await apiRepository.getNotifications();

    if (notifications == null) return;

    notificationList.value = notifications;
  }
}
