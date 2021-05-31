import 'dart:math';

import 'package:flutter/material.dart';

class FlowMenuDemo extends StatefulWidget {
  FlowMenuDemo({Key key}) : super(key: key);

  @override
  _FlowMenuDemoState createState() => _FlowMenuDemoState();
}

class _FlowMenuDemoState extends State<FlowMenuDemo>
    with TickerProviderStateMixin {
  AnimationController _ctrlAnimationCircle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ctrlAnimationCircle = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 80,
      duration: Duration(milliseconds: 300),
    );
    _ctrlAnimationCircle.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _ctrlAnimationCircle.dispose(); //销毁变量,释放资源
    super.dispose();
  }

  List<Widget> _buildFlowChildren() {
    return List.generate(
        5,
        (index) => Container(
              child: Icon(index.isEven ? Icons.timer : Icons.ac_unit,
                  color: Colors.primaries[index % Colors.primaries.length]),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Flow(
            delegate: FlowAnimatedCircle(_ctrlAnimationCircle.value),
            children: _buildFlowChildren(),
          ),
        ),
        Positioned.fill(
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              setState(() {
                _ctrlAnimationCircle.status == AnimationStatus.completed
                    ? _ctrlAnimationCircle.reverse()
                    : _ctrlAnimationCircle.forward();
              });
            },
          ),
        ),
      ],
    );
  }
}

class FlowAnimatedCircle extends FlowDelegate {
  final double radius;
  FlowAnimatedCircle(this.radius);

  @override
  void paintChildren(FlowPaintingContext context) {
    if (radius == 0) {
      return;
    }
    double x = 0;
    double y = 0;
    for (int i = 0; i < context.childCount; i++) {
      x = radius * cos(i * pi / (context.childCount - 1));
      y = radius * sin(i * pi / (context.childCount - 1));
      context.paintChild(i, transform: Matrix4.translationValues(x, -y, 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => true;
}
