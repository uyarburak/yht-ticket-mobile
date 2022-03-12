import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yht_ticket/models/responses/station_response.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/services/station_service.dart';

class SearchStationController extends GetxController {
  var searchQueryEditingController = TextEditingController();
  var searchQuery = "".obs;
  var searchQueryLower = "".obs;

  get clearable => searchQuery.isNotEmpty;

  setQuery(String query) {
    searchQuery(query);
    searchQueryLower(query.toLowerCase());
    update();
  }

  clearQuery() {
    searchQuery("");
    searchQueryLower("");
    searchQueryEditingController.clear();
    update();
  }

  clearHistory() {
    StationService.to.clearLastSearchedStations();
  }

  onStationPressed(String stationName) {
    if (Get.parameters.containsKey('destination')) {
      Get.toNamed(Routes.SCHEDULES, parameters: {
        'departure': stationName,
        'destination': Get.parameters['destination'] as String,
      });
    } else {
      StationService.to.addStationToLastSearchedList(stationName);
      Get.back(result: stationName);
    }
  }

  onStationRemovedFromHistory(String stationName) {
    StationService.to.removeStationFromLastSearchedList(stationName);
  }

  @override
  void onInit() {
    super.onInit();

    _stations = StationService.to.stations;
    popularStations.sort();
  }

  @override
  void onClose() {
    searchQueryEditingController.dispose();

    super.onClose();
  }

  var _stations = RxList<StationResponse>.empty();

  List<StationResponse> get filteredStations {
    if (searchQueryLower.isNotEmpty) {
      return _stations
          .where(
              (element) => element.nameLower.startsWith(searchQueryLower.value))
          .toList();
    }

    return _stations;
  }

  RxList<String> get lastSearchedStations =>
      StationService.to.lastSearchedStations;

  var popularStations = [
    'Ankara Gar',
    'ERYAMAN YHT',
    'Polatlı YHT',
    'Selçuklu YHT',
    'Konya',
    'Çumra',
    'Karaman',
    'Eskişehir',
    'Bozüyük YHT',
    'Bilecik YHT',
    'Arifiye',
    'İzmit YHT',
    'Gebze',
    'İstanbul(Pendik)',
    'İstanbul(Bostancı)',
    'İstanbul(Söğütlü Ç.)',
    'İstanbul(Bakırköy)',
    'İstanbul(Halkalı)',
  ];
}
