import 'package:crypto_app/src/core/utils/api_result.dart';
import 'package:crypto_app/src/core/utils/app_utils.dart';
import 'package:crypto_app/src/models/crypto_model.dart';
import 'package:crypto_app/src/repositories/crypto_repository.dart';
import 'package:crypto_app/src/repositories/favorite_repository.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final FavoriteRepository repository;
  final CryptoRepository cryptoRepository;
  final AppUtils appUtils;

  FavoriteController({
    required this.repository,
    required this.appUtils,
    required this.cryptoRepository,
  });

  RxBool isLoading = false.obs;
  RxList<CryptoModel> favoriteCryptos = <CryptoModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    getAllFavorites();
  }

  controlFavorite(CryptoModel model) async {
    isLoading.value = true;

    var cryptoAlreadyFav = await repository.getById(id: model.id!);

    if (cryptoAlreadyFav.isError) {
      ApiResult<bool> saved = await repository.insert(model: model);

      if (saved.data == true) {
        model.setIsFavorite(true);
        favoriteCryptos.add(model);
      } else {
        appUtils.showToast(
            message: "Não foi possível favoritar este time. Tente novamente!",
            isError: true);
      }
    } else {
      int removed = await repository.remove(model.id!);

      if (removed != 0) {
        model.setIsFavorite(false);
        favoriteCryptos.remove(model);
      } else {
        appUtils.showToast(
            message:
                "Não foi possível desfavoritar este time. Tente novamente!",
            isError: true);
      }
    }

    isLoading.value = false;
  }

  getAllFavorites() async {
    try {
      isLoading.value = true;

      ApiResult<List<CryptoModel>> cryptos = await repository.getAll();

      if (!cryptos.isError) {
        favoriteCryptos.assignAll(cryptos.data!);
      } 
    } finally {
      isLoading.value = false;
    }
  }

  checkIfIsFavorite(CryptoModel model) async {
    var isFavorite = await repository.getById(id: model.id!);

    if (isFavorite.data != null && isFavorite.data!.isFavorite.value) {
      model.setIsFavorite(true);
    } else {
      model.setIsFavorite(false);
    }
  }

  Future<void> removeAllFavorites() async {
    await repository.removeAllFavorites();

    for (final crypto in favoriteCryptos) {
      crypto.setIsFavorite(false);
    }

    favoriteCryptos.clear();
  }
}
