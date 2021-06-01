import 'package:demo03/common/utils/utils.dart';
import 'package:demo03/common/values/colors.dart';
import 'package:demo03/common/values/radii.dart';
import 'package:flutter/material.dart';

/// 扁平圆角按钮
Widget btnFlatButtonWidget({
  required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  Color gbColor = AppColors.primaryElement,
  String title = "button",
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    width: screenWidth(width),
    height: screenHeight(height),
    child: TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(gbColor),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: Radii.k6pxRadius)),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontFamily: fontName,
          fontWeight: fontWeight,
          fontSize: screenFontSize(fontSize),
          height: 1,
        ),
      ),
    ),
  );
}

/// 第三方按钮
Widget btnFlatButtonBorderOnlyWidget({
  required VoidCallback onPressed,
  double width = 80,
  double height = 44,
  required String iconFileName,
}) {
  return Container(
    width: screenWidth(width),
    height: screenHeight(height),
    child: TextButton(
      child: Image.asset("assets/images/icons-$iconFileName.png"),
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: Radii.k6pxRadius))),
    ),
  );
}
