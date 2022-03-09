import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yht_ticket/theme/new_app_theme.dart';
import 'package:yht_ticket/widgets/container.dart';
import 'package:yht_ticket/widgets/spacing.dart';
import 'package:yht_ticket/widgets/svg.dart';
import 'package:yht_ticket/widgets/tab_indicator.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  late ThemeData theme;
  late CustomTheme customTheme;
  HomeView(int index, {Key? key}) : super(key: key) {
    controller.changePage(index);

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        //key: _drawerKey,
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                  controller: controller.tabController,
                  children: controller.navItems
                      .map((navItem) => navItem.screen)
                      .toList()),
            ),
            FxContainer.none(
              padding: FxSpacing.xy(12, 16),
              color: theme.scaffoldBackgroundColor,
              bordered: true,
              enableBorderRadius: false,
              borderRadiusAll: 0,
              border: Border(
                top: BorderSide(width: 2, color: customTheme.border),
              ),
              child: TabBar(
                controller: controller.tabController,
                indicator: FxTabIndicator(
                    indicatorColor: theme.colorScheme.primary,
                    indicatorStyle: FxTabIndicatorStyle.rectangle,
                    indicatorHeight: 2,
                    radius: 4,
                    yOffset: -18,
                    width: 20),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: theme.colorScheme.primary,
                tabs: buildTab(),
              ),
            )
          ],
        ),
        //drawer: _buildDrawer(),
      ),
    );
  }

  List<Widget> buildTab() {
    List<Widget> tabs = [];

    for (int i = 0; i < controller.navItems.length; i++) {
      tabs.add(Container(
          child: SVG(controller.navItems[i].icon,
              color: (controller.currentIndex.value == i)
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onBackground.withAlpha(200),
              size: controller.navItems[i].size)));
    }
    return tabs;
  }
}
