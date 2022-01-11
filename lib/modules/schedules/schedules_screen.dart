import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/modules/schedules/schedules_controller.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';

class SchedulesScreen extends GetView<SchedulesController> {
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
              '${controller.departure} - ${controller.destination}',
              style: AppTheme.getTextStyle(AppTheme.theme.textTheme.headline6,
                  color: AppTheme.theme.colorScheme.onBackground,
                  fontWeight: 600),
            ),
            actions: [
              GestureDetector(
                  onTap: controller.swapStations,
                  child: Icon(MdiIcons.swapHorizontal,
                      color: AppTheme.theme.primaryColor)),
              SizedBox(
                width: MySize.size24,
              ),
            ],
          ),
          body: Container(
            color: AppTheme.customTheme.bgLayer2,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: Spacing.fromLTRB(24, 8, 24, 0),
                    children: [
                      Container(
                        margin: Spacing.top(12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: controller.days
                                .map(
                                  (date) => singleDateWidget(date),
                                )
                                .toList()),
                      ),
                      Container(
                        margin: Spacing.top(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SEFERLER",
                              style: AppTheme.getTextStyle(
                                  AppTheme.theme.textTheme.caption,
                                  color:
                                      AppTheme.theme.colorScheme.onBackground,
                                  muted: true,
                                  fontWeight: 700),
                            ),
                            Text(
                              DateFormat('d MMMM EEEE', 'tr_TR')
                                  .format(controller.selectedDate.value),
                              style: AppTheme.getTextStyle(
                                  AppTheme.theme.textTheme.caption,
                                  color:
                                      AppTheme.theme.colorScheme.onBackground,
                                  muted: true,
                                  fontWeight: 500),
                            ),
                          ],
                        ),
                      ),
                      _buildSchedules(),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                controller.selectedSchedules.isNotEmpty
                    ? Container(
                        color: AppTheme.customTheme.bgLayer1,
                        padding: Spacing.fromLTRB(24, 16, 24, 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: controller.selectedSchedules.length
                                        .toString(),
                                    style: AppTheme.getTextStyle(
                                        AppTheme.theme.textTheme.bodyText1,
                                        fontWeight: 700,
                                        letterSpacing: 0,
                                        color: AppTheme
                                            .theme.colorScheme.primary)),
                                TextSpan(
                                    text: " sefer seçildi",
                                    style: AppTheme.getTextStyle(
                                      AppTheme.theme.textTheme.caption,
                                      fontWeight: 600,
                                      letterSpacing: 0,
                                      color: AppTheme
                                          .theme.colorScheme.onBackground,
                                    )),
                              ]),
                            ),
                            InkWell(
                              onTap: controller.createAlerts,
                              child: Container(
                                padding: Spacing.fromLTRB(8, 8, 8, 8),
                                decoration: BoxDecoration(
                                    color: AppTheme.theme.colorScheme.primary,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size40!))),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: Spacing.left(12),
                                      child: Text(
                                        "TAMAM".toUpperCase(),
                                        style: AppTheme.getTextStyle(
                                            AppTheme.theme.textTheme.caption,
                                            fontSize: 12,
                                            letterSpacing: 0.7,
                                            color: AppTheme
                                                .theme.colorScheme.onPrimary,
                                            fontWeight: 600),
                                      ),
                                    ),
                                    Container(
                                      margin: Spacing.left(16),
                                      padding: Spacing.all(4),
                                      decoration: BoxDecoration(
                                          color: AppTheme
                                              .theme.colorScheme.onPrimary,
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        MdiIcons.chevronRight,
                                        size: MySize.size20,
                                        color:
                                            AppTheme.theme.colorScheme.primary,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(
                        color: AppTheme.customTheme.bgLayer1,
                        padding: Spacing.fromLTRB(24, 16, 24, 16),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.information,
                              color: AppTheme.theme.colorScheme.onBackground,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Sefer seçiniz",
                                style: AppTheme.getTextStyle(
                                  AppTheme.theme.textTheme.caption,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                  color:
                                      AppTheme.theme.colorScheme.onBackground,
                                ),
                              ),
                            ),
                            Container(
                              padding: Spacing.fromLTRB(8, 8, 8, 8),
                              decoration: BoxDecoration(
                                  color: AppTheme.theme.colorScheme.onBackground
                                      .withAlpha(160),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size40!))),
                              child: Row(
                                children: [
                                  Container(
                                    margin: Spacing.left(12),
                                    child: Text(
                                      "TAMAM".toUpperCase(),
                                      style: AppTheme.getTextStyle(
                                          AppTheme.theme.textTheme.caption,
                                          fontSize: 12,
                                          letterSpacing: 0.7,
                                          color: AppTheme
                                              .theme.colorScheme.onPrimary,
                                          fontWeight: 600),
                                    ),
                                  ),
                                  Container(
                                    margin: Spacing.left(16),
                                    padding: Spacing.all(4),
                                    decoration: BoxDecoration(
                                        color: AppTheme
                                            .theme.colorScheme.onPrimary,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      MdiIcons.chevronRight,
                                      size: MySize.size20,
                                      color: AppTheme
                                          .theme.colorScheme.onBackground
                                          .withAlpha(160),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget singleDateWidget(DateTime date) {
    if (controller.selectedDate.value == date) {
      return Container(
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MySize.size6!)),
          color: AppTheme.theme.colorScheme.primary,
        ),
        padding: Spacing.fromLTRB(0, 8, 0, 14),
        child: Column(
          children: [
            Text(
              DateFormat('dd\nE', 'tr-TR').format(date),
              style: AppTheme.getTextStyle(AppTheme.theme.textTheme.caption,
                  fontWeight: 600,
                  color: AppTheme.theme.colorScheme.onPrimary,
                  height: 1.9),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: Spacing.top(12),
              height: MySize.size8,
              width: MySize.size8,
              decoration: BoxDecoration(
                  color: AppTheme.theme.colorScheme.onPrimary,
                  shape: BoxShape.circle),
            )
          ],
        ),
      );
    }
    return InkWell(
      onTap: () {
        controller.setSelectedDate(date);
      },
      child: Container(
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size6!)),
            color: AppTheme.customTheme.bgLayer1,
            boxShadow: [
              BoxShadow(
                color: AppTheme.customTheme.shadowColor,
                blurRadius: MySize.size10!,
                spreadRadius: MySize.size2,
                offset: Offset(0, MySize.size8!),
              )
            ]),
        padding: Spacing.fromLTRB(0, 8, 0, 14),
        child: Column(
          children: [
            Text(
              DateFormat('dd\nE', 'tr-TR').format(date),
              style: AppTheme.getTextStyle(AppTheme.theme.textTheme.caption,
                  fontWeight: 600,
                  color: AppTheme.theme.colorScheme.onBackground,
                  height: 1.9),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSchedules() {
    if (controller.loading.isTrue) {
      return const Center(child: CircularProgressIndicator());
    }
    if (controller.schedules.isEmpty) {
      return Container(
        margin: Spacing.top(16),
        padding: Spacing.vertical(16),
        decoration: BoxDecoration(
          color: AppTheme.theme.cardTheme.color,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size16!)),
          boxShadow: [
            BoxShadow(
              color: AppTheme.theme.cardTheme.shadowColor!.withAlpha(28),
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset("assets/lotties/89719-electric-train-animation.json",
                width: 200),
            Container(
              margin: EdgeInsets.only(top: MySize.size24!),
              child: Text(
                "Sefer bulunamadı :(",
                style: AppTheme.getTextStyle(AppTheme.theme.textTheme.subtitle1,
                    color: AppTheme.theme.colorScheme.onBackground,
                    fontWeight: 600,
                    letterSpacing: 0),
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      margin: Spacing.top(16),
      decoration: BoxDecoration(
        color: AppTheme.theme.cardTheme.color,
        borderRadius: BorderRadius.all(Radius.circular(MySize.size16!)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.theme.cardTheme.shadowColor!.withAlpha(28),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: controller.schedules.asMap().keys.map((i) {
          var item = controller.schedules[i];
          var duration = item.endDate.difference(item.startDate);
          String sDuration;
          if (duration.inHours < 1) {
            sDuration = "${duration.inMinutes} dakika";
          } else if (duration.inMinutes.remainder(60) == 0) {
            sDuration = "${duration.inHours} saat";
          } else {
            sDuration =
                "${duration.inHours} saat ${duration.inMinutes.remainder(60)} dakika";
          }
          var wagons = [];
          if (item.selected) {
            wagons = item.wagonTypes
                .map((e) => ListTile(
                      trailing: Checkbox(
                        value: e.selected,
                        onChanged: (value) {
                          e.selected = value!;
                          if (item.wagonTypes.every(
                              (element) => element.selected == e.selected)) {
                            item.selected = e.selected;
                          }
                          controller.schedules.value =
                              controller.schedules.toList();
                        },
                      ),
                      horizontalTitleGap: 0,
                      contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      dense: true,
                      leading: const Icon(MdiIcons.train),
                      title: Text(e.name,
                          style: AppTheme.getTextStyle(
                              AppTheme.theme.textTheme.bodyText2,
                              color: AppTheme.theme.colorScheme.onBackground)),
                      subtitle: Text(
                          '${e.price.toStringAsFixed(2)} TL (${e.wagons.length} vagon)',
                          style: AppTheme.getTextStyle(
                              AppTheme.theme.textTheme.bodyText2,
                              color: AppTheme.theme.colorScheme.onBackground)),
                    ))
                .toList();
          }
          return Column(
            children: [
              i > 0 ? const Divider(height: 0.3) : const SizedBox(),
              CheckboxListTile(
                value: item.selected,
                onChanged: (value) {
                  item.selected = value!;
                  for (var element in item.wagonTypes) {
                    element.selected = value;
                  }
                  controller.schedules.value = controller.schedules.toList();
                },
                title: Text(
                    "${DateFormat.Hm().format(item.startDate)} - ${DateFormat.Hm().format(item.endDate)}",
                    style: AppTheme.getTextStyle(
                        AppTheme.theme.textTheme.bodyText1,
                        color: AppTheme.theme.colorScheme.onBackground)),
                subtitle: Text(sDuration,
                    style: AppTheme.getTextStyle(
                        AppTheme.theme.textTheme.bodyText2,
                        color: AppTheme.theme.colorScheme.onBackground)),
              ),
              ...wagons,
            ],
          );
        }).toList(),
      ),
    );
  }
}
