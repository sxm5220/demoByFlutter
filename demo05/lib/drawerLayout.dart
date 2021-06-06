import 'package:flutter/material.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer抽屉组件示例'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Symon'),
              accountEmail: Text('sxm5220@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('asset/images/1.jpg'),
              ),
              onDetailsPressed: () {},
              // otherAccountsPictures: [
              //   Container(
              //     child: Image.asset('asset/images/1.jpg'),
              //   )
              // ],
            ),
            ListTile(
              onTap: () => print('个性装扮'),
              leading: CircleAvatar(
                child: Icon(Icons.color_lens),
              ),
              title: Text('个性装扮'),
            ),
            ListTile(
              onTap: () => print('我的相册'),
              leading: CircleAvatar(
                child: Icon(
                  Icons.photo,
                ),
              ),
              title: Text('我的相册'),
            ),
            ListTile(
              onTap: () => print('免流量特权'),
              leading: CircleAvatar(
                child: Icon(
                  Icons.wifi,
                ),
              ),
              title: Text('免流量特权'),
            ),
          ],
        ),
      ),
    );
  }
}
