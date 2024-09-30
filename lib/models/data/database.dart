import 'package:hive/hive.dart';

class ToDoDataBase {
  List ToDoList = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    _myBox.put('key', 'value');
  }

  void loadData() {
    ToDoList = _myBox.get("TODOLIST");
  }

  void updateData() {
    _myBox.put("TODOLIST", ToDoList);
  }
}
