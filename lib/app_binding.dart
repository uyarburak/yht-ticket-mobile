import 'package:get/get.dart';
import 'package:yht_ticket/api/base_api_repository.dart';
import 'package:yht_ticket/api/fake_api_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<BaseApiRepository>(
      FakeApiRepository(),
      permanent: true,
    );
  }
}
