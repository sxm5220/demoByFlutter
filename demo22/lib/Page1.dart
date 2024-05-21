import 'dart:ui';

import 'package:flutter/material.dart';

import 'Page2.dart';
import 'commont.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<Offset> slideRightAnimation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slideRightAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(1.0, 0.0)).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInCubic));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () async {
                controller.forward();
                await Future.delayed(const Duration(milliseconds: 1000));
                if (mounted) {
                  Navigator.push(context, _createRoute())
                      .then((value) => controller.reset());
                }
              },
              child: const Icon(
                Icons.search,
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Column(
        children: [
          SlideTransition(
            position: slideRightAnimation,
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Calendar(),
            ),
          ),
        ],
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const Page2(),
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          // final opacityTween = Tween(begin: 0.0, end: 1.0).animate(animation);
          return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              // child: FadeTransition(opacity: opacityTween, child: child));
              child: child);
        });
  }
}
