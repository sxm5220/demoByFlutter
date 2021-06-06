import 'package:flutter/material.dart';

enum ConferenceItem { AddMember, LockConference, ModifyLayout, TurnoffAll }

class PopupMenuBtn extends StatelessWidget {
  const PopupMenuBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButton组件示例'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry<ConferenceItem>>[
              PopupMenuItem<ConferenceItem>(
                child: Text('添加成员'),
                value: ConferenceItem.AddMember,
              ),
              PopupMenuItem<ConferenceItem>(
                child: Text('锁定会议室'),
                value: ConferenceItem.LockConference,
              ),
              PopupMenuItem<ConferenceItem>(
                child: Text('修改布局'),
                value: ConferenceItem.ModifyLayout,
              ),
              PopupMenuItem<ConferenceItem>(
                child: Text('挂断所有'),
                value: ConferenceItem.TurnoffAll,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
