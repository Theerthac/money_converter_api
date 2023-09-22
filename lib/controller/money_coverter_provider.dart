import 'package:flutter/material.dart';
import 'package:money_converter/model/currency_model.dart';
import 'package:money_converter/service/currency_api.dart';

class CurrencyProvider extends ChangeNotifier {
  late Currency _result;
  late Map _allCurrencies;

  CurrencyProvider() {
    _result = Currency(
        rates: {}, base: '', disclaimer: '', license: '', timestamp: 0);
    _allCurrencies = {};
    refreshData();
  }

  Currency get result => _result;

  Map get allCurrencies => _allCurrencies;


  get convertedValue => null;

  Future<void> refreshData() async {
    _result = await ExchangeRates(). getRates();
    _allCurrencies = await  ExchangeRates(). getCurrencies();
    notifyListeners();
  }

  void updateConversionResult(convertedValue) {}
}


