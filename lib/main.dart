import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Niklas todolist",
        ),
        actions: [
          _dropdownMenu(),
          // IconButton(
          //     padding: EdgeInsets.fromLTRB(10.0, 10.0, 22.0, 10.0),
          //     iconSize: 30.0,
          //     icon: Icon(Icons.filter_list_rounded),
          //     tooltip: 'Filter button',
          //     onPressed: () {
          //       print('knappen funkar');
          //     }),
        ],
      ),
      body: ListView(
        children: [
          _checkboxListTodo("Tvätta"),
          _checkboxListTodo("Gömma nyckel"),
          _checkboxListTodo("Lägga locket på brunnen"),
          _checkboxListTodo("Mata katten"),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.black,
          onPressed: () {
            print("works");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondView()));
          },
        ),
      ),
    );
  }
}

Widget _dropdownMenu() {
  List<String> choices = ["All", "Done", "Not done"];
  return PopupMenuButton<String>(
    onSelected: choiceAction,
    itemBuilder: (BuildContext context) {
      return choices.map((String choice) {
        return PopupMenuItem(
          value: choice,
          child: Text(choice),
        );
      }).toList();
    },
  );
}

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Lägg till uppgifter"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: _textField(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 125.0, top: 22),
                child: Row(
                  children: [
                    _iconButton(),
                    _textAdd(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _textAdd() {
  return Text("add");
}

void choiceAction(String choice) {
  if (choice == 'Done') {
    print('You pressed Done');
  } else if (choice == 'Not done') {
    print('You pressed Not done');
  } else if (choice == 'All') {
    print('You pressed All');
  }
}

Widget _iconButton() {
  return IconButton(
      iconSize: 35.0,
      icon: Icon(Icons.add),
      onPressed: () {
        print("added");
      });
}

Widget _textField() {
  return TextField(
    decoration: InputDecoration(
      hintText: 'Lägg till',
      border: OutlineInputBorder(),
    ),
  );
}

Widget _checkboxListTodo(String toDo) {
  return CheckboxListTile(
      title: Text(toDo),
      value: false,
      onChanged: (value) {
        print("OK");
      });
}
