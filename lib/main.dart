import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'SecondPageClass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO app',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: HomePageClass());
  }
}

class TodoClass {
  TodoClass({required this.name, required this.status});
  String name; //String? name;
  bool status;
  //ta in en funktion tex void birthday()? anropa: TodoClass.birthday();

  get todoList => TodoClass;
}

class HomePageClass extends StatefulWidget {
  const HomePageClass({Key? key}) : super(key: key);

  @override
  _HomePageClassState createState() => _HomePageClassState();
}

class _HomePageClassState extends State<HomePageClass> {
  bool? status = false; // = TodoClass this.status
  final List<TodoClass> todoList = [
    TodoClass(name: '1', status: true),
    TodoClass(name: '2', status: true),
    TodoClass(name: '3', status: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 146, 193, 255),
      appBar: AppBar(
        title: Text("ToDo list"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 42, 53, 158),
      ),
      //_VertIconFilterWidget(), // hur lägger jag denna rätt?
      body: ListView.builder(
          // ListView statisk lista?
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            // todo istället för index?
            return Card(
              margin: EdgeInsets.all(11),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _listtileWidget(todoList[index]),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 42, 53, 158),
        tooltip: 'Add a TODO',
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => SecondPageClass())),
      ),
    );
  }

  Widget _listtileWidget(TodoClass todo) {
    //  listtile för att koppla samman tasks med checkbox?
    return ListTile(
      title: Text(todo.name),
      leading: Checkbox(
          value: false,
          onChanged:
              _onChanged), //(newValue) => setState(() => status = newValue),
      //value: status),
      trailing: _updateAndDeleteButtonWidget(todo),
    );
  }

  Widget _updateAndDeleteButtonWidget(TodoClass todo) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      IconButton(
        onPressed: () {
          setState(() {
            todoList.add(todo);
            //todoList[todo] = text;
          });
        },
        icon: Icon(Icons.edit),
      ),
      IconButton(
        onPressed: () {
          setState(() {
            todoList.remove(todo);
          });
        },
        icon: Icon(Icons.close),
      ),
    ]);
  }

/*Widget _VertIconFilterWidget(TodoClass todo) =>
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onPressed: () {
            PopupMenuButton(
                onSelected: (value) {
                  Provider.of<HomePageClass>(context, listen: false)
                      .setFilterBy(value);
                },
                itemBuilder: (context) => [
                      PopupMenuItem(child: Text('All'), value: 'all'),
                      PopupMenuItem(child: Text('Undone'), value: 'undone'),
                      PopupMenuItem(child: Text('Done'), value: 'done'),
                    ]);
          },
        );
      List<TodoList> todoList(list, filterBy) {
    if (filterBy == 'all') return list;
    if (filterBy == 'undone') return list.where((todo) => todo.toList());
    if (filterBy == 'done') return list.where((todo) => todo.toList());
  }*/

  void _onChanged(bool? value) {}
}

class SecondPageClass extends StatefulWidget {
  const SecondPageClass({Key? key}) : super(key: key);

  @override
  _SecondPageClassState createState() => _SecondPageClassState();
}

class _SecondPageClassState extends State<SecondPageClass> {
  String text = '';
  //final todo = List.from(todoList);

  final userInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("ToDo list"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 42, 53, 158),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: Center(
        child: Column(
          children: [
            //HomePageClass(), // Hur får jag todoList i HomePageClass att kunna användas i SecondPageClass?
            _TextfieldWidget(),
            _AddButtonWidget(),
          ],
        ),
      ),
    );
  }

  Widget _TextfieldWidget() => TextField(
      // argument: TodoClass todo ??
      controller: userInput,
      decoration: InputDecoration(hintText: 'What would you like to add?'),
      onChanged: (val) {
        setState(() {
          text = userInput.text;
          //TodoList.addItem(userInput.text);
        }); // todo.name? Hur får jag det att läggas till?
        //Navigator.pop(context);
      });

  Widget _AddButtonWidget() => IconButton(
        // argument: TodoClass todo ??
        icon: Icon(Icons.add, color: Colors.deepPurple),
        onPressed: () {
          setState(() {
            text = userInput.text;
            //TodoList.addItem(userInput.text);
          }); // Ska det vara todoList,TodoList, todo.name eller TodoClass?
          Navigator.pop(context);
        },
      );

  /*Widget _AddButtonWidget() => IconButton(
        icon: Icon(Icons.add),
        onPressed: () => insertItem(0, TodoClass),
      );

  void insertItem(int index, TodoList todo) {
    todo.insert(index, todo);
    key.currentState.insertItem(index); // text ist för todo?
  }*/
}
