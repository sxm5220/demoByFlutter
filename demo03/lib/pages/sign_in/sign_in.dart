import 'package:demo03/common/utils/utils.dart';
import 'package:demo03/common/values/values.dart';
import 'package:demo03/common/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //email的控制器
  final TextEditingController _emailController = TextEditingController();
  //密码的控制器
  final TextEditingController _pwdController = TextEditingController();

  //logo
  Widget _buildLogo() {
    return Container(
      width: screenWidth(110),
      margin: EdgeInsets.only(top: screenHeight(40 + 44.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: screenWidth(76),
            width: screenWidth(76),
            margin: EdgeInsets.symmetric(horizontal: screenWidth(15)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: screenWidth(76),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: [Shadows.primaryShadow],
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          screenWidth(76 * 0.5),
                        ),
                      ),
                    ),
                    child: Container(),
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight(15),
            ),
            child: Text(
              '部门',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: screenFontSize(24),
                height: 1,
              ),
            ),
          ),
          Text(
            '消息',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontSize: screenFontSize(16),
              fontWeight: FontWeight.w400,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  /// 登陆表单
  Widget _buildInputForm() {
    return Container(
      width: screenWidth(295),
      margin: EdgeInsets.only(
        top: screenHeight(49),
      ),
      child: Column(
        children: [
          //email input
          inputTextEdit(
            controller: _emailController,
            hintText: '邮箱',
            keyboardType: TextInputType.emailAddress,
            marginTop: 0,
          ),
          //password input
          inputTextEdit(
            controller: _pwdController,
            hintText: '密码',
            keyboardType: TextInputType.visiblePassword,
            isPassWord: true,
          ),
          // 注册 登陆
          Container(
            height: screenHeight(44),
            margin: EdgeInsets.only(
              top: screenHeight(15),
            ),
            child: Row(
              children: [
                //注册
                btnFlatButtonWidget(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/sign-up',
                    );
                  },
                  gbColor: AppColors.thirdElement,
                  title: '注册',
                ),
                Spacer(),
                //登陆
                btnFlatButtonWidget(
                    onPressed: () {
                      if (!duIsEmail(_emailController.value.text)) {
                        toastInfo(msg: '请正确输入邮件');
                        return;
                      }
                      if (!duCheckStringLength(_pwdController.value.text, 6)) {
                        toastInfo(msg: '密码不能小于6位');
                        return;
                      }
                    },
                    gbColor: AppColors.primaryElement,
                    title: '登陆'),
              ],
            ),
          ),
          //Fogot password
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

  //第三方登陆
  Widget _buildThirdPartyLogin() {
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

  //注册按钮
  Widget _buildSignUpBtn() {
    return Container(
      margin: EdgeInsets.only(
        bottom: screenHeight(20),
      ),
      child: btnFlatButtonWidget(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/sign-up',
          );
        },
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: '注册',
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildSignUpBtn(),
          ],
        ),
      ),
    );
  }
}
