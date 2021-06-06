import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  const TextBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextButton示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextButton扁平按钮组件示例'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              print('TextButton扁平按钮组件');
            },
            child: Text(
              'TextButton',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
      ),
    );
  }
}
