// import 'package:flutter/material.dart';
// import 'package:money_converter/service/currency_api.dart';

// class UsdToAny extends StatefulWidget {
//    final rates;
//    final Map currencies;

//   const UsdToAny({Key? key, @required this.rates, required this.currencies })
//       : super(key: key);

//   @override
//   State<UsdToAny> createState() => _UsdToAnyState();
// }

// class _UsdToAnyState extends State<UsdToAny> {

//   TextEditingController usdController = TextEditingController();
//   String dropdownvalue = 'AUD';
//    String answer = 'Converted Currency will be shown here :)';

//   @override
//   Widget build(BuildContext context) {
//     // var w = MediaQuery.of(context).size.width;
//     return Card(
//        child: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//              'USD to Any Currency',
//                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//              ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               key: ValueKey('usd'),
//               controller: usdController,
//               decoration: InputDecoration(hintText: 'Enter USD'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                     child: DropdownButton<String>(
//                         value: dropdownvalue,
//                         icon: Icon(
//                           Icons.arrow_drop_down_rounded,
//                         ),
//                         iconSize: 24,
//                         elevation: 16,
//                         isExpanded: true,
//                         underline: Container(
//                           height: 2,
//                           color: Colors.grey.shade400,
//                         ),
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             dropdownvalue = newValue!;
//                           });
//                         },
//                         items: widget.currencies.keys
//                             .toSet()
//                             .toList()
//                             .map<DropdownMenuItem<String>>((value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                         ),
//                         ),
//                        const SizedBox(width: 10),
//                        ElevatedButton(
//                          onPressed: (){
//                            setState(() {
                             
//                              answer = usdController.text +
//                              'USD =' +
//                              convertusd(widget.rates, usdController.text,
//                              dropdownvalue) + '' + dropdownvalue;
                             
//                            });
//                          },
//                           child:   Text('Convert'),
//                           style: ButtonStyle(
//                            backgroundColor: MaterialStateProperty.all(
//                              Theme.of(context).primaryColor,
//                            ),
//                           ),
//                           ),
                       
//               ],
//              ),
//               const SizedBox(height: 10,),
//                         Container(child: Text(answer),)
//         ],
//         ),
//        ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../service/currency_api.dart';


class UsdToAny extends StatefulWidget {
  final rates;
  final Map currencies;

  const UsdToAny({Key? key, @required this.rates, required this.currencies})
      : super(key: key);

  @override
  State<UsdToAny> createState() => _UsdToAnyState();
}

class _UsdToAnyState extends State<UsdToAny> {
  TextEditingController usdController = TextEditingController();
  String dropdownvalue = 'AUD';
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
              'USD to Any Currency',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              key: const ValueKey('usd'),
              controller: usdController,
              decoration: const InputDecoration(hintText: 'Enter USD'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownvalue,
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
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    items: widget.currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                 
                    setState(() {
                      answer = usdController.text +
                          ' USD =' +
                          convertusd(widget.rates, usdController.text, dropdownvalue) +
                          ' ' +
                          dropdownvalue;
                    });
                  },
                  child:  Text('Convert'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Container(child: Text(answer,style: const TextStyle(fontWeight: FontWeight.bold),),)
          ],
        ),
      ),
    );
  }
}