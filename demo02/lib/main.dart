import 'package:flutter/material.dart';
import 'package:flutter_test2/ui/alertDialog.dart';
import 'package:flutter_test2/ui/button.dart';
import 'package:flutter_test2/ui/drawingboard.dart';
import 'package:flutter_test2/ui/flowMenu.dart';
import 'package:flutter_test2/ui/flowPopMenu.dart';
import 'package:flutter_test2/ui/listDemo.dart';
import 'package:flutter_test2/ui/listView.dart';
import 'package:flutter_test2/ui/popupMenu.dart';
import 'package:flutter_test2/ui/progress.dart';
import 'package:flutter_test2/ui/radio.dart';
import 'package:flutter_test2/ui/slider.dart';
import 'package:flutter_test2/ui/switch.dart';
import 'package:flutter_test2/ui/text.dart';

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
          backgroundColor: Colors.transparent,
          title: Text('Transparent AppBar'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        /*AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.yellow,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterLogo(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'title with image',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),*/
        /*AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'title',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  'subtitle',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ),*/
        /*AppBar(
          title: Text('Flutter 学习'),
          backgroundColor: Colors.red,
          elevation: 5.0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ],
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),*/
        body: Center(child: TextValue() //AlertDialogDemo() //PopupMenuBtnDemo()
            //ListViewDemo() //ButtonDemo() //FlowMenuDemo() //DemoFlowPopMenu()
            //LisetDemo() //SwitchDemo() //SwitchDemo() //SliderDemo() //RadioValue(),
            ),
      ),
    );
  }
}
