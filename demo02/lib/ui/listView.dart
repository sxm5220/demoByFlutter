import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  ListViewDemo({Key key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _ListItem(
          title: "1",
        ),
        _ListItem(
          title: "2",
        ),
        _ListItem(
          title: "3",
        )
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  const _ListItem({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 45,
        alignment: Alignment.center,
        child: Text("$title"),
      ),
    );
  }
}
