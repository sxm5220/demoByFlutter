import 'package:demo08/vc/loginVC.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginVC(),
    );
  }
}
