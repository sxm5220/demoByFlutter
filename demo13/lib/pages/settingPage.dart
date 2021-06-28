import 'package:demo13/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '关于',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 1.0,
              height: 100.0,
              color: Colors.transparent,
            ),
            imageWithAsset('assets/images/ic_osc_logo.png', 200, 56),
          ],
        ),
      ),
    );
  }
}
