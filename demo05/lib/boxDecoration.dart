import 'dart:ui';

import 'package:flutter/material.dart';

class BoxDecorationDemo extends StatelessWidget {
  const BoxDecorationDemo({Key? key}) : super(key: key);

  Widget _buildD1() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8.0,
            spreadRadius: 8.0,
            offset: Offset(1.0, 1.0),
          )
        ],
        color: Colors.red,
        border: Border.all(
          color: Colors.grey,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(50.0),
        image: DecorationImage(
          image: ExactAssetImage('asset/images/wudang.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildD2() {
    return Container(
      child: ClipOval(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(
            'asset/images/1.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BoxDecoration装饰盒子——背景图示例'),
      ),
      body: Center(
        child: _buildD2(),
      ),
    );
  }
}
