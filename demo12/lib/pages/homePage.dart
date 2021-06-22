import 'package:demo12/views/tikTokTabBar.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  TikTokPageTag tabBarType = TikTokPageTag.home;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('data'),
    );
  }
}
