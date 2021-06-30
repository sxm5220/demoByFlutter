import 'package:demo13/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweetsListPage extends StatefulWidget {
  TweetsListPage({Key? key}) : super(key: key);

  @override
  _TweetsListPageState createState() => _TweetsListPageState();
}

class _TweetsListPageState extends State<TweetsListPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black38,
          indicatorColor: ThemeUtils.currentColorTheme,
          isScrollable: false,
          indicatorSize:
              TabBarIndicatorSize.label, //下划线宽度依据（字体标签label宽度值，tab宽度值）
          tabs: [Tab(text: '动态列表'), Tab(text: '热门动态')],
        ),
        /* body: TabBarView(
          children: [
            RefreshIndicator(child: ListView.builder(itemBuilder: (context,i){

            }), onRefresh: );
          ],
        ),*/
      ),
    );
  }
}
