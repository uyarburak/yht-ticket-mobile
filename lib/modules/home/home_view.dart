import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView(int index, {Key? key}) : super(key: key) {
    controller.changePage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: TabBarView(
            controller: controller.tabController, children: controller.pages),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.yhtTheme.bgLayer2,
            ),
            padding:
                EdgeInsets.only(top: MySize.size12!, bottom: MySize.size12!),
            child: TabBar(
              controller: controller.tabController,
              onTap: controller.changePage,
              indicator: const BoxDecoration(),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppTheme.yhtTheme.primary,
              tabs: <Widget>[
                _buildTabItem(0, MdiIcons.home, MdiIcons.homeOutline),
                _buildTabItem(1, MdiIcons.history, MdiIcons.history),
                _buildTabItem(2, MdiIcons.account, MdiIcons.accountOutline),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(int desiredIndex, IconData icon, IconData passiveIcon) {
    return (controller.currentIndex.value == desiredIndex)
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                color: AppTheme.yhtTheme.primary,
              ),
              Container(
                margin: EdgeInsets.only(top: MySize.size4!),
                decoration: BoxDecoration(
                  color: AppTheme.yhtTheme.primary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(2.5),
                  ),
                ),
                height: 5,
                width: 5,
              ),
            ],
          )
        : Icon(
            passiveIcon,
            color: AppTheme.yhtTheme.onBgLayer2Muted,
          );
  }
}
