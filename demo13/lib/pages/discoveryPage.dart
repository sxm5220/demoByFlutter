import 'package:demo13/pages/pages.dart';
import 'package:demo13/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem {
  String icon;
  String title;
  ListItem({required this.icon, required this.title});
}

class DiscoveryPage extends StatefulWidget {
  DiscoveryPage({Key? key}) : super(key: key);

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  static const String TAG_START = "startDivider";
  static const String TAG_END = "endDivider";
  static const String TAG_CENTER = "centerDivider";
  static const String TAG_BLANK = "blankDivider";

  static const double IMAGE_ICON_WIDTH = 30.0;
  static const double ARROW_ICON_WIDTH = 16.0;
  late final BuildContext cxt;

  final List listData = [];
  List<Map> items = [
    {"title": "开源软件", "image": "assets/images/ic_discover_softwares.png"},
    {"title": "码云推荐", "image": "assets/images/ic_discover_git.png"},
    {"title": "代码片段", "image": "assets/images/ic_discover_gist.png"},
    {"title": "扫一扫", "image": "assets/images/ic_discover_scan.png"},
    {"title": "摇一摇", "image": "assets/images/ic_discover_shake.png"},
    {"title": "码云封面人物", "image": "assets/images/ic_discover_nearby.png"},
    {"title": "线下活动", "image": "assets/images/ic_discover_pos.png"}
  ];

  @override
  void initState() {
    super.initState();
    listData.add(TAG_START);
    for (int i = 0; i < 3; i++) {
      listData.add(ListItem(title: items[i]['title'], icon: items[i]['image']));
      if (i == 2) {
        listData.add(TAG_END);
      } else {
        listData.add(TAG_CENTER);
      }
    }
    listData.add(TAG_BLANK);
    listData.add(TAG_START);
    for (int i = 3; i < 5; i++) {
      listData.add(ListItem(icon: items[i]['image'], title: items[i]['title']));
      if (i == 4) {
        listData.add(TAG_END);
      } else {
        listData.add(TAG_CENTER);
      }
    }
    listData.add(TAG_BLANK);
    listData.add(TAG_START);
    for (int i = 5; i < 7; i++) {
      listData.add(ListItem(icon: items[i]['image'], title: items[i]['title']));
      if (i == 6) {
        listData.add(TAG_END);
      } else {
        listData.add(TAG_CENTER);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: ListView.builder(
        itemBuilder: (context, i) => renderRow(context, i),
        itemCount: listData.length,
      ),
    );
  }

  renderRow(BuildContext context, int i) {
    var item = listData[i];
    if (item is String) {
      switch (item) {
        case TAG_START:
        case TAG_END:
          return Divider(height: 1);
        case TAG_CENTER:
          return Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: Divider(height: 1),
          );
        case TAG_BLANK:
          return Container(height: 20);
        default:
      }
    } else if (item is ListItem) {
      var listItemContent = Padding(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child:
                  imageWithAsset(item.icon, IMAGE_ICON_WIDTH, IMAGE_ICON_WIDTH),
            ),
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(fontSize: 16),
              ),
            ),
            imageWithAsset('assets/images/ic_arrow_right.png', ARROW_ICON_WIDTH,
                ARROW_ICON_WIDTH),
          ],
        ),
      );
      return InkWell(
        onTap: () {
          switch (item.title) {
            case "扫一扫":
              print('扫一扫');
              break;
            case "线下活动":
              navPush(context, OfflineActivityPage());
              break;
            case "码云推荐":
              navPush(
                  context,
                  CommonWebPage(
                      title: "码云推荐", url: "https://sxm5220.github.io"));
              break;
            case "代码片段":
              navPush(
                  context,
                  CommonWebPage(
                      title: "代码片段", url: "https://sxm5220.github.io"));
              break;
            case "开源软件":
              navPush(
                  context,
                  CommonWebPage(
                      title: "开源软件", url: "https://sxm5220.github.io"));
              break;
            case "码云封面人物":
              navPush(
                  context,
                  CommonWebPage(
                      title: "码云封面人物", url: "https://sxm5220.github.io"));
              break;
            default:
          }
        },
        child: listItemContent,
      );
    }
  }
}
