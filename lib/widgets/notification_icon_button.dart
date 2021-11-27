import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/services/notification_service.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';

class NotificationIconButton extends GetView<NotificationService> {
  const NotificationIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.rootDelegate.toNamed(Routes.NOTIFICATIONS);
        // Navigator.of(context).push(new MaterialPageRoute<Null>(
        //     builder: (BuildContext context) {
        //       return CourseNotificationScreen();
        //     },
        //     fullscreenDialog: true));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Icon(
            MdiIcons.bellOutline,
            color: AppTheme.theme.colorScheme.onBackground.withAlpha(200),
          ),
          Obx(
            () => controller.unreadNotificationCount > 0
                ? Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      height: MySize.size14,
                      width: MySize.size14,
                      decoration: BoxDecoration(
                          color: AppTheme.theme.colorScheme.primary,
                          borderRadius: BorderRadius.all(
                              Radius.circular(MySize.size40!))),
                      child: Center(
                        child: Text(
                          controller.unreadNotificationCount.toString(),
                          style: AppTheme.getTextStyle(
                            AppTheme.theme.textTheme.overline,
                            color: AppTheme.theme.colorScheme.onPrimary,
                            fontSize: 9,
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
