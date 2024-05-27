import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static Brightness get brightness => MediaQueryData.fromView(
          WidgetsBinding.instance.platformDispatcher.views.first)
      .platformBrightness;

  static bool get currentIsDark => AppTheme.brightness == Brightness.dark;

  static ThemeData basic({String? fontFamily}) {
    return ThemeData(
      useMaterial3: true,
      //在此处设备highlightColor、splashColor后，BottomNavigationBar 去掉点击水波纹效果
      highlightColor: const Color.fromRGBO(1, 0, 0, 0.0),
      splashColor: const Color.fromRGBO(1, 0, 0, 0.0),
      //fontFamily: fontFamily, //GetPlatform.isWeb ? null : Font.poppins, //字体样式,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.transparent,
        // primaryContainer: Colors.cyanAccent,
        brightness: brightness, //根据手机系统（明、暗）
        background: AppTheme.currentIsDark
            ? Colors.black
            : const Color.fromRGBO(
                255, 255, 255, 1), //Color.fromRGBO(245, 245, 245, 1),
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: AppTheme.currentIsDark ? Colors.black : Colors.white,
        color: AppTheme.currentIsDark ? Colors.black : Colors.white,
        iconTheme: IconThemeData(
            color: AppTheme.currentIsDark ? Colors.white : Colors.black),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppTheme.currentIsDark ? Colors.black : Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(
            size: 45.sp, color: const Color.fromRGBO(92, 146, 229, 1)),
        unselectedIconTheme: IconThemeData(
            size: 40.sp,
            color: AppTheme.currentIsDark
                ? const Color.fromRGBO(112, 112, 112, 1)
                : Colors.black54),
        selectedLabelStyle: TextStyle(color: Colors.cyan, fontSize: 28.sp),
        unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 24.sp),
      ),
      canvasColor: AppTheme.currentIsDark
          ? const Color(0xff0E1117)
          : const Color.fromRGBO(
              255, 255, 255, 1), //Color.fromRGBO(245, 245, 245, 1), //背景颜色
      cardColor: AppTheme.currentIsDark
          ? const Color(0xff161b22)
          : const Color.fromRGBO(255, 255, 255, 1), //card颜色
    );
  }
}
