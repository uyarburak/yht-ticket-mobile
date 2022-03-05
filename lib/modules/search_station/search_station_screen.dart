import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/services/station_service.dart';
import 'package:yht_ticket/theme/theme_data.dart';

import 'search_station_controller.dart';

class SearchStationScreen extends GetView<SearchStationController> {
  const SearchStationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                color: AppTheme.yhtTheme.bgLayer2,
                padding: const EdgeInsets.only(
                    left: 12.0, top: 8, right: 12, bottom: 8),
                child: Row(
                  children: [
                    InkWell(
                      onTap: Get.back,
                      child: Icon(
                        MdiIcons.chevronLeft,
                        size: 24,
                        color: AppTheme.yhtTheme.onBgLayer2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 8),
                        child: TextField(
                          style: AppTheme.getTextStyle(
                            AppTheme.theme.textTheme.bodyText1,
                            color: AppTheme.yhtTheme.onBgLayer2,
                            decoration: TextDecoration.none,
                          ),
                          controller: controller.searchQueryEditingController,
                          decoration: InputDecoration(
                            hintText: "Gar ismi ara",
                            hintStyle: AppTheme.getTextStyle(
                              AppTheme.theme.textTheme.bodyText1,
                              color: AppTheme.yhtTheme.onBgLayer2Muted,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            isDense: true,
                            suffixIcon: Obx(
                              () => controller.clearable
                                  ? InkWell(
                                      onTap: controller.clearQuery,
                                      child: Icon(
                                        MdiIcons.close,
                                        size: 24,
                                        color:
                                            AppTheme.yhtTheme.onBgLayer2Muted,
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                            suffixIconConstraints: const BoxConstraints(
                              minHeight: 16,
                              minWidth: 16,
                            ),
                          ),
                          autofocus: true,
                          maxLines: 1,
                          textInputAction: TextInputAction.search,
                          textCapitalization: TextCapitalization.sentences,
                          //onSubmitted: _onSubmit,
                          onChanged: controller.setQuery,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: AppTheme.yhtTheme.bgLayer1,
                  child: _buildStationList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStationList() {
    final stations = StationService.to.stations
        .where((element) =>
            element.nameLower.contains(controller.searchQueryLower.value))
        .toList();
    if (stations.isEmpty) return _noResult();
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index % 2 == 1) {
          return Divider(height: 0, color: AppTheme.yhtTheme.bgLayer3);
        }
        var item = stations[index ~/ 2];
        return ListTile(
          onTap: () {
            //controller.clearQuery();
            Get.back(result: item);
          },
          leading: CircleAvatar(
            radius: 16,
            backgroundColor: AppTheme.yhtTheme.primary,
            child: Text(
              item.name[0],
              style: AppTheme.getTextStyle(
                AppTheme.theme.textTheme.bodyText1,
                color: AppTheme.yhtTheme.onPrimary,
              ),
            ),
          ),
          title: Text(
            item.name,
            style: AppTheme.getTextStyle(
              AppTheme.theme.textTheme.bodyText1,
              color: AppTheme.yhtTheme.onBgLayer1Muted,
            ),
          ),
        );
      },
      itemCount: stations.length * 2 - 1,
    );
  }
}

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
