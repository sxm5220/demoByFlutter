import 'package:flutter/material.dart';

enum ButtonStatus { none, loading, done }

class ButtonDemo extends StatefulWidget {
  ButtonDemo({Key key}) : super(key: key);

  @override
  _ButtonDemoState createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  ButtonStatus _btn = ButtonStatus.none;

  Widget _buildBtn() {
    if (_btn == ButtonStatus.none) {
      return Text(
        "登陆",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      );
    } else if (_btn == ButtonStatus.loading) {
      return CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2,
      );
    } else if (_btn == ButtonStatus.done) {
      return Icon(
        Icons.check,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 240,
      height: 48,
      onPressed: () {
        setState(() {
          _btn = ButtonStatus.loading;
          Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _btn = ButtonStatus.done;
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  _btn = ButtonStatus.none;
                });
              });
            });
          });
        });
      },
      child: _buildBtn(),
      color: Colors.blue,
    );
  }
}
