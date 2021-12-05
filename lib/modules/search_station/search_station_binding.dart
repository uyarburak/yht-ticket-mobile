import 'package:get/get.dart';
import 'package:yht_ticket/modules/search_station/search_station_controller.dart';

class SearchStationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchStationController>(() => SearchStationController());
  }
}
