import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({Key key}) : super(key: key);

  Widget _buildStack() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 300,
          width: 300,
          color: Colors.red,
        ),
        Container(
          height: 250,
          width: 250,
          color: Colors.green,
        ),
        Container(
          height: 200,
          width: 200,
          color: Colors.yellow,
        ),
      ],
    );
  }

  Widget _buildContainerStack() {
    return Container(
      height: 400,
      width: 350,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 300,
              width: 200,
              color: Colors.red,
            ),
            Positioned(
              right: 0.0,
              // top: 0.0,
              // bottom: 0.0,
              child: Container(
                height: 250,
                width: 150,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildContainerStack(), //_buildStack(),
    );
  }
}
