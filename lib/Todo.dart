import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyState.dart';

class TodoClass {
  String id;
  String name;
  bool? status;

  TodoClass({
    required this.id,
    required this.name,
    required this.status,
  });

  static Map<String, dynamic> toJson(TodoClass todo) {
    return {
      'id': todo.id,
      'name': todo.name,
      'status': todo.status,
    };
  }

  static TodoClass fromJson(Map<String, dynamic> json) {
    return TodoClass(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }
}

class TodoList extends StatelessWidget {
  final List<TodoClass> list;

  TodoList(this.list, {required id, required name, required status});

  Widget build(BuildContext context) {
    return ListView(
      children: list
          .map(
            (todo) => _checkbox(
              context: context,
              todo: todo,
              onClicked: () {
                var state = Provider.of<MyState>(context, listen: false);
              },
            ),
          )
          .toList(),
    );
  }

  Widget _checkbox({
    required BuildContext context,
    required TodoClass todo,
    required VoidCallback onClicked,
  }) =>
      Consumer<MyState>(
        builder: (context, state, child) => Column(
          children: [
            ListTile(
              leading: Checkbox(
                value: todo.status,
                onChanged: (bool? status) {
                  Provider.of<MyState>(context, listen: false)
                      .setStatus(status, todo);
                },
              ),
              trailing: _deleteButtonWidget(context, todo),
              title: Text(
                todo.name,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      );

  Widget _deleteButtonWidget(context, todo) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      IconButton(
        icon: Icon(Icons.close, size: 19),
        onPressed: () async {
          var state = Provider.of<MyState>(context, listen: false);
          state.removeTodo(todo);
        },
      ),
    ]);
  }
}
