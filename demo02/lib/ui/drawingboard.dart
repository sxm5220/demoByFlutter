import 'package:flutter/material.dart';

class DrawingBoardDemo extends StatefulWidget {
  DrawingBoardDemo({Key key}) : super(key: key);

  @override
  _DrawingBoardDemoState createState() => _DrawingBoardDemoState();
}

class _DrawingBoardDemoState extends State<DrawingBoardDemo> {
  List<List<Offset>> _path = [];

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent pointerDownEvent) {
        setState(() {
          _path.add([pointerDownEvent.localPosition]);
        });
      },
      onPointerMove: (PointerMoveEvent p) {
        setState(() {
          _path[_path.length - 1].add(p.localPosition);
        });
      },
      onPointerCancel: (PointerCancelEvent p) {
        setState(() {
          _path[_path.length - 1].add(p.localPosition);
        });
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: DrawingBoardPainter(_path),
        ),
      ),
    );
  }
}

class DrawingBoardPainter extends CustomPainter {
  final List<List<Offset>> path;
  DrawingBoardPainter(this.path);

  Paint _paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;
  @override
  void paint(Canvas canvas, Size size) {
    path.forEach((element) {
      Path _p = Path();
      for (int i = 0; i < element.length; i++) {
        if (i == 0) {
          _p.moveTo(element[i].dx, element[i].dy);
        } else {
          _p.lineTo(element[i].dx, element[i].dy);
        }
      }
      canvas.drawPath(_p, _paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
