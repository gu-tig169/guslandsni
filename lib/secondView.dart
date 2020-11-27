import 'package:flutter/material.dart';

import 'model.dart';

class AndraVy extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Lägg till uppgifter"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Lägg till',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 120.0, top: 19),
                child: Row(
                  children: [
                    IconButton(
                        iconSize: 20.0,
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
