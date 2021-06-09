import 'package:demo06/common/values/image.dart';
import 'package:demo06/common/values/touch_callback.dart';
import 'package:demo06/mine/im_item.dart';
import 'package:flutter/material.dart';

class Mine extends StatelessWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //头像
          Container(
            margin: EdgeInsets.only(top: 20.0),
            color: Colors.white,
            height: 80.0,
            child: TouchCallBack(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 12.0, right: 15.0),
                    child: assetWithImage('yixiu.jpeg', 70.0, 70.0),
                  ),
                  //用户名及帐号显示
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '一休',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF353535),
                          ),
                        ),
                        Text(
                          '账号 yixiu',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFFa9a9a9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //二维码图片显示
                  Container(
                    margin: EdgeInsets.only(left: 12.0, right: 15.0),
                    child: assetWithImage('code.png', 24.0, 24.0),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
          //列表项 使用ImItem渲染
          Container(
            margin: EdgeInsets.only(top: 20),
            color: Colors.white,
            child: ImItem(
              title: '好友动态',
              imagePath: 'icon_me_friends.png',
              type: ImType.Friend,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: Column(
              children: [
                ImItem(
                  title: '消息管理',
                  imagePath: 'icon_me_message.png',
                  type: ImType.Mess,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),
                ),
                ImItem(
                  title: '我的相册',
                  imagePath: 'icon_me_photo.png',
                  type: ImType.Pic,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),
                ),
                ImItem(
                  title: '我的文件',
                  imagePath: 'icon_me_file.png',
                  type: ImType.File,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),
                ),
                ImItem(
                  title: '联系客服',
                  imagePath: 'icon_me_service.png',
                  type: ImType.Customer,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: ImItem(
              title: '清理缓存',
              imagePath: 'icon_me_clear.png',
              type: ImType.Clear,
            ),
          ),
        ],
      ),
    );
  }
}
