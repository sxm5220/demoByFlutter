import 'package:demo03/common/utils/utils.dart';
import 'package:demo03/common/values/values.dart';
import 'package:demo03/common/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwrodController = TextEditingController();

//logo
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(
        top: screenHeight(50),
      ),
      child: Text(
        '注册',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: screenFontSize(24),
          height: 1,
        ),
      ),
    );
  }

  //注册表单
  Widget _buildInputForm() {
    return Container(
      width: screenWidth(295),
      margin: EdgeInsets.only(
        top: screenHeight(49),
      ),
      child: Column(
        children: [
          // fullname input
          inputTextEdit(
            controller: _fullnameController,
            hintText: '全称',
            keyboardType: TextInputType.text,
            marginTop: 0,
          ),

          //email input
          inputTextEdit(
            controller: _emailController,
            hintText: '邮箱',
            keyboardType: TextInputType.emailAddress,
          ),

          //password input
          inputTextEdit(
            controller: _passwrodController,
            hintText: '密码',
            keyboardType: TextInputType.visiblePassword,
            isPassWord: true,
          ),
          Container(
            height: screenHeight(44),
            margin: EdgeInsets.only(
              top: screenHeight(15),
            ),
            child: btnFlatButtonWidget(
              onPressed: () {
                if (!duCheckStringLength(_fullnameController.value.text, 5)) {
                  toastInfo(msg: '用户名不能小于5');
                  return;
                }
                if (!duIsEmail(_emailController.value.text)) {
                  toastInfo(msg: '请正确输入邮箱');
                  return;
                }
                if (!duCheckStringLength(_passwrodController.value.text, 6)) {
                  toastInfo(msg: '密码不能小于6位');
                  return;
                }
                Navigator.pop(context);
              },
              width: 295,
              fontWeight: FontWeight.w600,
              title: '创建一个帐户',
            ),
          ),
          Container(
            height: screenHeight(40),
            margin: EdgeInsets.only(
              top: screenHeight(20),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                '忘记密码？',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w400,
                  fontSize: screenFontSize(16),
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //第三方
  Widget _buildThirdParyLogin() {
    return Container(
      width: screenWidth(295),
      margin: EdgeInsets.only(
        bottom: screenHeight(40),
      ),
      child: Column(
        children: [
          Text(
            '或使用三方登录',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w400,
              fontSize: screenFontSize(16),
            ),
          ),
          //按钮
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight(20),
            ),
            child: Row(
              children: [
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: 'twitter',
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: 'google',
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: 'facebook',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //有账号
  Widget _buildHaveAccountBtn() {
    return Container(
      margin: EdgeInsets.only(
        bottom: screenHeight(20),
      ),
      child: btnFlatButtonWidget(
        onPressed: () {
          Navigator.pop(context);
        },
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: '我有一个账号',
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(''),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              toastInfo(msg: '这是注册页面');
            },
            icon: Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
          ),
        ],
      ),
      //封装后的 appBar 报错????
      /*appBar: transparentAppBar(
        context: context,
        actions: [
          IconButton(
            onPressed: () {
              toastInfo(msg: '这是注册页面');
            },
            icon: Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
          ),
        ],
      ),*/
      body: Center(
        child: Column(
          children: [
            Divider(
              height: 1,
            ),
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdParyLogin(),
            _buildHaveAccountBtn(),
          ],
        ),
      ),
    );
  }
}
