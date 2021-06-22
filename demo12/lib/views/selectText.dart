import 'package:demo12/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectText extends StatelessWidget {
  final bool isSelect;
  final String? title;
  const SelectText({Key? key, this.isSelect: true, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Colors.black.withOpacity(0),
      child: Text(
        title ?? "??",
        textAlign: TextAlign.center,
        style:
            isSelect ? StandardTextStyle.big : StandardTextStyle.bigWithOpacity,
      ),
    );
  }
}
