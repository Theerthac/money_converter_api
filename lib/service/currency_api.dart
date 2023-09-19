// import 'package:http/http.dart' as http;
// import 'package:money_converter/utils/key.dart';

// import '../model/allcurrencies.dart';
// import '../model/currency_model.dart';

// Future<Currency> getRates() async {
//   final response = await http.get(Uri.parse(
//       // ignore: prefer_interpolation_to_compose_strings
//       'https://openexchangerates.org/api/latest.json?base=USD&app_id=' + key));

//   final result = currencyFromJson(response.body);
//   return result;
// }

// Future<Map> getCurrencies() async {
//   var response = await http.get(Uri.parse(
//       // ignore: prefer_interpolation_to_compose_strings
//       'http://openexchangerates.org/api/currencies.json?app_id=' + key));
      
//   final allCurrencies = allCurrenciesFromJson(response.body);
//   return allCurrencies;
// }


import 'package:http/http.dart' as http;
import 'package:money_converter/utils/key.dart';

import '../model/all_currencies.dart';
import '../model/currency_model.dart';

Future<Currency> getRates() async {
  final response = await http.get(
    Uri.parse('https://openexchangerates.org/api/latest.json?base=USD&app_id=$key'),
  );

  if (response.statusCode == 200) {
    final result = currencyFromJson(response.body);
    return result;
  } else {
    throw Exception('Failed to load currency rates');
  }
}

Future<Map<String, String>> getCurrencies() async {
  var response = await http.get(
    Uri.parse('https://openexchangerates.org/api/currencies.json?app_id=$key'),
  );

  if (response.statusCode == 200) {
    final allCurrencies = allCurrenciesFromJson(response.body);
    return allCurrencies;
  } else {
    throw Exception('Failed to load currency codes');
  }
}





String convertusd(Map rates, String usdAmount, String targetCurrency) {
 
  if (rates.containsKey(targetCurrency)) {
    double usdValue = double.tryParse(usdAmount) ?? 0.0;
    double rate = rates[targetCurrency];
    double convertedValue = usdValue * rate;
    return convertedValue.toStringAsFixed(2);
  } else {
    return 'Invalid currency';
  }
}











String convertany(
  Map<String, double> exchangeRates, 
  String amount,
  String currencybase,
  String currencyfinal,
) {
 
  if (!exchangeRates.containsKey(currencybase) || !exchangeRates.containsKey(currencyfinal)) {
    return "Invalid currency selection";
  }

  
  String output = (double.parse(amount) /
          exchangeRates[currencybase]! *
          exchangeRates[currencyfinal]!)
      .toStringAsFixed(2)
      .toString();

  return output;
}

// String convertusd(Map exchangeRates, String usd, String currency) {
//   String output =
//       ((exchangeRates[currency] * double.parse(usd)).toStringAsFixed(2))
//           .toString();
//   return output;
// }


// String convertany(Map exchangeRates, String amount, String currencybase,
//     String currencyfinal) {
//   String output = (double.parse(amount) /
//           exchangeRates[currencybase] *
//           exchangeRates[currencyfinal])
//       .toStringAsFixed(2)
//       .toString();

//   return output;
// }
