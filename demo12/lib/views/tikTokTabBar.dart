import 'package:demo12/style/style.dart';
import 'package:demo12/views/selectText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TikTokPageTag {
  home,
  follow,
  msg,
  me,
}

class TikTokTabBar extends StatelessWidget {
  final Function(TikTokPageTag)? onTabSwitch;
  final Function()? onAddButton;

  final bool hasBackground;
  final TikTokPageTag? current;

  const TikTokTabBar(
      {Key? key,
      this.onTabSwitch,
      this.onAddButton,
      this.hasBackground: false,
      this.current})
      : super(key: key);

  Flexible _buildGestureDetector(TikTokPageTag tag, String title) {
    return Expanded(
      child: GestureDetector(
        child: SelectText(
          isSelect: current == tag,
          title: title,
        ),
        onTap: () => onTabSwitch?.call(tag),
      ),
    );
  }

  Flexible _buildGestureDetectorWithIcon() {
    return Expanded(
      child: GestureDetector(
        child: Icon(
          Icons.add_box,
          size: 32,
        ),
        onTap: () => onAddButton?.call(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.of(context).padding;
    Widget row = Row(
      children: [
        _buildGestureDetector(TikTokPageTag.home, '首页'),
        _buildGestureDetector(TikTokPageTag.follow, '关注'),
        _buildGestureDetectorWithIcon(),
        _buildGestureDetector(TikTokPageTag.msg, '消息'),
        _buildGestureDetector(TikTokPageTag.me, '我'),
      ],
    );
    return Container(
      color: hasBackground ? ColorPlate.back2 : ColorPlate.back2.withOpacity(0),
      padding: EdgeInsets.only(bottom: padding.bottom),
      height: 50 + padding.bottom,
      child: row,
    );
  }
}
