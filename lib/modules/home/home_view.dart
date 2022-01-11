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
          shape: const CircularNotchedRectangle(),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.theme.bottomAppBarTheme.color,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.theme.cardTheme.shadowColor!.withAlpha(40),
                  blurRadius: 3,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            padding:
                EdgeInsets.only(top: MySize.size12!, bottom: MySize.size12!),
            child: TabBar(
              controller: controller.tabController,
              onTap: controller.changePage,
              indicator: const BoxDecoration(),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppTheme.theme.colorScheme.primary,
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
                color: AppTheme.theme.colorScheme.primary,
              ),
              Container(
                margin: EdgeInsets.only(top: MySize.size4!),
                decoration: BoxDecoration(
                    color: AppTheme.theme.primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(2.5))),
                height: 5,
                width: 5,
              )
            ],
          )
        : Icon(
            passiveIcon,
            color: AppTheme.theme.colorScheme.onBackground,
          );
  }
}
