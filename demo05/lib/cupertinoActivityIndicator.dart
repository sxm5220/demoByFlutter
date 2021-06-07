import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoActivityIndicatorDemo extends StatelessWidget {
  const CupertinoActivityIndicatorDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoActivityIndicator示例'),
      ),
      body: Center(
        child: CupertinoActivityIndicator(
          radius: 20.0,
        ),
      ),
    );
  }
}
