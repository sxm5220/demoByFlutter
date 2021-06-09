import 'package:demo06/contacts/contact_vo.dart';
import 'package:flutter/material.dart';

class ContactSiderList extends StatefulWidget {
  //好友列表项数据
  final List<ContactVO> items;
  //好友列表头构造器
  final IndexedWidgetBuilder headerBuilder;
  //好友列表项构造器
  final IndexedWidgetBuilder itemBuilder;
  //字母构造器
  final IndexedWidgetBuilder sectionBuilder;

  ContactSiderList(
      {Key? key,
      required this.items,
      required this.headerBuilder,
      required this.itemBuilder,
      required this.sectionBuilder})
      : super(key: key);

  @override
  _ContactSiderListState createState() => _ContactSiderListState();
}

class _ContactSiderListState extends State<ContactSiderList> {
  //列表滚动控制器
  final ScrollController _scrollController = ScrollController();

  bool _onNotification(ScrollNotification notification) => true;

  //判断并显示头部视图或空容器
  _isShowHeaderView(index) {
    if (index == 0 && widget.headerBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    return Container();
  }

  //根据定位判断是否显示好友列表头
  bool _shouldShowHeader(int position) {
    if (position <= 0) {
      return false;
    }
    if (position != 0 &&
        widget.items[position].seationKey !=
            widget.items[position - 1].seationKey) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NotificationListener(
            onNotification: _onNotification,
            child: ListView.builder(
              controller: _scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      _isShowHeaderView(index),
                      Offstage(
                        offstage: _shouldShowHeader(index),
                        child: widget.sectionBuilder(context, index),
                      ),
                      Column(
                        children: [
                          widget.itemBuilder(context, index),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
