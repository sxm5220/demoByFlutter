import 'package:flutter/material.dart';

class PopupMenuBtnDemo extends StatefulWidget {
  PopupMenuBtnDemo({Key key}) : super(key: key);

  @override
  _PopupMenuBtnDemoState createState() => _PopupMenuBtnDemoState();
}

class _PopupMenuBtnDemoState extends State<PopupMenuBtnDemo> {
  Widget _buildPopupMenuBtn() {
    return PopupMenuButton(
      offset: Offset(-30, 1), //弹出位置
      // child: Text("选择学科"),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.blue)),
      icon: Icon(Icons.add),
      elevation: 5,
      padding: EdgeInsets.all(5),
      color: Colors.white,
      onSelected: (value) {
        print("=>>$value");
      },
      onCanceled: () {
        print("onCanceled");
      },
      tooltip: "PopupMenuButton",
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem(
            child: Text("语文"),
            value: "语文",
          ),
          PopupMenuDivider(
            height: 50,
          ),
          PopupMenuItem(
            child: Text("数学"),
            value: "数学",
          ),
          PopupMenuDivider(
            height: 50,
          ),
          PopupMenuItem(
            child: Text("英语"),
            value: "英语",
          ),
          PopupMenuDivider(
            height: 50,
          ),
          CheckedPopupMenuItem(
            value: "历史",
            checked: true,
            child: Text("历史"),
          ),
        ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [_buildPopupMenuBtn()],
      ),
    );
  }
}
