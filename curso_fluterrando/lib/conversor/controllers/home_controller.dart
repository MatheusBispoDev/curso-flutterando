import 'package:cursofluterrando/conversor/models/currency_model.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  List<CurrencyModel>? currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  CurrencyModel? toCurrency;
  CurrencyModel? fromCurrency;

  HomeController({required this.toText, required this.fromText}) {
    this.currencies = CurrencyModel.getCurrencies();
    this.toCurrency = currencies![0];
    this.fromCurrency = currencies![1];
  }

  void convert() {
    String text = toText.text;
    //Se for null, devolve o 1.0
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0;

    if (fromCurrency!.name == 'Real') {
      returnValue = value * toCurrency!.real;
    } else if (fromCurrency!.name == 'Dolar') {
      returnValue = value * toCurrency!.dolar;
    } else if (fromCurrency!.name == 'Euro') {
      returnValue = value * toCurrency!.euro;
    } else if (fromCurrency!.name == 'Bitcoin') {
      returnValue = value * toCurrency!.bitcoin;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
