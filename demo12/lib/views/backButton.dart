import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

class IosBackButton extends StatelessWidget {
  const IosBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tapped(
      child: Container(
        color: Colors.white.withOpacity(0),
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
        child: Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
