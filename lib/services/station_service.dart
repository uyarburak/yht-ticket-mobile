import 'package:get/get.dart';
import 'package:turkish/turkish.dart';
import 'package:yht_ticket/api/base_api_repository.dart';
import 'package:yht_ticket/models/responses/station_response.dart';

class StationService extends GetxService {
  static StationService get to => Get.find();
  final BaseApiRepository apiRepository;
  StationService({required this.apiRepository});

  var stations = RxList<StationResponse>();

  @override
  void onInit() {
    getStations();
    super.onInit();
  }

  Future getStations() async {
    print("getStations called");
    var list = await apiRepository.getStations();

    if (list == null) return;

    stations.value = list..sort((a, b) => a.name.compareToTr(b.name, true));
  }
}
