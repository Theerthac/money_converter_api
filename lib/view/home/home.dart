
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:money_converter/view/home/widgets/any_to_any.dart';
import 'package:money_converter/view/home/widgets/usd_to_any.dart';
import '../../controller/money_coverter_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
         'Currency Converter',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 129, 125, 125),
        ),
        child: SingleChildScrollView(
          child: Form(
            child: Consumer<CurrencyProvider>(
              builder: (context, value, child) {
                final currencyData = value.result;
                final currenciesMap = value.allCurrencies;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (currencyData.rates.isNotEmpty)
                      UsdToAny(
                        currencies: currenciesMap,
                        rates: currencyData.rates,
                      ),
                    if (currencyData.rates.isNotEmpty)
                      AnyToAny(
                        currencies: currenciesMap.cast(), 
                        rates: currencyData.rates,
                      ),
                    if (currencyData.rates.isEmpty)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}



