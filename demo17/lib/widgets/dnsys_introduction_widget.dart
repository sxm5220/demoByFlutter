import 'package:flutter/cupertino.dart';

class DnsysIntroductionWidget extends StatefulWidget {
  const DnsysIntroductionWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subTitle,
      this.imageWidth = 360,
      this.imageHeight = 360,
      this.titleTextStyle = const TextStyle(fontSize: 30),
      this.subTitleTextStyle = const TextStyle(fontSize: 20)});
  final String imageUrl;
  final String title;
  final String subTitle;
  final double? imageWidth;
  final double? imageHeight;
  final TextStyle titleTextStyle;
  final TextStyle subTitleTextStyle;

  @override
  State<DnsysIntroductionWidget> createState() =>
      _DnsysIntroductionWidgetState();
}

class _DnsysIntroductionWidgetState extends State<DnsysIntroductionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(widget.imageUrl),
              height: widget.imageHeight,
              width: widget.imageWidth,
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: widget.titleTextStyle,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(
            widget.subTitle,
            style: widget.subTitleTextStyle,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
