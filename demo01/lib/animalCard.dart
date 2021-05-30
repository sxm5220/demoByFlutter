import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_demo1/detailPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimalCard extends StatelessWidget {
  final String? heroTag;
  const AnimalCard({Key? key, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(375, 812),
        orientation: Orientation.portrait);
    return Container(
      child: GestureDetector(
        onTap: () {
          /*Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => DetailPage(
                      heroTag: heroTag,
                    )),
          );*/
        },
        child: Container(
          height: ScreenUtil().setHeight(210),
          width: ScreenUtil().setWidth(327),
          margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
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
                  height: ScreenUtil().setHeight(210),
                  width: ScreenUtil().setWidth(150),
                  decoration: BoxDecoration(
                      color: Color(0xFF525145),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          'asset/images/map_1.png',
                          height: ScreenUtil().setHeight(210),
                          width: ScreenUtil().setWidth(150),
                          color: Colors.white.withOpacity(0.05),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(16),
                              right: ScreenUtil().setWidth(16),
                              bottom: ScreenUtil().setHeight(18)),
                          child: Text(
                            "Trinidad And Tobago",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: ScreenUtil().setWidth(80),
                        top: ScreenUtil().setWidth(80),
                        child: Container(
                          height: ScreenUtil().setWidth(40),
                          width: ScreenUtil().setWidth(40),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color(0xFFFDCD00), width: 0.2),
                          ),
                          child: Container(
                            height: ScreenUtil().setWidth(5),
                            width: ScreenUtil().setWidth(5),
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
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(70),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: ScreenUtil().setWidth(14),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                width: ScreenUtil().setWidth(220),
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
