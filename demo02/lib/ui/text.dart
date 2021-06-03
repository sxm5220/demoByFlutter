import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class TextValue extends StatelessWidget {
  const TextValue({Key key}) : super(key: key);

  Widget _buildDemo1() {
    return Container(
      width: 400,
      height: 800,
      color: Colors.white.withOpacity(.3),
      child: Column(
        children: [
          /* Text(
                '嘿嘿阿拉斯加短发就是大飞离开家啊说大飞ppddd',
                overflow: TextOverflow.visible,
                style: TextStyle(
                  //color: Colors.green,
                  fontSize: 20,
                ),
              ),
              Text(
                "哈哈",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 10,
                  shadows: [
                    Shadow(
                      color: Colors.blue,
                      offset: Offset(5, 5),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: "Symon",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                    TextSpan(text: "，"),
                    TextSpan(
                      text: "你好！你好！你好！你好！你好！你好！你好！你好！你好！你好！你好！你好！你好！",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("点击了");
                        },
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.blue,
                          ),
                          child: Text(
                            "判断题",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TextSpan(text: "莫毛毛密码"),
                    ]),
              ),*/
          Text.rich(
            TextSpan(
              text: "回复",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF999999),
              ),
              children: [
                TextSpan(
                  text: "@老孟：",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print("ontap");
                    },
                ),
                TextSpan(text: "你好，嘿嘿！"),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: "登陆即代表同意并阅读",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF999999),
              ),
              children: [
                TextSpan(
                    text: "《服务协议》",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Click==>");
                      }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDemo2() {
    return Container(
      child: Text(
        'Hello Flutter It is Awesome WOW',
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          color: Colors.black,
          fontSize: 50.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 2.0,
          wordSpacing: 20.0,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dotted,
        ),
      ),
    );
  }

  Widget _buildDemo3(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      width: double.infinity,
      height: 300.0,
      color: Colors.red,
      alignment: Alignment.center,
      padding: EdgeInsets.all(20.0),
      child: FlutterLogo(
        size: 100.0,
      ),
    );
    /*return Container(
      child: Center(
        child: Text(
          'hello flutter',
          textAlign: TextAlign.center,
        ),
      ),
      height: 350, //MediaQuery.of(context).size.height,
      width: 350, //MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(60.0),
          border: Border.all(width: 5, color: Colors.red)),
      /*decoration: ShapeDecoration(
        color: Colors.white,
        shadows: [
          BoxShadow(color: Colors.blue, blurRadius: 10.0),
        ],
        shape: Border.all(color: Colors.white, width: 2.0),
      ),*/ //FlutterLogoDecoration(),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildDemo3(context),
      ),
    );
  }
}
