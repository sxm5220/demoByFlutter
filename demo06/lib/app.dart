import 'package:demo06/chat/message_page.dart';
import 'package:demo06/common/values/values.dart';
import 'package:demo06/contacts/contacts.dart';
import 'package:demo06/mine/me.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //当前选中页面索引
  var _currentIndex = 0;
  //聊天页面
  MessagePage message = MessagePage();
  //好友页面
  Contacts contacts = Contacts();
  //我的页面
  Mine me = Mine();

  PopupMenuEntry _buildPopupMenuItem(String title,
      {String? imagePath, IconData? icon}) {
    return PopupMenuItem(
      child: Row(
        children: [
          imagePath != null
              ? assetWithImage(imagePath, 32.0, 32.0)
              : SizedBox(
                  width: 32.0,
                  height: 32.0,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('即时通讯'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                //弹出菜单
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                    items: <PopupMenuEntry>[
                      _buildPopupMenuItem('发起会话',
                          imagePath: 'icon_menu_group.png'),
                      _buildPopupMenuItem('添加好友',
                          imagePath: 'icon_menu_addfriend.png'),
                      _buildPopupMenuItem('联系客服', icon: Icons.person),
                    ]);
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed, //选中颜色
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '聊天',
            icon: _currentIndex == 0
                ? navBarItemWithImage('message_pressed.png')
                : navBarItemWithImage('message_normal.png'),
          ),
          BottomNavigationBarItem(
            label: '好友',
            icon: _currentIndex == 1
                ? navBarItemWithImage('contact_list_pressed.png')
                : navBarItemWithImage('contact_list_normal.png'),
          ),
          BottomNavigationBarItem(
            label: '我的',
            icon: _currentIndex == 2
                ? navBarItemWithImage('profile_pressed.png')
                : navBarItemWithImage('profile_normal.png'),
          ),
        ],
      ),
      body: currentPage(_currentIndex),
    );
  }

  currentPage(int index) {
    switch (index) {
      case 0:
        return message;
      case 1:
        return contacts;
      case 2:
        return me;
      default:
    }
  }
}
