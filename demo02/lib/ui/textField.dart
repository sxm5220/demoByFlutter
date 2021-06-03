import 'package:flutter/material.dart';

class TextFieldValue extends StatelessWidget {
  const TextFieldValue({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _textFieldValue = "";

    return Container(
      child: Container(
        child: Column(
          children: [
            /*TextField(),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.add,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "姓名：",
                labelStyle: TextStyle(color: Colors.grey),
                helperMaxLines: 1,
                helperStyle: TextStyle(color: Colors.red),
                helperText: "请输入姓名",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "请输入用户名",
                hintStyle: TextStyle(color: Colors.grey),
                hintMaxLines: 1,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                errorText: "用户名输入错误！",
                errorStyle: TextStyle(fontSize: 12),
                errorMaxLines: 1,
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _textFieldValue = value;
                });
              },
              decoration: InputDecoration(
                counterText: "${_textFieldValue.length}/35",
              ),
            ),
            Container(
              height: 60,
              width: 250,
              child: TextField(
                onChanged: (value) {
                  print('onChanged:$value');
                },
                onEditingComplete: () {
                  print('complete');
                },
                onTap: () {
                  print('onTap');
                },
                obscureText: false, //密码样式
                decoration: InputDecoration(
                    fillColor: Color(0x30cccccc),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00FF0000),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    hintText: "QQ号/手机号/邮箱",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x00000000)),
                        borderRadius: BorderRadius.all(Radius.circular(100)))),
              ),
            ),*/
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                print("object");
              },
              decoration: InputDecoration(
                fillColor: Color(0x30cccccc),
                filled: true,
                hintText: "输入密码",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                  borderSide: BorderSide(
                    color: Color(0x00FF0000),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//TextField(maxLength: 100,buildCounter:())
