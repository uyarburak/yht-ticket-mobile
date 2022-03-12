import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            FxSpacing.height(24),
            Padding(
              padding: FxSpacing.x(20),
              child: Row(
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
            ),
            FxSpacing.height(20),
            InkWell(
              onTap: controller.onClickSearchScheduleButton,
              child: Container(
                padding: FxSpacing.y(4),
                margin: FxSpacing.x(20),
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
            Padding(
              padding: FxSpacing.x(20),
              child: FxText.t3(
                "ALARMLARIM",
                fontWeight: 700,
                muted: true,
              ),
            ),
            ActiveAlertsWidget(),
            Padding(
              padding: FxSpacing.x(20),
              child: FxText.t3(
                "POPÜLER ŞEHİRLER",
                fontWeight: 700,
                muted: true,
              ),
            ),
            FxSpacing.height(20),
            Padding(
              padding: FxSpacing.x(20),
              child: const PopularDestinationsGridview(),
            ),
          ],
        ),
      ),
    );
  }
}
