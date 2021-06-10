import 'package:demo07/widgets/auto_refresh.dart';
import 'package:demo07/widgets/empty_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CardColumnScreen extends StatefulWidget {
  CardColumnScreen({Key? key}) : super(key: key);

  @override
  _CardColumnScreenState createState() => _CardColumnScreenState();
}

class _CardColumnScreenState extends State<CardColumnScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoRefresh(
      duration: Duration(milliseconds: 2000),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: MediaQuery.of(context).size.width / 2,
                    child: FadeInAnimation(child: widget),
                  ),
                  children: [
                    EmptyCard(
                      width: MediaQuery.of(context).size.width,
                      heigth: 166.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          EmptyCard(
                            heigth: 50,
                            width: 50,
                          ),
                          EmptyCard(
                            heigth: 50,
                            width: 50,
                          ),
                          EmptyCard(
                            heigth: 50,
                            width: 50,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: EmptyCard(
                            heigth: 150,
                          ),
                        ),
                        Flexible(
                          child: EmptyCard(
                            heigth: 150,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: EmptyCard(
                              heigth: 50,
                            ),
                          ),
                          Flexible(
                            child: EmptyCard(
                              heigth: 50,
                            ),
                          ),
                          Flexible(
                            child: EmptyCard(
                              heigth: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                    EmptyCard(
                      width: MediaQuery.of(context).size.width,
                      heigth: 166,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
