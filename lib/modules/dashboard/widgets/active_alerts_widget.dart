import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:yht_ticket/models/responses/alert_response.dart';
import 'package:yht_ticket/modules/dashboard/dashboard_controller.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';

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
    return Container(
      padding: Spacing.fromLTRB(24, 0, 24, 0),
      child: Column(
        children: alerts.map((e) => _buildActiveAlert(alert: e)).toList(),
      ),
    );
  }

  Widget _buildEmptyList() {
    return Container(
      margin: Spacing.fromLTRB(24, 24, 24, 0),
      padding: Spacing.all(24),
      decoration: BoxDecoration(
        color: AppTheme.theme.colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(MySize.size12!)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hiç alarmın yok!",
                style: AppTheme.getTextStyle(AppTheme.theme.textTheme.bodyText1,
                    color: AppTheme.theme.colorScheme.onPrimary,
                    fontWeight: 600),
              ),
              Container(
                margin: Spacing.top(8),
                width: MySize.safeWidth! * 0.6,
                child: Text(
                  "Hemen bir sefer seçerek, koltuk boşaldığında haberdar olabilirsin!",
                  style: AppTheme.getTextStyle(
                      AppTheme.theme.textTheme.bodyText2,
                      color: AppTheme.theme.colorScheme.onPrimary,
                      fontWeight: 400,
                      muted: true),
                ),
              ),
            ],
          ),
          const Icon(MdiIcons.chevronRight),
        ],
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
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final nextWeek = today.add(Duration(days: 7));
    final scheduleDate = DateTime(alert.scheduleDate.year,
        alert.scheduleDate.month, alert.scheduleDate.day);
    String date;
    if (scheduleDate == today) {
      date = 'Bugün ${DateFormat('HH:mm').format(alert.scheduleDate)}';
    } else if (scheduleDate.compareTo(nextWeek) < 0) {
      date = DateFormat('EEEE HH:mm', 'tr_TR').format(alert.scheduleDate);
    } else {
      date = DateFormat('d MMMM, E HH:mm', 'tr_TR').format(alert.scheduleDate);
    }
    return InkWell(
      onTap: () {},
      child: Container(
        margin: Spacing.top(24),
        child: Row(
          children: <Widget>[
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(MySize.size8!))),
              child: Stack(
                children: [
                  CircleAvatar(
                    child: Icon(
                      MdiIcons.train,
                      color: AppTheme.theme.colorScheme.onPrimary,
                    ),
                  ),
                  alert.scheduleDate.hour % 2 == 0
                      ? Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            height: MySize.size20,
                            width: MySize.size20,
                            decoration: BoxDecoration(
                                color: Colors.red.shade600,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size40!))),
                            child: Center(
                              child: Text(
                                '${alert.scheduleDate.hour ~/ 2}',
                                style: AppTheme.getTextStyle(
                                  AppTheme.theme.textTheme.overline,
                                  color: AppTheme.theme.colorScheme.onPrimary,
                                  fontWeight: 600,
                                  fontSize: 9,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: Spacing.left(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      date,
                      style: AppTheme.getTextStyle(
                          AppTheme.theme.textTheme.bodyText2,
                          color:
                              AppTheme.theme.colorScheme.primary.withAlpha(180),
                          fontWeight: 700),
                    ),
                    Text(
                      "${alert.departure} - ${alert.destination}",
                      style: AppTheme.getTextStyle(
                          AppTheme.theme.textTheme.bodyText1,
                          color: AppTheme.theme.colorScheme.onBackground,
                          letterSpacing: 0,
                          fontWeight: 600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${alert.wagonCount} vagon",
                      style: AppTheme.getTextStyle(
                          AppTheme.theme.textTheme.bodyText2,
                          color: AppTheme.theme.colorScheme.onBackground,
                          muted: true),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Icon(
              MdiIcons.chevronRight,
              color: AppTheme.theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
