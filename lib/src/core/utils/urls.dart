import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Url {
  static String apiUrl = dotenv.env['API_URL'] ?? '';
  static String apiToken = dotenv.env['API_KEY'] ?? '';

  static String allCoins = "$apiUrl/markets?vs_currency=usd&ids=bitcoin&names=Bitcoin&symbols=btc&category=layer-1&price_change_percentage=1h";
  static String marketChart = "$apiUrl/binancecoin/market_chart?vs_currency=usd&days=1";

  static String teste = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin&names=Bitcoin&symbols=btc&category=layer-1&price_change_percentage=1h";
}