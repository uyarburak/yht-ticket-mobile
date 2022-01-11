import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';

import '../dashboard_controller.dart';

class NotificationIconButton extends StatelessWidget {
  NotificationIconButton({Key? key}) : super(key: key);

  final DashboardController _dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.NOTIFICATIONS);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Icon(
            MdiIcons.bell,
            color: AppTheme.theme.colorScheme.onBackground.withAlpha(200),
          ),
          Obx(
            () => _dashboardController.unreadNotificationCount > 0
                ? Positioned(
                    right: -6,
                    top: -6,
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      height: MySize.size18,
                      width: MySize.size18,
                      decoration: BoxDecoration(
                          color: AppTheme.theme.colorScheme.primary,
                          borderRadius: BorderRadius.all(
                              Radius.circular(MySize.size40!))),
                      child: Center(
                        child: Text(
                          _dashboardController.unreadNotificationCount
                              .toString(),
                          style: AppTheme.getTextStyle(
                            AppTheme.theme.textTheme.overline,
                            color: AppTheme.theme.colorScheme.onPrimary,
                            fontSize: 10,
                            fontWeight: 500,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 0,
                  ),
          ),
        ],
      ),
    );
  }
}
