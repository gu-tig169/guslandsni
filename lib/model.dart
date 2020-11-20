import 'package:flutter/material.dart';

class ObjectCreate {
  String task;
  bool valueOfCheckbox;

  ObjectCreate({this.task, this.valueOfCheckbox});
}

class Model extends ChangeNotifier {
  final List<ObjectCreate> list = new List();

  void addList(ObjectCreate object) {
    list.add(object);
    notifyListeners();
  }

  void removeTask(object) {
    list.remove(object);
    notifyListeners();
  }

  bool getCheckbox(index) {
    return list[index].valueOfCheckbox;
  }

  void setCheckbox(index, secondValue) {
    list[index].valueOfCheckbox = secondValue;
    notifyListeners();
  }
}
