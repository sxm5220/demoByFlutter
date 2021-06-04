import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  ListViewDemo({Key key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('data'),
              Text('data2'),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text('data'), Text('data')],
              ),
            ],
          )
          /*Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100,
              ),
              Text('data'),
              Container(
                color: Colors.blue,
                height: 100,
                width: 100,
              )
            ],
          )*/
          /* Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlutterLogo(
                size: 100,
              ),
              Text('data'),
              Container(
                color: Colors.green,
                height: 100,
                width: 100,
              )
            ],
          )*/
          /*Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('data1'),
              Text('data1'),
              Text('data1'),
            ],
          )*/
        ],
        /*mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('data1'),
          Text('data2'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('data1'),
              Text('data2'),
            ],
          )
        ],*/
        /*mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FlutterLogo(
            size: 100,
          ),
          Text(
            'Column 2',
          ),
          Container(
            color: Colors.green,
            height: 100,
            width: 100,
          ),
        ],*/
        // children: [
        /*Text(
          'column1',
          style: TextStyle(color: Colors.black),
        ),
        Text(
          'column2',
          style: TextStyle(color: Colors.black),
        ),
        Text(
          'column3',
          style: TextStyle(color: Colors.black),
        ),*/
        // ],
      ),
    );
    /*ListView(
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
    );*/
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
