import 'package:demo29/ruler/ruler_page.dart';
import 'package:flutter/cupertino.dart';

import 'menu/actionMenu.dart';
import 'menu/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter iOS Action Menu',
      debugShowCheckedModeBanner: false,
      home: RulerPage(),
    );
  }

  Widget actionMenuWidget() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsUtil.lightBlue,
            ColorsUtil.lightPurple,
            ColorsUtil.darkPurple,
            ColorsUtil.darkBlue,
          ],
          stops: [0, 0.3, 0.8, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: ActionMenu(),
      ),
    );
  }
}
