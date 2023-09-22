
import 'dart:convert';

Map<String, String> allCurrenciesFromJson(String str) {
  Map<String, dynamic> map = json.decode(str);
  return Map<String, String>.from(map);
}

String allCurrenciesToJson(Map<String, String> data) {
  Map<String, dynamic> map = Map<String, dynamic>.from(data);
  return json.encode(map);
}