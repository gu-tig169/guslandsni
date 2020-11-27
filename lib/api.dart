import 'dart:convert';

import 'package:todoapp/model.dart';
import 'package:http/http.dart' as http;

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app/';
const API_KEY = '55b74874-868d-4a10-8d80-1f36161fd5a9';

class Api {
  static Future addTask(ObjectCreate object) async {
    var json = jsonEncode({
      'message': object.task,
    });

    await http.post('$API_URL/todos?key=$API_KEY',
        body: json, headers: {'Contenct-Type': 'application/json'});
  }
}
