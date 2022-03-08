import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turkish/turkish.dart';
import 'package:yht_ticket/api/api.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/shared/constants/storage.dart';

class StationService extends GetxService {
  static StationService get to => Get.find();

  final BaseApiRepository apiRepository;

  var stations = RxList<StationResponse>();
  var lastSearchedStations = RxList<String>();

  StationService({required this.apiRepository});

  @override
  void onInit() {
    getStations();
    fetchLastSearchedStations();
    super.onInit();
  }

  Future getStations() async {
    var list = await apiRepository.getStations();

    if (list == null) return;

    stations.value = list..sort((a, b) => a.name.compareToTr(b.name, true));
  }

  Future fetchLastSearchedStations() async {
    var storage = Get.find<SharedPreferences>()
        .getStringList(StorageConstants.lastSearchedStations);
    if (storage?.isNotEmpty ?? false) {
      lastSearchedStations.value = storage!;
    }
  }

  Future clearLastSearchedStations() async {
    Get.find<SharedPreferences>().remove(StorageConstants.lastSearchedStations);

    lastSearchedStations.clear();
  }

  Future addStationToLastSearchedList(String stationName) async {
    lastSearchedStations.remove(stationName);
    lastSearchedStations.insert(0, stationName);

    Get.find<SharedPreferences>().setStringList(
        StorageConstants.lastSearchedStations, lastSearchedStations.value);
  }

  Future removeStationFromLastSearchedList(String stationName) async {
    lastSearchedStations.remove(stationName);

    Get.find<SharedPreferences>().setStringList(
        StorageConstants.lastSearchedStations, lastSearchedStations.value);
  }
}
