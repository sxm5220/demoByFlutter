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

  Widget _buildMaterialBtn() {
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

  Widget _buildRaiseBtn() {
    // ignore: deprecated_member_use
    return RaisedButton(
      onPressed: () {},
      color: Colors.yellow,
      disabledTextColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 20.0,
      splashColor: Colors.green,
      highlightColor: Colors.red,
      highlightElevation: 1.0,
      child: Text('Raised Btn'),
    );
  }

  Widget _buildMaterialWithBtn() {
    return MaterialButton(
      onPressed: () {},
      minWidth: 250,
      colorBrightness: Brightness.dark,
      color: Colors.deepOrangeAccent,
      elevation: 20.0,
      splashColor: Colors.green,
      highlightElevation: 1,
      child: Text('Material btn'),
    );
  }

  Widget _buildFlatBtn() {
    return FlatButton(
      onPressed: () {},
      child: Text('Raised btn'),
      colorBrightness: Brightness.dark,
      color: Colors.deepOrangeAccent,
      splashColor: Colors.green,
      highlightColor: Colors.red,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20), right: Radius.circular(1))),
    );
  }

  Widget _buildOutlineBtn() {
    return OutlineButton(
      onPressed: () {},
      borderSide: BorderSide(
        width: 5,
        color: Colors.deepPurpleAccent,
      ),
      color: Colors.deepPurpleAccent,
      highlightedBorderColor: Colors.purple,
      splashColor: Colors.green,
      child: Text('Raised btn'),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.0), bottom: Radius.circular(1))),
    );
  }

  Widget _buildIconBtn() {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.build,
        size: 40,
      ),
      color: Colors.purple,
      splashColor: Colors.yellow,
    );
  }

  Widget _buildColum() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.orange,
          child: Icon(
            Icons.mic,
            size: 30.0,
            color: Colors.white,
          ),
        ),
        FloatingActionButton(
          onPressed: () {},
          mini: true,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.mic,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _buildColum(), //_buildIconBtn(), //_buildOutlineBtn(), //_buildFlatBtn(), //_buildMaterialWithBtn(), //_buildRaiseBtn(), //_buildBtn(), //_buildMaterialBtn(),
    );
  }
}
