import 'package:demo15/splash/sy_countDown_widget.dart';
import 'package:demo15/sy_navigationBar.dart';
import 'package:flutter/material.dart';

import '../constant/sy_assets_path.dart';

class SySplashWidget extends StatefulWidget {
  const SySplashWidget({super.key});

  @override
  State<SySplashWidget> createState() => _SySplashWidgetState();
}

class _SySplashWidgetState extends State<SySplashWidget> {
  var navigationBar = const SyNavigationBar();
  bool showAd = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Offstage(
          offstage: showAd,
          child: navigationBar,
        ),
        Offstage(
          offstage: !showAd,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            //color: Colors.white,
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width / 3,
                        //backgroundColor: Colors.white,
                        backgroundImage: AssetImage(ImagesPath.home),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          '落花有意随流水,流水无心恋落花',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: const Alignment(1.0, 1.0),
                        child: Container(
                          margin: const EdgeInsets.only(right: 30, top: 20),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 2, bottom: 2),
                          decoration: const BoxDecoration(
                              //color: Color(0xffEDEDED),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: SyCountDownWidget(
                            onCountDownFinishCallBack: (value) {
                              if (value) {
                                setState(() {
                                  showAd = false;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImagesPath.launcher,
                              width: 50,
                              height: 50,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Hi,豆芽',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
