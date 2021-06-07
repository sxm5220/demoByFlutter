import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoButtonDemo extends StatelessWidget {
  const CupertinoButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoButton按钮组件'),
      ),
      body: Center(
        child: CupertinoButton(
          color: Colors.blue,
          child: Text('CupertinoButton'),
          onPressed: () {},
        ),
      ),
    );
  }
}
