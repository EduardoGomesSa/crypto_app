import 'package:intl/intl.dart';

enum Currency { usd, brl }

class CurrencyFormatter {
  CurrencyFormatter._();

  static String format(double value, Currency currency) {
    final formatter = switch (currency) {
      Currency.usd => NumberFormat.currency(
          locale: 'en_US',
          symbol: '\$',
          decimalDigits: 2,
        ),
      Currency.brl => NumberFormat.currency(
          locale: 'pt_BR',
          symbol: 'R\$',
          decimalDigits: 2,
        ),
    };

    return formatter.format(value);
  }

  static String usd(double value) => format(value, Currency.usd);

  static String brl(double value) => format(value, Currency.brl);
}
