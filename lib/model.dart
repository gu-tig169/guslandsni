import 'package:flutter/material.dart';
import 'api.dart';

class ObjectCreate {
  String task;
  bool valueOfCheckbox;
  String id;

  ObjectCreate({this.id, this.task, this.valueOfCheckbox});

  static Map<String, dynamic> toJson(ObjectCreate object) {
    return {
      'title': object.task,
      'done': object.valueOfCheckbox,
    };
  }

  static ObjectCreate fromJson(Map<String, dynamic> json) {
    print(json);
    return ObjectCreate(
        id: json['id'], valueOfCheckbox: json['done'], task: json['title']);
  }
}

class Model extends ChangeNotifier {
  List<ObjectCreate> _list = [];
  List get list => _list;
  String _filter = 'All';
  String get filter => _filter;

  void addList(ObjectCreate object) async {
    _list.add(object);

    notifyListeners();
    await Api.addTask(object);
    // await Api.addTask(object);
    // await getList();
  }

  Future getList() async {
    List<ObjectCreate> list = await Api.getData();
    _list = list;
    notifyListeners();
  }

  void removeTask(ObjectCreate object) async {
    await Api.removeApiTask(object.id);
    await getList();
  }

  bool getCheckbox(index) {
    return _list[index].valueOfCheckbox;
  }

  void setCheckbox(ObjectCreate object, secondValue) async {
    object.valueOfCheckbox = secondValue;
    await Api.updateBoolValue(object);
    await getList();
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
