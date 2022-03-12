import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/theme/new_app_theme.dart';
import 'package:yht_ticket/widgets/button.dart';
import 'package:yht_ticket/widgets/spacing.dart';
import 'package:yht_ticket/widgets/text.dart';

class SearchScheduleBottomSheet extends StatefulWidget {
  const SearchScheduleBottomSheet({Key? key}) : super(key: key);

  @override
  State<SearchScheduleBottomSheet> createState() =>
      _SearchScheduleBottomSheetState();
}

class _SearchScheduleBottomSheetState extends State<SearchScheduleBottomSheet> {
  var theme = AppTheme.theme;
  var customTheme = AppTheme.customTheme;

  String? departureStation;
  String? destinationStation;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: theme.backgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FxText.sh1("Sefer Arama", fontWeight: 700),
              _buildSelectionInput(
                "Biniş İstasyonu",
                MdiIcons.locationExit,
                () async {
                  var station = await Get.toNamed(Routes.SEARCH_STATIONS);

                  if (station != null) {
                    setState(() {
                      departureStation = station as String;
                    });
                  }
                },
                departureStation,
              ),
              _buildSelectionInput(
                "İniş İstasyonu",
                MdiIcons.locationEnter,
                () async {
                  var station = await Get.toNamed(Routes.SEARCH_STATIONS);

                  if (station != null) {
                    setState(() {
                      destinationStation = station as String;
                    });
                  }
                },
                destinationStation,
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: FxButton.block(
                  elevation: 0,
                  borderRadiusAll: 4,
                  onPressed:
                      destinationStation != null && departureStation != null
                          ? () {
                              Get.toNamed(Routes.SCHEDULES, parameters: {
                                'departure': departureStation!,
                                'destination': destinationStation!,
                              });
                            }
                          : null,
                  child: FxText.b1(
                    "Sefer Ara",
                    fontWeight: 600,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionInput(
      String title, IconData iconData, VoidCallback onTap, String? value) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: FxSpacing.top(16),
        child: Column(
          children: <Widget>[
            Container(
              padding: FxSpacing.y(4),
              decoration: BoxDecoration(
                  color: customTheme.card,
                  border: Border.all(color: customTheme.cardDark, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Row(
                children: [
                  Container(
                    margin: FxSpacing.left(12),
                    padding: FxSpacing.vertical(12),
                    child: Icon(
                      iconData,
                      size: 20,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  const SizedBox(width: 12),
                  value != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.caption(
                              title,
                              muted: true,
                            ),
                            FxText.b1(value),
                          ],
                        )
                      : FxText.b1(
                          title,
                          muted: true,
                          fontWeight: 500,
                        ),
                  const Spacer(),
                  Icon(
                    MdiIcons.chevronDown,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                  FxSpacing.width(12),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
