import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonEndLine extends StatelessWidget {
  const CommonEndLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEEEEE),
      padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              height: 10,
            ),
            flex: 1,
          ),
          Text('我也是有底线的'),
          Expanded(
            child: Divider(
              height: 10,
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
