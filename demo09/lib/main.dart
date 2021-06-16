import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo09/second_page.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fancy Bottom Navigation',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: HomeScreen() //MyHomePage(title: 'Fancy Bottom Navigation'),
        );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        key: _bottomNavigationKey,
        index: 0,
        height: 70.0,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_page.toString(), textScaleFactor: 4.0),
              TextButton(
                  onPressed: () {
                    (_bottomNavigationKey.currentState
                            as CurvedNavigationBarState)
                        .setPage(1);
                  },
                  child: Text('Go to page of index 1'))
            ],
          ),
        ),
      ),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();

  _getPage(int page) {
    switch (page) {
      case 0:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('主页'),
            TextButton(
              child: Text(
                '进入下一页',
                style: TextStyle(color: Colors.red),
              ),
              // style: ButtonStyle(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
            ),
            TextButton(
              onPressed: () {
                final FancyBottomNavigationState fState = bottomNavigationKey
                    .currentState as FancyBottomNavigationState;
                fState.setPage(2);
              },
              child: Text(
                '跳转到购物车页面',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      case 1:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('搜索页面'),
          ],
        );
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('购物车页面'),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(
                iconData: Icons.home,
                title: "主页",
                onclick: () {
                  //点击图标跳转
                  final FancyBottomNavigationState fState = bottomNavigationKey
                      .currentState as FancyBottomNavigationState;
                  fState.setPage(1);
                }),
            TabData(
                iconData: Icons.search,
                title: '搜索',
                onclick: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()))),
            TabData(iconData: Icons.shopping_cart, title: '购物车')
          ],
          initialSelection: 0, //默认
          key: bottomNavigationKey,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          }),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
    );
  }
}
*/
