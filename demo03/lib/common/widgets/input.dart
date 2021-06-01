import 'package:demo03/common/utils/utils.dart';
import 'package:demo03/common/values/values.dart';
import 'package:flutter/material.dart';

/// 输入框
Widget inputTextEdit({
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  required String hintText,
  bool isPassWord = false,
  double marginTop = 15,
}) {
  return Container(
    height: screenHeight(44),
    margin: EdgeInsets.only(top: screenHeight(marginTop)),
    decoration: BoxDecoration(
        color: AppColors.secondaryElement, borderRadius: Radii.k6pxRadius),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
          border: InputBorder.none),
      style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.w400,
          fontSize: screenFontSize(18)),
      maxLines: 1,
      autocorrect: false, //自动纠正
      obscureText: isPassWord, //密码样式
    ),
  );
}
