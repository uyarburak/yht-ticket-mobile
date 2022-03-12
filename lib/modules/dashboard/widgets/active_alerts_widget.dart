import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/modules/dashboard/dashboard_controller.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/new_app_theme.dart';
import 'package:yht_ticket/widgets/spacing.dart';
import 'package:yht_ticket/widgets/text.dart';

class ActiveAlertsWidget extends StatelessWidget {
  ActiveAlertsWidget({
    Key? key,
  }) : super(key: key);

  final DashboardController _dashboardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_dashboardController.loading.isTrue) {
        return _buildLoading();
      }
      var alerts = _dashboardController.alertList;
      if (alerts.isEmpty) {
        return _buildEmptyList();
      }
      return _buildList(alerts);
    });
  }

  Widget _buildList(RxList<AlertResponse> alerts) {
    var customTheme = AppTheme.customTheme;

    return Column(
      children: [
        FxSpacing.height(16),
        ...List.generate(alerts.length * 2, (index) {
          if (index == alerts.length * 2 - 1) return FxSpacing.height(24);
          if (index % 2 == 1) {
            return Divider(
              height: 0,
              color: customTheme.borderDark,
            );
          }

          return _buildActiveAlert(alert: alerts[index ~/ 2]);
        }).toList(),
      ],
    );
  }

  Widget _buildEmptyList() {
    var theme = AppTheme.theme;
    return GestureDetector(
      onTap: _dashboardController.onClickSearchScheduleButton,
      child: Container(
        margin: Spacing.xy(20, 16),
        padding: Spacing.xy(16, 24),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size12!)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: FxSpacing.all(8),
              decoration: const BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const Icon(
                MdiIcons.alarmPlus,
                color: Colors.white,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.b1(
                  "Yeni alarm oluştur!",
                  color: theme.colorScheme.onPrimary,
                  fontWeight: 600,
                ),
                Container(
                  margin: Spacing.top(6),
                  width: MySize.safeWidth! * 0.6,
                  child: FxText.b2(
                    "Koltuk boşaldığında haberin olsun",
                    color: theme.colorScheme.onPrimary,
                    fontWeight: 500,
                    muted: true,
                  ),
                ),
              ],
            ),
            Icon(
              MdiIcons.chevronRight,
              color: theme.colorScheme.onPrimary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
      ),
    );
  }

  Widget _buildActiveAlert({required AlertResponse alert}) {
    var theme = AppTheme.theme;
    var customTheme = AppTheme.customTheme;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final nextWeek = today.add(const Duration(days: 7));
    final scheduleDate = DateTime(
        alert.startDate.year, alert.startDate.month, alert.startDate.day);
    String date;
    if (scheduleDate == today) {
      date = 'Bugün ${DateFormat('HH:mm').format(alert.startDate)}';
    } else if (scheduleDate.compareTo(nextWeek) < 0) {
      date = DateFormat('EEEE HH:mm', 'tr_TR').format(alert.startDate);
    } else {
      date = DateFormat('d MMMM, E HH:mm', 'tr_TR').format(alert.startDate);
    }
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.ALERT_DETAILS(alert.id));
      },
      child: Container(
        //margin: Spacing.bottom(24),
        padding: FxSpacing.xy(20, 16),
        color: customTheme.card,
        child: Stack(
          children: [
            Row(
              children: <Widget>[
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size8!))),
                  child: Container(
                    padding: FxSpacing.all(8),
                    decoration: BoxDecoration(
                        color: theme.primaryColor.withAlpha(24),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: Icon(
                      MdiIcons.train,
                      color: theme.primaryColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: Spacing.left(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FxText.b2(
                          date,
                          color: theme.primaryColor,
                          fontWeight: 700,
                        ),
                        FxText.b1(
                          "${alert.departureStationName} - ${alert.destinationStationName}",
                          letterSpacing: 0,
                          fontWeight: 600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        FxText.b2(
                          "${alert.wagonCount} vagon",
                          muted: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Icon(
                  MdiIcons.chevronRight,
                  color: theme.colorScheme.onBackground.withAlpha(120),
                ),
              ],
            ),
            alert.unreadNotificationCount > 0
                ? Positioned(
                    top: 0,
                    left: 25,
                    child: CircleAvatar(
                      maxRadius: 10,
                      backgroundColor: theme.colorScheme.secondary,
                      child: Center(
                        child: FxText.overline(
                          alert.unreadNotificationCount.toString(),
                          color: theme.colorScheme.onSecondary,
                          fontWeight: 600,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
