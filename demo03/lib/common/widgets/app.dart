import 'package:demo03/common/values/values.dart';
import 'package:flutter/material.dart';

Widget transparentAppBar({
  required BuildContext context,
  required List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(""),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: AppColors.primaryText,
      ),
    ),
    actions: actions,
  );
}
