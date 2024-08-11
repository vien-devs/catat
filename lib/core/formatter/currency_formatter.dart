import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String getCurrencyFormat(double nominal, {bool withSymbol = true}) {
    return NumberFormat.currency(
            locale: 'id',
            symbol: 'Rp',
            customPattern: withSymbol ? '\u00a4 #,###.#' : '#,###.#',
            decimalDigits: 0)
        .format(
      nominal,
    );
  }

  static String formatNominalNumber(int number) {
    if (number >= 1000000) {
      if (number % 1000000 > 0) {
        return '${(number / 1000000).toStringAsFixed(1)}jt';
      } else {
        return '${(number / 1000000).toStringAsFixed(0)}jt';
      }
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(0)}rb';
    } else {
      return number.toString();
    }
  }
}
