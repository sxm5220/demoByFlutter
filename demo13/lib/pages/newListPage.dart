import 'dart:convert';

import 'package:demo13/api/api.dart';
import 'package:demo13/constants/Constants.dart';
import 'package:demo13/pages/pages.dart';
import 'package:demo13/util/util.dart';
import 'package:demo13/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

final slideViewIndicatorStateKey = GlobalKey(); //<SlideViewIndicatorState>s

class NewsListPage extends StatefulWidget {
  NewsListPage({Key? key}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  /*
  final ScrollController _controller = ScrollController();

  late List listData;
  late List slideData;
  var curPage = 1;
  late SlideView slideView;
  var listTotalSize = 0;
  late SlideViewIndicator indicator;

  // 从网络获取数据，isLoadMore表示是否是加载更多数据
  _newsListData(bool isLoadMore) async {
    String url = Api.newsList;
    url += "?pageIndex=$curPage&pageSize=10";
    NetUtils.get(url).then(
      (data) {
        if (data.isNotEmpty) {
          // 将接口返回的json字符串解析为map类型
          Map<String, dynamic> map = json.decode(data);
          // code=0表示请求成功
          if (map['code'] == 0) {
            var msg = map['msg'];
            // total表示资讯总条数
            listTotalSize = msg['news']['total'];
            // data为数据内容，其中包含slide和news两部分，分别表示头部轮播图数据，和下面的列表数据
            var _listData = msg['news']['data'];
            var _slideData = msg['slide'];
            setState(() {
              if (!isLoadMore) {
                // 不是加载更多，则直接为变量赋值
                listData = _listData;
                slideData = _slideData;
              } else {
                // 是加载更多，则需要将取到的news数据追加到原来的数据后面
                List list1 = [];
                // 添加原来的数据
                list1.addAll(listData);
                // 添加新取到的数据
                list1.addAll(_listData);
                // 判断是否获取了所有的数据，如果是，则需要显示底部的"我也是有底线的"布局
                if (list1.length >= listTotalSize) {
                  list1.add(Constants.endLineTag);
                }
                // 给列表数据赋值
                listData = list1;
                // 轮播图数据
                slideData = _slideData;
              }
              indicator = SlideViewIndicator(
                count: slideData.length,
                key: slideViewIndicatorStateKey,
              );
              slideView = SlideView(
                data: slideData,
                slideViewIndicator: indicator,
                globalKey: slideViewIndicatorStateKey,
              );
            });
          }
        }
      },
    );
  }

  Future<Null> _pullToRefresh() async {
    curPage = 1;
    _newsListData(false);
    return null;
  }

  Widget _renderRow(int i) {
    if (i == 0) {
      return Container(
        height: 180.0,
        child: Stack(
          children: [
            slideView,
            Container(
              alignment: Alignment.bottomCenter,
              child: indicator,
            )
          ],
        ),
      );
    }
    i -= 1;
    if (i.isOdd) {
      return Divider(
        height: 1.0,
      );
    }
    i = i ~/ 2;
    var itemData = listData[i];
    if (itemData is String && itemData == Constants.endLineTag) {
      return CommonEndLine();
    }
    var titleRow = Row(
      children: [
        Expanded(
            child: Text(
          itemData['title'],
          style: TextStyle(fontSize: 15),
        ))
      ],
    );
    var timeRow = Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFECECEC),
            image: DecorationImage(
                image: NetworkImage(itemData['authorImg']), fit: BoxFit.cover),
            border: Border.all(color: Color(0xFFECECEC), width: 2.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Text(
            itemData['timeStr'],
            style: TextStyle(color: Color(0xFFB5BDC0), fontSize: 12),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${itemData['commCount']}',
                style: TextStyle(color: Color(0xFFB5BDC0), fontSize: 12),
              ),
              imageWithAsset('assets/images/ic_comment.png', 16, 16),
            ],
          ),
          flex: 1,
        )
      ],
    );
    String thumbImgUrl = itemData['thumb'];
    var thumbImg = Container(
      margin: EdgeInsets.all(10),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFECECEC),
        image: DecorationImage(
            image: ExactAssetImage('assets/images/ic_img_default.jpg'),
            fit: BoxFit.cover),
        border: Border.all(
          color: Color(0xFFECECEC),
          width: 2.0,
        ),
      ),
    );
    if (thumbImgUrl.length > 0) {
      thumbImg = Container(
        margin: EdgeInsets.all(10),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFECECEC),
          image: DecorationImage(
              image: NetworkImage(thumbImgUrl), fit: BoxFit.cover),
          border: Border.all(color: Color(0xFFECECEC), width: 2.0),
        ),
      );
    }

    return InkWell(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  titleRow,
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: timeRow,
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.all(6),
            child: Container(
              width: 100,
              height: 80,
              color: Color(0xFFECECEC),
              child: Center(
                child: thumbImg,
              ),
            ),
          )
        ],
      ),
      onTap: () {
        navPush(context, NewsDetailPage(id: itemData['detailUrl']));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && listData.length < listTotalSize) {
        curPage++;
        _newsListData(true);
      }
    });
    _newsListData(false);
  }*/

  @override
  Widget build(BuildContext context) {
    // 有数据，显示ListView
    //没有获取到数据 可能测试接口api被封
    /*if (listData.isNotEmpty) {
      Widget listView = ListView.builder(
        itemCount: listData.length * 2,
        itemBuilder: (context, i) => _renderRow(i),
        controller: _controller,
      );
      return RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
    }*/
    return Center(
      child: CircularProgressIndicator(), //圆形的Loading进度条
    );
  }
}
