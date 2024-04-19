import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../publick/constants.dart';

class DnsysImageTitleWidget extends StatelessWidget {
  const DnsysImageTitleWidget(
      {super.key, required this.svgSrc, required this.title});
  final String svgSrc;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: kPrimaryColor),
        )
      ],
    );
  }
}
