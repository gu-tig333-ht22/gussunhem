import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SecondPageState();
  }
}

class SecondPageState extends State<SecondPage> {
  late String title;
  late TextEditingController textInput;
  final _formKey = GlobalKey<FormState>();

  SecondPageState() {
    textInput = TextEditingController(text: '');
  }

  @override
  void initState() {
    super.initState();
    textInput = TextEditingController();
  }

  @override
  void dispose() {
    textInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("ToDo list"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 42, 53, 158),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _textField(),
            _addButton(),
          ],
        ),
      ),
    );
  }

  Widget _textField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 20),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter text in the field';
          }
          return null;
        },
        controller: textInput,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'What would you like to add?',
        ),
      ),
    );
  }

  Widget _addButton() {
    return Center(
        child: ElevatedButton.icon(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // != null
          Navigator.pop(
            context,
            textInput.text,
          );
        }
      },
      icon: const Icon(
        Icons.add,
        size: 14,
      ),
      label: const Text('ADD'),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 63, 29, 155)),
          textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
    ));
  }
}
