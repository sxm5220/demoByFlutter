import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:t/publick/constants.dart';
import 'package:t/widgets/dnsys_imageTitle_widget.dart';
import 'package:t/widgets/dnsys_infoCard_widget.dart';
import 'package:t/widgets/dnsys_subscription_widget.dart';
import 'package:t/widgets/dnsys_weeklyChart_widget.dart';

import 'dnsys_pelvicRange_widget.dart';
import 'dnsys_search_widget.dart';
import 'dnsys_speed_widget.dart';

class DnsysMainPage extends StatefulWidget {
  const DnsysMainPage({super.key});

  @override
  State<DnsysMainPage> createState() => _DnsysMainPageState();
}

class _DnsysMainPageState extends State<DnsysMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/menu.svg'),
          onPressed: () {},
        ),
        title: const Text(
          'Test Page 测试页面',
          style: TextStyle(fontFamily: 'Eater'),
        ),
        elevation: 0,
        actions: const [
          Icon(Icons.add_circle_outline, size: 30),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoCardWidget(),
              _preventation(),
              _helpCard(context),
              _detailWidget(),
              _mapWidget(),
              const DnsysSubscriptionWidget(
                text: "Week subscription",
                amount: "1.99",
                imagePath: "assets/images/weekly.jpg",
              ),
              const DnsysSubscriptionWidget(
                text: "1 Month subscription",
                amount: "4.39",
                imagePath: "assets/images/monthly.jpg",
              ),
              const DnsysPelvicRangeWidget(
                title: '髋活动度',
                chartColor: Colors.blue,
                max: 15,
                servoHipPos: null,
              ),
              const DnsysSpeedWidget(
                title: '速度',
                chartColor: Colors.blue,
                max: 4,
                servoHipPos: null,
              ),
              DnsysSearchWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _infoCardWidget() {
    return Container(
      padding: EdgeInsets.all(30),
      width: double.infinity,
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(.2),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: [
          DnsysInfoCardWidget(
              title: 'Test1Test1Test1Test1Test1Test1',
              effectedNum: 1000,
              iconColor: Color(0xFFFF8C00),
              onTap: () {}),
          DnsysInfoCardWidget(
              title: 'Test1Test1Test1Test1Test1Test1',
              effectedNum: 1000,
              iconColor: Color(0xFFFF8C00),
              onTap: () {}),
          DnsysInfoCardWidget(
              title: 'Test1Test1Test1Test1Test1Test1',
              effectedNum: 1000,
              iconColor: Color(0xFFFF8C00),
              onTap: () {}),
          DnsysInfoCardWidget(
              title: 'Test1Test1Test1Test1Test1Test1',
              effectedNum: 1000,
              iconColor: Color(0xFFFF8C00),
              onTap: () {}),
        ],
      ),
    );
  }

  _preventation() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DnsysImageTitleWidget(
              svgSrc: 'assets/svg/hand_wash.svg', title: 'N1'),
          DnsysImageTitleWidget(svgSrc: 'assets/svg/use_mask.svg', title: 'N2'),
          DnsysImageTitleWidget(
              svgSrc: 'assets/svg/Clean_Disinfect.svg', title: 'N2')
        ],
      ),
    );
  }

  _helpCard(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              // left side padding is 40% of total width
              left: MediaQuery.of(context).size.width * .4,
              top: 20,
              right: 20,
            ),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF60BE93),
                  Color(0xFF1B8D59),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Dial 999 for  \nMedical Help!\n",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: "If any symptoms appear ",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset("assets/svg/nurse.svg"),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: SvgPicture.asset("assets/svg/virus.svg"),
          ),
        ],
      ),
    );
  }

  _detailWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 21),
                    blurRadius: 50,
                    color: Colors.black.withOpacity(.05))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Cases',
                    style: TextStyle(
                        color: kTextMediumColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                  SvgPicture.asset('assets/svg/more.svg'),
                ],
              ),
              Gap(15),
              Row(
                children: [
                  Text(
                    "547 ",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: kPrimaryColor, height: 1.2),
                  ),
                  Text(
                    "5.9% ",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  SvgPicture.asset("assets/icons/increase.svg")
                ],
              ),
              Gap(15),
              Text(
                "From Health Center",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: kTextMediumColor,
                  fontSize: 16,
                ),
              ),
              Gap(15),
              DnsysWeeklyWidget(),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buildInfoTextWithPercentage(
                    percentage: "6.43",
                    title: "From Last Week",
                  ),
                  buildInfoTextWithPercentage(
                    percentage: "9.43",
                    title: "Recovery Rate",
                  ),
                ],
              )
            ],
          )),
    );
  }

  _mapWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 21),
                  blurRadius: 50,
                  color: Colors.black.withOpacity(.05))
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Global Map",
                  style: TextStyle(
                    color: kTextMediumColor,
                    fontSize: 15,
                  ),
                ),
                SvgPicture.asset(
                  "assets/svg/more.svg",
                )
              ],
            ),
            Gap(10),
            SvgPicture.asset("assets/svg/map.svg")
          ],
        ),
      ),
    );
  }

  RichText buildInfoTextWithPercentage({String? title, String? percentage}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$percentage% \n",
            style: TextStyle(
              fontSize: 20,
              color: kPrimaryColor,
            ),
          ),
          TextSpan(
            text: title,
            style: TextStyle(
              color: kTextMediumColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class Point {
  final double x;
  final double y;
  Point({required this.x, required this.y});
}

class Segment {
  final Point start;
  final Point end;
  Segment({required this.start, required this.end});

  double length() {
    return end.x - start.x;
  }

  double diff() {
    return end.y - start.y;
  }

  bool isRising() {
    return diff() > 0;
  }

  bool isFalling() {
    return diff() < 0;
  }
}
