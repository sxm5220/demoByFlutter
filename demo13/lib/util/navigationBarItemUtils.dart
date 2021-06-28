import 'package:flutter/cupertino.dart';

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
