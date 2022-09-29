import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:template/TodoDataAndUI.dart';

const API_KEY = 'f0218f21-1e54-4459-9e09-aad14c92a876';
const API_URL = 'https://todoapp-api.apps.k8s.gu.se';

class InternetFetcher {
  static Future<List<TodoClass>> addTodo(TodoClass todoToAdd) async {
    Map<String, dynamic> json = TodoClass.toJson(todoToAdd);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      Uri.parse('$API_URL/todos?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<TodoClass>((data) {
      return TodoClass.fromJson(data);
    }).toList();
  }

  static Future removeTodo(TodoClass todoToRemove) async {
    var response = await http
        .delete(Uri.parse('$API_URL/todos/${todoToRemove.id}?key=$API_KEY'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<TodoClass>((data) {
      return TodoClass.fromJson(data);
    }).toList();
  }

  static Future<List<TodoClass>> getTodo() async {
    var response = await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'));
    String bodyString = response.body;
    var json = jsonDecode(bodyString);

    return json.map<TodoClass>((data) {
      return TodoClass.fromJson(data);
    }).toList();
  }

  static Future<List<TodoClass>> updateTodo(TodoClass todoToUpdate) async {
    var bodyString = jsonEncode(TodoClass.toJson(todoToUpdate));
    http.Response response = await http.put(
      Uri.parse('$API_URL/todos/${todoToUpdate.id}?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<TodoClass>((data) {
      return TodoClass.fromJson(data);
    }).toList();
  }
}
