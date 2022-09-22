import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyState.dart';
import 'HomePage.dart';

void main() {
  var state = MyState();
  state.getTodo();

  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => state,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO app',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const HomePage());
  }
}
