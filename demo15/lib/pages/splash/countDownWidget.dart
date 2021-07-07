import 'dart:async';

import 'package:flutter/cupertino.dart';

class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;
  CountDownWidget({Key? key, this.onCountDownFinishCallBack}) : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var seconds = 6;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (seconds <= 1) {
        widget.onCountDownFinishCallBack(true);
        cancelTimer();
        return;
      }
      seconds--;
    });
  }

  void cancelTimer() {
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$seconds',
      style: TextStyle(fontSize: 17),
    );
  }
}
