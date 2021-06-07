import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabScaffoldDemo extends StatelessWidget {
  const CupertinoTabScaffoldDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
            ),
            label: '主页',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.conversation_bubble,
            ),
            label: '聊天',
          ),
        ],
        backgroundColor: CupertinoColors.lightBackgroundGray,
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return _buildHomePage();
              case 1:
                return _buildChatPage();
              default:
                return Container();
            }
          },
        );
      },
    );
  }
}

class _buildHomePage extends StatelessWidget {
  const _buildHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('主页'),
      ),
      child: Center(
        child: Text(
          '主页',
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}

class _buildChatPage extends StatelessWidget {
  const _buildChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('聊天面板'),
        trailing: Icon(CupertinoIcons.add),
        leading: Icon(CupertinoIcons.back),
      ),
      child: Center(
        child: Text(
          '聊天面板',
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
