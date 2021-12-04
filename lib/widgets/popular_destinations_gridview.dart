import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/utils/common_widget.dart';

import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';

class PopularDestinationsGridview extends StatelessWidget {
  const PopularDestinationsGridview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Spacing.fromLTRB(24, 12, 24, 12),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 16,
        runSpacing: 16,
        children: [
          _buildDestination(
            PopularDestination(
              title: 'Ankara-İstanbul',
              image: 'assets/images/istanbul-kare.jpg',
              schedules: [
                ScheduleInfo(title: 'Ankara Gar - İstanbul(Bakırköy)'),
                ScheduleInfo(title: 'Ankara Gar - İstanbul(Bostancı)'),
                ScheduleInfo(title: 'Ankara Gar - İstanbul(Halkalı)'),
                ScheduleInfo(title: 'Ankara Gar - İstanbul(Pendik)'),
                ScheduleInfo(title: 'Ankara Gar - İstanbul(Söğütlü Ç.)'),
                ScheduleInfo(title: 'Eryaman YHT - İstanbul(Bakırköy)'),
                ScheduleInfo(title: 'Eryaman YHT - İstanbul(Bostancı)'),
                ScheduleInfo(title: 'Eryaman YHT - İstanbul(Halkalı)'),
                ScheduleInfo(title: 'Eryaman YHT - İstanbul(Pendik)'),
                ScheduleInfo(title: 'Eryaman YHT - İstanbul(Söğütlü Ç.)'),
              ],
            ),
          ),
          _buildDestination(
            PopularDestination(
              title: 'Ankara-Eskişehir',
              image: 'assets/images/eskisehir-kare.jpg',
              schedules: [
                ScheduleInfo(title: 'Ankara Gar - Eskişehir'),
                ScheduleInfo(title: 'Eryaman YHT - Eskişehir'),
              ],
            ),
          ),
          _buildDestination(
              PopularDestination(
                title: 'İstanbul-Ankara',
                image: 'assets/images/ankara-yatay.jpg',
                schedules: [
                  ScheduleInfo(title: 'İstanbul(Bakırköy) - Ankara Gar'),
                  ScheduleInfo(title: 'İstanbul(Bostancı) - Ankara Gar'),
                  ScheduleInfo(title: 'İstanbul(Halkalı) - Ankara Gar'),
                  ScheduleInfo(title: 'İstanbul(Pendik) - Ankara Gar'),
                  ScheduleInfo(title: 'İstanbul(Söğütlü Ç.) - Ankara Gar'),
                  ScheduleInfo(title: 'İstanbul(Bakırköy) - Eryaman YHT'),
                  ScheduleInfo(title: 'İstanbul(Bostancı) - Eryaman YHT'),
                  ScheduleInfo(title: 'İstanbul(Halkalı) - Eryaman YHT'),
                  ScheduleInfo(title: 'İstanbul(Pendik) - Eryaman YHT'),
                  ScheduleInfo(title: 'İstanbul(Söğütlü Ç.) - Eryaman YHT'),
                ],
              ),
              1),
          _buildDestination(
            PopularDestination(
              title: 'İstanbul-Konya',
              image: 'assets/images/konya-kare.jpg',
              schedules: [
                ScheduleInfo(title: 'İstanbul(Bakırköy) - Konya YHT'),
                ScheduleInfo(title: 'İstanbul(Bostancı) - Konya YHT'),
                ScheduleInfo(title: 'İstanbul(Halkalı) - Konya YHT'),
                ScheduleInfo(title: 'İstanbul(Pendik) - Konya YHT'),
                ScheduleInfo(title: 'İstanbul(Söğütlü Ç.) - Konya YHT'),
                ScheduleInfo(title: 'İstanbul(Bakırköy) - Selçuklu YHT'),
                ScheduleInfo(title: 'İstanbul(Bostancı) - Selçuklu YHT'),
                ScheduleInfo(title: 'İstanbul(Halkalı) - Selçuklu YHT'),
                ScheduleInfo(title: 'İstanbul(Pendik) - Selçuklu YHT'),
                ScheduleInfo(title: 'İstanbul(Söğütlü Ç.) - Selçuklu YHT'),
              ],
            ),
          ),
          _buildDestination(
            PopularDestination(
              title: 'Eskişehir-İstanbul',
              image: 'assets/images/istanbul-kare.jpg',
              schedules: [
                ScheduleInfo(title: 'Eskişehir - İstanbul(Bakırköy)'),
                ScheduleInfo(title: 'Eskişehir - İstanbul(Bostancı)'),
                ScheduleInfo(title: 'Eskişehir - İstanbul(Halkalı)'),
                ScheduleInfo(title: 'Eskişehir - İstanbul(Pendik)'),
                ScheduleInfo(title: 'Eskişehir - İstanbul(Söğütlü Ç.)'),
              ],
            ),
          ),
          _buildDestination(
            PopularDestination(
              title: 'Ankara-Konya',
              image: 'assets/images/konya-yatay.jpg',
              schedules: [
                ScheduleInfo(title: 'Ankara Gar - Konya YHT'),
                ScheduleInfo(title: 'Ankara Gar - Selçuklu YHT'),
                ScheduleInfo(title: 'Eryaman YHT - Konya YHT'),
                ScheduleInfo(title: 'Eryaman YHT - Selçuklu YHT'),
              ],
            ),
            1,
          ),
        ],
      ),
    );
  }

  Widget _buildDestination(PopularDestination destination,
      [double scale = 0.5]) {
    return InkWell(
      onTap: () {
        if (destination.schedules.isNotEmpty) {
          _showBottomSheet(destination.schedules);
        } else {
          CommonWidget.toast("${destination.title} opening");
        }
      },
      child: SizedBox(
        width: (MySize.safeWidth!) * scale - 35,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
                  ).createShader(Rect.fromLTRB(
                      0, rect.height * 0.6, rect.width, rect.height));
                },
                blendMode: BlendMode.srcOver,
                child: Image.asset(
                  destination.image,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        MdiIcons.train,
                        color: AppTheme.theme.colorScheme.background,
                        size: MySize.size22,
                      ),
                      Container(
                        margin: Spacing.only(left: 4),
                        child: Text(
                          destination.title,
                          style: AppTheme.getTextStyle(
                              AppTheme.theme.textTheme.bodyText2,
                              color: Colors.white,
                              fontWeight: 600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(List<ScheduleInfo> schedules) {
    Get.bottomSheet(
      Container(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              color: AppTheme.theme.dialogBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MySize.size16!),
                  topRight: Radius.circular(MySize.size16!))),
          child: Padding(
            padding: EdgeInsets.all(MySize.size16!),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: schedules
                    .map(
                      (e) => ListTile(
                        onTap: () {
                          var splitted = e.title.split(' - ');
                          Get.back();
                          Get.toNamed(
                            Routes.SCHEDULES,
                            parameters: {
                              'departure': splitted[0],
                              'destination': splitted[1],
                            },
                          );
                        },
                        dense: true,
                        leading: Icon(MdiIcons.train,
                            color: AppTheme.theme.colorScheme.onBackground),
                        title: Text(e.title,
                            style: AppTheme.getTextStyle(
                                AppTheme.theme.textTheme.bodyText2,
                                fontWeight: 600)),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PopularDestination {
  final String title;
  final String image;
  final List<ScheduleInfo> schedules;
  PopularDestination({
    required this.title,
    required this.image,
    required this.schedules,
  });
}

class ScheduleInfo {
  final String title;
  ScheduleInfo({
    required this.title,
  });
}
