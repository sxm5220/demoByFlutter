import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OfflineActivityPage extends StatefulWidget {
  OfflineActivityPage({Key? key}) : super(key: key);

  @override
  _OfflineActivityPageState createState() => _OfflineActivityPageState();
}

class _OfflineActivityPageState extends State<OfflineActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '线下活动',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
