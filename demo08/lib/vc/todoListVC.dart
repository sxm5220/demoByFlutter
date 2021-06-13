import 'dart:html';

import 'package:demo08/helpers/databaseHelper.dart';
import 'package:demo08/models/taskModel.dart';
import 'package:demo08/vc/addTaskVC.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqlite_api.dart';

class TodoListVC extends StatefulWidget {
  TodoListVC({Key? key}) : super(key: key);

  @override
  _TodoListVCState createState() => _TodoListVCState();
}

class _TodoListVCState extends State<TodoListVC> {
  Future<List<Task>>? _taskList;
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  @override
  void initState() {
    super.initState();
    _updateTaskList();
  }

  Widget _buildTask(Task task) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          ListTile(
            title: Text(
              task.title!,
              style: TextStyle(
                  fontSize: 18,
                  decoration: task.status == 0
                      ? TextDecoration.none
                      : TextDecoration.lineThrough),
            ),
            subtitle: Text(
              '${_dateFormatter.format(task.date!)} * ${task.priority}',
              style: TextStyle(
                  fontSize: 15,
                  decoration: task.status == 0
                      ? TextDecoration.none
                      : TextDecoration.lineThrough),
            ),
            trailing: Checkbox(
              onChanged: (value) {
                task.status = value! ? 1 : 0;
                DataBaseHelper.instance.updateTask(task);
                _updateTaskList();
              },
              activeColor: Theme.of(context).primaryColor,
              value: task.status == 1 ? true : false,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => AddTaskVC(
                        updateTaskList: _updateTaskList(),
                        task: task,
                      )),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  _updateTaskList() {
    setState(() {
      _taskList = DataBaseHelper.instance.getTaskList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Text('Option 1'),
            Text('Option 2'),
            Text('Option 3'),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('TaskIt'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTaskVC(
                updateTaskList: _updateTaskList(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder(
        future: _taskList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final int? completedTaskCount = (snapshot.data as List<Task>)
              .where((Task task) => task.status == 1)
              .toList()
              .length;
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 60),
            itemCount: 1 + (snapshot.data as List<Task>).length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Tasks',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$completedTaskCount of ${(snapshot.data as List<Task>).length}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return _buildTask((snapshot.data as List<Task>)[index - 1]);
            },
          );
        },
      ),
    );
  }
}
