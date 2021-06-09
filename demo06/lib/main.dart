import 'package:demo06/routes.dart';
import 'package:demo06/loading.dart';
import 'package:flutter/material.dart';
import 'common/values/values.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '聊天室',
      theme: ThemeData(
        primaryColor: AppColors.naviBackground,
        scaffoldBackgroundColor: AppColors.primaryBackground,
        cardColor: AppColors.naviBackground,
      ),
      routes: staticRoutes,
      home: LoadingPage(),
    );
  }
}
