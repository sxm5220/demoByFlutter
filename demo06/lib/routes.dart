import 'package:demo06/app.dart';
import 'package:demo06/search.dart';
import 'package:demo06/webview.dart';

///静态路由
var staticRoutes = {
  'app': (context) => App(),
  '/friends': (context) => WebView(),
  'search': (context) => Search(),
};
