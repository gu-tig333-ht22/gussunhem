import 'dart:html';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'TODO app', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO list!"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 42, 53, 158),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TodoList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 42, 53, 158),
        tooltip: 'Add a TODO',
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondPage())),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("TODO list!"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 42, 53, 158),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration:
                  InputDecoration(hintText: 'What would you like to add?'),
            ),
            Icon(
              Icons.add,
              color: Colors.deepPurple,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TodoItem(
          label: "Create checkboxes",
        ),
        TodoItem(
          label: "Add class navigating to second page",
        ),
        TodoItem(
          label: "Change from default color to RGB",
        ),
        TodoItem(
          label: "Add app bar for second page",
        ),
        TodoItem(
          label: "Add three dots in appbar",
        ),
        TodoItem(
          label: "Make a PR on github",
        ),
        TodoItem(
          label: "Enjoy weekend!",
        ),
      ],
    );
  }
}

class TodoItem extends StatelessWidget {
  final String label;

  const TodoItem({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Checkbox(
          onChanged: (val) {},
          value: true,
        ), // value: false for unchecked checkboxes
        Text(label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 36, 36, 143),
            )),
        Icon(Icons.close, color: Colors.deepPurple, size: 18),
      ],
    ));
  }
}
