import 'dart:convert';

import 'package:demo13/api/api.dart';
import 'package:demo13/constants/Constants.dart';
import 'package:demo13/events/events.dart';
import 'package:demo13/pages/pages.dart';
import 'package:demo13/util/themeUtils.dart';
import 'package:demo13/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyInfoPage extends StatefulWidget {
  MyInfoPage({Key? key}) : super(key: key);

  @override
  _MyInfoPageState createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  var userAvatar;
  var userName;
  static const double IMAGE_ICON_WIDTH = 30.0;
  static const double ARROW_ICON_WIDTH = 16.0;
  List<Map> items = [
    {'title': '我的消息', 'img': 'assets/images/ic_my_message.png'},
    {'title': '阅读记录', 'img': 'assets/images/ic_my_blog.png'},
    {'title': '我的博客', 'img': 'assets/images/ic_my_blog.png'},
    {'title': '我的问答', 'img': 'assets/images/ic_my_question.png'},
    {'title': '我的活动', 'img': 'assets/images/ic_discover_pos.png'},
    {'title': '我的团队', 'img': 'assets/images/ic_my_team.png'},
    {'title': '邀请好友', 'img': 'assets/images/ic_my_recommend.png'},
  ];

  Widget iconImage(path) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: imageWithAsset(path, IMAGE_ICON_WIDTH, IMAGE_ICON_WIDTH),
    );
  }

  renderRow(i) {
    if (i == 0) {
      var avatarContainer = Container(
        color: ThemeUtils.currentColorTheme,
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              this.userAvatar == null
                  ? imageWithAsset(
                      'assets/images/ic_avatar_default.png', 60, 60)
                  : Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: NetworkImage(userAvatar), fit: BoxFit.cover),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
              Text(
                userName == null ? '点击头像登录' : userName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
      return GestureDetector(
        onTap: () {
          DataUtils.isLogin().then((isLogin) {
            if (isLogin) {
              // 已登录，显示用户详细信息
              _showUserInfoDetail();
            } else {
              // 未登录，跳转到登录页面
              _login();
            }
          });
        },
        child: avatarContainer,
      );
    }
    --i;
    if (i.isOdd) {
      return Divider(
        height: 1,
      );
    }
    i = i ~/ 2;

    return InkWell(
      onTap: () {
        _handleListItemClick(items[i]['title']);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Row(
          children: [
            iconImage(items[i]['img']),
            Expanded(
                child: Text(
              items[i]['title'],
              style: TextStyle(fontSize: 16),
            )),
            imageWithAsset('assets/images/ic_arrow_right.png', ARROW_ICON_WIDTH,
                ARROW_ICON_WIDTH)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length * 2,
      itemBuilder: (context, i) => renderRow(i),
    );
  }

  _handleListItemClick(String title) {
    // DataUtils.isLogin().then((isLogin) {
    //   if (!isLogin) {
    //     // 未登录
    _showLoginDialog();
    //   } else {
    //     DataUtils.getUserInfo().then((info) {
    //     navPush(context,
    //         CommonWebPage(title: '我的博客', url: 'https://sxm5220.github.io'));
    //     });
    //   }
    // });
  }

  _login() async {
    // 打开登录页并处理登录成功的回调
    final result = await navPush(context, LoginPage());
    // result为"refresh"代表登录成功
    if (result != null && result == 'refresh') {
      // 刷新用户信息
      _userInfo();
      // 通知动弹页面刷新
      Constants.eventBus.fire(LoginEvent());
    }
  }

// 获取用户信息
  _userInfo() async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String accessToken = sp.get(DataUtils.SP_AC_TOKEN) as String;
      Map<String, String> params = Map();
      params['access_token'] = accessToken;
      NetUtils.get(Api.userInfo, params: params).then((data) {
        if (data.isNotEmpty) {
          var map = json.decode(data);
          setState(() {
            userAvatar = map['avatar'];
            userName = map['name'];
          });
          DataUtils.saveUserInfo(map);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  _showLoginDialog() {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            title: Text('提示'),
            content: Text('没有登录，现在去登录吗？'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  '取消',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _login();
                },
                child: Text(
                  '确定',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          );
        });
  }

  _showUserInfoDetail() {}
}
