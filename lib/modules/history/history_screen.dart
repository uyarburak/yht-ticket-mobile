import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/new_app_theme.dart';
import 'package:yht_ticket/widgets/button.dart';
import 'package:yht_ticket/widgets/spacing.dart';
import 'package:yht_ticket/widgets/text.dart';

import 'history_controller.dart';

class HistoryScreen extends GetView<HistoryController> {
  const HistoryScreen({Key? key}) : super(key: key);

  static ThemeData theme = AppTheme.theme;
  static CustomTheme customTheme = AppTheme.customTheme;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const FxText.sh1("Alarm Geçmişi", fontWeight: 600),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            return controller.refreshAlerts();
          },
          color: theme.primaryColor,
          backgroundColor: customTheme.card,
          child: ListView(
            padding: FxSpacing.zero,
            children: <Widget>[
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
    );
  }

  Widget _buildList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        controller.activeAlerts.isNotEmpty
            ? Container(
                margin: FxSpacing.fromLTRB(24, 8, 0, 8),
                child: const FxText.caption(
                  "DEVAM EDEN ALARMLAR",
                  fontWeight: 700,
                  muted: true,
                ),
              )
            : const SizedBox(),
        ...controller.activeAlerts.map((e) => singleTask(e.id,
            task: '${e.departureStationName} - ${e.destinationStationName}',
            subject: DateFormat("d MMMM HH:mm", 'tr_TR').format(e.startDate),
            status: e.alertStatusType)),
        controller.completedAlerts.isNotEmpty
            ? Container(
                margin: FxSpacing.fromLTRB(24, 24, 0, 8),
                child: const FxText.caption(
                  "GEÇMİŞ ALARMLAR",
                  fontWeight: 700,
                  muted: true,
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
    );
  }

  Widget singleTask(String alertId,
      {String? subject, String? task, String? submissionDate, int status = 0}) {
    IconData iconData;
    Color iconColor, statusColor;
    String statusText = '';
    if (status == AlertStatus.active || status == AlertStatus.created) {
      iconColor = theme.primaryColor;
      iconData = MdiIcons.bell;
      statusColor = theme.primaryColor;
      //statusText = "Devam ediyor";
    } else if (status == AlertStatus.paymentRequired) {
      iconColor = customTheme.colorInfo;
      iconData = MdiIcons.cashMultiple;
      statusColor = customTheme.colorInfo;
      statusText = "Ödeme bekliyor";
    } else if (status == AlertStatus.cancelledByUser) {
      iconColor = customTheme.colorError;
      iconData = MdiIcons.stop;
      statusColor = customTheme.colorError;
      statusText = "Durduruldu";
    } else if (status == AlertStatus.completed) {
      iconColor = customTheme.disabledColor;
      iconData = MdiIcons.checkAll;
      statusColor = customTheme.disabledColor;
      statusText = "Tamamlandı";
    } else {
      iconColor = customTheme.disabledColor;
      iconData = MdiIcons.help;
      statusColor = customTheme.disabledColor;
      statusText = "???";
    }

    return InkWell(
      onTap: () {
        Get.toNamed(Routes.ALERT_DETAILS(alertId));
      },
      child: Container(
        padding: FxSpacing.all(16),
        margin: FxSpacing.fromLTRB(24, 8, 24, 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: customTheme.card,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
          boxShadow: const [],
          border: Border.all(color: customTheme.cardDark, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: FxSpacing.all(6),
              decoration: BoxDecoration(
                  color: iconColor.withAlpha(80), shape: BoxShape.circle),
              child: Icon(
                iconData,
                color: iconColor,
                size: MySize.size20,
              ),
            ),
            Expanded(
              child: Container(
                margin: FxSpacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.b1(
                      subject!,
                      fontWeight: 600,
                    ),
                    Container(
                      margin: FxSpacing.top(2),
                      child: FxText.caption(
                        task!,
                        fontWeight: 600,
                        muted: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FxText.caption(
                  submissionDate ?? '',
                  fontSize: 12,
                  letterSpacing: 0.2,
                  muted: true,
                  fontWeight: 600,
                ),
                Container(
                  margin: FxSpacing.top(2),
                  child: FxText.b2(
                    statusText,
                    color: statusColor,
                    letterSpacing: 0,
                    fontWeight: status == 3 ? 600 : 500,
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
    return SkeletonLoader(
      builder: Container(
        padding: FxSpacing.all(16),
        margin: FxSpacing.fromLTRB(24, 8, 24, 8),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: customTheme.shimmerBaseColor,
              radius: MySize.size16,
            ),
            SizedBox(width: MySize.size16!),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 10,
                    color: customTheme.shimmerHighlightColor,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 12,
                    color: customTheme.shimmerHighlightColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      items: 20,
      period: const Duration(seconds: 2),
      highlightColor: customTheme.shimmerBaseColor,
      direction: SkeletonDirection.ltr,
    );
  }

  Widget _buildAlertsNotFound() {
    return Column(
      children: [
        SizedBox(height: MySize.size24!),
        Lottie.asset("assets/lotties/629-empty-box.json"),
        Container(
          margin: EdgeInsets.only(top: MySize.size24!),
          child: const FxText.sh1(
            "Gösterilecek alarm bulunamadı!",
            fontWeight: 600,
            letterSpacing: 0,
          ),
        ),
        FxSpacing.height(24),
        FxButton(
          borderRadiusAll: 4,
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(MdiIcons.plus),
              FxText.b2(
                "Alarm oluştur",
                fontWeight: 600,
                color: theme.colorScheme.onPrimary,
                letterSpacing: 0.5,
              )
            ],
          ),
        ),
      ],
    );
  }
}
