import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:t/publick/constants.dart';
import 'package:t/widgets/dnsys_counter_widget.dart';
import 'package:t/widgets/dnsys_myHeader_widget.dart';
import 'package:t/widgets/dnsys_preventCard_widget.dart';
import 'package:t/widgets/dnsys_symptomCard_widget.dart';
import 'package:t/widgets/dnsys_users_widget.dart';

class DnsysMain2Page extends StatefulWidget {
  const DnsysMain2Page({super.key});

  @override
  State<DnsysMain2Page> createState() => _DnsysMain2PageState();
}

class _DnsysMain2PageState extends State<DnsysMain2Page> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
    _startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    _cancelTimer();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  late Timer _timer;
  bool isFirst = true;

  _startTimer() {
    /*创建循环*/
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        isFirst = !isFirst;
      });
    });
  }

  _cancelTimer() {
    isFirst = true;
    _timer.cancel();
  }

  bool isFullCard = true;

  final kDefualtShadow = BoxShadow(
    offset: Offset(5, 5),
    blurRadius: 10,
    color: Color(0xFFE9E9E9).withOpacity(0.56),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            DnsysMyHeaderWidget(
                image: isFirst
                    ? 'assets/svg/Drcorona.svg'
                    : "assets/svg/coronadr.svg",
                textTop: isFirst ? 'All you need' : "Get to know",
                textBottom: isFirst ? "is stay at home." : "",
                offset: offset),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Symptoms",
                    style: kTitleTextstyle,
                  ),
                  const Gap(20),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DnsysSymptomCardWidget(
                          image: 'assets/images/headache.png',
                          title: 'Headache',
                          isActive: true,
                        ),
                        DnsysSymptomCardWidget(
                            image: 'assets/images/caugh.png', title: 'Caugh'),
                        DnsysSymptomCardWidget(
                            image: 'assets/images/fever.png', title: 'Fever'),
                        DnsysSymptomCardWidget(
                            image: 'assets/images/caugh.png', title: 'Caugh'),
                        DnsysSymptomCardWidget(
                            image: 'assets/images/fever.png', title: 'Fever')
                      ],
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            travelSpots.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: DnsysUserCard(
                                user: travelSpots[index],
                                isFullCard: true,
                                press: () {},
                              ),
                            ),
                          ),
                          Gap(20),
                          AddNewPlaceCard(),
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                  const Text("Prevention", style: kTitleTextstyle),
                  const Gap(20),
                  const DnsysPreventCardWidget(
                      image: 'assets/images/wear_mask.png',
                      title: 'Wear face mask',
                      text:
                          'Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks'),
                  const DnsysPreventCardWidget(
                      image: 'assets/images/wear_mask.png',
                      title: 'Wear face mask',
                      text:
                          'Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks')
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/maps-and-flags.svg'),
                  Gap(20),
                  Expanded(
                      child: DropdownButton(
                    isExpanded: true,
                    underline: const SizedBox(),
                    icon: SvgPicture.asset('assets/svg/dropdown.svg'),
                    value: 'Indonesia',
                    items: ['Indonesia', 'Bangladesh', 'United States', 'Japan']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList(),
                    onChanged: (value) {},
                  ))
                ],
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "Case Update\n",
                          style: kTitleTextstyle,
                        ),
                        TextSpan(
                          text: "Newest update March 28",
                          style: TextStyle(
                            color: kTextLightColor,
                          ),
                        ),
                      ])),
                      Spacer(),
                      Text(
                        "See details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DnsysCounterWidget(
                          color: kInfectedColor,
                          number: 1046,
                          title: "Infected",
                        ),
                        DnsysCounterWidget(
                          color: kDeathColor,
                          number: 87,
                          title: "Deaths",
                        ),
                        DnsysCounterWidget(
                          color: kRecovercolor,
                          number: 46,
                          title: "Recovered",
                        ),
                      ],
                    ),
                  ),
                  Gap(20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Spread of Virus",
                        style: kTitleTextstyle,
                      ),
                      Text(
                        "See details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
