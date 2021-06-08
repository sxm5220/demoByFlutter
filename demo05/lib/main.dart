import 'package:demo05/alertDialog.dart';
import 'package:demo05/boxDecoration.dart';
import 'package:demo05/card.dart';
import 'package:demo05/chartAnimation.dart';
import 'package:demo05/cupertinoActivityIndicator.dart';
import 'package:demo05/cupertinoAlertDialog.dart';
import 'package:demo05/cupertinoButton.dart';
import 'package:demo05/cupertinoTabScaffold.dart';
import 'package:demo05/drawerLayout.dart';
import 'package:demo05/fontAnimation.dart';
import 'package:demo05/listView.dart';
import 'package:demo05/popupMenuBtn.dart';
import 'package:demo05/textBtn.dart';
import 'package:demo05/floatingActionBtn.dart';
import 'package:demo05/homePage.dart';
import 'package:demo05/textField.dart';
import 'package:demo05/widgetDemo.dart';
import 'package:demo05/wrap.dart';
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
            ChartAnimationDemo() //FontAnimationDemo() //BoxDecorationDemo() //ListViewDemo() //WidgetDemo() //WrapDemo() //CupertinoTabScaffoldDemo() //CupertinoAlertDialogDemo() //CupertinoActivityIndicatorDemo() //CardDemo() //TextFieldDemo() //AlertDialogDemo(), //PopupMenuBtn() //TextBtn() //FloatingActionBtn() //DrawerLayout() //MyHomePage(title: 'HttpClient请求'),
        );
  }
}
