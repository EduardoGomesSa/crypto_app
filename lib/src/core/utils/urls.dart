import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Url {
  static String apiUrl = dotenv.env['API_URL'] ?? '';
  static String apiToken = dotenv.env['API_KEY'] ?? '';

  static String allCoins = apiUrl;
}