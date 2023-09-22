

import 'package:flutter/material.dart';
import 'package:money_converter/service/currency_api.dart';

class UsdToAnyConversionProvider extends ChangeNotifier {
  TextEditingController usdController = TextEditingController();
  String dropdownValue = 'AUD';
  String answer = 'Converted Currency will be shown here :)';

  void changedropdownvalue(String? value) {
    dropdownValue = value!;
    notifyListeners();
  }
  void resetdropdownvalue() {
    dropdownValue = answer;
    notifyListeners();
  }


  

  void convertUsdToAny(Map rates, String usdAmount, String toCurrency) {
    answer =
        '$usdAmount USD = ${ExchangeRates(). convertusd(rates, usdAmount, toCurrency)} $toCurrency';
    notifyListeners();

    
   
    
  }
}
