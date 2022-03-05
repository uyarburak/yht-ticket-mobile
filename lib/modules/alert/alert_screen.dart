import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';

import 'alert_controller.dart';

class AlertScreen extends GetView<AlertController> {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppTheme.yhtTheme.bgLayer2,
          centerTitle: true,
          leading: InkWell(
            onTap: Get.back,
            child: Icon(
              MdiIcons.chevronLeft,
              color: AppTheme.yhtTheme.onBgLayer1,
            ),
          ),
          title: Text(
            '${controller.alert.value?.departureStationName} - ${controller.alert.value?.destinationStationName}',
            style: AppTheme.getTextStyle(
              AppTheme.theme.textTheme.headline6,
              color: AppTheme.yhtTheme.onBgLayer1,
              fontWeight: 600,
            ),
          ),
          actions: [
            GestureDetector(
              //onTap: controller.swapStations,
              child: Icon(
                MdiIcons.information,
                color: AppTheme.yhtTheme.onBgLayer1Muted,
              ),
            ),
            SizedBox(
              width: MySize.size24,
            ),
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
              positionPixels: MediaQuery.of(context).size.height - 110,
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
            color: AppTheme.yhtTheme.bgLayer3,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          child: Row(
            children: [
              Text(
                'OLAYLAR',
                style: AppTheme.getTextStyle(
                  AppTheme.theme.textTheme.subtitle1,
                  color: AppTheme.yhtTheme.onBgLayer3Muted,
                  fontWeight: 600,
                ),
              ),
              const Spacer(),
              InkWell(
                child: Icon(
                  Icons.delete,
                  color: AppTheme.yhtTheme.onBgLayer3Muted,
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
          left: Get.width / 2 - 16,
          child: Icon(
            Icons.horizontal_rule_rounded,
            color: AppTheme.yhtTheme.onBgLayer3Muted,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget _buildSheetBelow() {
    return Container(
      color: AppTheme.yhtTheme.bgLayer3,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: controller.alert.value?.notifications.isEmpty ?? true
          ? ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              leading: Icon(
                Icons.info,
                color: AppTheme.yhtTheme.onBgLayer3Muted,
              ),
              title: Text(
                'Henüz yukarıdaki vagonlarda bir değişim olmadı. Koltuklarda bir değişim olduğunda burada göreceksiniz.',
                style: TextStyle(
                  color: AppTheme.yhtTheme.onBgLayer3Muted,
                ),
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
                      Text(
                        item.toString(),
                        style: TextStyle(
                          color: AppTheme.yhtTheme.onBgLayer3,
                          fontSize: 15,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${item.createdAt.hour.toString().padLeft(2, '0')}:${item.createdAt.minute.toString().padLeft(2, '0')}',
                        style: AppTheme.getTextStyle(
                          AppTheme.theme.textTheme.overline,
                          color: AppTheme.yhtTheme.onBgLayer3Muted,
                          fontWeight: 500,
                        ),
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
      color: AppTheme.yhtTheme.bgLayer1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BOŞ KOLTUKLAR',
            style: AppTheme.getTextStyle(
              AppTheme.theme.textTheme.subtitle1,
              color: AppTheme.yhtTheme.onBgLayer1,
              fontWeight: 600,
            ),
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
    return Container(
      width: ((Get.width - 32 - 16) / 3).floorToDouble(),
      //height: 30,
      decoration: BoxDecoration(
        color: AppTheme.yhtTheme.bgLayer2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            wagon.emptyCount.toString(),
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppTheme.yhtTheme.onBgLayer2,
            ),
          ),
          //const Spacer(),
          Text(
            '${wagon.wagon}. Vagon',
            style: TextStyle(
              color: AppTheme.yhtTheme.onBgLayer2Muted,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
