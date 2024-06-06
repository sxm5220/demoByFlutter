import 'dart:async';

import 'package:demo26/pages/homepage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (kReleaseMode) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    } else {
      FlutterError.dumpErrorToConsole(details);
    }
  };

  setCustomErrorPage();

  runZonedGuarded(() {
    runApp(const MyApp());
  }, (error, stack) => catchError(error, stack));
}

void catchError(Object error, StackTrace stack) {
  print("❌：AppCatchError>>>:$kReleaseMode");
  print("❌：App出现异常：message:$error,stackTrace:$stack");
}

void setCustomErrorPage() {
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    debugPrint(flutterErrorDetails.toString());
    String stError = "未知";
    if (flutterErrorDetails.exception.toString().indexOf('data != null') !=
        -1) {
      stError = "某字段为空";
    }
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("👻👻👻:当前模块异常${',系统诊断为：' + stError},请于管理员联系！"),
                Text(
                  flutterErrorDetails.exceptionAsString(),
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ),
        ),
      ),
    );
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
