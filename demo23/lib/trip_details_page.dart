import 'package:demo23/widgets/trip_details_pageview_item.dart';
import 'package:flutter/material.dart';

import 'models/trip_data.dart';

class TripDetailsPage extends StatelessWidget {
  const TripDetailsPage({super.key, required this.data});
  final TripData data;

  @override
  Widget build(BuildContext context) {
    return TripDetailsBody(
      data: data,
    );
  }
}

class TripDetailsBody extends StatefulWidget {
  const TripDetailsBody({super.key, required this.data});
  final TripData data;

  @override
  State<TripDetailsBody> createState() => _TripDetailsBodyState();
}

class _TripDetailsBodyState extends State<TripDetailsBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final PageController _pageController;
  double offset = 0;
  late final Animation<double> _sizeXAnimation;
  late final Animation<double> _sizeYAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
      }
    });
    _pageController = PageController();
    _pageController.addListener(() {
      final screenHeight = MediaQuery.of(context).size.height;
      setState(() {
        offset = _pageController.offset / screenHeight;
      });
      if (_pageController.offset < -50.0) {
        if (!_animationController.isAnimating) {
          _animationController.forward();
        }
        // print("🦐 offset==>:$offset --- ${_pageController.offset}");
      }
    });

    _sizeXAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(_animationController);

    _sizeYAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (offset < 0.0) {
      offset = 0.0;
    } else if (offset > 1.0) {
      offset = 1.0;
    }
    // print("😁offset:$offset");
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is OverscrollNotification) {
          //print("🌹overscroll.overscroll::${notification.overscroll}");
          if (notification.overscroll < 0.5 &&
              notification.dragDetails != null &&
              notification.metrics.axisDirection == AxisDirection.down) {
            if (!_animationController.isAnimating) {
              _animationController.forward();
            }
          }
        } else {
          //print("🍉 overscroll:$notification");
        }
        return true;
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          //print("x:${_sizeXAnimation.value} y:${_sizeYAnimation.value}");
          return Transform.scale(
            scaleX: _sizeXAnimation.value,
            scaleY: _sizeYAnimation.value,
            child: Scaffold(
              appBar: _buildAppBar(context),
              extendBodyBehindAppBar: true,
              body: Stack(
                children: [
                  _buildBackground(),
                  _buildHeader(),
                  PageView(
                    scrollDirection: Axis.vertical,
                    controller: _pageController,
                    children: [
                      const SizedBox.shrink(),
                      TripDetailsPageViewItem(
                        data: widget.data,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      forceMaterialTransparency: true,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        style: IconButton.styleFrom(
          backgroundColor: Color.lerp(
                  Colors.white, Colors.black.withOpacity(0.25), 1 - offset) ??
              Colors.transparent,
        ),
        icon: Icon(Icons.close,
            color: Color.lerp(Colors.white, Colors.black, offset)),
      ),
      actions: [
        Opacity(
          opacity: offset,
          child: IconButton(
            icon: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://q6.itc.cn/q_70/images03/20240514/edff7fc31d05404cb97be496dd7785d2.jpeg'),
            ),
            onPressed: () {},
          ),
        )
      ],
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildHeader() {
    return Align(
      alignment: FractionalOffset(0, 1 - (offset)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const TitleSubtitle(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'date${widget.data.id}',
                    child: Opacity(
                      opacity: 1 - offset,
                      child: Text(
                        widget.data.date,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Color.lerp(
                                  Colors.white, Colors.black, offset),
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: Hero(
                      tag: 'title${widget.data.id}',
                      child: Text(
                        widget.data.title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Color.lerp(
                                  Colors.white, Colors.black, offset),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildUserChips(),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }

  Wrap _buildUserChips() {
    return Wrap(
      children: widget.data.userList
          .map(
            (user) => Container(
              margin: const EdgeInsets.only(right: 4),
              child: Hero(
                tag: "user${widget.data.id}${user.uid}",
                child: Material(
                  type: MaterialType.transparency,
                  child: Chip(
                    backgroundColor:
                        Color.lerp(Colors.white, Colors.grey[800], 1 - offset),
                    shape: const StadiumBorder(
                      side: BorderSide(
                          // color: Color.lerp(Colors.red, Colors.black26, height) ?? Colors.transparent,
                          ),
                    ),
                    side: BorderSide(
                        color: Color.lerp(
                                Colors.transparent, Colors.black26, offset) ??
                            Colors.transparent),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        user.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.lerp(Colors.white, Colors.black, offset),
                        ),
                      ),
                    ),
                    avatar: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 9,
                        backgroundImage: NetworkImage(user.img),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Positioned _buildBackground() {
    return Positioned.fill(
      child: Hero(
        tag: 'bg${widget.data.id}',
        child: Opacity(
          opacity: 1 - offset,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.data.imagePath),
                  colorFilter:
                      const ColorFilter.mode(Colors.black54, BlendMode.darken)),
            ),
          ),
        ),
      ),
    );
  }
}
