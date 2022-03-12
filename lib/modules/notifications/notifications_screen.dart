import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:yht_ticket/theme/new_app_theme.dart';
import 'package:yht_ticket/theme/text_style.dart';
import 'package:yht_ticket/widgets/spacing.dart';
import 'package:yht_ticket/widgets/text.dart';

import 'notifications_controller.dart';

class NotificationsScreen extends GetView<NotificationsController> {
  final dateFormat = DateFormat("d MMMM, EEEE HH:mm", "tr_TR");

  NotificationsScreen({Key? key}) : super(key: key) {
    timeago.setLocaleMessages('tr', timeago.TrMessages());
  }

  var theme = AppTheme.theme;
  var customTheme = AppTheme.customTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            MdiIcons.chevronLeft,
          ),
        ),
        title: FxText.sh1("Bildirimler", fontWeight: 600),
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
                    child: FxText.sh2(
                      "Gösterilecek bildirim bulunamadı!",
                      fontWeight: 600,
                      letterSpacing: 0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size24!),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => theme.primaryColor),
                          padding:
                              MaterialStateProperty.all(Spacing.xy(16, 0))),
                      onPressed: () {
                        controller.getNotifications();
                      },
                      child: FxText.b2(
                        "Tekrar dene",
                        fontWeight: 600,
                        color: theme.colorScheme.onPrimary,
                        letterSpacing: 0.5,
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          var grouped = _toMap(controller.notificationList);
          return RefreshIndicator(
            onRefresh: controller.getNotifications,
            color: theme.primaryColor,
            backgroundColor: customTheme.card,
            child: Container(
              //margin: Spacing.horizontal(MySize.size24!),
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
                    margin: FxSpacing.y(12),
                    padding: FxSpacing.x(24),
                    child: FxText.b1(
                      grouped.keys.toList()[section],
                      fontWeight: 600,
                      muted: true,
                    ),
                  );
                },
                separatorBuilder: (ctx, _) {
                  return Divider(
                    height: 0.5,
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
      //margin: FxSpacing.top(16),
      padding: FxSpacing.xy(24, 12),
      color: customTheme.card,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNotificationIcon(item),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: RichText(
                text: TextSpan(
                  style: FxTextStyle.b2(
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500,
                  ),
                  // style: AppTheme.getTextStyle(
                  //     AppTheme.theme.textTheme.bodyText2,
                  //     color: AppTheme.yhtTheme.onBgLayer1,
                  //     fontWeight: 500),
                  children: [
                    ..._buildNotificationMessage(item),
                    TextSpan(
                      text: "\n${timeago.format(item.createdAt, locale: 'tr')}",
                      style: FxTextStyle.caption(
                        color: theme.colorScheme.onBackground,
                        xMuted: true,
                        height: 1.5,
                      ),
                      // style: AppTheme.getTextStyle(
                      //     AppTheme.theme.textTheme.bodyText2,
                      //     color: AppTheme.yhtTheme.onBgLayer1Muted,
                      //     fontWeight: 500),
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

  Widget _buildNotificationIcon(NotificationResponse item) {
    if (item.notificationType == NotificationTypes.alertCreated) {
      return CircleAvatar(
        radius: 22,
        backgroundColor: Colors.green.withAlpha(80),
        child: const Icon(
          MdiIcons.bellRing,
          color: Colors.green,
        ),
      );
    } else if (item.notificationType == NotificationTypes.alertCancelled) {
      return CircleAvatar(
        radius: 22,
        backgroundColor: Colors.red.withAlpha(80),
        child: const Icon(
          MdiIcons.bellOffOutline,
          color: Colors.red,
        ),
      );
    } else if (item.notificationType == NotificationTypes.alertCompleted) {
      return CircleAvatar(
        radius: 22,
        backgroundColor: theme.primaryColor.withAlpha(100),
        child: Icon(
          MdiIcons.train,
          color: theme.primaryColor,
        ),
      );
    }
    return CircleAvatar(
      radius: 22,
      backgroundColor: AppTheme.theme.primaryColor.withAlpha(80),
      child: Icon(
        MdiIcons.faceMan,
        color: AppTheme.theme.primaryColor,
      ),
    );
  }

  List<TextSpan> _buildNotificationMessage(NotificationResponse item) {
    if (item.notificationType == NotificationTypes.alertCreated) {
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
    } else if (item.notificationType == NotificationTypes.alertCancelled) {
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
    } else if (item.notificationType == NotificationTypes.alertCompleted) {
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
