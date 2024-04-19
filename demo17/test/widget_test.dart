// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:t/main.dart';

void main() {
  group('DnsysTest', () {
    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
    test('t', () {
      /*int max = 20;
      double resDouble = max / 2;
      int resInt = max ~/ 2;
      debugPrint('resDouble:$resDouble resInt:$resInt');*/
      // 获取当前时间戳（毫秒）
      var currentTimestamp1 = DateTime.now();
      var currentTimestamp2 = DateTime.now().toUtc();
      var currentTimestamp3 = DateTime.now().microsecondsSinceEpoch;
      print(
          '当前时间戳（毫秒）：$currentTimestamp1 ::$currentTimestamp2 ::$currentTimestamp3');
    });
  });
}
