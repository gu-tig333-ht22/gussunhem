// //to-do-list
// statefulwidget for unchecking boxes

//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TODO',
        theme: ThemeData(primarySwatch: Colors.deepPurple), //rgb
        home: MyHomePage());
  }
}

// HomePage

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("TODO list!"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 71, 30, 140)),
      body: /*Container(
          color: Colors.blue,
          padding: EdgeInsets.all(40)),*/

          Center(
        child: Column(
          // MainAxisAlignment.something
          children: [
            // multiple values
            Progress(),
            TaskList(),
            ElevatedButton(
              child: Text('Add something to the TODO list'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[300],
                onPrimary: Colors.white,
                padding: EdgeInsets.all(30),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, //add TODO-item to list
        tooltip: 'Add a TODO',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// classes

class Progress extends StatelessWidget {
  // change name of class
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Here below you can add stuff to your TODO list;", // change color
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 62, 71, 154),
            )),
        LinearProgressIndicator(value: 7.0), // fade
      ],
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskItem(
          label: "This is something I want to add",
        ), // add bold text, wider between tasks
        TaskItem(
          label: "TODO 2",
        ), // add cross in right corner to remove task + remove from list
        TaskItem(
          label: "TODO 3",
        ),
        TaskItem(
          label: "TODO 4",
        ),
        TaskItem(
          label: "TODO 5",
        ),
      ],
    );
  }
}

class TaskItem extends StatelessWidget {
  // change to statefull
  final String label;

  const TaskItem({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(onChanged: null, value: false), // onChanged: cross/uncrossed
        Text(label,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
              color: Colors.deepPurple[600],
              fontStyle: FontStyle.italic,
            )), // download a font from google
      ],
    );
  }
}

// Add announcement "Task $task has been added to the TODO list!"


/* void printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
}

// This is where the app starts executing.
void main() {
  var number = 42; // Declare and initialize a variable.
  printInteger(number); */