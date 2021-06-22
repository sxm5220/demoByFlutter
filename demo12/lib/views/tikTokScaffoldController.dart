import 'package:flutter/material.dart';

enum TikTokPagePosition {
  left,
  right,
  middle,
}

class TikTokScaffoldController extends ValueNotifier<TikTokPagePosition> {
  TikTokScaffoldController([
    TikTokPagePosition value = TikTokPagePosition.middle,
  ]) : super(value);

  Future Function(TikTokPagePosition pagePosition)? _onAnimateToPage;

  Future? animateToPage(TikTokPagePosition pagePosition) {
    return _onAnimateToPage?.call(pagePosition);
  }

  Future? animateToLeft() {
    return _onAnimateToPage?.call(TikTokPagePosition.left);
  }

  Future? animateToRight() {
    return _onAnimateToPage?.call(TikTokPagePosition.right);
  }

  Future? animateToMiddle() {
    return _onAnimateToPage?.call(TikTokPagePosition.middle);
  }
}

class TikTokScaffold extends StatefulWidget {
  final TikTokScaffoldController? controller;

  /// 首页的顶部
  final Widget? header;

  /// 底部导航
  final Widget? tabBar;

  /// 左滑页面
  final Widget? leftPage;

  /// 右滑页面
  final Widget? rightPage;

  final Widget? page;

  /// 视频序号
  final int currentIndex;

  final bool hasBottomPadding;
  final bool? enableGesture;

  final Function()? onPullDownRefresh;

  TikTokScaffold(
      {Key? key,
      this.header,
      this.tabBar,
      this.leftPage,
      this.rightPage,
      this.page,
      this.currentIndex: 0,
      this.hasBottomPadding: false,
      this.enableGesture,
      this.onPullDownRefresh,
      this.controller})
      : super(key: key);

  @override
  _TikTokScaffoldState createState() => _TikTokScaffoldState();
}

class _TikTokScaffoldState extends State<TikTokScaffold>
    with TickerProviderStateMixin {
  AnimationController? animationControllerX;
  AnimationController? animationControllerY;

  late Animation<double> animationX;
  late Animation<double> animationY;

  double offsetX = 0.0;
  double offsetY = 0.0;
  double inMiddle = 0;

  @override
  void initState() {
    widget.controller!._onAnimateToPage = animateToPage;
    super.initState();
  }

  Future animateToPage(p) async {}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
