import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/secondView.dart';

import 'model.dart';

class HuvudVy extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Att utföra",
        ),
        actions: [
          _filterKnapp(),
        ],
      ),
      body: MinLista(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          //backgroundColor: Colors.blueGrey[400],
          onPressed: () async {
            print("Knappen funkar");
            var thirdValue = await Navigator.push(
                context, MaterialPageRoute(builder: (context) => AndraVy()));

            Provider.of<Model>(context, listen: false).addList(thirdValue);
          },
        ),
      ),
    );
  }
}

class MinLista extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, state, child) => ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: state.list.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(),
              ),
              child: CheckboxListTile(
                value: state.getCheckbox(index),
                onChanged: (bool fourthValue) {
                  state.setCheckbox(index, fourthValue);

                  //Provider.of<Model>(context, listen: false).setCheckbox(index);
                },
                title: Text(
                  state.list[index].task,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                ),
                secondary: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    state.removeTask(state.list[index]);
                  },
                ),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            );
          }),
    );
  }
}

//Dropdown-meny med filtreringalternativ, ingen funktion annat är prints
Widget _filterKnapp() {
  List<String> choices = ["All", "Done", "Not done"];

  return Padding(
    padding: const EdgeInsets.only(right: 15.0),
    child: PopupMenuButton<String>(
      icon: Icon(
        Icons.tune_rounded,
      ),
      onSelected: choiceAction,
      itemBuilder: (BuildContext context) {
        return choices.map((String choice) {
          return PopupMenuItem(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    ),
  );
}

//Kollar så att knapparna i drop down fungerar
void choiceAction(String choice) {
  if (choice == "All") {
    print("You pressed: All");
  } else if (choice == "Done") {
    print("You pressed: Done");
  } else if (choice == "Not done") {
    print("You pressed: Not done");
  }
}
