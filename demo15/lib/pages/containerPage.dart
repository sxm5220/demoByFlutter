import 'package:demo15/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///这个页面是作为整个APP的最外层的容器，以Tab为基础控制每个item的显示与隐藏
class ContainerPage extends StatefulWidget {
  ContainerPage({Key? key}) : super(key: key);

  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class Items {
  String name, activeIcon, normalIcon;
  Items(this.name, this.activeIcon, this.normalIcon);
}

class _ContainerPageState extends State<ContainerPage> {
  int selectIndex = 0;
  final ShopPage shopPage = ShopPage();
  List<Widget>? pages;
  List<BottomNavigationBarItem>? itemList;
  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);
  final itemNames = [
    Items('首页', 'assets/images/ic_tab_home_active.png',
        'assets/images/ic_tab_home_normal.png'),
    Items('书影音', 'assets/images/ic_tab_subject_active.png',
        'assets/images/ic_tab_subject_normal.png'),
    Items('小组', 'assets/images/ic_tab_group_active.png',
        'assets/images/ic_tab_group_normal.png'),
    Items('市集', 'assets/images/ic_tab_shiji_active.png',
        'assets/images/ic_tab_shiji_normal.png'),
    Items('我的', 'assets/images/ic_tab_profile_active.png',
        'assets/images/ic_tab_profile_normal.png')
  ];

  @override
  void initState() {
    super.initState();
    if (pages == null) {
      pages = [
        HomePage(),
        BookAudioVideoPage(),
        GroupPage(),
        shopPage,
        PersonCenterPage()
      ];
    }
    if (itemList == null) {
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
                width: 30,
                height: 30,
              )))
          .toList();
    }
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
          _pagesWidget(3),
          _pagesWidget(4)
        ],
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        currentIndex: selectIndex,
        fixedColor: Color.fromARGB(255, 0, 188, 96),
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
