
import 'package:flutter/material.dart';
import 'package:money_converter/controller/any_to_any.dart';
import 'package:provider/provider.dart';

class AnyToAny extends StatelessWidget {
  final Map<String, String> currencies; 
  final Map<String, dynamic> rates; 
  const AnyToAny({Key? key, required this.currencies, required this.rates})
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
              'Convert Any Currency',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<AnyToAnyConvertProvider>(
              builder: (context, value, child) {
                return TextFormField(
                  key: const ValueKey('amount'),
                  controller: value.amountController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Amount',
                  ),
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
                  child: Consumer<AnyToAnyConvertProvider>(
                    builder: (context, value, child) {
                      return DropdownButton<String>(
                        value: value.dropdownValue1,
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: Colors.grey.shade400,
                        ),
                        onChanged: (String? newValue) {
                          Provider.of<AnyToAnyConvertProvider>(context, listen: false)
                         .changedropdownvalueone(newValue);
                        
                        },
                        items: currencies.keys.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text('To'),
                ),
                Expanded(
                  child: Consumer<AnyToAnyConvertProvider>(
                    builder: (context, value, child) {
                      return DropdownButton<String>(
                        value: value.dropdownValue2,
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: Colors.grey.shade400,
                        ),
                        onChanged: (String? newValue) {
                              Provider.of<AnyToAnyConvertProvider>(context, listen: false)
                         .changedropdownvaluetwo(newValue);
                          
                        },
                        items: currencies.keys.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<AnyToAnyConvertProvider>(
              builder: (context, value, child) {
                return Container(
                  child: ElevatedButton(
                    onPressed: () {
                      value.convertCurrency(
                        rates,
                        value.amountController.text,
                        value.dropdownValue1,
                        value.dropdownValue2,
                      );
                    },
                    child:  Text('Convert'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Consumer<AnyToAnyConvertProvider>(
              builder: (context, currencyProvider, _) {
                return Container(
                  child: Text(
                    currencyProvider.answer,
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