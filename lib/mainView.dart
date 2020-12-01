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
          FilterKnapp(),
        ],
      ),
      body: Consumer<Model>(builder: (context, state, child) {
        return MinLista(filtreradLista(state.list, state.filter));
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () async {
            print("Knappen funkar");
            var thirdValue = await Navigator.push(
                context, MaterialPageRoute(builder: (context) => AndraVy()));

            if (thirdValue.task != "") {
              Provider.of<Model>(context, listen: false).addList(thirdValue);
            }
          },
        ),
      ),
    );
  }
}

class MinLista extends StatelessWidget {
  final List<ObjectCreate> listan;
  MinLista(this.listan);
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: listan.length,
        itemBuilder: (BuildContext context, index) =>
            taskItem(listan[index], context, index));
  }
}

taskItem(ObjectCreate listan, context, index) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(),
    ),
    child: CheckboxListTile(
      title: Text(
        listan.task,
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
      ),
      value: listan.valueOfCheckbox,
      onChanged: (bool fourthValue) {
        var state = Provider.of<Model>(context, listen: false);
        state.setCheckbox(index, fourthValue);
      },
      secondary: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          var state = Provider.of<Model>(context, listen: false);
          state.removeTask(state.list[index]);
        },
      ),
      controlAffinity: ListTileControlAffinity.leading,
    ),
  );
}

//filterknapp
class FilterKnapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Icon _icon = Icon(Icons.more_vert);
    return Consumer<Model>(
      builder: (context, state, child) => PopupMenuButton(
        onSelected: (value) {
          Provider.of<Model>(context, listen: false).setFilter(value);
        },
        icon: _icon,
        itemBuilder: (context) => [
          PopupMenuItem(
            child: ListTile(
              title: Text("All"),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text("Done"),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text("Not done"),
            ),
          ),
        ],
      ),
    );
  }
}

List<ObjectCreate> filtreradLista(list, filter) {
  if (filter == "Done") {
    print(list.where((object) => object.valueOfCheckbox == true).toList());
    return list.where((object) => object.valueOfCheckbox == true).toList();
  } else if (filter == "Not done") {
    return list.where((object) => object.valueOfCheckbox == false).toList();
  }

  return list;
}
