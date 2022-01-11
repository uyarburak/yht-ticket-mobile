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
      () => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppTheme.customTheme.bgLayer1,
            centerTitle: true,
            leading: InkWell(
              onTap: Get.back,
              child: Icon(
                MdiIcons.chevronLeft,
                color: AppTheme.theme.colorScheme.onBackground,
              ),
            ),
            title: Text(
              '${controller.alert.value?.departureStationName} - ${controller.alert.value?.destinationStationName}',
              style: AppTheme.getTextStyle(AppTheme.theme.textTheme.headline6,
                  color: AppTheme.theme.colorScheme.onBackground,
                  fontWeight: 600),
            ),
            actions: [
              GestureDetector(
                  //onTap: controller.swapStations,
                  child: Icon(MdiIcons.swapHorizontal,
                      color: AppTheme.theme.primaryColor)),
              SizedBox(
                width: MySize.size24,
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              return controller.refreshAlert();
            },
            color: AppTheme.theme.primaryColor,
            backgroundColor: Colors.white,
            child: SnappingSheet(
              grabbingHeight: 86,
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
                  positionPixels: 42,
                  snappingCurve: Curves.ease,
                  snappingDuration: Duration(milliseconds: 600),
                ),
                SnappingPosition.pixels(
                  positionPixels: MediaQuery.of(context).size.height - 110,
                  snappingCurve: Curves.ease,
                  snappingDuration: const Duration(milliseconds: 500),
                ),
              ],
              child: _buildGridView(),
              sheetBelow: SnappingSheetContent(
                draggable: true,
                sizeBehavior: const SheetSizeFill(),
                child: _buildSheetBelow(),
              ),
              grabbing: _buildSheetHeader(),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildSheetHeader() {
    return Column(
      children: [
        const Icon(
          Icons.horizontal_rule_rounded,
          color: Colors.black26,
          size: 30,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          child: Row(
            children: [
              Text(
                'OLAYLAR',
                style: AppTheme.getTextStyle(AppTheme.theme.textTheme.subtitle1,
                    color: AppTheme.theme.colorScheme.secondary,
                    fontWeight: 600),
              ),
              const Spacer(),
              InkWell(
                child: const Icon(
                  Icons.delete,
                  color: Colors.black26,
                ),
                onTap: () {
                  //_controller.logs.clear();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Obx _buildSheetBelow() {
    return Obx(
      () => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: controller.alert.value?.notifications.isEmpty ?? true
            ? const ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                leading: Icon(Icons.info),
                title: Text(
                    'Henüz yukarıdaki vagonlarda bir değişim olmadı. Koltuklarda bir değişim olduğunda burada göreceksiniz.'),
              )
            : ListView.builder(
                itemCount: controller.alert.value?.notifications.length,
                itemBuilder: (context, index) {
                  final item = controller.alert.value!.notifications[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      children: [
                        item.newStatus == 0
                            ? Icon(Icons.event_seat,
                                color: Colors.green.shade300)
                            : Icon(Icons.airline_seat_recline_normal,
                                color: item.newStatus == 1
                                    ? Colors.blue.shade300
                                    : Colors.pink.shade300),
                        const SizedBox(width: 5),
                        Text(
                          item.toString(),
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${item.createdAt.hour.toString().padLeft(2, '0')}:${item.createdAt.minute.toString().padLeft(2, '0')}',
                          style: const TextStyle(
                            color: Colors.black38,
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

  Container _buildGridView() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BOŞ KOLTUKLAR',
            style: AppTheme.getTextStyle(AppTheme.theme.textTheme.subtitle1,
                color: AppTheme.theme.colorScheme.onBackground,
                fontWeight: 600),
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
        color: AppTheme.theme.primaryColorDark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            wagon.emptyCount.toString(),
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          //const Spacer(),
          Text(
            '${wagon.wagon}. Vagon',
            style: const TextStyle(
              color: Colors.white54,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
