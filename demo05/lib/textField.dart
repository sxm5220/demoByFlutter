import 'package:flutter/material.dart';

class TextFieldDemo extends StatelessWidget {
  TextFieldDemo({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField组件示例'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            controller: controller,
            maxLength: 30,
            maxLines: 1,
            autocorrect: true,
            obscureText: false, //是否是密码
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: Colors.green,
            ),
            onChanged: (text) {
              print('文本内容改变时回调$text');
            },
            onSubmitted: (value) {
              print('内容提交时回调$value');
            },
            enabled: true,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              helperText: '用户名',
              prefixIcon: Icon(Icons.person),
              suffixText: '用户名',
            ),
          ),
        ),
      ),
    );
  }
}
