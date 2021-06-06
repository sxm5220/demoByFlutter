import 'package:demo05/alertDialog.dart';
import 'package:demo05/drawerLayout.dart';
import 'package:demo05/popupMenuBtn.dart';
import 'package:demo05/textBtn.dart';
import 'package:demo05/floatingActionBtn.dart';
import 'package:demo05/homePage.dart';
import 'package:demo05/textField.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // primaryColor: Colors.white,
        ),
        home:
            TextFieldDemo() //AlertDialogDemo(), //PopupMenuBtn() //TextBtn() //FloatingActionBtn() //DrawerLayout() //MyHomePage(title: 'HttpClient请求'),
        );
  }
}
