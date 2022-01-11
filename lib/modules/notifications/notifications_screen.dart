import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/models/enums/notification_types.dart';
import 'package:yht_ticket/models/responses/notification_response.dart';
import 'package:yht_ticket/modules/notifications/notifications_controller.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsScreen extends GetView<NotificationsController> {
  NotificationsScreen({Key? key}) : super(key: key) {
    timeago.setLocaleMessages('tr', timeago.TrMessages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.customTheme.bgLayer1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.customTheme.bgLayer1,
        centerTitle: true,
        leading: InkWell(
          onTap: Get.back,
          child: Icon(
            MdiIcons.chevronLeft,
            color: AppTheme.theme.colorScheme.onBackground,
          ),
        ),
        title: Text(
          "Bildirimler",
          style: AppTheme.getTextStyle(AppTheme.theme.textTheme.headline6,
              color: AppTheme.theme.colorScheme.onBackground, fontWeight: 600),
        ),
      ),
      body: Obx(
        () {
          if (controller.notificationList.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset("assets/lotties/781-no-notifications.json"),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size24!),
                    child: Text(
                      "Gösterilecek bildirim bulunamadı!",
                      style: AppTheme.getTextStyle(
                          AppTheme.theme.textTheme.subtitle1,
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size24!),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(Spacing.xy(16, 0))),
                        onPressed: () {
                          controller.getNotifications();
                        },
                        child: Text("Tekrar dene",
                            style: AppTheme.getTextStyle(
                                AppTheme.theme.textTheme.bodyText2,
                                fontWeight: 600,
                                color: AppTheme.theme.colorScheme.onPrimary,
                                letterSpacing: 0.5))),
                  )
                ],
              ),
            );
          }
          var grouped = _toMap(controller.notificationList);
          return RefreshIndicator(
            onRefresh: controller.getNotifications,
            color: AppTheme.theme.primaryColor,
            backgroundColor: Colors.white,
            child: Container(
              margin: Spacing.fromLTRB(24, 0, 24, 0),
              child: GroupListView(
                sectionsCount: grouped.keys.length,
                countOfItemInSection: (int section) {
                  return grouped[grouped.keys.toList()[section]]!.length;
                },
                itemBuilder: (BuildContext context, IndexPath index) {
                  return _buildNotification(grouped[
                      grouped.keys.toList()[index.section]]![index.index]);
                },
                groupHeaderBuilder: (BuildContext context, int section) {
                  return Container(
                    margin: Spacing.top(16),
                    child: Text(
                      grouped.keys.toList()[section],
                      style: AppTheme.getTextStyle(
                          AppTheme.theme.textTheme.bodyText1,
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontWeight: 600),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Map<String, List<NotificationResponse>> _toMap(
      List<NotificationResponse> notifications) {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);
    var week = today.subtract(const Duration(days: 6));
    var month = today.subtract(const Duration(days: 30));

    Map<String, List<NotificationResponse>> map = {};
    var thisDay = notifications
        .where((element) => element.createdAt.compareTo(today) >= 0);
    var thisWeek = notifications.where((element) =>
        element.createdAt.compareTo(week) >= 0 &&
        element.createdAt.compareTo(today) < 0);
    var thisMonth = notifications.where((element) =>
        element.createdAt.compareTo(month) >= 0 &&
        element.createdAt.compareTo(week) < 0);
    var older = notifications
        .where((element) => element.createdAt.compareTo(month) < 0);

    if (thisDay.isNotEmpty) {
      map['Bugün'] = thisDay.toList();
    }
    if (thisWeek.isNotEmpty) {
      map['Bu hafta'] = thisWeek.toList();
    }
    if (thisMonth.isNotEmpty) {
      map['Bu ay'] = thisMonth.toList();
    }
    if (older.isNotEmpty) {
      map['Daha Eski'] = older.toList();
    }

    return map;
  }

  Widget _buildNotification(NotificationResponse item) {
    return Container(
      margin: Spacing.top(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black.withAlpha(8),
            child: _buildNotificationIcon(item),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: RichText(
                text: TextSpan(
                  style: AppTheme.getTextStyle(
                      AppTheme.theme.textTheme.bodyText2,
                      color: AppTheme.theme.colorScheme.onBackground,
                      fontWeight: 500),
                  children: [
                    ..._buildNotificationMessage(item),
                    TextSpan(
                      text: "\n${timeago.format(item.createdAt, locale: 'tr')}",
                      style: AppTheme.getTextStyle(
                          AppTheme.theme.textTheme.bodyText2,
                          color: AppTheme.theme.colorScheme.onBackground,
                          xMuted: true,
                          fontWeight: 500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Icon _buildNotificationIcon(NotificationResponse item) {
    if (item.notificationType == NotificationTypes.AlertCreated) {
      return const Icon(
        MdiIcons.bellRing,
        color: Colors.green,
      );
    } else if (item.notificationType == NotificationTypes.AlertCancelled) {
      return const Icon(
        MdiIcons.bellOffOutline,
        color: Colors.red,
      );
    } else if (item.notificationType == NotificationTypes.AlertCompleted) {
      return Icon(
        MdiIcons.train,
        color: AppTheme.theme.primaryColor,
      );
    }
    return Icon(
      MdiIcons.faceMan,
      color: AppTheme.theme.primaryColor,
    );
  }

  var dateFormat = DateFormat("d MMMM, EEEE HH:mm", "tr_TR");
  List<TextSpan> _buildNotificationMessage(NotificationResponse item) {
    if (item.notificationType == NotificationTypes.AlertCreated) {
      var startDate = DateTime.parse(item.payload['startDate'] as String);
      return [
        TextSpan(
          text: dateFormat.format(startDate),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const TextSpan(text: ' tarihli '),
        TextSpan(
          text: item.payload['departureStationName'] as String,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const TextSpan(text: ' - '),
        TextSpan(
          text: item.payload['destinationStationName'] as String,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const TextSpan(text: ' seferi için alarm oluşturuldu.'),
      ];
    } else if (item.notificationType == NotificationTypes.AlertCancelled) {
      var startDate = DateTime.parse(item.payload['startDate'] as String);
      return [
        TextSpan(
          text: dateFormat.format(startDate),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const TextSpan(text: ' tarihli '),
        TextSpan(
          text: item.payload['departureStationName'] as String,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const TextSpan(text: ' - '),
        TextSpan(
          text: item.payload['destinationStationName'] as String,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const TextSpan(text: ' seferi için alarm kapatıldı.'),
      ];
    } else if (item.notificationType == NotificationTypes.AlertCompleted) {
      var startDate = DateTime.parse(item.payload['startDate'] as String);
      return [
        TextSpan(
          text: dateFormat.format(startDate),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const TextSpan(text: ' tarihli '),
        TextSpan(
          text: item.payload['departureStationName'] as String,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const TextSpan(text: ' - '),
        TextSpan(
          text: item.payload['destinationStationName'] as String,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const TextSpan(text: ' treni seferine başladı. İyi yolculuklar!'),
      ];
    }
    return [const TextSpan(text: "???")];
  }
}
