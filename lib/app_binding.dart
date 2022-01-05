import 'package:get/get.dart';
import 'package:yht_ticket/api/api_provider.dart';
import 'package:yht_ticket/api/base_api_repository.dart';
import 'package:yht_ticket/services/notification_service.dart';
import 'package:yht_ticket/services/station_service.dart';

import 'api/api_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ApiProvider(), permanent: true);

    Get.put<BaseApiRepository>(
      ApiRepository(apiProvider: Get.find()),
      permanent: true,
    );
    Get.lazyPut<NotificationService>(
      () => NotificationService(apiRepository: Get.find()),
      fenix: true,
    );
    Get.lazyPut<StationService>(
      () => StationService(apiRepository: Get.find()),
      fenix: true,
    );
  }
}
