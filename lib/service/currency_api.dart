import 'package:http/http.dart' as http;
import 'package:money_converter/utils/key.dart';
import '../model/all_currencies.dart';
import '../model/currency_model.dart';

class ExchangeRates {
  Future<Currency> getRates() async {
    final response = await http.get(
      Uri.parse(
          'https://openexchangerates.org/api/latest.json?base=USD&app_id=$key'),
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
      Uri.parse(
          'https://openexchangerates.org/api/currencies.json?app_id=$key'),
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
    if (!exchangeRates.containsKey(currencybase) ||
        !exchangeRates.containsKey(currencyfinal)) {
      return "Invalid currency selection";
    }

    String output = (double.parse(amount) /
            exchangeRates[currencybase]! *
            exchangeRates[currencyfinal]!)
        .toStringAsFixed(2)
        .toString();

    return output;
  }
}
