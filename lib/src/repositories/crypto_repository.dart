import 'package:crypto_app/src/core/services/http_manager.dart';
import 'package:crypto_app/src/core/utils/api_result.dart';
import 'package:crypto_app/src/core/utils/app_utils.dart';
import 'package:crypto_app/src/core/utils/urls.dart';
import 'package:crypto_app/src/models/crypto_model.dart';

class CryptoRepository {
  final HttpManager httpManager;
  final AppUtils appUtils;

  CryptoRepository({
    required this.httpManager,
    required this.appUtils,
  });

  Future<ApiResult<List<CryptoModel>>> getAllCoins() async {
    // String? apiToken = dotenv.env['API_TOKEN'];

    final String endpoint = Url.allCoins;
    final response = await httpManager.requestList(
      url: Url.allCoins,
      method: HttpMethods.get,
    );

    if (response['status'] == 200) {
      // var rounds = RoundModel.fromMap(convertMap(response));

      return ApiResult<List<CryptoModel>>(data: null);
    } else {
      return ApiResult<List<CryptoModel>>(
        message: "Erro ao buscar as rodadas de jogos. Tente novamente!",
        isError: true,
      );
    }
  }
}