import 'package:get/get.dart';
import 'package:turkish/turkish.dart';
import 'package:yht_ticket/api/api.dart';
import 'package:yht_ticket/models/models.dart';

class StationService extends GetxService {
  static StationService get to => Get.find();
  final BaseApiRepository apiRepository;

  var stations = RxList<StationResponse>();

  StationService({required this.apiRepository});

  @override
  void onInit() {
    getStations();
    super.onInit();
  }

  Future getStations() async {
    var list = await apiRepository.getStations();

    if (list == null) return;

    stations.value = list..sort((a, b) => a.name.compareToTr(b.name, true));
  }
}
