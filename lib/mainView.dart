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
          PopupMenuButton(
              onSelected: (value) {
                Provider.of<Model>(context, listen: false).setFilter(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('All'), value: 'All'),
                    PopupMenuItem(child: Text('Done'), value: 'Done'),
                    PopupMenuItem(child: Text('Not done'), value: 'Not done'),
                  ])
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

            if (thirdValue != null) {
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
            taskItem(listan[index], context));
  }
}

taskItem(ObjectCreate object, context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(),
    ),
    child: CheckboxListTile(
      title: Text(
        object.task,
        style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            decoration:
                object.valueOfCheckbox ? TextDecoration.lineThrough : null),
      ),
      value: object.valueOfCheckbox,
      onChanged: (bool fourthValue) {
        var state = Provider.of<Model>(context, listen: false);
        state.setCheckbox(object, fourthValue);
      },
      secondary: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          var state = Provider.of<Model>(context, listen: false);
          state.removeTask(object);
        },
      ),
      controlAffinity: ListTileControlAffinity.leading,
    ),
  );
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
