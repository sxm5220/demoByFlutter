import 'package:flutter/material.dart';

import 'constant/sy_assets_path.dart';
import 'home/sy_home_page.dart';

class SyNavigationBar extends StatefulWidget {
  const SyNavigationBar({super.key});

  @override
  State<SyNavigationBar> createState() => _SyNavigationBarState();
}

class Items {
  String name, activeIcon, normalIcon;
  Items(this.name, this.activeIcon, this.normalIcon);
}

class _SyNavigationBarState extends State<SyNavigationBar> {
  int selectIndex = 0;
  List<Widget>? pages = [
    SyHomePage(),
    SyHomePage(),
    SyHomePage(),
  ];
  List<BottomNavigationBarItem>? itemList;
  final defaultItemColor = const Color.fromARGB(255, 125, 125, 125);
  final itemNames = [
    Items('首页', TabPath.tabHomeActive, TabPath.tabHomeNormal),
    Items('书影音', TabPath.tabSubjectActive, TabPath.tabSubjectNormal),
    Items('小组', TabPath.tabGroupActive, TabPath.tabGroupNormal),
  ];

  @override
  void initState() {
    super.initState();
    itemList = itemNames
        .map((item) => BottomNavigationBarItem(
            icon: Image.asset(
              item.normalIcon,
              width: 30,
              height: 30,
            ),
            label: item.name,
            activeIcon: Image.asset(
              item.activeIcon,
              width: 35,
              height: 35,
            )))
        .toList();
  }

  Widget _pagesWidget(int index) {
    return Offstage(
      offstage: selectIndex != index,
      child: TickerMode(
        enabled: selectIndex == index,
        child: pages![index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pagesWidget(0),
          _pagesWidget(1),
          _pagesWidget(2),
        ],
      ),
      // backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        currentIndex: selectIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: itemList!,
        onTap: (index) {
          setState(() {
            selectIndex = index;
          });
        },
      ),
    );
  }
}
