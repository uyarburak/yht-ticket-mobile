import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/utils/common_widget.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/new_app_theme.dart';
import 'package:yht_ticket/widgets/text.dart';

class PopularDestinationsGridview extends StatelessWidget {
  const PopularDestinationsGridview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: 8,
      runSpacing: 16,
      children: [
        _buildDestination(
          PopularDestination(
            title: 'İstanbul',
            image: 'assets/images/istanbul-kare.jpg',
            stations: [
              StationInfo(
                name: 'İstanbul(Pendik)',
                displayName: 'İstanbul (Pendik)',
              ),
              StationInfo(
                name: 'İstanbul(Bostancı)',
                displayName: 'İstanbul (Bostancı)',
              ),
              StationInfo(
                name: 'İstanbul(Söğütlü Ç.)',
                displayName: 'İstanbul (Söğütlü Çeşme)',
              ),
              StationInfo(
                name: 'İstanbul(Bakırköy)',
                displayName: 'İstanbul (Bakırköy)',
              ),
              StationInfo(
                name: 'İstanbul(Halkalı)',
                displayName: 'İstanbul (Halkalı)',
              ),
            ],
          ),
        ),
        _buildDestination(
          PopularDestination(
            title: 'Eskişehir',
            image: 'assets/images/eskisehir-kare.jpg',
            stations: [
              StationInfo(
                name: 'Eskişehir',
                displayName: 'Eskişehir',
              ),
            ],
          ),
        ),
        _buildDestination(
            PopularDestination(
              title: 'Ankara',
              image: 'assets/images/ankara-yatay.jpg',
              stations: [
                StationInfo(
                  name: 'Ankara Gar',
                  displayName: 'Ankara Gar',
                ),
                StationInfo(
                  name: 'ERYAMAN YHT',
                  displayName: 'Eryaman YHT',
                ),
                StationInfo(
                  name: 'Polatlı YHT',
                  displayName: 'Polatlı YHT',
                ),
              ],
            ),
            1),
        _buildDestination(
          PopularDestination(
            title: 'Konya',
            image: 'assets/images/konya-kare.jpg',
            stations: [
              StationInfo(
                name: 'Konya',
                displayName: 'Konya',
              ),
              StationInfo(
                name: 'Selçuklu YHT',
                displayName: 'Selçuklu YHT',
              ),
              StationInfo(
                name: 'Çumra',
                displayName: 'Çumra',
              ),
            ],
          ),
        ),
        _buildDestination(
          PopularDestination(
            title: 'Kocaeli',
            image: 'assets/images/istanbul-kare.jpg',
            stations: [
              StationInfo(
                name: 'İzmit YHT',
                displayName: 'İzmit YHT',
              ),
              StationInfo(
                name: 'Gebze',
                displayName: 'Gebze',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDestination(PopularDestination destination,
      [double scale = 0.5]) {
    return InkWell(
      onTap: () {
        if (destination.stations.length > 1) {
          _showBottomSheet(destination.stations);
        } else if (destination.stations.length == 1) {
          Get.toNamed(Routes.SEARCH_STATIONS,
              parameters: {'destination': destination.stations.first.name});
        }
      },
      child: SizedBox(
        width: (MySize.safeWidth!) * scale - (scale == 1 ? 35 : 28),
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
              bottom: 6,
              left: 6,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    MdiIcons.train,
                    color: Colors.white,
                    size: MySize.size22,
                  ),
                  Container(
                    margin: Spacing.only(left: 4),
                    child: FxText.b2(
                      destination.title,
                      color: Colors.white,
                      fontWeight: 600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(List<StationInfo> stations) {
    var theme = AppTheme.theme;
    var customTheme = AppTheme.customTheme;
    Get.bottomSheet(
      Container(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              color: theme.backgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MySize.size16!),
                  topRight: Radius.circular(MySize.size16!))),
          child: Padding(
            padding: EdgeInsets.all(MySize.size16!),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: stations
                    .map(
                      (e) => ListTile(
                        onTap: () {
                          Get.back();
                          Get.toNamed(Routes.SEARCH_STATIONS,
                              parameters: {'destination': e.name});
                        },
                        dense: true,
                        leading: const Icon(MdiIcons.train),
                        title: FxText.b2(
                          e.displayName,
                          fontWeight: 600,
                        ),
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
  final List<StationInfo> stations;
  PopularDestination({
    required this.title,
    required this.image,
    required this.stations,
  });
}

class StationInfo {
  final String name;
  final String displayName;
  StationInfo({
    required this.name,
    required this.displayName,
  });
}
