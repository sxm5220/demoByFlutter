import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Shimmer.fromColors(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Container(
            color: Colors.white,
            height: 16.0,
            width: 16.0,
          ),
        ),
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
      ),
      title: Shimmer.fromColors(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Container(
            color: Colors.white,
            height: 56.0,
          ),
        ),
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
      ),
    );
  }
}
