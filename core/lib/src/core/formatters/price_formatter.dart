import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class PriceFormatter extends CentavosInputFormatter
    implements TextInputFormatter {
  PriceFormatter({super.moeda});

  static double clearMask(String value) {
    return UtilBrasilFields.converterMoedaParaDouble(value);
  }
}
