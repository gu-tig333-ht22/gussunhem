import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyState.dart';
import 'TodoDataAndUI.dart';
import 'SecondPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 232, 238),
      appBar: AppBar(
        title: const Text("ToDo list"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 42, 53, 158),
        actions: [
          PopupMenuButton(
            onSelected: (String done) {
              Provider.of<MyState>(context, listen: false).setFilterBy(done);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'all',
                child: Text("All"),
              ),
              const PopupMenuItem(
                value: 'done',
                child: Text("Done"),
              ),
              const PopupMenuItem(
                value: 'undone',
                child: Text("Undone"),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            TodoList(_filterList(state.list, state.filterBy)),
        child: const Padding(
          padding: EdgeInsets.only(bottom: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 42, 53, 158),
          tooltip: 'Add a TODO',
          child: const Icon(Icons.add),
          onPressed: () async {
            var newTodo = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondPage(),
              ),
            );
            if (newTodo != null) {
              TodoClass newTodoObject = TodoClass(id: "testid", title: newTodo);

              Provider.of<MyState>(context, listen: false)
                  .addTodo(newTodoObject);
            }
          }),
    );
  }

  List<TodoClass> _filterList(list, filterBy) {
    if (filterBy == 'all') return list;
    if (filterBy == 'undone') {
      return list.where((todo) => todo.done == false).toList();
    }
    if (filterBy == 'done') {
      return list.where((todo) => todo.done == true).toList();
    } else {
      return list;
    }
  }
}
