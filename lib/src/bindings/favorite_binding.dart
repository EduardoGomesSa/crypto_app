import 'package:crypto_app/src/controllers/favorite_controller.dart';
import 'package:crypto_app/src/core/utils/app_utils.dart';
import 'package:crypto_app/src/repositories/crypto_repository.dart';
import 'package:crypto_app/src/repositories/favorite_repository.dart';
import 'package:get/get.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteRepository());
    Get.put(FavoriteController(
      repository: Get.find<FavoriteRepository>(),
      cryptoRepository: Get.find<CryptoRepository>(),
      appUtils: Get.find<AppUtils>(),
    ));
  }
}
