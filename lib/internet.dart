import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:template/Todo.dart';
//import 'MyState.dart';

/*class InternetFetcher {
  static Future<String> fetchIp() async {
    http.Response response = await http.get(Uri.parse('https://api.myip.com'));
    var jsonData = response.body;
    var obj = jsonDecode(jsonData);
    return obj['ip']; //'${obj['ip']} in country ${obj['country']}';
  }
}*/

const API_KEY = '';
const API_URL = '';

class InternetFetcher {
//String _path = "/todos";
//get list => _list;
//var _list = list;
  //The getter '_list' isn't defined for the type 'InternetFetch' (in MyState)

  static Future<List<TodoClass>> addTodo(String todoToAdd) async {
    //Map<String, dynamic> json = TodoClass.toJson(todo);
    var bodyString = jsonEncode({
      // var bodyString = jsonEncode(json);
      'name': todoToAdd,
    });
    {
      //try {
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
    } /* catch (e) {
      print(e);
      return [];
    } */
    // notifyListeners();
  }

  //*************************************************************************/

  static Future removeTodo(String todoToRemove) async {
    var response = await http.delete(Uri.parse(
        '$API_URL/todos/$todoToRemove?key=$API_KEY')); // &_confirm=true
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<TodoClass>((data) {
      return TodoClass.fromJson(data);
    }).toList();
  }

  //*************************************************************************/

  static Future<List<TodoClass>> getTodo() async {
    var response = await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'));
    String bodyString = response.body;
    var json = jsonDecode(bodyString);

    return json.map<TodoClass>((data) {
      return TodoClass.fromJson(data);
    }).toList();
  }

  //*************************************************************************/

  static Future<List<TodoClass>> updateTodo(TodoClass todoToUpdate) async {
    var bodyString = jsonEncode(TodoClass.toJson(todoToUpdate));
    {
      //try {
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
    } /*catch (e) {
      print(e);
      return [];
    }*/
  }
}
