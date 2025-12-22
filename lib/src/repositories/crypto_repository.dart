import 'package:crypto_app/src/core/services/http_manager.dart';
import 'package:crypto_app/src/core/utils/api_result.dart';
import 'package:crypto_app/src/core/utils/app_utils.dart';
import 'package:crypto_app/src/core/utils/urls.dart';
import 'package:crypto_app/src/models/crypto_chart_point_model.dart';
import 'package:crypto_app/src/models/crypto_model.dart';

class CryptoRepository {
  final HttpManager httpManager;
  final AppUtils appUtils;

  CryptoRepository({
    required this.httpManager,
    required this.appUtils,
  });

  Future<ApiResult<List<CryptoModel>>> getAllCoins() async {
    final response = await httpManager.requestList(
      url: Url.coinsMarkets(),
      method: HttpMethods.get,
    );

    if (response is List && response.isNotEmpty) {
      var cryptos = CryptoModel.fromList(response);

      return ApiResult<List<CryptoModel>>(data: cryptos);
    } else {
      return ApiResult<List<CryptoModel>>(
        message: "Erro ao buscar as cryptomoedas. Tente novamente!",
        isError: true,
      );
    }
  }

  Future<ApiResult<List<CryptoChartPointModel>>> getChart({
    required String cryptoId,
    int days = 1,
  }) async {
    final response = await httpManager.requestList(
      url: Url.marketChart(cryptoId),
      method: HttpMethods.get,
    );

    if (response is! Map || response['prices'] != null) {
      final List prices = response['prices'];

       final chartPoints = CryptoChartPointModel.fromList(prices);

      return ApiResult<List<CryptoChartPointModel>>(data: chartPoints);
    }

    return ApiResult<List<CryptoChartPointModel>>(
      message: "Erro ao buscar as cryptomoedas. Tente novamente!",
      isError: true,
    );
  }
}
