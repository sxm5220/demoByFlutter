import 'package:flutter/material.dart';

import '../publick/constants.dart';

class DnsysSymptomCardWidget extends StatelessWidget {
  const DnsysSymptomCardWidget({
    super.key,
    required this.image,
    required this.title,
    this.isActive = false,
  });
  final String image;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              isActive
                  ? BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 20,
                      color: kActiveShadowColor,
                    )
                  : BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      color: kShadowColor,
                    ),
            ]),
        child: Column(
          children: [
            Image.asset(image, height: 90),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
