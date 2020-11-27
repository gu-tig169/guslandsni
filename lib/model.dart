import 'package:flutter/material.dart';
import 'api.dart';

class ObjectCreate {
  String task;
  bool valueOfCheckbox;

  ObjectCreate({this.task, this.valueOfCheckbox});
}

class Model extends ChangeNotifier {
  final List<ObjectCreate> _list = [];
  List get list => _list;
  String _filter = 'All';
  String get filter => _filter;

  void addList(ObjectCreate object) {
    addTask(object);
    _list.add(object);
    notifyListeners();
  }

  void removeTask(kattpiss) {
    _list.remove(kattpiss);
    notifyListeners();
  }

  bool getCheckbox(index) {
    return _list[index].valueOfCheckbox;
  }

  void setCheckbox(index, secondValue) {
    _list[index].valueOfCheckbox = secondValue;
    notifyListeners();
  }

  List<ObjectCreate> filtreradLista(String filter) {
    if (filter == "Done") {
      notifyListeners();
      print(_list.where((object) => object.valueOfCheckbox == true).toList());
      return _list.where((object) => object.valueOfCheckbox == true).toList();
    } else if (filter == "Not done") {
      notifyListeners();
      return _list.where((object) => object.valueOfCheckbox == false).toList();
    }

    return _list;
  }

  void setFilter(filter2) {
    this._filter = filter2;
    notifyListeners();
  }
}
