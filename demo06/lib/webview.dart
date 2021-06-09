import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatefulWidget {
  WebView({Key? key}) : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://flutter.io/',
      appBar: AppBar(
        title: Text('Flutter官网'),
      ),
      withZoom: true,
      withLocalStorage: true,
    );
  }
}
