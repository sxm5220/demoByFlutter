import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogDemo extends StatefulWidget {
  AlertDialogDemo({Key key}) : super(key: key);

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  Widget _buildSimpleDialog() {
    return ElevatedButton(
      onPressed: () {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: Text("提示"),
                children: [
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    child: Text("确认删除吗？"),
                  ),
                  Divider(
                    height: 1,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop("");
                    },
                    child: Text("取消"),
                  ),
                  Divider(
                    height: 1,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop("");
                    },
                    child: Text("确认"),
                  ),
                ],
              );
            });
      },
      child: Text("自定义"),
    );
  }

  Widget _buildRaiseBtnWithiOS() {
    return ElevatedButton(
        onPressed: () {
          showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text("提示"),
                content: Text("确认删除吗？"),
                actions: [
                  CupertinoDialogAction(
                    child: Text("取消"),
                    onPressed: () {
                      print("取消");
                      Navigator.of(context).pop("");
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text("确认"),
                    onPressed: () {
                      print("确认");
                      Navigator.of(context).pop("");
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text("确认2"),
                    onPressed: () {
                      print("确认2");
                      Navigator.of(context).pop("");
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Text("iOS"));
  }

  Widget _buildRaiseBtn() {
    return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text("确认删除吗？"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          print("取消");
                          Navigator.of(context).pop("cancel");
                        },
                        child: Text("取消")),
                    TextButton(
                        onPressed: () {
                          print("确认");
                          Navigator.of(context).pop("ok");
                        },
                        child: Text("确认")),
                  ],
                );
              });
        },
        child: Text("切换"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        _buildRaiseBtn(),
        _buildRaiseBtnWithiOS(),
        _buildSimpleDialog()
      ],
    ));
  }
}
