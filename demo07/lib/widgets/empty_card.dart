import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  final double? width;
  final double? heigth;
  const EmptyCard({Key? key, this.width, this.heigth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Colors.black12,
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
    );
  }
}
