import 'package:demo01/util/system.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String? heroTag;
  DetailPage({Key? key, this.heroTag}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double paddingLeft = screenWithWidth(24);
    int widthRightSide = 130;
    int widthLeftSide = 375 - widthRightSide;

    return Material(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff4A423F),
                  Color(0xff9D8B8B),
                ],
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: screenWithWidth(widthRightSide),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(30)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF3D3730),
                      Color(0xFF837576),
                    ],
                  ),
                ),
                child: SafeArea(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: screenWithHeight(29),
                      ),
                      height: screenWithHeight(31),
                      width: screenWithWidth(70),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWithWidth(20),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Text(
                        "Skip",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: screenWithFontSize(12),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: screenWithHeight(29),
                      ),
                      height: screenWithHeight(50),
                      width: screenWithWidth(60),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWithWidth(20),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFFDCD00),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: screenWithWidth(20),
                      ),
                    )
                  ],
                )),
              ),
            ),
          ),
          Container(
            child: SafeArea(
              child: Container(
                width: screenWithWidth(widthLeftSide),
                padding: EdgeInsets.symmetric(horizontal: paddingLeft),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: screenWithHeight(29),
                      ),
                      width: screenWithWidth(50),
                      height: screenWithHeight(31),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: screenWithWidth(25),
                            height: screenWithHeight(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          Container(
                            width: screenWithHeight(5),
                            height: screenWithHeight(5),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          Container(
                            width: screenWithHeight(5),
                            height: screenWithHeight(5),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: screenWithWidth(5),
                            height: screenWithWidth(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFFDCD00),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: screenWithWidth(5),
                          ),
                          Text(
                            "Hummingbird",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWithFontSize(20),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: paddingLeft),
                      child: Text(
                        'Hummingbirds are birds native to the Americas and '
                        'constitute the biological family Trochilidae. '
                        'They are the smallest of birds, most species '
                        'measuring 7.5–13 cm (3–5 in) in length. The '
                        'smallest extant bird species is the 5 cm '
                        '(2.0 in) bee hummingbird, which weighs less '
                        'than 2.0 g (0.07 oz). They are known as '
                        'hummingbirds because of the humming sound '
                        'created by their beating wings, which flap at'
                        ' high frequencies audible to humans. They hover '
                        'in mid-air at rapid wing-flapping rates, which '
                        'vary from around 12 beats per second in the '
                        'largest species, to in excess of 80 in some of '
                        'the smallest. Of those species that have been '
                        'measured in wind tunnels, their top speeds '
                        'exceed 15 m/s (54 km/h; 34 mph) and some '
                        'species can dive at speeds in excess of 22'
                        ' m/s (79 km/h; 49 mph).',
                        style: TextStyle(
                          fontSize: screenWithFontSize(13),
                          color: Colors.white,
                        ),
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: screenWithHeight(29),
                      ),
                      height: screenWithHeight(60),
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWithWidth(20)),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        'Donate',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWithFontSize(12)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: screenWithHeight(-120),
            right: screenWithWidth(-200),
            height: screenWithHeight(812),
            child: Hero(
              tag: widget.heroTag ?? "",
              child: Image.asset(
                "asset/images/humingbird.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
