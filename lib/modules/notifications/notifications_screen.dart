import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/models/responses/notification_response.dart';
import 'package:yht_ticket/services/notification_service.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsScreen extends GetView<NotificationService> {
  NotificationsScreen({Key? key}) : super(key: key) {
    controller.setLatestReadNotificationDate();
    timeago.setLocaleMessages('tr', timeago.TrMessages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                sectionSeparatorBuilder: (context, section) => const Divider(),
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
    var thisDay =
        notifications.where((element) => element.date.compareTo(today) >= 0);
    var thisWeek = notifications.where((element) =>
        element.date.compareTo(week) >= 0 && element.date.compareTo(today) < 0);
    var thisMonth = notifications.where((element) =>
        element.date.compareTo(month) >= 0 && element.date.compareTo(week) < 0);
    var older =
        notifications.where((element) => element.date.compareTo(month) < 0);

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
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size24!)),
            child: Icon(
              item.notificationType == 1
                  ? MdiIcons.faceWoman
                  : MdiIcons.faceMan,
              size: MySize.size48,
              color: AppTheme.theme.primaryColor,
            ),
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
                    TextSpan(text: item.message),
                    TextSpan(
                      text: " ${timeago.format(item.date, locale: 'tr')}",
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
}
