import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yht_ticket/modules/dashboard/dashboard_screen.dart';
import 'package:yht_ticket/modules/history/history_screen.dart';
import 'package:yht_ticket/modules/profile/profile_screen.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  static HomeController get to => Get.find();

  late TabController tabController;

  final currentIndex = 0.obs;

  final pages = <Widget>[
    const DashboardScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  Widget get currentPage => pages[currentIndex()];

  changePage(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: pages.length);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
