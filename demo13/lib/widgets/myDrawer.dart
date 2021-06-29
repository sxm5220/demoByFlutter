import 'package:demo13/pages/pages.dart';
import 'package:demo13/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final double WIDTH = 304.0;

  // 菜单文本前面的图标大小
  static const double IMAGE_ICON_WIDTH = 30.0;
  // 菜单后面的箭头的图标大小
  static const double ARROW_ICON_WIDTH = 16.0;

// 菜单
  List<Map> menuTitles = [
    {'title': '发布动弹', 'icon': 'assets/images/leftmenu/icon_me_file.png'},
    {'title': '动弹小黑屋', 'icon': 'assets/images/leftmenu/icon_me_file.png'},
    {'title': '设置', 'icon': 'assets/images/leftmenu/icon_me_file.png'},
    {'title': '关于', 'icon': 'assets/images/leftmenu/icon_me_file.png'}
  ];

  // const MyDrawer({Key? key}) : super(key: key);
  Widget _buildRenderRow(BuildContext context, int index) {
    if (index == 0) {
      var img = imageWithAsset('assets/images/cover_img.jpg', WIDTH, WIDTH);
      return Container(
        width: WIDTH,
        height: WIDTH,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: img,
      );
    }
    // 舍去之前的封面图
    index -= 1;
    // 如果是奇数则渲染分割线
    if (index.isOdd) {
      return Divider();
    }
    // 偶数，就除2取整，然后渲染菜单item
    index = index ~/ 2;
    // 菜单item组件
    var listItemContent = Padding(
      // 设置item的外边距
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      // Row组件构成item的一行
      child: Row(
        children: [
          // 菜单item的图标
          Padding(
            padding: EdgeInsets.fromLTRB(2.0, 0.0, 6.0, 0.0),
            child: imageWithAsset(menuTitles[index]['icon'], 28, 28),
          ),
          // 菜单item的文本，需要
          Expanded(
            child: Text(
              menuTitles[index]['title'],
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          // 菜单后面的箭头图片
          imageWithAsset('assets/images/ic_arrow_right.png', ARROW_ICON_WIDTH,
              ARROW_ICON_WIDTH)
        ],
      ),
    );
    return InkWell(
      child: listItemContent,
      onTap: () {
        switch (index) {
          case 0:
            // 发布动弹
            navPush(context, PublishTweetPage());
            break;
          case 1:
            // 小黑屋
            navPush(context, BlackHousePage());
            break;
          case 2:
            // 设置
            navPush(context, SettingPage());
            break;
          case 3:
            // 关于
            navPush(context, AboutPage());
            break;

          default:
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(width: WIDTH),
      child: Material(
        elevation: 16.0,
        child: ListView.builder(
          itemCount: menuTitles.length * 2 + 1,
          itemBuilder: _buildRenderRow,
          padding: EdgeInsets.all(0.0), // 加上这一行可以让Drawer展开时，状态栏中不显示白色
        ),
      ),
    );
  }
}
