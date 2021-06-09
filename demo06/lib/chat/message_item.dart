import 'package:date_format/date_format.dart';
import 'package:demo06/chat/message_data.dart';
import 'package:demo06/common/values/touch_callback.dart';
import 'package:demo06/common/values/values.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final MessageData message;
  const MessageItem({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9)))),
      height: 64.0,
      child: TouchCallBack(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 13.0, right: 13.0),
                  child: assetWithImage('profile_pressed.png', 48,
                      48) //netWorkWithImage(message.avatar, 48.0, 48.0),
                  ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.title,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF353535),
                      ),
                      maxLines: 1,
                    ),
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Text(
                      message.subTitle,
                      style:
                          TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis, //省略号
                    ),
                  ],
                ),
              ),
              Container(
                //时间顶部对齐
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsets.only(right: 12.0, top: 12.0),
                child: Text(
                  formatDate(message.time, [HH, ':', nn, ':', ss]).toString(),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFFa9a9a9),
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {}),
    );
  }
}
