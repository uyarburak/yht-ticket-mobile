import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    searchQueryEditingController.dispose();
    super.onClose();
  }
}
