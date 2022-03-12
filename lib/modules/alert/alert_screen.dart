import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/theme/new_app_theme.dart';
import 'package:yht_ticket/widgets/spacing.dart';
import 'package:yht_ticket/widgets/text.dart';

import 'alert_controller.dart';

class AlertScreen extends GetView<AlertController> {
  const AlertScreen({Key? key}) : super(key: key);

  static var theme = AppTheme.theme;
  static var customTheme = AppTheme.customTheme;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
          title: Column(
            children: [
              FxText.sh1(
                '${controller.alert.value?.departureStationName} - ${controller.alert.value?.destinationStationName}',
                fontWeight: 600,
              ),
              controller.alert.value != null
                  ? FxText.sh2(
                      DateFormat('dd MMMM EEEE, HH:mm', 'tr_TR')
                          .format(controller.alert.value!.startDate),
                      muted: true,
                      fontSize: 13,
                    )
                  : const SizedBox(),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: controller.onInfoButtonClicked,
              child: Icon(
                MdiIcons.information,
                color: theme.colorScheme.onBackground,
              ),
            ),
            FxSpacing.width(24),
          ],
        ),
        body: SnappingSheet(
          grabbingHeight: 52,
          snappingPositions: [
            const SnappingPosition.factor(
              positionFactor: 0.4,
              snappingCurve: Curves.elasticOut,
              snappingDuration: Duration(milliseconds: 500),
            ),
            const SnappingPosition.factor(
              positionFactor: 0.2,
              snappingCurve: Curves.elasticOut,
              snappingDuration: Duration(milliseconds: 500),
            ),
            const SnappingPosition.pixels(
              positionPixels: 26,
              snappingCurve: Curves.ease,
              snappingDuration: Duration(milliseconds: 600),
            ),
            SnappingPosition.pixels(
              positionPixels: Get.size.height - 56 - Get.statusBarHeight,
              snappingCurve: Curves.ease,
              snappingDuration: const Duration(milliseconds: 500),
            ),
          ],
          // RefreshIndicator(
          // onRefresh: () async {
          //   return controller.refreshAlert();
          // },
          // color: AppTheme.theme.primaryColor,
          // backgroundColor: AppTheme.customTheme.bgLayer1,
          child: _buildGridView(),
          sheetBelow: SnappingSheetContent(
            draggable: true,
            sizeBehavior: const SheetSizeFill(),
            child: _buildSheetBelow(),
          ),
          grabbing: _buildSheetHeader(),
        ),
      ),
    );
  }

  Widget _buildSheetHeader() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: customTheme.card,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          child: Row(
            children: [
              const FxText.sh1(
                'OLAYLAR',
                fontWeight: 600,
                xMuted: true,
              ),
              const Spacer(),
              InkWell(
                child: Icon(
                  Icons.delete,
                  color: theme.colorScheme.onBackground.withAlpha(120),
                ),
                onTap: () {
                  //_controller.logs.clear();
                },
              ),
            ],
          ),
        ),
        Positioned(
          top: -2,
          left: Get.width / 2 - 15,
          child: Icon(
            Icons.horizontal_rule_rounded,
            size: 30,
            color: theme.colorScheme.onBackground.withAlpha(120),
          ),
        ),
      ],
    );
  }

  Widget _buildSheetBelow() {
    return Container(
      color: customTheme.card,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: controller.alert.value?.notifications.isEmpty ?? true
          ? const ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              leading: Icon(Icons.info),
              title: FxText.b3(
                'Henüz yukarıdaki vagonlarda bir değişim olmadı. Koltuklarda bir değişim olduğunda burada göreceksiniz.',
                muted: true,
              ),
            )
          : ListView.builder(
              itemCount: controller.alert.value?.notifications.length,
              itemBuilder: (context, index) {
                final item = controller.alert.value!.notifications[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      item.newStatus == 0
                          ? Icon(Icons.event_seat, color: Colors.green.shade300)
                          : Icon(Icons.airline_seat_recline_normal,
                              color: item.newStatus == 1
                                  ? Colors.blue.shade300
                                  : Colors.pink.shade300),
                      const SizedBox(width: 8),
                      FxText.b2(
                        item.toString(),
                      ),
                      const Spacer(),
                      FxText.overline(
                        '${item.createdAt.hour.toString().padLeft(2, '0')}:${item.createdAt.minute.toString().padLeft(2, '0')}',
                        fontWeight: 500,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Container _buildGridView() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FxText.sh1(
            'BOŞ KOLTUKLAR',
            fontWeight: 600,
          ),
          const SizedBox(height: 16),
          controller.alert.value != null
              ? Expanded(
                  child: Wrap(
                    // crossAxisCount: 3,
                    // mainAxisSpacing: 8,
                    // crossAxisSpacing: 8,
                    //childAspectRatio: 1.2,
                    runSpacing: 8,
                    spacing: 8,

                    children: controller.alert.value!.scheduleWagons
                        .map((e) => _buildWagon(e))
                        .toList(),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _buildWagon(ScheduleWagon wagon) {
    var hasEmptySeats = (wagon.emptyCount ?? 0) > 0;
    return Container(
      width: ((Get.width - 32 - 16) / 3).floorToDouble(),
      //height: 30,
      decoration: BoxDecoration(
        color: hasEmptySeats ? theme.primaryColor : customTheme.card,
        borderRadius: BorderRadius.circular(12),
        border: hasEmptySeats
            ? null
            : Border.all(
                color: customTheme.borderDark,
              ),
      ),
      child: Column(
        children: [
          FxSpacing.height(10),
          FxText.h1(
            wagon.emptyCount.toString(),
            color: hasEmptySeats ? theme.colorScheme.onPrimary : null,
          ),
          //const Spacer(),
          FxText.caption(
            '${wagon.wagon}. Vagon',
            muted: true,
            color: hasEmptySeats ? theme.colorScheme.onPrimary : null,
          ),
          FxSpacing.height(10),
        ],
      ),
    );
  }
}
