import 'package:demo04/counter.dart';
import 'package:demo04/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Counter(),
        )
      ],
      child: MaterialApp(
        title: 'Provider事例',
        home: MyHome(),
      ),
    );
  }
}
