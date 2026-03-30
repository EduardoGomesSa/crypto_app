import 'package:crypto_app/src/core/ui/formatters.dart';
import 'package:crypto_app/src/core/utils/api_result.dart';
import 'package:crypto_app/src/core/utils/app_utils.dart';
import 'package:crypto_app/src/models/crypto_chart_point_model.dart';
import 'package:crypto_app/src/models/crypto_model.dart';
import 'package:crypto_app/src/repositories/crypto_repository.dart';
import 'package:crypto_app/src/repositories/favorite_repository.dart';
import 'package:get/get.dart';

class CryptoController extends GetxController {
  final CryptoRepository repository;
  final FavoriteRepository favoriteRepository;
  final AppUtils appUtils;

  CryptoController({
    required this.repository,
    required this.favoriteRepository,
    required this.appUtils,
  });

  RxBool isLoading = false.obs;
  RxList<CryptoModel> listCryptos = RxList<CryptoModel>([]);
  RxList<CryptoChartPointModel> listChartPoints =
      RxList<CryptoChartPointModel>([]);
  RxList<CryptoModel> filteredCryptos = <CryptoModel>[].obs;
  RxBool isBrl = false.obs;
  RxDouble dolarExchangeRate = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    getAllCoins();
  }

  getAllCoins() async {
    isLoading.value = true;

    ApiResult<List<CryptoModel>> result = await repository.getAllCoins();
    final favoriteIds = await favoriteRepository.getFavoriteIds();

    if (!result.isError) {
      final favoriteSet = favoriteIds.toSet();

      final finalListCoins = result.data!;

      for (final crypto in finalListCoins) {
        if (favoriteSet.contains(crypto.id)) {
          crypto.setIsFavorite(true);
        }
      }

      listCryptos.assignAll(finalListCoins);
      filteredCryptos.assignAll(listCryptos);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }

  getChartById(String id) async {
    isLoading.value = true;

    ApiResult<List<CryptoChartPointModel>> result =
        await repository.getChart(cryptoId: id);

    if (!result.isError) {
      listChartPoints.assignAll(result.data!);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }

  void searchCryptosByParam(String searchTerm) {
    final query = searchTerm.toLowerCase().trim();

    if (query.isEmpty) {
      filteredCryptos.assignAll(listCryptos);
      return;
    }

    filteredCryptos.assignAll(
      listCryptos.where((crypto) {
        final name = crypto.name?.toLowerCase() ?? '';
        final symbol = crypto.symbol?.toLowerCase() ?? '';

        return name.contains(query) || symbol.contains(query);
      }).toList(),
    );
  }

  Future<void> toggleCurrency() async {
    if (isBrl.value) {
      isBrl.value = false;
    } else {
      if (dolarExchangeRate.value == 0.0) {
        isLoading.value = true;
        final result = await repository.getDolarValueInReal();
        isLoading.value = false;

        if (!result.isError) {
          dolarExchangeRate.value = result.data!;
          isBrl.value = true;
        } else {
          appUtils.showToast(message: result.message!, isError: true);
        }
      } else {
        isBrl.value = true;
      }
    }
  }

  String formatPrice(double priceInUsd) {
    if (isBrl.value) {
      return CurrencyFormatter.brl(priceInUsd * dolarExchangeRate.value);
    }

    return CurrencyFormatter.usd(priceInUsd);
  }
}
