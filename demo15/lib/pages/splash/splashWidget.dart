import 'package:demo15/constant/constant.dart';
import 'package:demo15/pages/pages.dart';
import 'package:demo15/pages/splash/countDownWidget.dart';
import 'package:demo15/util/screenUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//打开app首页
class SplashWidget extends StatefulWidget {
  SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  var container = ContainerPage();
  bool showAd = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Offstage(
          child: container,
          offstage: showAd,
        ),
        Offstage(
          child: Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: ScreenUtils.screenW(context) / 3,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage(Constant.ASSETS_IMG + 'home.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          '落花有意随流水,流水无心恋落花',
                          style: TextStyle(fontSize: 15, color: Colors.black),
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
                        alignment: Alignment(1.0, 1.0),
                        child: Container(
                          margin: EdgeInsets.only(right: 30, top: 20),
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 2, bottom: 2),
                          child: CountDownWidget(
                            onCountDownFinishCallBack: (value) {
                              if (value) {
                                setState(() {
                                  showAd = false;
                                });
                              }
                            },
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffEDEDED),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Constant.ASSETS_IMG + 'ic_launcher.png',
                              width: 50,
                              height: 50,
                            ),
                            Padding(
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
            width: ScreenUtils.screenW(context),
            height: ScreenUtils.screenH(context),
            color: Colors.white,
          ),
          offstage: !showAd,
        ),
      ],
    );
  }
}
