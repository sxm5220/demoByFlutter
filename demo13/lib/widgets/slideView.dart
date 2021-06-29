import 'package:demo13/pages/pages.dart';
import 'package:demo13/util/util.dart';
import 'package:demo13/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideView extends StatefulWidget {
  final List data;
  final SlideViewIndicator slideViewIndicator;
  final GlobalKey globalKey;
  SlideView(
      {Key? key,
      required this.data,
      required this.slideViewIndicator,
      required this.globalKey})
      : super(key: key);

  @override
  _SlideViewState createState() => _SlideViewState();
}

class _SlideViewState extends State<SlideView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late List slideData;
  late final SlideViewIndicator slideViewIndicator;
  @override
  void initState() {
    super.initState();
    slideData = this.widget.data;
    tabController = TabController(length: slideData.length, vsync: this);
    tabController.addListener(() {
      // this.widget.globalKey.currentState.setSelectedIndex(tabController.index);
      (this.widget.globalKey as SlideViewIndicator)
          .createState()
          .setSelectedIndex(tabController.index);
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    if (slideData.length > 0) {
      for (var i = 0; i < slideData.length; i++) {
        var item = slideData[i];
        var imgUrl = item['imgUrl'];
        var title = item['title'];
        var detailUrl = item['detailUrl'];

        items.add(
          GestureDetector(
            onTap: () {
              navPush(
                context,
                NewsDetailPage(
                  id: detailUrl,
                ),
              );
            },
            child: Stack(
              children: [
                imageWithNetWork(
                    imgUrl, MediaQuery.of(context).size.width, BoxFit.cover),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0x50000000),
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    }
    // items.add(Container(
    //   color: Color(0x00000000),
    //   alignment: Alignment.bottomCenter,
    //   child: SlideViewIndicator(count: slideData.length),
    // ));
    return TabBarView(
      controller: tabController,
      children: items,
    );
  }
}
