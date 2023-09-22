import 'package:flutter/material.dart';
import 'package:money_converter/controller/any_to_any.dart';
import 'package:money_converter/controller/money_coverter_provider.dart';
import 'package:money_converter/controller/usd_to_any_provider.dart';
import 'package:money_converter/view/home/home.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
       ChangeNotifierProvider(
          create: (BuildContext context) => CurrencyProvider(),
        ),

        ChangeNotifierProvider(
          create: (BuildContext context) => UsdToAnyConversionProvider() ,),

          ChangeNotifierProvider(
            create: (BuildContext context) => AnyToAnyConvertProvider(),)
      ],
      child:  const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}