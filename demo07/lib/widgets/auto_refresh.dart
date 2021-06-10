import 'dart:async';

import 'package:flutter/cupertino.dart';

class AutoRefresh extends StatefulWidget {
  final Duration duration;
  final Widget child;

  AutoRefresh({Key? key, required this.duration, required this.child})
      : super(key: key);

  @override
  _AutoRefreshState createState() => _AutoRefreshState();
}

class _AutoRefreshState extends State<AutoRefresh> {
  int? keyValue;
  ValueKey? key;
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    keyValue = 0;
    key = ValueKey(keyValue);
    _recursiveBuild();
  }

  void _recursiveBuild() {
    _timer = Timer(widget.duration, () {
      setState(() {
        keyValue = keyValue! + 1;
        key = ValueKey(keyValue);
        _recursiveBuild();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
