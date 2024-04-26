import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/database.dart';
import 'components/dialog_widget.dart';
import 'components/todo_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todoBox = Hive.box('todoBox');
  ToDoDataBase db = ToDoDataBase();
  final _controller = TextEditingController();
  final channel = const MethodChannel('.watchkitapp');

  @override
  void initState() {
    _initFlutterChannel();
    if (_todoBox.get("TODOLIST") == null) {
      db.createInitialData(channel, db);
    } else {
      db.loadData(channel, db);
    }
    super.initState();
  }

  Future<void> _initFlutterChannel() async {
    channel.setMethodCallHandler((call) async {
      // Receive data from Native
      switch (call.method) {
        case "updateFromNative":
          var index = call.arguments["data"]["index"];
          var status = call.arguments["data"]["status"];
          checkBoxChanged(status, index);
          break;
        default:
          break;
      }
    });
  }

  void checkBoxChanged(bool? value, int index) async {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    await db.updateDataBase(channel, db);
  }

  void saveNewTask() async {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    await db.updateDataBase(channel, db);
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogWidget(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) async {
    setState(() {
      db.toDoList.removeAt(index);
    });
    await db.updateDataBase(channel, db);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoWidget(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (value) => deleteTask(index));
        },
      ),
    );
  }
}
