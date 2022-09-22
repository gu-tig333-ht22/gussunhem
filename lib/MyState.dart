import 'package:flutter/material.dart';
import 'Todo.dart';
import 'internet.dart';

class MyState extends ChangeNotifier {
  late List<TodoClass> _list = [];
  String _filterBy = 'all';
  //String _ip = '';
  //bool _loading = false;
  //String get ip => _ip;
  //bool get loading => _loading;

  /*MyState() {
    fetchIp();
  }

  void fetchIp() async {
    _loading = true;
    notifyListeners();

    var ip = await InternetFetcher.fetchIp();
    _loading = false;

    _ip = ip;
    notifyListeners(); */

  List<TodoClass> get list => _list;

  String get filterBy => _filterBy;

  Future getTodo() async {
    List<TodoClass> list = await InternetFetcher.getTodo();
    _list = list;
    notifyListeners();
  }

  void addTodo(String todo) async {
    String id = '1';
    TodoClass input = TodoClass(id: id, name: todo, status: false);
    _list.add(input); // await InternetFetcher._list.add(input);
    notifyListeners();
  }

  void setStatus(bool? status, todo) async {
    todo.status =
        status; //todo.status = await InternetFetcher.status; The getter 'status' isn't defined for the type 'InternetFetcher'.
    notifyListeners();
  }

  void removeTodo(TodoClass todoToRemove) {
    _list.remove(
        todoToRemove); // await InternetFetcher._list.remove(todoToRemove);
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }
}
