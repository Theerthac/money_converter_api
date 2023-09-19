// import 'package:flutter/material.dart';
// import 'package:money_converter/service/currency_api.dart';

// class AnyToAny extends StatefulWidget {
//   final rates;
//   final Map currencies;

//   const AnyToAny({Key? key, @required this.rates, required this.currencies})
//       : super(key: key);

//   @override
//   State<AnyToAny> createState() => _AnyToAnyState();
// }

// class _AnyToAnyState extends State<AnyToAny> {
//   TextEditingController amountController = TextEditingController();

//   String dropdownValue1 = 'AUD';
//   String dropdownValue2 = 'AUD';
//   String answer = 'Converted Currency will be shown here :)';

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//              Text(
//               'Convert Any Currency',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               key: ValueKey('amount'),
//               controller: amountController,
//               decoration: InputDecoration(
//                 hintText: 'Enter Amount',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                     child: DropdownButton(
//                   value: dropdownValue1,
//                   icon: Icon(Icons.arrow_drop_down_rounded),
//                   iconSize: 24,
//                   elevation: 16,
//                   isExpanded: true,
//                   underline: Container(
//                     height: 2,
//                     color: Colors.grey.shade400,
//                   ),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       dropdownValue1 = newValue!;
//                     });
//                   },
//                   items: widget.currencies.keys
//                       .toSet()
//                       .toList()
//                       .map<DropdownMenuItem<String>>((value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 )),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20),
//                   child: Text('To'),
//                 ),
//                 Expanded(
//                     child: DropdownButton(
//                   value: dropdownValue2,
//                   icon: Icon(Icons.arrow_drop_down_rounded),
//                   iconSize: 24,
//                   elevation: 16,
//                   isExpanded: true,
//                   underline: Container(
//                     height: 2,
//                     color: Colors.grey.shade400,
//                   ),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       dropdownValue2 = newValue!;
//                     });
//                   },
//                   items: widget.currencies.keys
//                       .toSet()
//                       .toList()
//                       .map<DropdownMenuItem<String>>((value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ))
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               child: ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       answer = amountController.text +
//                        '' +
//                        convertany(widget.rates,amountController.text,
//                        dropdownValue1,dropdownValue2)+
//                        ''+
//                        dropdownValue2;
//                     });
//                   },
//                   child: Text('Convert'),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStatePropertyAll(
//                       Theme.of(context).primaryColor
//                     )
//                   ),
//                   ),
//             ),
//            const SizedBox(height: 10,),
//                         Container(child: Text(answer),)
//         ],

//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:money_converter/service/currency_api.dart';

class AnyToAny extends StatefulWidget {
  final rates;
  final Map currencies;

  const AnyToAny({Key? key, required this.rates, required this.currencies})
      : super(key: key);

  @override
  State<AnyToAny> createState() => _AnyToAnyState();
}

class _AnyToAnyState extends State<AnyToAny> {
  TextEditingController amountController = TextEditingController();

  String dropdownValue1 = 'AUD';
  String dropdownValue2 = 'AUD';
  String answer = 'Converted Currency will be shown here :)';

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
            TextFormField(
              key: const ValueKey('amount'),
              controller: amountController,
              decoration: const InputDecoration(
                hintText: 'Enter Amount',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownValue1,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue1 = newValue!;
                      });
                    },
                    items: widget.currencies.keys.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text('To'),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownValue2,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                      });
                    },
                    items: widget.currencies.keys.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    answer =
                        ' ${convertany(widget.rates, amountController.text, dropdownValue1, dropdownValue2)} $dropdownValue2';
                  });
                },
                child:  Text('Convert'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(child: Text(answer,style: const TextStyle(fontWeight: FontWeight.bold),)),
          ],
        ),
      ),
    );
  }
}
