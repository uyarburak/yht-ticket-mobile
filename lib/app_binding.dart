import 'package:get/get.dart';
import 'package:yht_ticket/services/station_service.dart';

import 'api/api.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ApiProvider(), permanent: true);

    Get.put<BaseApiRepository>(
      ApiRepository(apiProvider: Get.find()),
      permanent: true,
    );

    Get.lazyPut<StationService>(
      () => StationService(apiRepository: Get.find()),
      fenix: true,
    );
  }
}
