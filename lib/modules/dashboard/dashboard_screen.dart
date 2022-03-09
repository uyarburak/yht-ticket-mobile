import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/new_app_theme.dart';
import 'package:yht_ticket/widgets/popular_destinations_gridview.dart';
import 'package:yht_ticket/widgets/spacing.dart';
import 'package:yht_ticket/widgets/text.dart';

import 'dashboard_controller.dart';
import 'widgets/active_alerts_widget.dart';
import 'widgets/notification_icon_button.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({Key? key}) : super(key: key);

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  Widget build(BuildContext context) {
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          return controller.refreshAlertsAndUnreadNotificationCount();
        },
        color: theme.primaryColor,
        backgroundColor: customTheme.card,
        child: Container(
          padding: FxSpacing.fromLTRB(20, 24, 20, 8),
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.b2(
                        DateFormat('EEEE, d MMMM yyyy', 'tr_TR')
                            .format(DateTime.now()),
                        fontWeight: 400,
                        letterSpacing: 0,
                      ),
                      FxText.h5(
                        "YHT Koltuk Alarmı",
                        fontWeight: 700,
                        letterSpacing: -0.3,
                      ),
                    ],
                  ),
                  Container(
                    padding: Spacing.all(10),
                    decoration: BoxDecoration(
                      color: customTheme.card,
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size8!)),
                    ),
                    child: NotificationIconButton(),
                  )
                ],
              ),
              FxSpacing.height(20),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.SEARCH_STATIONS);
                },
                child: Container(
                  padding: Spacing.vertical(4),
                  decoration: BoxDecoration(
                      color: customTheme.card,
                      border: Border.all(color: customTheme.cardDark, width: 1),
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size8!))),
                  child: Row(
                    children: [
                      Container(
                        margin: Spacing.left(12),
                        padding: Spacing.vertical(12),
                        child: Icon(
                          MdiIcons.magnify,
                          size: MySize.size20,
                          color: customTheme.disabledColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      FxText.b1(
                        "Tren seferi ara...",
                        muted: true,
                        fontWeight: 500,
                      ),
                    ],
                  ),
                ),
              ),
              FxSpacing.height(20),
              FxText.t3(
                "ALARMLARIM",
                fontWeight: 700,
                muted: true,
              ),
              ActiveAlertsWidget(),
              FxText.t3(
                "POPÜLER ŞEHİRLER",
                fontWeight: 700,
                muted: true,
              ),
              FxSpacing.height(20),
              const PopularDestinationsGridview(),
            ],
          ),
        ),
      ),
    );
    /*
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          return controller.refreshAlertsAndUnreadNotificationCount();
        },
        color: AppTheme.yhtTheme.primary,
        backgroundColor: AppTheme.yhtTheme.bgLayer2,
        child: Container(
          color: AppTheme.yhtTheme.bgLayer1,
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
                                color: AppTheme.yhtTheme.onBgLayer1),
                          ),
                          Text(
                            "YHT Koltuk Alarmı",
                            style: AppTheme.getTextStyle(
                                AppTheme.theme.textTheme.headline5,
                                fontSize: 24,
                                fontWeight: 700,
                                letterSpacing: -0.3,
                                color: AppTheme.yhtTheme.onBgLayer1),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: Spacing.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme.yhtTheme.bgLayer2,
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size8!)),
                      ),
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
                        color: AppTheme.yhtTheme.bgLayer2,
                        border: Border.all(
                            color: AppTheme.yhtTheme.bgLayer3, width: 1),
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size8!))),
                    child: Row(
                      children: [
                        Container(
                          margin: Spacing.left(12),
                          padding: Spacing.vertical(12),
                          child: Icon(
                            MdiIcons.magnify,
                            color: AppTheme.yhtTheme.onBgLayer2Muted,
                            size: MySize.size20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Tren seferi ara...",
                          style: AppTheme.getTextStyle(
                              AppTheme.theme.textTheme.bodyText1,
                              color: AppTheme.yhtTheme.onBgLayer2Muted,
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
                      color: AppTheme.yhtTheme.onBgLayer1,
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
                      color: AppTheme.yhtTheme.onBgLayer1,
                      fontWeight: 600),
                ),
              ),
              const PopularDestinationsGridview()
            ],
          ),
        ),
      ),
    );
    */
  }
}
