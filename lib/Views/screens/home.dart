import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_hive/components/dialog_box.dart';
import 'package:notes_hive/components/todo_tile.dart';
import 'package:notes_hive/models/data/database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.ToDoList[index][1] = !db.ToDoList[index][1];
    });
    db.updateData();
  }

  void onNewTask() {
    setState(() {
      db.ToDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTaske() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: onNewTask,
            onCancel: Navigator.of(context).pop,
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.ToDoList.removeAt(index);
    });
    db.updateData();
    deleteTask(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hive To Do'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: createNewTaske,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.ToDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            deleteFunction: (context) => deleteTask,
            taskeCompleted: db.ToDoList[index][1],
            taskeName: db.ToDoList[index][0],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
