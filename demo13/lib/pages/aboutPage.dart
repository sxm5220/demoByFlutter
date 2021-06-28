import 'package:demo13/util/imageUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
