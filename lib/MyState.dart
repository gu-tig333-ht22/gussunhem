import 'package:flutter/material.dart';
import 'TodoDataAndUI.dart';
import 'api.dart';

class MyState extends ChangeNotifier {
  List<TodoClass> _list = [];
  String _filterBy = 'all';

  MyState() {
    getTodo();
  }

  List<TodoClass> get list => _list;
  String get filterBy => _filterBy;

  Future getTodo() async {
    List<TodoClass> list = await InternetFetcher.getTodo();
    _list = list;
    notifyListeners();
  }

  void addTodo(TodoClass todo) async {
    _list = await InternetFetcher.addTodo(todo);
    notifyListeners();
  }

  void setStatus(todo) async {
    todo.done = !todo.done;
    _list = await InternetFetcher.updateTodo(todo);
    notifyListeners();
  }

  void removeTodo(TodoClass todoToRemove) async {
    _list = await InternetFetcher.removeTodo(todoToRemove);
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }
}
