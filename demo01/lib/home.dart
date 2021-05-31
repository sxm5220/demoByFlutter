import 'package:demo01/animalCard.dart';
import 'package:demo01/util/system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeClassIndex = 0;
  IconData activeMenuIcon = Icons.home;
  List<String> listCategory = ["All", "Birds", "Fishes", "Reptile"];
  List<IconData> listIcon = [
    Icons.home,
    Icons.adjust_rounded,
    Icons.apps,
    Icons.self_improvement_outlined
  ];
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(375, 812),
        orientation: Orientation.portrait);

    double paddingLeft = screenWithWidth(24);
    double paddingHeight = screenWithHeight(29);

    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff504944),
              Color(0xffA28E8F),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: paddingLeft,
                        vertical: paddingHeight,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.subject,
                            size: screenWithHeight(35),
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.search,
                            size: screenWithHeight(35),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: screenWithHeight(108),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listCategory.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    activeClassIndex = index;
                                    itemCount =
                                        listCategory[activeClassIndex].length;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  margin: EdgeInsets.only(
                                      left: index == 0 ? paddingLeft : 0),
                                  height: screenWithHeight(31),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWithWidth(20)),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: index == activeClassIndex
                                          ? Color(0xFFFDCD00)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  child: Text(
                                    listCategory[index],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: screenWithFontSize(15),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        String heroTag = "humingbird" + index.toString();
                        return Container(
                          child: AnimalCard(
                            heroTag: heroTag,
                          ),
                        );
                      },
                      itemCount: 3,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                    ),
                  ],
                ),
              ),
              Container(
                height: screenWithHeight(70),
                width: screenWithWidth(375),
                padding: EdgeInsets.symmetric(horizontal: paddingLeft),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: listIcon
                      .map(
                        (icon) => GestureDetector(
                          onTap: () {
                            setState(() {
                              activeMenuIcon = icon;
                            });
                          },
                          child: Container(
                            width: screenWithWidth(42),
                            height: screenWithWidth(42),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: activeMenuIcon == icon
                                    ? Color(0xFFB9AEAE)
                                    : Colors.transparent,
                                boxShadow: [
                                  BoxShadow(
                                      color: activeMenuIcon == icon
                                          ? Colors.black.withOpacity(0.1)
                                          : Colors.transparent,
                                      offset: Offset(5, 5),
                                      blurRadius: 5),
                                ]),
                            child: Icon(
                              icon,
                              color: Colors.white,
                              size: screenWithHeight(20),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
