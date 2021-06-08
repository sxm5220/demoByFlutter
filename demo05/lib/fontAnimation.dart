import 'package:flutter/material.dart';

class FontAnimationDemo extends StatefulWidget {
  FontAnimationDemo({Key? key}) : super(key: key);

  @override
  _FontAnimationDemoState createState() => _FontAnimationDemoState();
}

class _FontAnimationDemoState extends State<FontAnimationDemo>
    with SingleTickerProviderStateMixin {
  //补间动画
  Animation<double>? tween;
  //动画控制对象
  AnimationController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    tween = Tween(begin: 0.0, end: 1.0).animate(controller!)
      ..addListener(() {
        setState(() {
          /*var value = tween!.value;
          if (value > 0.5) {
            print(value);
            dispose();
          }*/
        });
      });
    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 动画'),
      ),
      body: GestureDetector(
        onTap: () {
          startAnimtaion();
        },
        child: Center(
          child: Text(
            '字体放大',
            style: TextStyle(
              fontSize: 60 * controller!.value,
            ),
          ),
        ),
      ),
    );
  }

  //重新开始执行动画
  startAnimtaion() {
    setState(() {
      controller!.forward(from: 0.0);
    });
  }

  //销毁动画
  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }
}
