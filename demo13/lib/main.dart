import 'package:demo13/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo13/constants/Constants.dart';
import 'package:demo13/events/changeThemeEvent.dart';
import 'package:demo13/pages/pages.dart';
import 'package:demo13/util/util.dart';

void main() {
  runApp(MyOSCClient());
}

class MyOSCClient extends StatefulWidget {
  MyOSCClient({Key? key}) : super(key: key);

  @override
  _MyOSCClientState createState() => _MyOSCClientState();
}

class _MyOSCClientState extends State<MyOSCClient> {
  final appBarTitles = ['资讯', '动态', '发现', '我的'];
  var pages = [NewsListPage(), TweetsListPage(), DiscoveryPage(), MyInfoPage()];

  Color themeColor = ThemeUtils.currentColorTheme;
  int _tabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DataUtils.getColorThemeIndex().then((index) {
      if (index != null) {
        ThemeUtils.currentColorTheme = ThemeUtils.supportColors[index];
        Color color = ThemeUtils.supportColors[index];
        Constants.eventBus.fire(ChangeThemEvent(color: color));
      }
    });
    Constants.eventBus.on<ChangeThemEvent>().listen((event) {
      setState(() {
        themeColor = event.color;
      });
    });
  }

  Widget _buildBottomNavigationBar() {
    return CupertinoTabBar(
      activeColor: themeColor,
      items: [
        BottomNavigationBarItem(
          icon: tabWithIcon(0, _tabIndex),
          label: tabWithTitle(0, _tabIndex, appBarTitles),
        ),
        BottomNavigationBarItem(
          icon: tabWithIcon(1, _tabIndex),
          label: tabWithTitle(1, _tabIndex, appBarTitles),
        ),
        BottomNavigationBarItem(
          icon: tabWithIcon(2, _tabIndex),
          label: tabWithTitle(2, _tabIndex, appBarTitles),
        ),
        BottomNavigationBarItem(
          icon: tabWithIcon(3, _tabIndex),
          label: tabWithTitle(3, _tabIndex, appBarTitles),
        ),
      ],
      currentIndex: _tabIndex,
      onTap: (value) {
        setState(() {
          _tabIndex = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: themeColor),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            appBarTitles[_tabIndex],
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: IndexedStack(
          children: pages,
          index: _tabIndex,
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
        drawer: MyDrawer(),
      ),
    );
  }
}
