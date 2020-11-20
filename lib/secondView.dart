import 'package:flutter/material.dart';

import 'model.dart';

class AndraVy extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Lägg till uppgifter"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Lägg till',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 125.0, top: 22),
                child: Row(
                  children: [
                    IconButton(
                        iconSize: 15.0,
                        icon: Icon(Icons.add),
                        onPressed: () {
                          Navigator.pop(
                              context,
                              ObjectCreate(
                                  valueOfCheckbox: false,
                                  task: controller.text));
                          print("added");
                        }),
                    _addText(),
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

Widget _addText() {
  return Text("Lägg till");
}
