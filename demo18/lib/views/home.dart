import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Mobile part of the app using Flutter

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _channel = const MethodChannel(
      "com.example.appleTest4"); // open channel using package name
  String? _title;

  @override
  void initState() {
    super.initState();

    _channel.setMethodCallHandler((call) async {
      final methodName = call.method;
      final args = call.arguments;

      if (methodName != "updateTextFromWatch") return;

      final text = args["text"];
      setState(() {
        _title = text;
      });
    });
  }

  void _updateText(String text) {
    setState(() {
      _title = text;
    });
    _sendNewTextToAppleWatch(text);
  }

  void _sendNewTextToAppleWatch(String text) {
    _channel.invokeMethod("forwardToAppleWatch", {
      "method": "updateTextFromFlutter",
      "data": {
        "text": text,
      },
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                _title ?? "Nothing communicated yet",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => _updateText("🐱"),
                  child: const Text(
                    '🐱',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                InkWell(
                  onTap: () => _updateText("🐶"),
                  child: const Text(
                    '🐶',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                InkWell(
                  onTap: () => _updateText("🐭"),
                  child: const Text(
                    '🐭',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                InkWell(
                  onTap: () => _updateText("🐍"),
                  child: const Text(
                    '🐍',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
