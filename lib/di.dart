import 'package:get/get.dart';
import 'package:yht_ticket/services/auth_service.dart';
import 'package:yht_ticket/services/storage_service.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    Get.lazyPut(() => AuthService());
    await Get.putAsync(() => StorageService().init());
  }
}
