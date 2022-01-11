import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';

import 'history_controller.dart';

class HistoryScreen extends GetView<HistoryController> {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              return controller.refreshAlerts();
            },
            color: AppTheme.theme.primaryColor,
            backgroundColor: Colors.white,
            child: Container(
              color: AppTheme.customTheme.bgLayer1,
              child: ListView(
                padding: Spacing.zero,
                children: <Widget>[
                  Container(
                    margin: Spacing.fromLTRB(24, 16, 24, 0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text(
                              "Alarm Geçmişi",
                              style: AppTheme.getTextStyle(
                                  AppTheme.theme.textTheme.bodyText1,
                                  color:
                                      AppTheme.theme.colorScheme.onBackground,
                                  fontWeight: 600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  controller.loading.isTrue
                      ? _buildSkeletonLoader()
                      : controller.completedAlerts.isEmpty &&
                              controller.activeAlerts.isEmpty
                          ? _buildAlertsNotFound()
                          : _buildList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    return Container(
      margin: Spacing.fromLTRB(0, 8, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          controller.activeAlerts.isNotEmpty
              ? Container(
                  margin: Spacing.fromLTRB(24, 16, 0, 8),
                  child: Text(
                    "DEVAM EDEN ALARMLAR",
                    style: AppTheme.getTextStyle(
                        AppTheme.theme.textTheme.caption,
                        fontWeight: 700,
                        muted: true,
                        color: AppTheme.theme.colorScheme.onBackground),
                  ),
                )
              : const SizedBox(),
          ...controller.activeAlerts.map((e) => singleTask(e.id,
              task: '${e.departureStationName} - ${e.destinationStationName}',
              subject: DateFormat("d MMMM HH:mm", 'tr_TR').format(e.startDate),
              status: e.alertStatusType)),
          controller.completedAlerts.isNotEmpty
              ? Container(
                  margin: Spacing.fromLTRB(24, 24, 0, 8),
                  child: Text(
                    "GEÇMİŞ ALARMLAR",
                    style: AppTheme.getTextStyle(
                        AppTheme.theme.textTheme.caption,
                        fontWeight: 700,
                        muted: true,
                        color: AppTheme.theme.colorScheme.onBackground),
                  ),
                )
              : const SizedBox(),
          ...controller.completedAlerts.map(
            (e) => singleTask(
              e.id,
              task: '${e.departureStationName} - ${e.destinationStationName}',
              subject: DateFormat("d MMMM HH:mm", 'tr_TR').format(e.startDate),
              status: e.alertStatusType,
              submissionDate:
                  DateFormat("dd/MM/yy", 'tr_TR').format(e.lastModifiedAt),
            ),
          ),
        ],
      ),
    );
  }

  Widget singleTask(String alertId,
      {String? subject, String? task, String? submissionDate, int status = 0}) {
    IconData iconData;
    Color iconBG, iconColor, statusColor;
    String statusText = '';
    if (status == AlertStatus.active || status == AlertStatus.created) {
      iconBG = AppTheme.theme.colorScheme.primary;
      iconColor = AppTheme.theme.colorScheme.onPrimary;
      iconData = MdiIcons.alarm;
      statusColor = AppTheme.theme.colorScheme.primary;
      statusText = "Devam ediyor";
    } else if (status == AlertStatus.paymentRequired) {
      iconBG = AppTheme.customTheme.colorInfo;
      iconColor = AppTheme.customTheme.onInfo;
      iconData = MdiIcons.cashMultiple;
      statusColor = AppTheme.customTheme.colorInfo;
      statusText = "Ödeme bekliyor";
    } else if (status == AlertStatus.cancelledByUser) {
      iconBG = AppTheme.customTheme.colorInfo;
      iconColor = AppTheme.customTheme.onInfo;
      iconData = MdiIcons.stop;
      statusColor = AppTheme.customTheme.colorInfo;
      statusText = "Durduruldu";
    } else if (status == AlertStatus.completed) {
      iconBG = AppTheme.customTheme.disabledColor;
      iconColor = AppTheme.customTheme.onDisabled;
      iconData = MdiIcons.checkAll;
      statusColor = AppTheme.customTheme.disabledColor;
      statusText = "Tamamlandı";
    } else {
      iconBG = AppTheme.customTheme.disabledColor;
      iconColor = AppTheme.customTheme.onDisabled;
      iconData = MdiIcons.help;
      statusColor = AppTheme.customTheme.disabledColor;
      statusText = "???";
    }

    return InkWell(
      onTap: () {
        Get.toNamed(Routes.ALERT_DETAILS(alertId));
      },
      child: Container(
        padding: Spacing.all(16),
        margin: Spacing.fromLTRB(24, 8, 24, 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: AppTheme.customTheme.bgLayer1,
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
            boxShadow: const [],
            border: Border.all(color: AppTheme.customTheme.bgLayer3, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: Spacing.all(6),
              decoration: BoxDecoration(color: iconBG, shape: BoxShape.circle),
              child: Icon(
                iconData,
                color: iconColor,
                size: MySize.size20,
              ),
            ),
            Expanded(
              child: Container(
                margin: Spacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      subject!,
                      style: AppTheme.getTextStyle(
                          AppTheme.theme.textTheme.bodyText1,
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontWeight: 600),
                    ),
                    Container(
                      margin: Spacing.top(2),
                      child: Text(
                        task!,
                        style: AppTheme.getTextStyle(
                          AppTheme.theme.textTheme.caption,
                          color: AppTheme.theme.colorScheme.onBackground
                              .withAlpha(160),
                          fontWeight: 600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  submissionDate ?? '',
                  style: AppTheme.getTextStyle(AppTheme.theme.textTheme.caption,
                      fontSize: 12,
                      letterSpacing: 0.2,
                      color: AppTheme.theme.colorScheme.onBackground,
                      muted: true,
                      fontWeight: 600),
                ),
                Container(
                  margin: Spacing.top(2),
                  child: Text(
                    statusText,
                    style: AppTheme.getTextStyle(
                        AppTheme.theme.textTheme.bodyText2,
                        color: statusColor,
                        letterSpacing: 0,
                        fontWeight: status == 3 ? 600 : 500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonLoader() {
    return Container(
      margin: Spacing.fromLTRB(0, 8, 0, 0),
      child: SkeletonLoader(
        builder: Container(
          padding: Spacing.all(16),
          margin: Spacing.fromLTRB(24, 8, 24, 8),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: MySize.size16,
              ),
              SizedBox(width: MySize.size16!),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 10,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 12,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        items: 20,
        period: const Duration(seconds: 2),
        highlightColor: AppTheme.theme.colorScheme.primary.withAlpha(28),
        direction: SkeletonDirection.ltr,
      ),
    );
  }

  Widget _buildAlertsNotFound() {
    return Column(
      children: [
        SizedBox(height: MySize.size24!),
        Lottie.asset("assets/lotties/629-empty-box.json"),
        Container(
          margin: EdgeInsets.only(top: MySize.size24!),
          child: Text(
            "Gösterilecek alarm bulunamadı!",
            style: AppTheme.getTextStyle(AppTheme.theme.textTheme.subtitle1,
                color: AppTheme.theme.colorScheme.onBackground,
                fontWeight: 600,
                letterSpacing: 0),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: MySize.size24!),
          child: ElevatedButton.icon(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(Spacing.xy(16, 0))),
              onPressed: () {
                //controller.getNotifications();
              },
              icon: const Icon(MdiIcons.plus),
              label: Text("Alarm oluştur",
                  style: AppTheme.getTextStyle(
                      AppTheme.theme.textTheme.bodyText2,
                      fontWeight: 600,
                      color: AppTheme.theme.colorScheme.onPrimary,
                      letterSpacing: 0.5))),
        )
      ],
    );
  }
}
