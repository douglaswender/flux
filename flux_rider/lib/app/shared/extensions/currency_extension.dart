import 'package:intl/intl.dart';

extension CurrencyIntExtension on int? {
  String reais() =>
      NumberFormat.currency(decimalDigits: 2, locale: "pt-BR", symbol: "R\$")
          .format(this! / 100);
}

extension CurrencyDoubleExtension on double? {
  String reais() =>
      NumberFormat.currency(decimalDigits: 2, locale: "pt-BR", symbol: "R\$")
          .format(this! / 100);
}
