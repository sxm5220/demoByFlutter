import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo15/pages/home/home_app_bar.dart' as myapp;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static var tabs = ['动态', '推荐'];
  DefaultTabController getWidget() {
    return DefaultTabController(
        initialIndex: 1,
        length: tabs.length,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverOverlapAbsorber(
                  //child: myapp.SliverAppBar(pinned: true,expandedHeight: 120.0,primary: true,titleSpacing: 0.0,backgroundColor: Colors.white,)
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
              ];
            },
            body: TabBarView(
                children: tabs.map((e) => SliverContainer(name: e)).toList())));
  }

  @override
  Widget build(BuildContext context) {
    return getWidget();
  }
}

class SliverContainer extends StatefulWidget {
  final String name;
  SliverContainer({Key? key, required this.name}) : super(key: key);

  @override
  _SliverContainerState createState() => _SliverContainerState();
}

class _SliverContainerState extends State<SliverContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
