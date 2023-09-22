
import 'dart:convert';

Currency currencyFromJson(String str) => Currency.fromJson(json.decode(str));

String currencyToJson(Currency data) => json.encode(data.toJson());

class Currency {
  Currency({
    required this.disclaimer,
    required this.license,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  String disclaimer;
  String license;
  int timestamp;
  String base;
  Map<String, double> rates;

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      disclaimer: json["disclaimer"],
      license: json["license"], 
      timestamp: json["timestamp"],
      base: json["base"],
      rates: Map<String, double>.from(json["rates"]).map(
        (k, v) => MapEntry<String, double>(k, (v is int) ? v.toDouble() : v  ),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "disclaimer": disclaimer,
        "license": license,
        "timestamp": timestamp,
        "base": base,
        "rates": Map<String, double>.from(rates).map(
          (k, v) => MapEntry<String, dynamic>(k, v),
        ),
      };
}