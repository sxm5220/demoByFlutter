import 'dart:async';

import 'package:flutter/cupertino.dart';

class SyCountDownWidget extends StatefulWidget {
  const SyCountDownWidget({super.key, required this.onCountDownFinishCallBack});
  final Function(bool isFinish) onCountDownFinishCallBack;

  @override
  State<SyCountDownWidget> createState() => _SyCountDownWidgetState();
}

class _SyCountDownWidgetState extends State<SyCountDownWidget> {
  var seconds = 3;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
      style: const TextStyle(fontSize: 17),
    );
  }
}
