import 'package:demo06/common/values/image.dart';
import 'package:demo06/common/values/touch_callback.dart';
import 'package:flutter/material.dart';

enum ImType { Friend, Mess, Pic, File, Customer, Clear }

class ImItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final Icon? icon;
  final ImType type;
  const ImItem(
      {Key? key,
      required this.title,
      required this.imagePath,
      this.icon,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
      onPressed: () {
        switch (type) {
          case ImType.Friend:
            Navigator.pushNamed(context, '/friends');
            break;
          case ImType.Mess:
            print('消息管理');
            break;
          case ImType.Pic:
            print('我的相册');
            break;
          case ImType.File:
            print('我的文件');
            break;
          case ImType.Customer:
            print('联系客服');
            break;
          case ImType.Clear:
            print('清理缓存');
            break;
          default:
        }
      },
      child: Container(
        height: 50.0,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 22, right: 22),
              // ignore: unnecessary_null_comparison
              child: imagePath != null
                  ? assetWithImage(imagePath, 32, 32)
                  : SizedBox(
                      height: 32,
                      width: 32,
                      child: icon,
                    ),
            ),
            //标题
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF353535),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
