import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressDemo extends StatefulWidget {
  ProgressDemo({Key key}) : super(key: key);

  @override
  _ProgressDemoState createState() => _ProgressDemoState();
}

class _ProgressDemoState extends State<ProgressDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: 0.3,
            backgroundColor: Colors.greenAccent,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
          CircularProgressIndicator(
            value: 0.3,
            backgroundColor: Colors.greenAccent,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
          CupertinoActivityIndicator(
            radius: 20,
          ),
        ],
      ),
    );
  }
}
