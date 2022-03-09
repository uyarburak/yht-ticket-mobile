import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yht_ticket/modules/dashboard/dashboard_screen.dart';
import 'package:yht_ticket/modules/history/history_screen.dart';
import 'package:yht_ticket/modules/profile/profile_screen.dart';

class NavItem {
  final String icon;
  final Widget screen;
  final double size;

  NavItem(this.icon, this.screen, [this.size = 28]);
}

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static HomeController get to => Get.find();

  late TabController tabController;
  late List<NavItem> navItems;

  final currentIndex = 0.obs;

  Widget? get currentPage => navItems[currentIndex.value].screen;

  changePage(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 3);

    navItems = [
      NavItem('assets/icons/home.svg', DashboardScreen(), 22),
      NavItem('assets/icons/alarm.svg', const HistoryScreen(), 22),
      NavItem('assets/icons/user.svg', const ProfileScreen(), 22),
    ];

    tabController.addListener(() {
      currentIndex.value = tabController.index;
    });

    tabController.animation!.addListener(() {
      final aniValue = tabController.animation!.value;
      if (aniValue - currentIndex.value > 0.5) {
        currentIndex.value++;
      } else if (aniValue - currentIndex.value < -0.5) {
        currentIndex.value--;
      }
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
