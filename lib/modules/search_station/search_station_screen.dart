import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/theme/new_app_theme.dart';
import 'package:yht_ticket/theme/text_style.dart';
import 'package:yht_ticket/widgets/button.dart';
import 'package:yht_ticket/widgets/container.dart';
import 'package:yht_ticket/widgets/spacing.dart';
import 'package:yht_ticket/widgets/text.dart';

import 'search_station_controller.dart';

class SearchStationScreen extends GetView<SearchStationController> {
  SearchStationScreen({Key? key}) : super(key: key);

  final theme = AppTheme.theme;
  final customTheme = AppTheme.customTheme;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Column(
          children: [
            Container(
              padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
              margin: FxSpacing.x(24),
              child: TextFormField(
                controller: controller.searchQueryEditingController,
                style: FxTextStyle.b2(
                  letterSpacing: 0,
                  color: theme.colorScheme.onBackground,
                  fontWeight: 500,
                ),
                decoration: InputDecoration(
                  hintText: "İstasyon ara",
                  hintStyle: FxTextStyle.b2(
                    letterSpacing: 0,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: customTheme.card,
                  filled: true,
                  isDense: true,
                  prefixIcon: Icon(
                    MdiIcons.magnify,
                    size: 16,
                    color: theme.colorScheme.onBackground.withAlpha(220),
                  ),
                  suffixIcon: controller.clearable
                      ? InkWell(
                          onTap: controller.clearQuery,
                          child: Icon(
                            MdiIcons.close,
                            size: 16,
                            color:
                                theme.colorScheme.onBackground.withAlpha(220),
                          ),
                        )
                      : null,
                  icon: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      MdiIcons.chevronLeft,
                      size: 22,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.search,
                textCapitalization: TextCapitalization.sentences,
                onChanged: controller.setQuery,
              ),
            ),
            Expanded(
              child: ListView(
                padding: FxSpacing.top(16),
                children: [
                  controller.lastSearchedStations.isNotEmpty
                      ? Container(
                          margin: FxSpacing.x(24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const FxText.b2(
                                "Son aradıklarınız",
                                fontWeight: 700,
                                muted: true,
                              ),
                              InkWell(
                                onTap: controller.clearHistory,
                                child: FxText.b2(
                                  "Temizle",
                                  color: theme.colorScheme.primary,
                                  fontWeight: 600,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  controller.lastSearchedStations.isNotEmpty
                      ? Container(
                          margin: FxSpacing.fromLTRB(24, 12, 0, 32),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: controller.lastSearchedStations
                                  .map(
                                    (element) => Container(
                                      margin: element ==
                                              controller
                                                  .lastSearchedStations.first
                                          ? FxSpacing.zero
                                          : element ==
                                                  controller
                                                      .lastSearchedStations.last
                                              ? FxSpacing.fromLTRB(16, 0, 24, 0)
                                              : FxSpacing.left(16),
                                      child: searchRecentItem(
                                        name: element,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Container(
                    margin: FxSpacing.x(24),
                    child: FxText.b2(
                      controller.clearable ? "İstasyonlar" : 'YHT İstasyonları',
                      color: theme.colorScheme.onBackground,
                      fontWeight: 700,
                      muted: true,
                    ),
                  ),
                  Column(
                      children: controller.clearable
                          ? controller.filteredStations
                              .map((e) => searchResultItem(e.name))
                              .toList()
                          : controller.popularStations
                              .map((e) => searchResultItem(e))
                              .toList()),
                  FxSpacing.height(20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchResultItem(String stationName) {
    return Container(
      margin: FxSpacing.top(16),
      child: InkWell(
        onTap: () => controller.onStationPressed(stationName),
        child: Padding(
          padding: FxSpacing.x(24),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: theme.colorScheme.primary,
                radius: 20,
                child: FxText.b1(
                  stationName[0],
                  color: theme.colorScheme.onPrimary,
                  fontWeight: 600,
                ),
              ),
              Expanded(
                child: Container(
                  margin: FxSpacing.left(20),
                  child: FxText.b2(
                    stationName,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  MdiIcons.chevronRight,
                  color: theme.colorScheme.onBackground.withAlpha(100),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget searchRecentItem({required String name, bool isActive = false}) {
    return InkWell(
      onTap: () => controller.onStationPressed(name),
      onLongPress: () {
        // TODO make this dialog a seperate widget.
        Get.dialog(
          Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Container(
              padding: FxSpacing.all(20),
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: const [
                      Expanded(
                        child: Center(
                          child: FxText.h6("Geçmişten sil", fontWeight: 600),
                        ),
                      ),
                      Icon(Icons.history)
                    ],
                  ),
                  const Divider(),
                  Container(
                    margin: FxSpacing.only(top: 8),
                    child: RichText(
                      text: TextSpan(
                          style: FxTextStyle.sh2(
                              fontWeight: 600, letterSpacing: 0.2),
                          children: <TextSpan>[
                            const TextSpan(
                              text: "Geçmişinizden ",
                            ),
                            TextSpan(
                                text: name,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: theme.colorScheme.primary)),
                            const TextSpan(
                                text:
                                    " istasyonunu silmek istediğinizden emin misiniz?"),
                          ]),
                    ),
                  ),
                  Container(
                      margin: FxSpacing.top(24),
                      alignment: AlignmentDirectional.centerEnd,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          FxButton.text(
                              onPressed: () {
                                Get.back();
                              },
                              child: FxText.b2(
                                "Vazgeç",
                                fontWeight: 600,
                                color: theme.colorScheme.primary,
                              )),
                          FxButton(
                              backgroundColor: theme.colorScheme.primary,
                              borderRadiusAll: 4,
                              elevation: 0,
                              onPressed: () {
                                controller.onStationRemovedFromHistory(name);
                                Get.back();
                              },
                              child: FxText.b2("Sil",
                                  fontWeight: 600,
                                  color: theme.colorScheme.onPrimary)),
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
      },
      child: FxContainer(
        color: customTheme.card,
        bordered: true,
        border: Border.all(color: customTheme.border),
        borderRadiusAll: 4,
        padding: FxSpacing.fromLTRB(16, 8, 16, 8),
        child: FxText.b2(name, color: theme.colorScheme.onBackground),
      ),
    );
  }
}
/*
Widget _noResult() {
  return Container(
    color: AppTheme.yhtTheme.bgLayer1,
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            MdiIcons.emoticonSadOutline,
            size: 32,
            color: AppTheme.yhtTheme.onBgLayer1,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text("İstasyon bulunamadı",
                style: AppTheme.getTextStyle(AppTheme.theme.textTheme.subtitle1,
                    color: AppTheme.yhtTheme.onBgLayer1, fontWeight: 700)),
          ),
          Text("Doğru yazdığından emin misin?",
              style: AppTheme.getTextStyle(AppTheme.theme.textTheme.subtitle2,
                  color: AppTheme.yhtTheme.onBgLayer1Muted, fontWeight: 500)),
        ],
      ),
    ),
  );
}
*/