import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/new_app_theme.dart';
import 'package:yht_ticket/theme/text_style.dart';
import 'package:yht_ticket/widgets/spacing.dart';
import 'package:yht_ticket/widgets/text.dart';

import 'schedules_controller.dart';

class SchedulesScreen extends GetView<SchedulesController> {
  SchedulesScreen({Key? key}) : super(key: key);

  final theme = AppTheme.theme;
  final customTheme = AppTheme.customTheme;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
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
            title: FxText.sh1(
                '${controller.departure} - ${controller.destination}',
                fontWeight: 600),
            actions: [
              GestureDetector(
                onTap: controller.swapStations,
                child: const Icon(MdiIcons.swapHorizontal),
              ),
              FxSpacing.width(24),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: Spacing.fromLTRB(24, 8, 24, 0),
                  children: [
                    Container(
                      margin: FxSpacing.top(12),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ...controller.days
                                .map(
                                  (date) => singleDateWidget(date),
                                )
                                .toList(),
                            _buildDateSelector(),
                          ]),
                    ),
                    Container(
                      margin: Spacing.top(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const FxText.caption(
                            "SEFERLER",
                            fontWeight: 700,
                            muted: true,
                          ),
                          FxText.caption(
                            DateFormat('d MMMM EEEE', 'tr_TR')
                                .format(controller.selectedDate.value),
                            muted: true,
                            fontWeight: 500,
                          ),
                        ],
                      ),
                    ),
                    _buildSchedules(),
                  ],
                ),
              ),
              controller.selectedSchedules.isNotEmpty
                  ? Container(
                      color: customTheme.card,
                      margin: FxSpacing.top(4),
                      padding: FxSpacing.xy(24, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: controller.selectedSchedules.length
                                      .toString(),
                                  style: FxTextStyle.b1(
                                    fontWeight: 800,
                                    letterSpacing: 1,
                                    color: theme.primaryColor,
                                  ),
                                ),
                                TextSpan(
                                  text: " sefer seçildi",
                                  style: FxTextStyle.caption(
                                    fontWeight: 600,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: controller.createAlerts,
                            child: Container(
                              padding: Spacing.all(8),
                              decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size40!))),
                              child: Row(
                                children: [
                                  Container(
                                    margin: Spacing.left(12),
                                    child: FxText.caption(
                                      "TAMAM".toUpperCase(),
                                      fontSize: 12,
                                      letterSpacing: 0.7,
                                      color: theme.colorScheme.onPrimary,
                                      fontWeight: 600,
                                    ),
                                  ),
                                  Container(
                                    margin: Spacing.left(16),
                                    padding: Spacing.all(4),
                                    decoration: BoxDecoration(
                                        color: theme.colorScheme.onPrimary,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      MdiIcons.chevronRight,
                                      size: MySize.size20,
                                      color: theme.colorScheme.primary,
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
                      color: customTheme.card,
                      margin: FxSpacing.top(4),
                      padding: FxSpacing.xy(24, 16),
                      child: Row(
                        children: [
                          const Icon(
                            MdiIcons.information,
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: FxText.caption(
                              "Sefer seçiniz",
                              fontWeight: 600,
                              letterSpacing: 0,
                              muted: true,
                            ),
                          ),
                          Container(
                            padding: Spacing.all(8),
                            decoration: BoxDecoration(
                                color: customTheme.cardDark,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size40!))),
                            child: Row(
                              children: [
                                Container(
                                  margin: Spacing.left(12),
                                  child: FxText.caption(
                                    "TAMAM".toUpperCase(),
                                    fontSize: 12,
                                    letterSpacing: 0.7,
                                    muted: true,
                                    fontWeight: 600,
                                  ),
                                ),
                                Container(
                                  margin: Spacing.left(16),
                                  padding: Spacing.all(4),
                                  decoration: BoxDecoration(
                                      color: customTheme.card,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    MdiIcons.chevronRight,
                                    size: MySize.size20,
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
    );
  }

  Widget singleDateWidget(DateTime date) {
    if (controller.selectedDate.value == date) {
      return Container(
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MySize.size6!)),
          color: theme.primaryColor,
        ),
        padding: Spacing.fromLTRB(0, 8, 0, 14),
        child: Column(
          children: [
            FxText.caption(
              DateFormat('dd\nE', 'tr-TR').format(date),
              fontWeight: 600,
              color: theme.colorScheme.onPrimary,
              height: 1.9,
              textAlign: TextAlign.center,
            ),
            Container(
              margin: Spacing.top(12),
              height: MySize.size8,
              width: MySize.size8,
              decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimary, shape: BoxShape.circle),
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
          color: customTheme.card,
        ),
        padding: Spacing.fromLTRB(0, 8, 0, 14),
        child: FxText.caption(
          DateFormat('dd\nE', 'tr-TR').format(date),
          fontWeight: 600,
          height: 1.9,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return InkWell(
      onTap: () async {
        var date = await showDatePicker(
          context: Get.context!,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 60),
          ),
        );

        if (date != null) controller.setSelectedDate(date);
      },
      child: Container(
        width: 50,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MySize.size6!)),
          color: customTheme.card,
        ),
        padding: Spacing.fromLTRB(0, 8, 0, 14),
        child: const Icon(MdiIcons.calendar),
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
          color: customTheme.card,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size16!)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              "assets/lotties/89719-electric-train-animation.json",
              width: 200,
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24!),
              child: const FxText.sh1(
                "Sefer bulunamadı :(",
                fontWeight: 600,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      margin: Spacing.top(16),
      decoration: BoxDecoration(
        color: customTheme.card,
        borderRadius: BorderRadius.all(Radius.circular(MySize.size16!)),
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
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => theme.primaryColor),
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
                      leading: const Icon(
                        MdiIcons.train,
                      ),
                      title: FxText.b2(
                        e.name,
                      ),
                      subtitle: FxText.b2(
                        '${e.price.toStringAsFixed(2)} TL (${e.wagons.length} vagon)',
                        muted: true,
                      ),
                    ))
                .toList();
          }
          return Column(
            children: [
              i > 0
                  ? const Divider(
                      height: 0.3,
                    )
                  : const SizedBox(),
              CheckboxListTile(
                value: item.selected,
                // activeColor: MaterialStateColor.resolveWith(
                //     (states) => theme.colorScheme.secondary),
                onChanged: (value) {
                  item.selected = value!;
                  for (var element in item.wagonTypes) {
                    element.selected = value;
                  }
                  controller.schedules.value = controller.schedules.toList();
                },
                title: FxText.b1(
                  "${DateFormat.Hm().format(item.startDate)} - ${DateFormat.Hm().format(item.endDate)}",
                  fontWeight: 600,
                ),
                subtitle: FxText.b2(
                  sDuration,
                  muted: true,
                ),
              ),
              ...wagons,
            ],
          );
        }).toList(),
      ),
    );
  }
}
