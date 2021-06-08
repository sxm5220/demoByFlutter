import 'package:flutter/material.dart';

class ChartAnimationDemo extends StatefulWidget {
  ChartAnimationDemo({Key? key}) : super(key: key);

  @override
  _ChartAnimationDemoState createState() => _ChartAnimationDemoState();
}

class _ChartAnimationDemoState extends State<ChartAnimationDemo> {
  var height = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图标动画'),
      ),
      body: Center(
        child: Container(
          height: 400,
          alignment: AlignmentDirectional.bottomStart,
          child: InkWell(
            onTap: () {
              setState(() {
                height = 320;
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: 40.0,
                  height: height - 40.0,
                  color: Colors.greenAccent,
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(left: 10.0),
                  duration: Duration(seconds: 2),
                  width: 40.0,
                  height: height - 10,
                  color: Colors.yellow,
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(left: 10.0),
                  duration: Duration(seconds: 3),
                  width: 40.0,
                  height: height - 60,
                  color: Colors.red,
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(left: 10.0),
                  duration: Duration(seconds: 3),
                  width: 40.0,
                  height: height - 50,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
