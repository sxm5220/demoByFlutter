import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget? navPush(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
    return widget;
  }));
  return null;
}
