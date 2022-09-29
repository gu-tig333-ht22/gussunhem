import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyState.dart';

class TodoClass {
  String id;
  String title;
  bool done;

  TodoClass({
    required this.id,
    required this.title,
    this.done = false,
  });

  static Map<String, dynamic> toJson(TodoClass todo) {
    return {
      'title': todo.title,
      'done': todo.done,
    };
  }

  static TodoClass fromJson(Map<String, dynamic> json) {
    return TodoClass(
      id: json['id'],
      title: json['title'],
      done: json['done'],
    );
  }
}

class TodoList extends StatelessWidget {
  final List<TodoClass> list;

  const TodoList(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list
          .map(
            (TodoClass todo) => _checkbox(
              context: context,
              todo: todo,
              onClicked: () {
                var state = Provider.of<MyState>(context, listen: false);
                state.setStatus(todo);
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
              onTap: onClicked,
              leading: Checkbox(
                value: todo.done,
                onChanged: (bool? done) {
                  Provider.of<MyState>(context, listen: false).setStatus(todo);
                },
              ),
              trailing: _deleteButtonWidget(context, todo),
              title: Text(
                todo.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Merriweather',
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
        icon: const Icon(Icons.close, size: 19),
        onPressed: () async {
          var state = Provider.of<MyState>(context, listen: false);
          state.removeTodo(todo);
        },
      ),
    ]);
  }
}
