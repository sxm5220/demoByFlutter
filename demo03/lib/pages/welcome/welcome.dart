import 'package:demo03/common/utils/utils.dart';
import 'package:demo03/common/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildPageHeadTitle(),
            _buildPageHeadDetail(),
            _buildFeatureItem('feature-1', '引人注目的摄影和排版提供了一个美丽的阅读', 50),
            _buildFeatureItem("feature-2", "行业新闻从不与广告商或出版商分享您的个人数据", 20),
            _buildFeatureItem("feature-3", "您可以获得 Premium 以解锁数百种出版物", 20),
            Spacer(),
            _buildStartButton(context),
          ],
        ),
      ),
    );
  }
}

/// 页头标题
Widget _buildPageHeadTitle() {
  return Container(
    margin: EdgeInsets.only(top: screenHeight(60 + 44.0)),
    child: Text(
      '新闻',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontSize: screenFontSize(24),
          fontWeight: FontWeight.w600,
          height: 1),
    ),
  );
}

/// 页头说明
Widget _buildPageHeadDetail() {
  return Container(
    width: screenWidth(243),
    height: screenHeight(70),
    margin: EdgeInsets.only(top: screenHeight(14)),
    child: Text(
      '最好的新闻频道都集中在一个地方。 为您提供可信来源和个性化新闻',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.normal,
          fontSize: screenFontSize(16),
          height: 1.3),
    ),
  );
}

/// 特性说明
Widget _buildFeatureItem(String imageName, String intro, double marginTop) {
  return Container(
    width: screenHeight(280),
    height: screenHeight(80),
    margin: EdgeInsets.only(top: screenHeight(marginTop)),
    child: Row(
      children: [
        Container(
          width: screenWidth(80),
          height: screenHeight(80),
          child: Image.asset(
            'assets/images/$imageName.png',
            fit: BoxFit.none,
          ),
        ),
        Spacer(),
        Container(
          width: screenWidth(200),
          child: Text(
            intro,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              fontSize: screenFontSize(16),
            ),
          ),
        ),
      ],
    ),
  );
}

/// 开始按钮
Widget _buildStartButton(BuildContext context) {
  return Container(
    width: screenWidth(195),
    height: screenHeight(44),
    margin: EdgeInsets.only(bottom: screenHeight(60)),
    child: TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/sign-in");
      },
      child: Text(
        '进入',
        style: TextStyle(
          color: AppColors.primaryElementText,
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.primaryElement),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: Radii.k6pxRadius))),
    ),
  );
}
