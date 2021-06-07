import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoAlertDialogDemo extends StatelessWidget {
  const CupertinoAlertDialogDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoAlertDialog示例'),
      ),
      body: Center(
        child: CupertinoAlertDialog(
          title: Text('提示'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('是否要删除？'),
                Text('一旦删除数据不可恢复！'),
              ],
            ),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text('确定'),
              onPressed: () {
                print('确定');
              },
            ),
            CupertinoDialogAction(
              child: Text('取消'),
              onPressed: () {
                print('取消');
              },
            ),
          ],
        ),
      ),
    );
  }
}
