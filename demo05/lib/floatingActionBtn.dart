import 'package:flutter/material.dart';

class FloatingActionBtn extends StatelessWidget {
  const FloatingActionBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FloatingActionButton示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FloatingActionButton示例'),
        ),
        body: Center(
          child: Text(
            'FloatingActionButton示例',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('你点击了FloatingActionButton')));
            },
            child: Icon(Icons.add),
            tooltip: '请点击FloatingActionButton',
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            elevation: 7.0,
            highlightElevation: 14.0,
            mini: false,
            shape: CircleBorder(),
            isExtended: false,
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
