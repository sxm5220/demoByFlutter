import 'package:flutter/cupertino.dart';

//本地图片
Image imageWithAsset(String name, double width, double height) =>
    Image.asset(name, width: width, height: height);

//网络图片
Image imageWithNetWork(String url, double width, BoxFit fit) => Image.network(
      url,
      width: width,
      fit: fit,
    );
