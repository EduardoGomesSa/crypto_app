import 'package:crypto_app/src/core/utils/api_result.dart';
import 'package:crypto_app/src/core/utils/app_utils.dart';
import 'package:crypto_app/src/models/crypto_model.dart';
import 'package:crypto_app/src/repositories/crypto_repository.dart';
import 'package:get/get.dart';

class CryptoController extends GetxController {
  final CryptoRepository repository;
  final AppUtils appUtils;

  CryptoController({
    required this.repository,
    required this.appUtils,
  });

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    getAllCoins();
  }

  getAllCoins() async {
    isLoading.value = true;

    ApiResult<List<CryptoModel>> result = await repository.getAllCoins();

    if (!result.isError) {
      // round = result.data!;
      //selectedRound.value = round.season!.currentMatchday!;
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }
}