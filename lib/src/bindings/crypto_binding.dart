import 'package:crypto_app/src/controllers/crypto_controller.dart';
import 'package:crypto_app/src/core/services/http_manager.dart';
import 'package:crypto_app/src/core/utils/app_utils.dart';
import 'package:crypto_app/src/repositories/crypto_repository.dart';
import 'package:get/get.dart';

class CryptoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HttpManager());
    Get.put(AppUtils());
    Get.put(CryptoRepository(
      httpManager: Get.find<HttpManager>(),
      appUtils: Get.find<AppUtils>(),
    ));
    Get.put(CryptoController(
      repository: Get.find<CryptoRepository>(),
      appUtils: Get.find<AppUtils>(),
    ));
  }
}
