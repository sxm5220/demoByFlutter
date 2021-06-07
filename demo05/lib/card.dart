import 'package:flutter/material.dart';

class CardDemo extends StatelessWidget {
  const CardDemo({Key? key}) : super(key: key);

  Widget _buildCard() {
    return SizedBox(
        height: 250,
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  '秦皇岛海港区',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Text('富立半岛七区'),
                leading: Icon(Icons.home),
              ),
              Divider(), //分割线
              ListTile(
                title: Text(
                  '秦皇岛海港区',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Text('富立半岛七区'),
                leading: Icon(Icons.home),
              ),
              Divider(),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildCard(),
      ),
    );
  }
}
