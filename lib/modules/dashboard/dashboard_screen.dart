import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';
import 'package:yht_ticket/widgets/popular_destinations_gridview.dart';

import 'dashboard_controller.dart';
import 'widgets/active_alerts_widget.dart';
import 'widgets/notification_icon_button.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          return controller.refreshAlertsAndUnreadNotificationCount();
        },
        color: AppTheme.theme.primaryColor,
        backgroundColor: Colors.white,
        child: Container(
          color: AppTheme.customTheme.bgLayer1,
          child: ListView(
            padding: Spacing.top(48),
            children: <Widget>[
              Container(
                margin: Spacing.fromLTRB(24, 0, 24, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('EEEE, d MMMM yyyy', 'tr_TR')
                                .format(DateTime.now()),
                            style: AppTheme.getTextStyle(
                                AppTheme.theme.textTheme.bodyText2,
                                fontWeight: 400,
                                letterSpacing: 0,
                                color: AppTheme.theme.colorScheme.onBackground),
                          ),
                          Text(
                            "YHT Koltuk Alarmı",
                            style: AppTheme.getTextStyle(
                                AppTheme.theme.textTheme.headline5,
                                fontSize: 24,
                                fontWeight: 700,
                                letterSpacing: -0.3,
                                color: AppTheme.theme.colorScheme.onBackground),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: Spacing.all(10),
                      decoration: BoxDecoration(
                          color: AppTheme.customTheme.bgLayer2,
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size8!)),
                          boxShadow: [
                            BoxShadow(
                                color: AppTheme.customTheme.shadowColor,
                                blurRadius: MySize.size4!)
                          ]),
                      child: NotificationIconButton(),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.SEARCH_STATIONS);
                },
                child: Container(
                  margin: Spacing.fromLTRB(24, 24, 24, 0),
                  child: Container(
                    padding: Spacing.vertical(4),
                    decoration: BoxDecoration(
                        color: AppTheme.customTheme.bgLayer2,
                        border: Border.all(
                            color: AppTheme.customTheme.bgLayer3, width: 1),
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size8!))),
                    child: Row(
                      children: [
                        Container(
                          margin: Spacing.left(12),
                          padding: Spacing.vertical(12),
                          child: Icon(
                            MdiIcons.magnify,
                            color: AppTheme.theme.colorScheme.onBackground
                                .withAlpha(200),
                            size: MySize.size20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Tren seferi ara...",
                          style: AppTheme.getTextStyle(
                              AppTheme.theme.textTheme.bodyText1,
                              color: AppTheme.theme.colorScheme.onBackground,
                              muted: true,
                              fontWeight: 500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: Spacing.fromLTRB(24, 36, 0, 0),
                child: Text(
                  "Alarmlarım",
                  style: AppTheme.getTextStyle(
                      AppTheme.theme.textTheme.subtitle1,
                      color: AppTheme.theme.colorScheme.onBackground,
                      fontWeight: 600),
                ),
              ),
              ActiveAlertsWidget(),
              Container(
                margin: Spacing.fromLTRB(24, 36, 0, 0),
                child: Text(
                  "Popüler Seferler",
                  style: AppTheme.getTextStyle(
                      AppTheme.theme.textTheme.subtitle1,
                      color: AppTheme.theme.colorScheme.onBackground,
                      fontWeight: 600),
                ),
              ),
              const PopularDestinationsGridview()
            ],
          ),
        ),
      ),
    );
  }
}
