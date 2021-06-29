import 'package:demo13/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo13/constants/Constants.dart';
import 'package:demo13/events/changeThemeEvent.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: themeColor),
      home: Scaffold(
        appBar: AppBar(
          toolbarOpacity: 1.0,
          shadowColor: Colors.white10,
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
        bottomNavigationBar:
            bottomNavigationBar(themeColor, _tabIndex, (value) {
          setState(() {
            _tabIndex = value;
          });
        }),
        drawer: MyDrawer(),
      ),
    );
  }
}
