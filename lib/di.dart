import 'package:get/get.dart';

import 'services/auth_service.dart';
import 'services/storage_service.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    Get.lazyPut(() => AuthService());
    await Get.putAsync(() => StorageService().init(), permanent: true);
  }
}
