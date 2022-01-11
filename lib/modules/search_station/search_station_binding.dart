import 'package:get/get.dart';

import 'search_station_controller.dart';

class SearchStationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchStationController>(() => SearchStationController());
  }
}
