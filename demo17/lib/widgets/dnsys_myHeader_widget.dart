import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../publick/constants.dart';
import 'dnsys_infoScreen_widget.dart';

class DnsysMyHeaderWidget extends StatefulWidget {
  const DnsysMyHeaderWidget(
      {super.key,
      required this.image,
      required this.textTop,
      required this.textBottom,
      required this.offset});
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;

  @override
  State<DnsysMyHeaderWidget> createState() => _DnsysMyHeaderWidgetState();
}

class _DnsysMyHeaderWidgetState extends State<DnsysMyHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF3383CD),
                  Color(0xFF11249F),
                ]),
            image:
                DecorationImage(image: AssetImage('assets/images/virus.png'))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const DnsysInfoScreenWidget();
                  }));
                },
                child: SvgPicture.asset('assets/svg/menu 2.svg')),
            Gap(20),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  top: (widget.offset < 0) ? 0 : widget.offset,
                  child: SvgPicture.asset(
                    widget.image,
                    width: 230,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Positioned(
                  top: 20 - widget.offset / 2,
                  left: 150,
                  child: Text(
                    '${widget.textTop} \n${widget.textBottom}',
                    style: kHeadingTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
