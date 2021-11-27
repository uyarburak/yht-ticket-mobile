import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yht_ticket/api/base_api_repository.dart';
import 'package:yht_ticket/models/responses/notification_response.dart';
import 'package:yht_ticket/shared/constants/storage.dart';

class NotificationService extends GetxService {
  final BaseApiRepository apiRepository;
  NotificationService({required this.apiRepository});
  static NotificationService get to => Get.find();

  get unreadNotificationCount => notificationList
      .where((element) =>
          element.date.compareTo(lastSeenNotificationDate.value) > 0)
      .length;
  var notificationList = RxList<NotificationResponse>();
  var lastSeenNotificationDate = DateTime(2010).obs;
  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }

  Future getNotifications() async {
    print("getNotifications called");
    var notifications = await apiRepository.getNotifications();

    if (notifications == null) return;

    final prefs = Get.find<SharedPreferences>();
    var lastSeen = prefs.getString(StorageConstants.lastSeenNotificationDate);
    print("lastSeen: $lastSeen");
    if (lastSeen != null) {
      var date = DateTime.parse(lastSeen);
      print("date: $date");
      lastSeenNotificationDate.value = date;
      print("unreadNot: $unreadNotificationCount");
      print("lastSeenNotificationDate: $lastSeenNotificationDate");
    }

    notificationList.value = notifications;
  }

  void setLatestReadNotificationDate() async {
    if (notificationList.isNotEmpty) {
      await Future.delayed(const Duration(seconds: 3));
      var latestSeen = notificationList.first.date;
      lastSeenNotificationDate.value = latestSeen;
      final prefs = Get.find<SharedPreferences>();
      prefs.setString(
          StorageConstants.lastSeenNotificationDate, latestSeen.toString());

      print("storage lastSeenNotificationDate set to $latestSeen");
    }
  }
}
