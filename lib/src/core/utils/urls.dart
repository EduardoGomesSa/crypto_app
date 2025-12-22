import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Url {
  static final String _baseUrl = dotenv.env['API_URL'] ?? '';
  static final String apiToken = dotenv.env['API_KEY'] ?? '';

  static String coinsMarkets() =>
      '$_baseUrl/markets?vs_currency=usd&ids=bitcoin&names=Bitcoin&symbols=btc&category=layer-1&price_change_percentage=1h';

  static String marketChart(String cryptoId) =>
      '$_baseUrl/$cryptoId/market_chart?vs_currency=usd&days=1';
}