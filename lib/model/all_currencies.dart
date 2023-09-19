// import 'dart:convert';

// Map<String, String> allCurrenciesFromJson(String str) =>
//     Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

// String allCurrenciesToJson(Map<String, String> data) =>
//     json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));



import 'dart:convert';

Map<String, String> allCurrenciesFromJson(String str) {
  Map<String, dynamic> map = json.decode(str);
  return Map<String, String>.from(map);
}

String allCurrenciesToJson(Map<String, String> data) {
  Map<String, dynamic> map = Map<String, dynamic>.from(data);
  return json.encode(map);
}