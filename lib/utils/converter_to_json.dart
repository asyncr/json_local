import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:json_local/models/item.dart';

import '../provider/url.dart';

// Future<List<Item>> converterJson() async {
//   final jsonData = await rootBundle.loadString('assets/json_local.json');
//   final jsonResult = await json.decode(jsonData) as List;
//   // final jsonResult = json.decode(jsonData) as Map<String, dynamic>; //
//   return jsonResult.map((dynamic item) => Item.fromJson(item)).toList();
// }

//Crear una funcion que retorne un Future de tipo List<Item>
//de la clase Item.dart leyendo el archivo json_local.json
Future<List<Item>> converterJson() async {
  final jsonData = await rootBundle.loadString(localjson);
  final jsonResult = json.decode(jsonData) as Map<String, dynamic>;
  return (jsonResult['items'] as List)
      .map((item) => Item.fromJson(item))
      .toList();
}
