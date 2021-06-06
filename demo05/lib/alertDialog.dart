import 'package:flutter/material.dart';

class AlertDialogDemo extends StatelessWidget {
  const AlertDialogDemo({Key? key}) : super(key: key);

  Widget _buildAlertDialog() {
    return AlertDialog(
      title: Text('提示'),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text('是否要删除?'),
            Text('一旦删除数据不可恢复！'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            print('确定=>');
          },
          child: Text('确定'),
        ),
        TextButton(
          onPressed: () {
            print('取消=>');
          },
          child: Text('取消'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialog组件示例'),
      ),
      body: Center(
        child: _buildAlertDialog(),
      ),
    );
  }
}
