import 'package:demo06/common/values/touch_callback.dart';
import 'package:demo06/common/values/values.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //定义焦点节点
  FocusNode focusNode = FocusNode();

//请求获取焦点
  _requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  //返回一个文本组件
  _getText(String text) {
    return TouchCallBack(
      child: Text(
        text,
        style: TextStyle(fontSize: 14.0, color: AppColors.naviBackground),
      ),
      onPressed: () {},
      isfeed: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                TouchCallBack(
                  child: Container(
                    height: 45.0,
                    margin: EdgeInsets.only(
                      left: 12.0,
                      right: 10.0,
                    ),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 45.0,
                  margin: EdgeInsets.only(left: 50, right: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: AppColors.naviBackground),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: _requestFocus(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: '搜索',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      //添加麦克风🎤图标
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.mic,
                          color: Color(0xffaaaaaa),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Text(
                '常用搜索',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _getText('朋友'),
                  _getText('聊天'),
                  _getText('群组'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _getText('Flutter'),
                  _getText('Dart'),
                  _getText('Swift'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
