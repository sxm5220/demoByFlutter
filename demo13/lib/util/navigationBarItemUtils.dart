import 'package:flutter/cupertino.dart';
import 'package:demo13/pages/pages.dart';

Image navBarItemWithImage(String name) =>
    Image.asset('assets/images/nav/$name', width: 20.0, height: 20.0);

var tabImages = [
  [
    navBarItemWithImage('ic_nav_news_normal.png'),
    navBarItemWithImage('ic_nav_news_actived.png')
  ],
  [
    navBarItemWithImage('ic_nav_tweet_normal.png'),
    navBarItemWithImage('ic_nav_tweet_actived.png')
  ],
  [
    navBarItemWithImage('ic_nav_discover_normal.png'),
    navBarItemWithImage('ic_nav_discover_actived.png')
  ],
  [
    navBarItemWithImage('ic_nav_my_normal.png'),
    navBarItemWithImage('ic_nav_my_pressed.png')
  ]
];

Image tabWithIcon(int currentIndex, int tabIndex) {
  if (currentIndex == tabIndex) {
    return tabImages[currentIndex][1];
  }
  return tabImages[currentIndex][0];
}

String tabWithTitle(int currentIndex, int tabIndex, List<String> tabTitles) {
  return tabTitles[currentIndex];
  // return Text(
  //   tabTitles[currentIndex],
  //   style: currentIndex == tabIndex
  //       ? TextStyle(color: Color(0xff63ca6c))
  //       : TextStyle(color: Color(0xff969696)),
  // );
}

final appBarTitles = ['资讯', '动态', '发现', '我的'];
var pages = [NewsListPage(), TweetsListPage(), DiscoveryPage(), MyInfoPage()];

Widget bottomNavigationBar(
    Color activeColor, int tabIndex, ValueChanged<int>? onTap) {
  return CupertinoTabBar(
    activeColor: activeColor, //themeColor,
    items: [
      BottomNavigationBarItem(
        icon: tabWithIcon(0, tabIndex),
        label: tabWithTitle(0, tabIndex, appBarTitles),
      ),
      BottomNavigationBarItem(
        icon: tabWithIcon(1, tabIndex),
        label: tabWithTitle(1, tabIndex, appBarTitles),
      ),
      BottomNavigationBarItem(
        icon: tabWithIcon(2, tabIndex),
        label: tabWithTitle(2, tabIndex, appBarTitles),
      ),
      BottomNavigationBarItem(
        icon: tabWithIcon(3, tabIndex),
        label: tabWithTitle(3, tabIndex, appBarTitles),
      ),
    ],
    currentIndex: tabIndex,
    onTap: onTap,
  );
}
