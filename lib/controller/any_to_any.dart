
import 'package:flutter/material.dart';
import 'package:money_converter/service/currency_api.dart';

class  AnyToAnyConvertProvider extends ChangeNotifier {
  TextEditingController amountController = TextEditingController();
  String dropdownValue1 = 'AUD';
  String dropdownValue2 = 'AUD';
  String answer = 'Converted Currency will be shown here :)';

  void changedropdownvalueone(String? value) {
    dropdownValue1 = value!;
    notifyListeners();
  }

   void resetdropdownvalueone() {
    dropdownValue1 = answer;
    notifyListeners();
  }

  void changedropdownvaluetwo(String? value) {
    dropdownValue2 = value!;
    notifyListeners();
  }

   void resetdropdownvaluetwo() {
    dropdownValue2 = answer;
    notifyListeners();
  }

  void convertCurrency(rates, String amount, String fromCurrency, String toCurrency) {
    answer = '${ExchangeRates() .convertany(rates, amount, fromCurrency, toCurrency)} $toCurrency';
    notifyListeners();
}
}


