import 'package:demo08/helpers/databaseHelper.dart';
import 'package:demo08/models/taskModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class AddTaskVC extends StatefulWidget {
  final Function? updateTaskList;
  final Task? task;
  AddTaskVC({Key? key, this.updateTaskList, this.task}) : super(key: key);

  @override
  _AddTaskVCState createState() => _AddTaskVCState();
}

class _AddTaskVCState extends State<AddTaskVC> {
  final _formKey = GlobalKey<FormState>();
  String? _title = '';
  String? _priority = 'Low';
  DateTime? _date = DateTime.now();
  TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');
  final List<String> _priorities = ['Low', 'Medium', 'High'];
  @override
  void initState() {
    super.initState();
    _dateController.text = _dateFormatter.format(_date!);
    if (widget.task != null) {
      _title = widget.task!.title;
      _priority = widget.task!.priority;
      _date = widget.task!.date;
    }
  }

  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _date!,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormatter.format(date);
    }
  }

  _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('$_title, $_priority, $_date');
      Task task = Task(title: _title, date: _date, priority: _priority);
      if (widget.task == null) {
        task.status = 0;
        DataBaseHelper.instance.insertTask(task);
      } else {
        task.id = widget.task!.id;
        task.status = widget.task!.status;
        DataBaseHelper.instance.updateTask(task);
      }
      widget.updateTaskList!();
      Navigator.pop(context);
    }
  }

  _delete() {
    DataBaseHelper.instance.deleteTask(widget.task!.id);
    widget.updateTaskList!();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.task == null ? 'Add Task' : 'Update Task',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: TextFormField(
                            style: TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                labelText: 'Title',
                                labelStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            validator: (value) => value!.trim().isEmpty
                                ? 'Please Enter a Task Title'
                                : null,
                            onSaved: (newValue) => _title = newValue,
                            initialValue: _title,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: TextFormField(
                            readOnly: true,
                            controller: _dateController,
                            style: TextStyle(fontSize: 18),
                            onTap: _handleDatePicker(),
                            decoration: InputDecoration(
                                labelText: 'Date',
                                labelStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: DropdownButtonFormField(
                            isDense: true,
                            icon: Icon(Icons.arrow_drop_down_circle),
                            iconSize: 22,
                            iconDisabledColor: Theme.of(context).primaryColor,
                            style: TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                labelText: 'Priority',
                                labelStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) =>
                                value.toString().trim().isEmpty
                                    ? 'Please Select a Priority Level'
                                    : null,
                            items: _priorities
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _priority = value.toString();
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 60.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: TextButton(
                            onPressed: _submit(),
                            child: Text(
                              widget.task == null ? 'Add' : 'Update',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        widget.task != null
                            ? Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: TextButton(
                                  onPressed: _delete(),
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
