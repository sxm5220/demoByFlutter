import 'package:flutter/material.dart';

Image navBarItemWithImage(String name) =>
    Image.asset('asset/images/$name', width: 32.0, height: 28.0);

Image assetWithImage(String name, double width, double height) =>
    Image.asset('asset/images/$name', width: width, height: height);

Image assetWithFitImage(String name) =>
    Image.asset('asset/images/$name', fit: BoxFit.cover);

Image netWorkWithImage(String url, double width, double height) =>
    Image.network(
      url,
      width: width,
      height: height,
    );
