import 'package:demo15/routerUtil.dart';
import 'package:demo15/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kTabHeight = 46.0;
const double _kTextAndIconTabHeight = 42.0;

class HomeTabBar extends StatefulWidget implements PreferredSizeWidget {
  final TabBar tabBar;
  final double translate;
  HomeTabBar({Key? key, required this.tabBar, required this.translate})
      : super(key: key);

  @override
  _HomeTabBarState createState() => _HomeTabBarState();

  @override
  Size get preferredSize {
    for (Widget item in tabBar.tabs) {
      if (item is Tab) {
        final Tab tab = item;
        if (tab.text != null && tab.icon != null) {
          return Size.fromHeight(
              _kTextAndIconTabHeight + tabBar.indicatorWeight);
        }
      }
    }
    return Size.fromHeight(_kTabHeight + tabBar.indicatorWeight);
  }
}

class _HomeTabBarState extends State<HomeTabBar> {
  double get allHeight => widget.preferredSize.height;

  double getTop(double translate) {
    return Tween(begin: allHeight, end: 0.0).transform(widget.translate);
  }

  Widget getOpacityWidget(Widget child) {
    if (widget.translate == 1) {
      return child;
    }
    return Opacity(
      opacity: Interval(0, 1, curve: Curves.fastOutSlowIn)
          .transform(widget.translate),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    var value = ScreenUtils.screenW(context) * 0.75 - 10.0;
    return Stack(
      children: [
        //搜索框
        Positioned(
          left: 15,
          right: value,
          top: getTop(widget.translate),
          child: getOpacityWidget(
            Container(
              padding: EdgeInsets.only(top: 3, bottom: 3, right: 10, left: 5),
              decoration: BoxDecoration(
                  color: Color.fromARGB(245, 236, 236, 236),
                  borderRadius: BorderRadius.all(Radius.circular(17))),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 128, 128, 129),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Align(
                        alignment: Alignment(1, 0),
                        child: Text(
                          '搜索',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 192, 192, 192)),
                        ),
                      ),
                      onTap: () {
                        RouterUtil.push(
                            context, RouterUtil.searchPage, '搜索流浪地球试一试');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Expanded(
                child: widget.tabBar,
                flex: 3,
              ),
              Expanded(
                child: Container(),
                flex: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
