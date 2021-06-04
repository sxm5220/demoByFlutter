import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerUI extends StatelessWidget {
  const ContainerUI({Key key}) : super(key: key);

  Widget _buildContainer(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
          bottom: Radius.circular(80.0),
        ),
        color: Colors.green,
      ),
      child: Text('Hello'),
    );
    /*Container(
      height: 200,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
            offset: Offset(10.0, 10.0),
          ),
        ],
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(100),
        ),
        color: Colors.green,
      ),
      child: Text(
        'hello',
        style: TextStyle(color: Colors.white),
      ),
    );*/
    /*Container(
      height: 200,
      width: 200.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200.0),
        color: Colors.green,
      ),
      child: Text(
        'Hello',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );*/
    /*Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 20.0,
          ),
        ],
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://picsum.photos/200/300'),
        ),
      ),
    );*/
    /*Container(
      height: 100.0,
      width: 200.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            blurRadius: 12.0,
          ),
          BoxShadow(
            color: Colors.green,
            blurRadius: 40.0,
          ),
        ],
      ),
    );*/
    /*Container(
      margin: EdgeInsets.all(2.0),
      constraints: BoxConstraints(
        maxWidth: 600.0,
        minWidth: 600.0,
      ),
      width: 50.0,
      alignment: Alignment.topCenter,
      child: Image.network('https://picsum.photos/500/400'),
    );*/
    /*Container(
      margin: EdgeInsets.all(20.0),
      width: double.infinity,
      height: 300.0,
      color: Colors.red,
      alignment: Alignment.center,
      padding: EdgeInsets.all(20.0),
      child: FlutterLogo(
        size: 100.0,
      ),
    );*/
    /*return Container(
      child: Center(
        child: Text(
          'hello flutter',
          textAlign: TextAlign.center,
        ),
      ),
      height: 350, //MediaQuery.of(context).size.height,
      width: 350, //MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(60.0),
          border: Border.all(width: 5, color: Colors.red)),
      /*decoration: ShapeDecoration(
        color: Colors.white,
        shadows: [
          BoxShadow(color: Colors.blue, blurRadius: 10.0),
        ],
        shape: Border.all(color: Colors.white, width: 2.0),
      ),*/ //FlutterLogoDecoration(),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildContainer(context),
      ),
    );
  }
}
