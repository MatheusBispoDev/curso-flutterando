import 'package:cursofluterrando/conversor/controllers/home_controller.dart';
import 'package:cursofluterrando/conversor/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);

  test('Conversao de real para dolar', () {
    toText.text = '2.0';
    homeController.convert();
    expect(fromText.text, '0.36');
  });

  test('Conversao dolar para real', () {
    toText.text = '1.0';
    homeController.toCurrency = CurrencyModel(
        name: 'Dolar', real: 5.65, dolar: 1.0, euro: 0.85, bitcoin: 0.000088);
    homeController.fromCurrency = CurrencyModel(
        name: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);
    homeController.convert();
    expect(fromText.text, '5.65');
  });
}
