import 'package:flutter/material.dart';

class AppTheme {
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color? lightAccent = Colors.blueGrey[900];
  static Color darkAccent = Colors.white;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: lightPrimary,
    hintColor: lightAccent,
    // cardColor: lightAccent,
    // scaffoldBackgroundColor: lightBG,
    // appBarTheme: AppBarTheme(
    //   elevation: 0,
    //   titleTextStyle: TextStyle(
    //     color: darkBG,
    //     fontSize: 18.0,
    //     fontWeight: FontWeight.w800,
    //   ),
    // ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: darkPrimary,
    // hintColor: darkAccent,
    // scaffoldBackgroundColor: darkBG,
    // cardColor: darkAccent,
    // appBarTheme: AppBarTheme(
    //   elevation: 0,
    //   titleTextStyle: TextStyle(
    //     color: lightBG,
    //     fontSize: 18.0,
    //     fontWeight: FontWeight.w800,
    //   ),
    // ),
  );
}
