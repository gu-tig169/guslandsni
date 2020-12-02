import 'dart:convert';

import 'package:todoapp/model.dart';
import 'package:http/http.dart' as http;

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = 'a5a4ee8c-485c-4daf-bc07-ad1162bf8762';

class Api {
  static Future addTask(ObjectCreate object) async {
    var json = jsonEncode(ObjectCreate.toJson(object));
    print(json);
    http.post(
      '$API_URL/todos?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future<List<ObjectCreate>> getData() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    var decodedResponse = jsonDecode(response.body);
    return decodedResponse.map<ObjectCreate>((item) {
      return ObjectCreate.fromJson(item);
    }).toList();
  }

  static Future removeApiTask(String objectId) async {
    await http.delete('$API_URL/todos/$objectId?key=$API_KEY');
  }

  static Future updateBoolValue(ObjectCreate object) async {
    var objectID = object.id;
    var json = jsonEncode(ObjectCreate.toJson(object));
    await http.put(
      '$API_URL/todos/$objectID?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
  }
}
