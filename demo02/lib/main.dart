import 'package:flutter/material.dart';
import 'package:flutter_test2/alertDialog.dart';
import 'package:flutter_test2/button.dart';
import 'package:flutter_test2/drawingboard.dart';
import 'package:flutter_test2/flowMenu.dart';
import 'package:flutter_test2/flowPopMenu.dart';
import 'package:flutter_test2/listDemo.dart';
import 'package:flutter_test2/listView.dart';
import 'package:flutter_test2/popupMenu.dart';
import 'package:flutter_test2/progress.dart';
import 'package:flutter_test2/radio.dart';
import 'package:flutter_test2/slider.dart';
import 'package:flutter_test2/switch.dart';
import 'package:flutter_test2/text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
          textTheme: TextTheme(
              bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 24,
      ))),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter 学习'),
        ),
        body: Center(child: AlertDialogDemo() //PopupMenuBtnDemo()
            //ListViewDemo() //ButtonDemo() //FlowMenuDemo() //DemoFlowPopMenu()
            //LisetDemo() //SwitchDemo() //SwitchDemo() //SliderDemo() //RadioValue(),
            ),
      ),
    );
  }
}
