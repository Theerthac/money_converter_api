
import 'package:flutter/material.dart';
import 'package:money_converter/controller/usd_to_any_provider.dart';
import 'package:provider/provider.dart';

class UsdToAny extends StatelessWidget {
  final Map currencies;
  final Map rates;

  const UsdToAny({Key? key, required this.currencies, required this.rates})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'USD to Any Currency',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<UsdToAnyConversionProvider>(
              builder: (context, usdConversionProvider, _) {
                return TextFormField(
                  key: const ValueKey('usd'),
                  controller: usdConversionProvider.usdController,
                  decoration: const InputDecoration(hintText: 'Enter USD'),
                  keyboardType: TextInputType.number,
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Consumer<UsdToAnyConversionProvider>(
                      builder: (context, value, child) {
                    return DropdownButton<String>(
                      value: value.dropdownValue,
                      icon: const Icon(
                        Icons.arrow_drop_down_rounded,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline: Container(
                        height: 2,
                        color: Colors.grey.shade400,
                      ),
                      onChanged: (String? newValue) {
                         Provider.of<UsdToAnyConversionProvider>(context, listen: false)
                         .changedropdownvalue(newValue);
                        
                      },
                      items: currencies.keys
                          .toSet()
                          .toList()
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    );
                  }),
                ),
                const SizedBox(width: 10),
                Consumer<UsdToAnyConversionProvider>(
                  builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: () {
                        value.convertUsdToAny(
                          rates,
                          value.usdController.text,
                          value.dropdownValue,
                        );
                      },
                      child:  Text('Convert'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<UsdToAnyConversionProvider>(
              builder: (context, value, child) {
                return Container(
                  child: Text(
                    value.answer,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
