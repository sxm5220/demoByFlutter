import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  final _todoBox = Hive.box('todoBox');

  void createInitialData(MethodChannel channel, ToDoDataBase db) async {
    toDoList = [
      ["Test Todo List App", true],
      ["Slide me to left to delete", false],
    ];
    await sendDataToNative(channel, db);
  }

  void loadData(MethodChannel channel, ToDoDataBase db) async {
    toDoList = _todoBox.get("TODOLIST");
    await sendDataToNative(channel, db);
  }

  Future<void> updateDataBase(MethodChannel channel, ToDoDataBase db) async {
    _todoBox.put("TODOLIST", toDoList);
    await sendDataToNative(channel, db);
  }

  Future<void> sendDataToNative(MethodChannel channel, ToDoDataBase db) async {
    await channel.invokeMethod(
        "flutterToWatch", {"method": "sendDataToNative", "data": db.toDoList});
  }
}
