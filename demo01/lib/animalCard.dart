import 'package:demo01/util/system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo01/detailPage.dart';

class AnimalCard extends StatelessWidget {
  final String? heroTag;
  const AnimalCard({Key? key, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => DetailPage(
                      heroTag: heroTag,
                    )),
          );
        },
        child: Container(
          height: screenWithHeight(210),
          width: screenWithWidth(327),
          margin: EdgeInsets.only(bottom: screenWithHeight(20)),
          decoration: BoxDecoration(
              color: Color(0xFF9C9288),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(5, 5),
                    blurRadius: 7)
              ],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: screenWithHeight(210),
                  width: screenWithWidth(150),
                  decoration: BoxDecoration(
                      color: Color(0xFF525145),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          'asset/images/map_1.png',
                          height: screenWithHeight(210),
                          width: screenWithWidth(150),
                          color: Colors.white.withOpacity(0.05),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: screenWithWidth(16),
                              right: screenWithWidth(16),
                              bottom: screenWithHeight(18)),
                          child: Text(
                            "Trinidad And Tobago",
                            style: TextStyle(
                              fontSize: screenWithFontSize(16),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWithWidth(80),
                        top: screenWithWidth(80),
                        child: Container(
                          height: screenWithWidth(40),
                          width: screenWithWidth(40),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color(0xFFFDCD00), width: 0.2),
                          ),
                          child: Container(
                            height: screenWithWidth(5),
                            width: screenWithWidth(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFFFDCD00),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: screenWithHeight(50),
                  width: screenWithWidth(70),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: screenWithWidth(14),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                width: screenWithWidth(220),
                child: Hero(
                  tag: heroTag ?? '',
                  child: Image.asset(
                    'asset/images/humingbird.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
