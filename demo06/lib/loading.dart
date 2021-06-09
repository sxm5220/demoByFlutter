import 'package:flutter/material.dart';
import 'common/values/values.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //在加载页面停顿3秒
    Future.delayed(Duration(seconds: 3), () {
      print('Flutter即时通讯APP界面实现....');
      Navigator.of(context).pushReplacementNamed('app');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          assetWithFitImage('loading.jpeg'),
        ],
      ),
    );
  }
}
